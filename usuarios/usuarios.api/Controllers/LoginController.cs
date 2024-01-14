using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core.interfaces;
using usuarios.core;
using usuarios.infra.Data.Modelos;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace usuarios.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IRepository<loginDto> _apiRepositoryLogin;
        private readonly IRepository<Usuario> _apiRepositoryUser;
        private readonly IRepository<Sesione> _apiRepositorySession;
        private readonly IConfiguration _configuration;

        public LoginController(IRepository<loginDto> userRepositoryLogin, IRepository<Usuario> userRepositoryUser, IRepository<Sesione> userRepositorySession, IConfiguration configuration)
        {
            _apiRepositoryLogin = userRepositoryLogin;
            _apiRepositoryUser = userRepositoryUser;
            _apiRepositorySession = userRepositorySession;
            _configuration = configuration;
        }
        [HttpPost]
        public async Task<ApiResponse<Sesione>> Login(loginDto request)
        {
            try
            {
                var idUsuario = _apiRepositoryLogin.ObtenerUsuariosPorLogin(request);

                if (idUsuario > 0)
                {
                    Sesione sesione = new Sesione()
                    {
                        UsuarioId = idUsuario,
                        Estado = true,
                        FechaInicio = DateTime.Now,
                        Token = generateToken(idUsuario),
                        FechaFin = null
                    };

                    await _apiRepositorySession.Create(sesione, "");
                    return new ApiResponse<Sesione>
                    {
                        Estado = new Estado { Codigo = "200", Mensaje = "Exito", Descripcion = "" },
                        Data = sesione
                    };
                }
                else
                {
                    return new ApiResponse<Sesione>
                    {
                        Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = "Verifique usuario y contraseña" },
                        Data = null
                    };
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse<Sesione>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }

        }



        private string generateToken(int idUsuario)
        {

            var usuario = _apiRepositoryUser.GetById(idUsuario);

            var _SymmetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Authentication:secretKey"]));
            var signinCredentials = new SigningCredentials(_SymmetricSecurityKey, SecurityAlgorithms.HmacSha256);
            var header = new JwtHeader(signinCredentials);
            //claims

            var claims = new[] {
                new Claim(ClaimTypes.Name,usuario.Result.Data.Nombre),
                new Claim(ClaimTypes.Email,usuario.Result.Data.CorreoElectronico),
                new Claim(ClaimTypes.Role,usuario.Result.Data.RolId.ToString()),
            };

            int minutos = int.Parse(_configuration["Authentication:Minutes"]);
            //payload
            var payload = new JwtPayload
            (
                 _configuration["Authentication:Issuer"],
                 _configuration["Authentication:Audience"],
                 claims,
                 System.DateTime.Now,
                 System.DateTime.UtcNow.AddMinutes(minutos)
            );

            //signature

            var token = new JwtSecurityToken(header, payload);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core.interfaces;
using usuarios.core;
using usuarios.infra.Data.Modelos;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace usuarios.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SesionController : ControllerBase
    {
        private readonly IRepository<Sesione> _apiRepository;
        private readonly IConfiguration _configuration;

        public SesionController(IRepository<Sesione> userRepository, IConfiguration configuration)
        {
            _apiRepository = userRepository;
            _configuration = configuration;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Sesione>>> GetAllSesiones()
        {
            var Sesiones = await _apiRepository.GetAll();
            return Ok(Sesiones);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Sesione>> GetSesionesById(int id)
        {
            try
            {
                var Sesione = await _apiRepository.GetById(id);

                if (Sesione.Data == null)
                {
                    Sesione.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Sesione;
                }
                return Sesione;
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


        [HttpPost]
        public async Task<ApiResponse<string>> CreateSesion([FromBody] SesionDto createSesionDto)
        {
            try
            {
                var Sesione = new Sesione
                {
                    UsuarioId = createSesionDto.UsuarioID,
                    Token = createSesionDto.Token,
                    FechaInicio = (DateTime)createSesionDto.FechaInicio,
                    FechaFin = createSesionDto.FechaFin,
                    Estado = createSesionDto.Estado
                };
                var respuesta = await _apiRepository.Create(Sesione, "");
                return respuesta;
            }
            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPut("{id}")]
        public async Task<ApiResponse<string>> UpdateSesion(int id, [FromBody] SesionDto updateSesione)
        {
            try
            {

                var existeSesione = await _apiRepository.GetById(id);
                if (existeSesione.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeSesione.Data.UsuarioId = updateSesione.UsuarioID;
                existeSesione.Data.Token = updateSesione.Token;
                existeSesione.Data.FechaInicio = (DateTime)updateSesione.FechaInicio;
                existeSesione.Data.FechaFin = updateSesione.FechaFin;
                existeSesione.Data.Estado = updateSesione.Estado;

                var respuesta = await _apiRepository.Update(id, existeSesione.Data);
                return respuesta;
            }
            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpDelete("{id}")]
        public async Task<ApiResponse<string>> DeleteSesion(int id)
        {

            try
            {
                var resultDelete = new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "", Mensaje = "", Descripcion = "" },
                    Data = null
                };
                // Recibo id del usuario para ubicar el id sesion y manejarlo generico.
                var sesionActiva = _apiRepository.GetAll().Result.Data.Where(x => x.UsuarioId == id).ToList();
                foreach (Sesione sesion in sesionActiva)
                {
                    resultDelete = await _apiRepository.Delete(sesion.SesionId);
                }

                return resultDelete;
            }

            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }

        [HttpGet("token/{token}")]
        public async Task<ApiResponse<Sesione>> GetSesionByToken(String token)
        {
            try
            {
                var tokenHandler = new JwtSecurityTokenHandler();
                var validationParameters = GetValidationParameters();
                var principal = tokenHandler.ValidateToken(token, validationParameters, out var validatedToken);
                var sesionToken = tokenHandler.WriteToken(validatedToken);
                var sesionActiva = _apiRepository.GetAll().Result.Data.Where(x => x.Token == token).ToList();
                Sesione sesionResp = new Sesione
                {
                    SesionId = sesionActiva[0].SesionId,
                    Token = sesionActiva[0].Token,
                    UsuarioId = sesionActiva[0].UsuarioId,
                    FechaInicio = sesionActiva[0].FechaInicio,
                    FechaFin = sesionActiva[0].FechaFin,
                    Estado = sesionActiva[0].Estado
                };
         
                var resultSesion = new ApiResponse<Sesione>
                {
                    Estado = new Estado { Codigo = "200", Mensaje = "", Descripcion = "" },
                    Data = sesionResp
                };
                return resultSesion;

            }
            catch (Exception ex)
            {
                return new ApiResponse<Sesione>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.Message },
                    Data = null
                };
            }


        }

        private TokenValidationParameters GetValidationParameters()
        {
            return new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Authentication:secretKey"])),
                ValidateIssuer = false,
                ValidateAudience = false,
                ValidateLifetime = true, // Validar la expiración del token
                ClockSkew = TimeSpan.Zero // Sin tolerancia de tiempo
            };
        }


    }
}

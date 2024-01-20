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

namespace usuarios.api.util
{
    public class tokenUtil
    {
        private readonly IRepository<loginDto> _apiRepositoryLogin;
        private readonly IRepository<Usuario> _apiRepositoryUser;
        private readonly IRepository<Sesione> _apiRepositorySession;
        private readonly IConfiguration _configuration;
         

        public tokenUtil(IRepository<loginDto> userRepositoryLogin, IRepository<Usuario> userRepositoryUser, IRepository<Sesione> userRepositorySession, IConfiguration configuration)
        {
            _apiRepositoryLogin = userRepositoryLogin;
            _apiRepositoryUser = userRepositoryUser;
            _apiRepositorySession = userRepositorySession;
            _configuration = configuration;
        }
        public string generateToken(int idUsuario)
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

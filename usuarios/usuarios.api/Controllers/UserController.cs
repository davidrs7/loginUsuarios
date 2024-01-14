using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core.interfaces;
using usuarios.core;
using usuarios.infra.Repository;
using System.ComponentModel.DataAnnotations;
using usuarios.core.validators;
using usuarios.infra.Data.Modelos;

namespace usuarios.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IRepository<Usuario> _apiRepository;


        #region controllers
        public UserController(IRepository<Usuario> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Usuario>>> GetAllUsers()
        {
            var users = await _apiRepository.GetAll();
            return Ok(users);
        }

        [HttpPost]
        public async Task<ApiResponse<string>> CreateUser([FromBody] CreateUserDto createUserDto)
        {
            try
            {
                // validate(createUserDto); // validaciones de parte del front ya que cada empresa puede establecer parametros diferentes.
                var user = new Usuario
                {
                    Nombre = createUserDto.Nombre,
                    TipoDocumento = createUserDto.TipoDocumento,
                    NumDocumento = createUserDto.NumDocumento,
                    CorreoElectronico = createUserDto.CorreoElectronico,
                    Contraseña = createUserDto.Contraseña,
                    Telefono = createUserDto.Telefono,
                    Direccion = createUserDto.Direccion,
                    FechaNacimiento = createUserDto.FechaNacimiento,
                    FechaCreacion = createUserDto.FechaCreacion,
                    SexoId = createUserDto.SexoId,
                    JefeId = createUserDto.JefeId,
                    RolId = createUserDto.RolId,
                    CargoId = createUserDto.CargoId,
                    EmpresaId = createUserDto.EmpresaId,
                    UsuarioIdOpcional = createUserDto.UsuarioIdOpcional
                };

                var respuesta = await _apiRepository.Create(user, createUserDto.Contraseña);

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


        [HttpGet("{id}")]
        public async Task<ApiResponse<Usuario>> GetUserById(int id)
        {
            try
            {
                var user = await _apiRepository.GetById(id);

                if (user.Data == null)
                {
                    user.Estado.Descripcion = "No existen datos para esta consulta.";
                    return user;
                }

                user.Data.Contraseña = null;

                return user;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Usuario>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }

        [HttpPut("{id}")]
        public async Task<ApiResponse<string>> UpdateUser(int id, [FromBody] updateUserDto updateUserDto)
        {
            try
            {

                var existingUser = await _apiRepository.GetById(id);
                if (existingUser.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }
                bool validaPw = string.Equals(existingUser.Data.Contraseña, updateUserDto.Contraseña.Trim());
                if (!validaPw)
                {
                    updateUserDto.Contraseña = BCrypt.Net.BCrypt.HashPassword(updateUserDto.Contraseña);
                }

                existingUser.Data.Nombre = updateUserDto.Nombre;
                existingUser.Data.TipoDocumento = updateUserDto.TipoDocumento;
                existingUser.Data.NumDocumento = updateUserDto.NumDocumento;
                existingUser.Data.CorreoElectronico = updateUserDto.CorreoElectronico;
                existingUser.Data.Contraseña = updateUserDto.Contraseña;
                existingUser.Data.Telefono = updateUserDto.Telefono;
                existingUser.Data.Contraseña = updateUserDto.Contraseña;
                existingUser.Data.Direccion = updateUserDto.Direccion;
                existingUser.Data.FechaNacimiento = updateUserDto.FechaNacimiento;
                existingUser.Data.FechaCreacion = updateUserDto.FechaCreacion;
                existingUser.Data.SexoId = updateUserDto.SexoId;
                existingUser.Data.JefeId = updateUserDto.JefeId;
                existingUser.Data.RolId = updateUserDto.RolId;
                existingUser.Data.CargoId = updateUserDto.CargoId;
                existingUser.Data.EmpresaId = updateUserDto.EmpresaId;
                existingUser.Data.UsuarioIdOpcional = updateUserDto.UsuarioIdOpcional;
                existingUser.Data.Estado = updateUserDto.Estado;

                var respuesta = await _apiRepository.Update(id, existingUser.Data);
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
        public async Task<ApiResponse<string>> DeleteUser(int id)
        {

            try
            {
                var resultDelete = await _apiRepository.Delete(id);
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

        #endregion

        internal ApiResponse<string> validate(CreateUserDto createUserDto)
        {
            var validationContext = new ValidationContext(createUserDto);
            var validationResults = new List<ValidationResult>();
            var isValid = Validator.TryValidateObject(createUserDto, validationContext, validationResults, true);
            var errorResponse = new ApiResponse<string> { };

            var customPasswordValidationAttribute = new passwordValidate();
            errorResponse = customPasswordValidationAttribute.GetApiResponse(validationResults.First());



            return errorResponse;
        }
    }
}


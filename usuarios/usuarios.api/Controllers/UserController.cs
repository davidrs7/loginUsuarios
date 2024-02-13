using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core.interfaces;
using usuarios.core;
using usuarios.infra.Repository;
using System.ComponentModel.DataAnnotations;
using usuarios.core.validators;
using System.IO;
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

        [HttpPost("cargar-usuarios")]
        public async Task<ApiResponse<string>> CargarUsuarios([FromForm] FileUserModelDto model)
        {
            if (model == null || model.File == null || model.File.Length == 0)
            {
              return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = "Archivo vacio" },
                    Data = null
                };
            }

            var users = await _apiRepository.GetAll();
            var contador = 0;

            try
            {
                using (var reader = new StreamReader(model.File.OpenReadStream()))
                {
                    var usuarios = new List<Usuario>();

                    while (!reader.EndOfStream)
                    {
                        var line = await reader.ReadLineAsync();
                        var values = line.Split(',');

                        var usuario = new Usuario
                        {
                            Nombre = values[0],
                            TipoDocumento = Convert.ToInt32(values[1]),
                            NumDocumento = values[2],
                            CorreoElectronico = values[3],
                            Contraseña = values[4],
                            Telefono = values[5],
                            Direccion = values[6],
                            FechaNacimiento = DateTime.Parse(values[7]),
                            FechaCreacion = DateTime.Parse(values[8]),
                            SexoId = Convert.ToInt32(values[9]),
                            JefeId = Convert.ToInt32(values[10]),
                            RolId = Convert.ToInt32(values[11]),
                            CargoId = Convert.ToInt32(values[12]),
                            EmpresaId = Convert.ToInt32(values[13]),
                            UsuarioIdOpcional = Convert.ToInt32(values[14]),
                            Estado = Convert.ToBoolean(values[15])
                        };

                        usuarios.Add(usuario);

                        var userSel = users.Data.Where(x => x.NumDocumento == usuario.NumDocumento).Count();

                        if (userSel == 0)
                        {
                            var create = await _apiRepository.Create(usuario, usuario.Contraseña);
                            contador = create.Estado.Codigo == "200" ? contador += 1 : contador;
                        }

                    }

                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "200", Mensaje = "Exito", Descripcion = "Se cargaron: " + contador + " usuarios de: " + usuarios.Count() +" subidos en el archivo." },
                        Data = null
                    };
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = "Carga exitosa" },
                    Data = null
                };
            }
        }

        [HttpGet("hierarchy/{id}")]
        public async Task<ActionResult<IEnumerable<Usuario>>> GetUsersByIdBoss(int id)
        {
            var users = await _apiRepository.GetAll();
            users.Data = users.Data.Where(x => x.JefeId == id);
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


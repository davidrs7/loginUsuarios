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
    public class RolesController : ControllerBase
    {
        private readonly IRepository<Role> _apiRepository;
        public RolesController(IRepository<Role> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Role>>> GetAllRoles()
        {
            var Roles = await _apiRepository.GetAll();
            return Ok(Roles);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Role>> GetRolesById(int id)
        {
            try
            {
                var Role = await _apiRepository.GetById(id);

                if (Role.Data == null)
                {
                    Role.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Role;
                }
                return Role;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Role>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateRole([FromBody] RolesDto createRolesDto)
        {
            try
            {
                var Role = new Role
                {
                    Nombre = createRolesDto.Nombre,
                    Descripcion = createRolesDto.Descripcion,
                    ColorId = createRolesDto.ColorId,
                    Estado = createRolesDto.Estado
                };
                var respuesta = await _apiRepository.Create(Role, "");
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
        public async Task<ApiResponse<string>> UpdateRole(int id, [FromBody] RolesDto updateRole)
        {
            try
            {

                var existeRole = await _apiRepository.GetById(id);
                if (existeRole.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeRole.Data.Nombre = updateRole.Nombre;
                existeRole.Data.Descripcion = updateRole.Descripcion;
                existeRole.Data.ColorId = updateRole.ColorId;
                existeRole.Data.Estado = updateRole.Estado;

                var respuesta = await _apiRepository.Update(id, existeRole.Data);
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
        public async Task<ApiResponse<string>> DeleteRole(int id)
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
    }
}

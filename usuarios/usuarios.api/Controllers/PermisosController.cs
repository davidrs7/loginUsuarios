using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core.interfaces;
using usuarios.core;
using usuarios.infra.Data.Modelos;

namespace usuarios.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PermisosController : ControllerBase
    {
        private readonly IRepository<Permiso> _apiRepository;
        public PermisosController(IRepository<Permiso> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Permiso>>> GetAllPermisos()
        {
            var Permisos = await _apiRepository.GetAll();
            return Ok(Permisos);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Permiso>> GetPermisosById(int id)
        {
            try
            {
                var Permiso = await _apiRepository.GetById(id);

                if (Permiso.Data == null)
                {
                    Permiso.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Permiso;
                }
                return Permiso;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Permiso>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreatePermiso([FromBody] PermisoDto createPermisoDto)
        {
            try
            {
                var Permiso = new Permiso
                {
                    Nombre = createPermisoDto.Nombre,
                    Descripcion = createPermisoDto.Descripcion,
                    RutaAngular = createPermisoDto.RutaAngular,
                    Estado = createPermisoDto.Estado
                };
                var respuesta = await _apiRepository.Create(Permiso, "");
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
        public async Task<ApiResponse<string>> UpdatePermiso(int id, [FromBody] PermisoDto updatePermiso)
        {
            try
            {

                var existePermiso = await _apiRepository.GetById(id);
                if (existePermiso.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existePermiso.Data.Nombre = updatePermiso.Nombre;
                existePermiso.Data.Estado = updatePermiso.Estado;
                existePermiso.Data.Descripcion = updatePermiso.Descripcion;
                existePermiso.Data.RutaAngular = updatePermiso.RutaAngular;

                var respuesta = await _apiRepository.Update(id, existePermiso.Data);
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
        public async Task<ApiResponse<string>> DeletePermiso(int id)
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

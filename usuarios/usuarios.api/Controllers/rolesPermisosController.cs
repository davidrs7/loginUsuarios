using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core;
using usuarios.core.interfaces;
using usuarios.infra.Data.Modelos;


namespace usuarios.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class rolesPermisosController : ControllerBase
    {
        private readonly IRepository<rolesPermisos> _apiRepository;
        public rolesPermisosController(IRepository<rolesPermisos> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<rolesPermisos>>> GetAllrolPermisos()
        {
            var rolPermisoss = await _apiRepository.GetAll();
            return Ok(rolPermisoss);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<rolesPermisos>> GetrolPermisosById(int id)
        {
            try
            {
                var rolPermisos = await _apiRepository.GetById(id);

                if (rolPermisos.Data == null)
                {
                    rolPermisos.Estado.Descripcion = "No existen datos para esta consulta.";
                    return rolPermisos;
                }
                return rolPermisos;
            }
            catch (Exception ex)
            {
                return new ApiResponse<rolesPermisos>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreaterolPermisos([FromBody] rolesPermisosDto createrolPermisosDto)
        {
            try
            {
                var rolPermisos = new rolesPermisos
                {
                    RolID = createrolPermisosDto.RolID,
                    PermisoID = createrolPermisosDto.PermisoID
                };
                var respuesta = await _apiRepository.Create(rolPermisos, "");
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
        public async Task<ApiResponse<string>> UpdaterolPermisos(int id, [FromBody] rolesPermisosDto updaterolPermisos)
        {
            try
            {

                var existerolPermisos = await _apiRepository.GetById(id);
                if (existerolPermisos.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existerolPermisos.Data.RolID = updaterolPermisos.RolID;
                existerolPermisos.Data.PermisoID = updaterolPermisos.PermisoID;

                var respuesta = await _apiRepository.Update(id, existerolPermisos.Data);
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
        public async Task<ApiResponse<string>> DeleterolPermisos(int id)
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

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
    public class EstadoAccionesController : ControllerBase
    {
        private readonly IRepository<EstadoAccion> _apiRepository;
        public EstadoAccionesController(IRepository<EstadoAccion> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<EstadoAccion>>> GetAllEstadoAccion()
        {
            var EstadoAccion = await _apiRepository.GetAll();
            return Ok(EstadoAccion);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<EstadoAccion>> GetEstadoAccionById(int id)
        {
            try
            {
                var EstadoAccion = await _apiRepository.GetById(id);

                if (EstadoAccion.Data == null)
                {
                    EstadoAccion.Estado.Descripcion = "No existen datos para esta consulta.";
                    return EstadoAccion;
                }
                return EstadoAccion;
            }
            catch (Exception ex)
            {
                return new ApiResponse<EstadoAccion>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateEstadoAccion([FromBody] EstadoAccionDto createEstadoAccionDto)
        {
            try
            {
                var EstadoAccion = new EstadoAccion
                {
                    Id = createEstadoAccionDto.Id,
                    Estado = createEstadoAccionDto.Estado
                };
                var respuesta = await _apiRepository.Create(EstadoAccion, "");
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
        public async Task<ApiResponse<string>> UpdateEstadoAccion(int id, [FromBody] EstadoAccionDto updateEstadoAccion)
        {
            try
            {

                var existeEstadoAccion = await _apiRepository.GetById(id);
                if (existeEstadoAccion.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }
                 existeEstadoAccion.Data.Estado = updateEstadoAccion.Estado; 

                var respuesta = await _apiRepository.Update(id, existeEstadoAccion.Data);
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
        public async Task<ApiResponse<string>> DeleteEstadoAccion(int id)
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

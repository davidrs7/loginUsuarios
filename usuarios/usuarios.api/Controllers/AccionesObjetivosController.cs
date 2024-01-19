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
    public class AccionesObjetivosController : ControllerBase
    {
        private readonly IRepository<AccionObjetivo> _apiRepository;
        public AccionesObjetivosController(IRepository<AccionObjetivo> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<AccionObjetivo>>> GetAllAccionObjetivos()
        {
            var AccionObjetivos = await _apiRepository.GetAll();
            return Ok(AccionObjetivos);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<AccionObjetivo>> GetAccionObjetivoById(int id)
        {
            try
            {
                var AccionObjetivo = await _apiRepository.GetById(id);

                if (AccionObjetivo.Data == null)
                {
                    AccionObjetivo.Estado.Descripcion = "No existen datos para esta consulta.";
                    return AccionObjetivo;
                }
                return AccionObjetivo;
            }
            catch (Exception ex)
            {
                return new ApiResponse<AccionObjetivo>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }
         
        [HttpGet("xIduser/{id}")]
        public async Task<ActionResult<IEnumerable<Usuario>>> GetUsersByIdBoss(int id)
        {
            var AccionesObjetivos = await _apiRepository.GetAll();
            AccionesObjetivos.Data = AccionesObjetivos.Data.Where(x => x.IdUsuario == id);
            return Ok(AccionesObjetivos);
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateAccionObjetivo([FromBody] AccionesObjetivosDto createAccionObjetivoDto)
        {
            try
            {
                var AccionObjetivo = new AccionObjetivo
                {
                    IdObjetivo = createAccionObjetivoDto.IdObjetivo,
                    IdUsuario = createAccionObjetivoDto.IdUsuario,
                    Descripcion = createAccionObjetivoDto.Descripcion,
                    Calificacion = createAccionObjetivoDto.Calificacion,
                    Evidencia = createAccionObjetivoDto.Evidencia,
                    IdEstado = createAccionObjetivoDto.IdEstado,
                    Comentarios = createAccionObjetivoDto.Comentarios,
                    FechaAccion = createAccionObjetivoDto.FechaAccion
                };
                var respuesta = await _apiRepository.Create(AccionObjetivo, "");
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
        public async Task<ApiResponse<string>> UpdateAccionObjetivo(int id, [FromBody] AccionesObjetivosDto updateAccionObjetivo)
        {
            try
            {

                var existeAccionObjetivo = await _apiRepository.GetById(id);
                if (existeAccionObjetivo.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeAccionObjetivo.Data.IdObjetivo = updateAccionObjetivo.IdObjetivo;
                existeAccionObjetivo.Data.IdUsuario = updateAccionObjetivo.IdUsuario;
                existeAccionObjetivo.Data.Descripcion = updateAccionObjetivo.Descripcion;
                existeAccionObjetivo.Data.Calificacion = updateAccionObjetivo.Calificacion;
                existeAccionObjetivo.Data.Evidencia = updateAccionObjetivo.Evidencia;
                existeAccionObjetivo.Data.IdEstado = updateAccionObjetivo.IdEstado;
                existeAccionObjetivo.Data.Comentarios = updateAccionObjetivo.Comentarios;
                existeAccionObjetivo.Data.FechaAccion = updateAccionObjetivo.FechaAccion;

                var respuesta = await _apiRepository.Update(id, existeAccionObjetivo.Data);
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
        public async Task<ApiResponse<string>> DeleteAccionObjetivo(int id)
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

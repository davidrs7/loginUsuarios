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
    public class opciones_respuestaController : ControllerBase
    {
        private readonly IRepository<opciones_respuesta> _apiRepository;
        public opciones_respuestaController(IRepository<opciones_respuesta> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<opciones_respuesta>>> GetAllopciones_respuesta()
        {
            var opciones_respuesta = await _apiRepository.GetAll();
            return Ok(opciones_respuesta);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<opciones_respuesta>> Getopciones_respuestaById(int id)
        {
            try
            {
                var opciones_respuesta = await _apiRepository.GetById(id);

                if (opciones_respuesta.Data == null)
                {
                    opciones_respuesta.Estado.Descripcion = "No existen datos para esta consulta.";
                    return opciones_respuesta;
                }
                return opciones_respuesta;
            }
            catch (Exception ex)
            {
                return new ApiResponse<opciones_respuesta>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> Createopciones_respuesta([FromBody] opciones_respuestaDto opciones_respuestaDto)
        {
            try
            {
                var opciones_respuesta = new opciones_respuesta
                {
                    id_pregunta = opciones_respuestaDto.id_pregunta,
                     descripcion = opciones_respuestaDto.descripcion,
                    estado = opciones_respuestaDto.estado,
                    peso = opciones_respuestaDto.peso
                };
                var respuesta = await _apiRepository.Create(opciones_respuesta, "");
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
        public async Task<ApiResponse<string>> Updateopciones_respuesta(int id, [FromBody] opciones_respuestaDto updateopciones_respuesta)
        {
            try
            {

                var existeopciones_respuesta = await _apiRepository.GetById(id);
                if (existeopciones_respuesta.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeopciones_respuesta.Data.id_pregunta = updateopciones_respuesta.id_pregunta;
                existeopciones_respuesta.Data.descripcion = updateopciones_respuesta.descripcion;
                existeopciones_respuesta.Data.estado = updateopciones_respuesta.estado;
                existeopciones_respuesta.Data.peso = updateopciones_respuesta.peso;

                var respuesta = await _apiRepository.Update(id, existeopciones_respuesta.Data);
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
        public async Task<ApiResponse<string>> Deleteopciones_respuesta(int id)
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

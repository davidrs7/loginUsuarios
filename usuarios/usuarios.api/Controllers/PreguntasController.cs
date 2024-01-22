using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.Mime;
using usuarios.api.Dto;
using usuarios.core;
using usuarios.core.interfaces;
using usuarios.infra.Data.Modelos;

namespace usuarios.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PreguntasController : ControllerBase
    {
        private readonly IRepository<preguntas> _apiRepository;
        public PreguntasController(IRepository<preguntas> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<preguntas>>> GetAllPreguntas()
        {
            var Preguntas = await _apiRepository.GetAll();
            return Ok(Preguntas);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<preguntas>> GetPreguntaById(int id)
        {
            try
            {
                var Pregunta = await _apiRepository.GetById(id);

                if (Pregunta.Data == null)
                {
                    Pregunta.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Pregunta;
                }
                return Pregunta;
            }
            catch (Exception ex)
            {
                return new ApiResponse<preguntas>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreatePregunta([FromBody] preguntaDto preguntasDto)
        {
            try
            {
                var pregunta = new preguntas
                {
                    pregunta = preguntasDto.pregunta,
                    estado = preguntasDto.estado,
                    fecha_inicio = preguntasDto.fecha_inicio,
                    fecha_fin = preguntasDto.fecha_fin
                };
                var respuesta = await _apiRepository.Create(pregunta, "");
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
        public async Task<ApiResponse<string>> UpdatePregunta(int id, [FromBody] preguntaDto updatePregunta)
        {
            try
            {

                var existePregunta = await _apiRepository.GetById(id);
                if (existePregunta.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existePregunta.Data.pregunta = updatePregunta.pregunta;
                existePregunta.Data.estado = updatePregunta.estado;
                existePregunta.Data.fecha_inicio = updatePregunta.fecha_inicio;
                existePregunta.Data.fecha_fin = updatePregunta.fecha_fin;

                var respuesta = await _apiRepository.Update(id, existePregunta.Data);
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
        public async Task<ApiResponse<string>> DeletePregunta(int id)
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

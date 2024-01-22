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
    public class respuestas_usuarioController : ControllerBase
    {
        private readonly IRepository<respuestas_usuario> _apiRepository;
        public respuestas_usuarioController(IRepository<respuestas_usuario> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<respuestas_usuario>>> GetAllrespuestas_usuario()
        {
            var respuestas_usuario = await _apiRepository.GetAll();
            return Ok(respuestas_usuario);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<respuestas_usuario>> Getrespuestas_usuarioById(int id)
        {
            try
            {
                var respuestas_usuario = await _apiRepository.GetById(id);

                if (respuestas_usuario.Data == null)
                {
                    respuestas_usuario.Estado.Descripcion = "No existen datos para esta consulta.";
                    return respuestas_usuario;
                }
                return respuestas_usuario;
            }
            catch (Exception ex)
            {
                return new ApiResponse<respuestas_usuario>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> Createrespuestas_usuario([FromBody] respuestas_usuarioDto respuestas_usuarioDto)
        {
            try
            {
                var respuestas_usuario = new respuestas_usuario
                {
                    id_pregunta = respuestas_usuarioDto.id_pregunta,
                    id_respuesta = respuestas_usuarioDto.id_respuesta,
                    comentarios = respuestas_usuarioDto.comentarios,
                    fecha_accion = respuestas_usuarioDto.fecha_accion
                };
                var respuesta = await _apiRepository.Create(respuestas_usuario, "");
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
        public async Task<ApiResponse<string>> Updaterespuestas_usuario(int id, [FromBody] respuestas_usuarioDto updaterespuestas_usuario)
        {
            try
            {

                var existerespuestas_usuario = await _apiRepository.GetById(id);
                if (existerespuestas_usuario.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existerespuestas_usuario.Data.id_pregunta = updaterespuestas_usuario.id_pregunta;
                existerespuestas_usuario.Data.id_respuesta = updaterespuestas_usuario.id_respuesta;
                existerespuestas_usuario.Data.comentarios = updaterespuestas_usuario.comentarios;
                existerespuestas_usuario.Data.fecha_accion = updaterespuestas_usuario.fecha_accion;

                var respuesta = await _apiRepository.Update(id, existerespuestas_usuario.Data);
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
        public async Task<ApiResponse<string>> Deleterespuestas_usuario(int id)
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

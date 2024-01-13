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
    public class TipoDocumentoController : ControllerBase
    {
        private readonly IRepository<Tiposdocumento> _apiRepository;
        public TipoDocumentoController(IRepository<Tiposdocumento> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Tiposdocumento>>> GetAllTipDocs()
        {
            var Tiposdocumentos = await _apiRepository.GetAll();
            return Ok(Tiposdocumentos);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Tiposdocumento>> GetTipDocsById(int id)
        {
            try
            {
                var Tiposdocumento = await _apiRepository.GetById(id);

                if (Tiposdocumento.Data == null)
                {
                    Tiposdocumento.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Tiposdocumento;
                }
                return Tiposdocumento;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Tiposdocumento>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateTiposdocumento([FromBody] TipDocDto createTiposdocumentoDto)
        {
            try
            {
                var Tiposdocumento = new Tiposdocumento
                {
                    Descripcion = createTiposdocumentoDto.Descripcion,
                    Estado = createTiposdocumentoDto.Estado
                };
                var respuesta = await _apiRepository.Create(Tiposdocumento, "");
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
        public async Task<ApiResponse<string>> UpdateTiposdocumento(int id, [FromBody] TipDocDto updateTiposdocumento)
        {
            try
            {

                var existeTiposdocumento = await _apiRepository.GetById(id);
                if (existeTiposdocumento.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeTiposdocumento.Data.Descripcion = updateTiposdocumento.Descripcion;
                existeTiposdocumento.Data.Estado = updateTiposdocumento.Estado;

                var respuesta = await _apiRepository.Update(id, existeTiposdocumento.Data);
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
        public async Task<ApiResponse<string>> DeleteTiposdocumento(int id)
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

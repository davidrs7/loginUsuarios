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
    public class SexoController : ControllerBase
    {
        private readonly IRepository<Sexo> _apiRepository;
        public SexoController(IRepository<Sexo> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Sexo>>> GetAllSexos()
        {
            var Sexos = await _apiRepository.GetAll();
            return Ok(Sexos);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Sexo>> GetSexoById(int id)
        {
            try
            {
                var Sexo = await _apiRepository.GetById(id);

                if (Sexo.Data == null)
                {
                    Sexo.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Sexo;
                }
                return Sexo;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Sexo>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateSexo([FromBody] SexoDto createSexoDto)
        {
            try
            {
                var Sexo = new Sexo
                {
                    Descripcion = createSexoDto.Descripcion,
                    Estado = createSexoDto.Estado
                };
                var respuesta = await _apiRepository.Create(Sexo, "");
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
        public async Task<ApiResponse<string>> UpdateSexo(int id, [FromBody] SexoDto updateSexo)
        {
            try
            {

                var existeSexo = await _apiRepository.GetById(id);
                if (existeSexo.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeSexo.Data.Descripcion = updateSexo.Descripcion;
                existeSexo.Data.Estado = updateSexo.Estado;

                var respuesta = await _apiRepository.Update(id, existeSexo.Data);
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
        public async Task<ApiResponse<string>> DeleteSexo(int id)
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

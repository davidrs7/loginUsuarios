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
    public class SesionController : ControllerBase
    {
        private readonly IRepository<Sesione> _apiRepository;
        public SesionController(IRepository<Sesione> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Sesione>>> GetAllSesiones()
        {
            var Sesiones = await _apiRepository.GetAll();
            return Ok(Sesiones);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Sesione>> GetSesionesById(int id)
        {
            try
            {
                var Sesione = await _apiRepository.GetById(id);

                if (Sesione.Data == null)
                {
                    Sesione.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Sesione;
                }
                return Sesione;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Sesione>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateSesion([FromBody] SesionDto createSesionDto)
        {
            try
            {
                var Sesione = new Sesione
                {
                    UsuarioId = createSesionDto.UsuarioID,
                    Token = createSesionDto.Token,
                    FechaInicio = createSesionDto.FechaInicio,
                    FechaFin = createSesionDto.FechaFin,
                    Estado = createSesionDto.Estado
                };
                var respuesta = await _apiRepository.Create(Sesione, "");
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
        public async Task<ApiResponse<string>> UpdateSesion(int id, [FromBody] SesionDto updateSesione)
        {
            try
            {

                var existeSesione = await _apiRepository.GetById(id);
                if (existeSesione.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeSesione.Data.UsuarioId = updateSesione.UsuarioID;
                existeSesione.Data.Token = updateSesione.Token;
                existeSesione.Data.FechaInicio = updateSesione.FechaInicio;
                existeSesione.Data.FechaFin = updateSesione.FechaFin;
                existeSesione.Data.Estado = updateSesione.Estado;

                var respuesta = await _apiRepository.Update(id, existeSesione.Data);
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
        public async Task<ApiResponse<string>> DeleteSesion(int id)
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

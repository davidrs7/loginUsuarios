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
    public class CompetenciasController : ControllerBase
    {
        private readonly IRepository<Competencia> _apiRepository;
        public CompetenciasController(IRepository<Competencia> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Competencia>>> GetAllCompetencias()
        {
            var Competencias = await _apiRepository.GetAll();
            return Ok(Competencias);
        }


        [HttpGet("{id}")]
        public async Task<ApiResponse<Competencia>> GetCompetenciaById(int id)
        {
            try
            {
                var Competencia = await _apiRepository.GetById(id);

                if (Competencia.Data == null)
                {
                    Competencia.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Competencia;
                }
                return Competencia;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Competencia>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateCompetencia([FromBody] CompetenciasDto CompetenciasDto)
        {
            try
            {
                var Competencia = new Competencia
                {
                    competencia = CompetenciasDto.competencia,
                    estado = CompetenciasDto.estado
                };
                var respuesta = await _apiRepository.Create(Competencia, "");
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
        public async Task<ApiResponse<string>> UpdateCompetencia(int id, [FromBody] CompetenciasDto updateCompetencia)
        {
            try
            {

                var existeCompetencia = await _apiRepository.GetById(id);
                if (existeCompetencia.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeCompetencia.Data.competencia = updateCompetencia.competencia;
                existeCompetencia.Data.estado = updateCompetencia.estado; 
                var respuesta = await _apiRepository.Update(id, existeCompetencia.Data);
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
        public async Task<ApiResponse<string>> DeleteCompetencia(int id)
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

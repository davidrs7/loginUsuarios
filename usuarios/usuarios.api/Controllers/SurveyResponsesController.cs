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
    public class SurveyResponsesController : ControllerBase
    {
        private readonly IRepository<SurveyResponses> _apiRepository;
        public SurveyResponsesController(IRepository<SurveyResponses> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<SurveyResponses>>> GetAllSurveyResponses()
        {
            var SurveyResponses = await _apiRepository.GetAll();
            return Ok(SurveyResponses);
        }

        [HttpGet("{idUser}")]
        public async Task<ActionResult<IEnumerable<respuestas_usuario>>> GetSurveyResponsesById(int idUser)
        {
            var SurveyResponses = await _apiRepository.GetAll();
            SurveyResponses.Data = SurveyResponses.Data.Where(x => x.user_id == idUser);
            return Ok(SurveyResponses);
        }

        [HttpPost]
        public async Task<ApiResponse<string>> CreateSurveyResponses([FromBody] SurveyResponsesDto SurveyResponsesDto)
        {
            try
            {
                var SurveyResponse = new SurveyResponses
                { 
                    survey_id = SurveyResponsesDto.survey_id,
                    field_id = SurveyResponsesDto.field_id,
                    user_id = SurveyResponsesDto.user_id,
                    survey_header_id = SurveyResponsesDto.survey_header_id,
                    response_value = SurveyResponsesDto.response_value,
                };
                var respuesta = await _apiRepository.Create(SurveyResponse, "");
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
        public async Task<ApiResponse<string>> UpdateSurveyResponses(int id, [FromBody] SurveyResponsesDto UpdateSurveyResponsesDto)
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

                existerespuestas_usuario.Data.survey_id = UpdateSurveyResponsesDto.survey_id;
                existerespuestas_usuario.Data.field_id = UpdateSurveyResponsesDto.field_id;
                existerespuestas_usuario.Data.user_id = UpdateSurveyResponsesDto.user_id; 
                existerespuestas_usuario.Data.survey_header_id = UpdateSurveyResponsesDto.survey_header_id;
                existerespuestas_usuario.Data.response_value = UpdateSurveyResponsesDto.response_value;

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
        public async Task<ApiResponse<string>> DeleteSurveyResponses(int id)
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

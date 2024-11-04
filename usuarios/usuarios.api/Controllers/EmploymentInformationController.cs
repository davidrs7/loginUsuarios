using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core;
using usuarios.core.interfaces;
using usuarios.infra.Data.Modelos;

namespace usuarios.api.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class EmploymentInformationController : Controller
    {
        private readonly IRepository<EmploymentInformation> _apiRepository;
        public EmploymentInformationController(IRepository<EmploymentInformation> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<EmploymentInformation>>> GetAllEmplymentInformation()
        {
            var EmploymentInformations = await _apiRepository.GetAll();
            return Ok(EmploymentInformations);
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<EmploymentInformation>> GetUserById(int id)
        {
            var EmploymentInformations = await _apiRepository.GetAll();
            var EmploymentInformation = EmploymentInformations.Data.Where(x => x.EmployeeId == id);
            return Ok(EmploymentInformation);
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateCompany([FromBody] EmploymentInformationDto createEmploymentInformationDto)
        {
            try
            {
                var EmploymentInformation = new EmploymentInformation
                {
                    CompanyName = createEmploymentInformationDto.CompanyName,
                    JobTitle = createEmploymentInformationDto.JobTitle,
                    EmployeeId = createEmploymentInformationDto.EmployeeId,
                    StartDate = createEmploymentInformationDto.StartDate,
                    EndDate = createEmploymentInformationDto.EndDate
                };
                var respuesta = await _apiRepository.Create(EmploymentInformation, "");
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
        public async Task<ApiResponse<string>> UpdateCompany(int id, [FromBody] EmploymentInformationDto updateEmploymentInformation)
        {
            try
            {

                var existeEmploymentInformation = await _apiRepository.GetById(id);
                if (existeEmploymentInformation.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeEmploymentInformation.Data.CompanyName = updateEmploymentInformation.CompanyName;
                existeEmploymentInformation.Data.JobTitle = updateEmploymentInformation.JobTitle;
                existeEmploymentInformation.Data.EmployeeId = updateEmploymentInformation.EmployeeId;
                existeEmploymentInformation.Data.StartDate = updateEmploymentInformation.StartDate;
                existeEmploymentInformation.Data.EndDate = updateEmploymentInformation.EndDate;

                var respuesta = await _apiRepository.Update(id, existeEmploymentInformation.Data);
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
        public async Task<ApiResponse<string>> DeleteEmploymentInformation(int id)
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

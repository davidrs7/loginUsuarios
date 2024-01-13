using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using usuarios.api.Dto;
using usuarios.core.interfaces;
using usuarios.core;
using usuarios.infra.Repository;
using System.ComponentModel.DataAnnotations;
using usuarios.core.validators;
using usuarios.infra.Data.Modelos;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using System.Net.Mime;

namespace usuarios.api.Controllers
{
 
    [Route("api/[controller]")]
    [ApiController]
    public class EmpresasController : ControllerBase
    {
        private readonly IRepository<Empresa> _apiRepository;         
        public EmpresasController(IRepository<Empresa> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Empresa>>> GetAllCompanies()
        {
            var empresas = await _apiRepository.GetAll();
            return Ok(empresas);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Empresa>> GetUserById(int id)
        {
            try
            {
                var empresa = await _apiRepository.GetById(id);

                if (empresa.Data == null)
                {
                    empresa.Estado.Descripcion = "No existen datos para esta consulta.";
                    return empresa;
                } 
                return empresa;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Empresa>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateCompany([FromBody] empresaDto createEmpresaDto)
        {
            try
            { 
                var empresa = new Empresa
                {
                    Nombre = createEmpresaDto.Nombre,
                    Estado = createEmpresaDto.Estado                  
                };
                var respuesta = await _apiRepository.Create(empresa,"");
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
        public async Task<ApiResponse<string>> UpdateCompany(int id, [FromBody] empresaDto updateEmpresa)
        {
            try
            {

                var existeEmpresa = await _apiRepository.GetById(id);
                if (existeEmpresa.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeEmpresa.Data.Nombre = updateEmpresa.Nombre;
                existeEmpresa.Data.Estado = updateEmpresa.Estado; 

                var respuesta = await _apiRepository.Update(id, existeEmpresa.Data);
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
        public async Task<ApiResponse<string>> DeleteCompany(int id)
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

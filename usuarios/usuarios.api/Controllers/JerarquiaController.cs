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


namespace usuarios.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JerarquiaController : ControllerBase
    {
        private readonly IRepository<Jerarquia> _apiRepository;
        public JerarquiaController(IRepository<Jerarquia> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Jerarquia>>> GetAllJerarquias()
        {
            var Jerarquias = await _apiRepository.GetAll();
            return Ok(Jerarquias);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Jerarquia>> GetJerarquiaById(int id)
        {
            try
            {
                var Jerarquia = await _apiRepository.GetById(id);

                if (Jerarquia.Data == null)
                {
                    Jerarquia.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Jerarquia;
                }
                return Jerarquia;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Jerarquia>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateJerarquia([FromBody] JerarquiaDto createJerarquiaDto)
        {
            try
            {
                var Jerarquia = new Jerarquia
                {
                    JefeId = createJerarquiaDto.JefeID,
                    SubordinadoId = createJerarquiaDto.SubordinadoID
                };
                var respuesta = await _apiRepository.Create(Jerarquia, "");
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
        public async Task<ApiResponse<string>> UpdateJerarquia(int id, [FromBody] JerarquiaDto updateJerarquia)
        {
            try
            {

                var existeJerarquia = await _apiRepository.GetById(id);
                if (existeJerarquia.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeJerarquia.Data.JefeId = updateJerarquia.JefeID;
                existeJerarquia.Data.SubordinadoId = updateJerarquia.SubordinadoID;

                var respuesta = await _apiRepository.Update(id, existeJerarquia.Data);
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
        public async Task<ApiResponse<string>> DeleteJerarquia(int id)
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

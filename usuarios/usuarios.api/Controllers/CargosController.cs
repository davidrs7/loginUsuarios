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
    public class CargosController : ControllerBase
    {
        private readonly IRepository<Cargo> _apiRepository;
        public CargosController(IRepository<Cargo> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Cargo>>> GetAllCargos()
        {
            var cargos = await _apiRepository.GetAll();
            return Ok(cargos);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Cargo>> GetCargoById(int id)
        {
            try
            {
                var Cargo = await _apiRepository.GetById(id);

                if (Cargo.Data == null)
                {
                    Cargo.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Cargo;
                }
                return Cargo;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Cargo>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateCargo([FromBody] CargoDto createCargoDto)
        {
            try
            {
                var Cargo = new Cargo
                {
                    Nombre = createCargoDto.Nombre,
                    Descripcion = createCargoDto.Descripcion,
                    EmpresaId = createCargoDto.EmpresaID,
                    Estado = createCargoDto.Estado
                };
                var respuesta = await _apiRepository.Create(Cargo, "");
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
        public async Task<ApiResponse<string>> UpdateCargo(int id, [FromBody] CargoDto updateCargo)
        {
            try
            {

                var existeCargo = await _apiRepository.GetById(id);
                if (existeCargo.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeCargo.Data.Nombre = updateCargo.Nombre;
                existeCargo.Data.EmpresaId = updateCargo.EmpresaID;
                existeCargo.Data.Descripcion = updateCargo.Descripcion;
                existeCargo.Data.Estado = updateCargo.Estado;

                var respuesta = await _apiRepository.Update(id, existeCargo.Data);
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
        public async Task<ApiResponse<string>> DeleteCargo(int id)
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

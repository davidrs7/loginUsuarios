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
    public class ObjetivosController : ControllerBase
    {
        private readonly IRepository<Objetivo> _apiRepository;
        public ObjetivosController(IRepository<Objetivo> userRepository)
        {
            _apiRepository = userRepository;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<Objetivo>>> GetAllObjetivos()
        {
            var objetivos = await _apiRepository.GetAll();
            return Ok(objetivos);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<Objetivo>> GetObjetivosById(int id)
        {
            try
            {
                var Objetivo = await _apiRepository.GetById(id);

                if (Objetivo.Data == null)
                {
                    Objetivo.Estado.Descripcion = "No existen datos para esta consulta.";
                    return Objetivo;
                }
                return Objetivo;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Objetivo>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateObjetivo([FromBody] ObjetivosDto createObjetivoDto)
        {
            try
            {
                var Objetivo = new Objetivo
                {
                    Titulo = createObjetivoDto.Titulo,
                    Descripcion = createObjetivoDto.Descripcion,
                    Peso = createObjetivoDto.Peso,
                    FechaInicio = createObjetivoDto.FechaInicio,
                    FechaFin = createObjetivoDto.FechaFin,
                    Estado = createObjetivoDto.Estado
                };
                var respuesta = await _apiRepository.Create(Objetivo, "");
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
        public async Task<ApiResponse<string>> UpdateObjetivo(int id, [FromBody] ObjetivosDto updateObjetivo)
        {
            try
            {

                var existeObjetivo = await _apiRepository.GetById(id);
                if (existeObjetivo.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeObjetivo.Data.Titulo = updateObjetivo.Titulo;
                existeObjetivo.Data.Descripcion = updateObjetivo.Descripcion;
                existeObjetivo.Data.Peso = updateObjetivo.Peso;
                existeObjetivo.Data.FechaInicio = updateObjetivo.FechaInicio;
                existeObjetivo.Data.FechaFin = updateObjetivo.FechaFin;
                existeObjetivo.Data.Estado = updateObjetivo.Estado;

                var respuesta = await _apiRepository.Update(id, existeObjetivo.Data);
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
        public async Task<ApiResponse<string>> DeleteObjetivo(int id)
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

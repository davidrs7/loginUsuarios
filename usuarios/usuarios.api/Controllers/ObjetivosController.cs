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


        // Se recibe el id del usuario
        [HttpGet("{id}")]
        public async Task<ActionResult<Objetivo>> GetObjetivosById(int id)
        { 
                var objetivos = await _apiRepository.GetAll();
                objetivos.Data = objetivos.Data.Where(x => x.IdUsuario == id); 
                return Ok(objetivos); 
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateObjetivo([FromBody] ObjetivosDto createObjetivoDto)
        {
            try
            {
                var Objetivo = new Objetivo
                {
                    IdUsuario = createObjetivoDto.IdUsuario,
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

                existeObjetivo.Data.IdUsuario = updateObjetivo.IdUsuario;
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


        [HttpPost("cargar-objetivos")]
        public async Task<ApiResponse<string>> CargarObjetivos([FromForm] FileUserModelDto model)
        {
            if (model == null || model.File == null || model.File.Length == 0)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = "Archivo vacio" },
                    Data = null
                };
            }

            var users = await _apiRepository.GetAll();
            var contador = 0;

            try
            {
                using (var reader = new StreamReader(model.File.OpenReadStream()))
                {
                    var objetivos = new List<Objetivo>();

                    while (!reader.EndOfStream)
                    {
                        var line = await reader.ReadLineAsync();
                        var values = line.Split(',');

                        var objetivo = new Objetivo
                        {
                            IdUsuario = Convert.ToInt32(values[0]),
                            Titulo = values[1],
                            Descripcion = values[2],
                            Peso = Convert.ToInt32(values[3]),
                            FechaInicio = DateTime.Parse(values[4]),
                            FechaFin = DateTime.Parse(values[5]),
                            Estado = Convert.ToBoolean(values[6])
                        };

                        objetivos.Add(objetivo);

                        var objetivoSel = users.Data
                                            .Where(x => x.Titulo == objetivo.Titulo && x.Descripcion == objetivo.Descripcion && 
                                                        x.Peso == objetivo.Peso && x.FechaInicio == objetivo.FechaInicio && 
                                                        x.FechaFin == objetivo.FechaFin && x.IdUsuario == objetivo.IdUsuario).Count();

                        if (objetivoSel == 0)
                        {
                            var create = await _apiRepository.Create(objetivo, "");
                            contador = create.Estado.Codigo == "200" ? contador += 1 : contador;
                        }

                    }

                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "200", Mensaje = "Exito", Descripcion = "Se cargaron: " + contador + " objetivos de: " + objetivos.Count() + " subidos en el archivo." },
                        Data = null
                    };
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse<string>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = "Problemas para cargar el archivo por favor revisa la estructura." },
                    Data = null
                };
            }
        }

    }
}

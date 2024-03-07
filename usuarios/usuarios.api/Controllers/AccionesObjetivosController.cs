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
    public class AccionesObjetivosController : ControllerBase
    {
        private readonly IRepository<AccionObjetivo> _apiRepository;
        public AccionesObjetivosController(IRepository<AccionObjetivo> userRepository)
        {
            _apiRepository = userRepository;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<AccionObjetivo>>> GetAllAccionObjetivos()
        {
            var AccionObjetivos = await _apiRepository.GetAll();
            return Ok(AccionObjetivos);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<AccionObjetivo>> GetAccionObjetivoById(int id)
        {
            try
            {
                var AccionObjetivo = await _apiRepository.GetById(id);

                if (AccionObjetivo.Data == null)
                {
                    AccionObjetivo.Estado.Descripcion = "No existen datos para esta consulta.";
                    return AccionObjetivo;
                }
                return AccionObjetivo;
            }
            catch (Exception ex)
            {
                return new ApiResponse<AccionObjetivo>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }
         
        [HttpGet("xIduser/{id}")]
        public async Task<ActionResult<IEnumerable<Usuario>>> GetUsersByIdBoss(int id)
        {
            var AccionesObjetivos = await _apiRepository.GetAll();
            AccionesObjetivos.Data = AccionesObjetivos.Data.Where(x => x.IdUsuario == id);
            return Ok(AccionesObjetivos);
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateAccionObjetivo([FromBody] AccionesObjetivosDto createAccionObjetivoDto)
        {
            try
            {
                var AccionObjetivo = new AccionObjetivo
                {
                    IdObjetivo = createAccionObjetivoDto.IdObjetivo,
                    IdUsuario = createAccionObjetivoDto.IdUsuario,
                    Descripcion = createAccionObjetivoDto.Descripcion,
                    Calificacion = createAccionObjetivoDto.Calificacion,
                    Evidencia = createAccionObjetivoDto.Evidencia,
                    IdEstado = createAccionObjetivoDto.IdEstado,
                    Comentarios = createAccionObjetivoDto.Comentarios,
                    FechaAccion = createAccionObjetivoDto.FechaAccion
                };
                var respuesta = await _apiRepository.Create(AccionObjetivo, "");
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
        public async Task<ApiResponse<string>> UpdateAccionObjetivo(int id, [FromBody] AccionesObjetivosDto updateAccionObjetivo)
        {
            try
            {

                var existeAccionObjetivo = await _apiRepository.GetById(id);
                if (existeAccionObjetivo.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeAccionObjetivo.Data.IdObjetivo = updateAccionObjetivo.IdObjetivo;
                existeAccionObjetivo.Data.IdUsuario = updateAccionObjetivo.IdUsuario;
                existeAccionObjetivo.Data.Descripcion = updateAccionObjetivo.Descripcion;
                existeAccionObjetivo.Data.Calificacion = updateAccionObjetivo.Calificacion;
                existeAccionObjetivo.Data.Evidencia = updateAccionObjetivo.Evidencia;
                existeAccionObjetivo.Data.IdEstado = updateAccionObjetivo.IdEstado;
                existeAccionObjetivo.Data.Comentarios = updateAccionObjetivo.Comentarios;
                existeAccionObjetivo.Data.FechaAccion = updateAccionObjetivo.FechaAccion;

                var respuesta = await _apiRepository.Update(id, existeAccionObjetivo.Data);
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
        public async Task<ApiResponse<string>> DeleteAccionObjetivo(int id)
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



        [HttpPost("cargar-acciones")]
        public async Task<ApiResponse<string>> CargarAcciones([FromForm] FileUserModelDto model)
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
                    var acciones = new List<AccionObjetivo>();

                    while (!reader.EndOfStream)
                    {
                        var line = await reader.ReadLineAsync();
                        var values = line.Split(',');

                        var accion = new AccionObjetivo
                        {
                            IdObjetivo = Convert.ToInt32(values[0]),
                            IdUsuario = Convert.ToInt32(values[1]), 
                            Descripcion = values[2],
                            Calificacion = Convert.ToInt32(values[3]),
                            Evidencia = values[4],
                            IdEstado = Convert.ToInt32(values[5]),
                            Comentarios = values[6],
                            FechaAccion = DateTime.Parse(values[7])
                        };

                        acciones.Add(accion);

                        var objetivoSel = users.Data
                                            .Where(x => x.IdObjetivo == accion.IdObjetivo && x.IdUsuario == accion.IdUsuario &&
                                                        x.Descripcion == accion.Descripcion ).Count();

                        if (objetivoSel == 0)
                        {
                            var create = await _apiRepository.Create(accion, "");
                            contador = create.Estado.Codigo == "200" ? contador += 1 : contador;
                        }

                    }

                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "200", Mensaje = "Exito", Descripcion = "Se cargaron: " + contador + " acciones de: " + acciones.Count() + " subidos en el archivo." },
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

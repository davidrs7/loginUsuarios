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
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    //[Produces(MediaTypeNames.Application.Json)]
    [Route("api/[controller]")]
    [ApiController]
    public class ColoresController : ControllerBase
    {
        private readonly IRepository<Color> _apiRepository;
        public ColoresController(IRepository<Color> userRepository)
        {
            _apiRepository = userRepository;
        }
         
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Color>>> GetAllColores()
        {
            var Colores = await _apiRepository.GetAll();
            return Ok(Colores);
        }

        [HttpGet("colorHex/{colorHex}")]
        public async Task<ApiResponse<Color>> GetColorById(string colorHex)
        {
            try
            {
                var Colores = await _apiRepository.GetAll();
                var Color = Colores.Data.Where(x => x.Hex == colorHex).ToList();
                Color colorSeleccionado = new Color();

                if (Color.Count()>0)
                {
                    colorSeleccionado.Id = Color[0].Id;
                    colorSeleccionado.Hex = Color[0].Hex;
                    colorSeleccionado.Available = Color[0].Available;
                   
                } 
                var resultSesion = new ApiResponse<Color>
                {
                    Estado = new Estado { Codigo = "200", Mensaje = "Respuesta exitosa", Descripcion = "" },
                    Data = colorSeleccionado
                };
                 
                return resultSesion;
            }
            catch (Exception ex)
            {
                return new ApiResponse<Color>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }


        [HttpPost]
        public async Task<ApiResponse<string>> CreateColor([FromBody] ColorDto createColorDto)
        {
            try
            {
                var Color = new Color
                {
                    Id = createColorDto.Id,
                    Available = createColorDto.Available,
                    Hex = createColorDto.Hex, 
                };
                var respuesta = await _apiRepository.Create(Color, "");
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
        public async Task<ApiResponse<string>> UpdateColor(int id, [FromBody] ColorDto updateColor)
        {
            try
            {

                var existeColor = await _apiRepository.GetById(id);
                if (existeColor.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeColor.Data.Id = updateColor.Id;
                existeColor.Data.Available = updateColor.Available;
                existeColor.Data.Hex = updateColor.Hex; 

                var respuesta = await _apiRepository.Update(id, existeColor.Data);
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
        public async Task<ApiResponse<string>> DeleteColor(int id)
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

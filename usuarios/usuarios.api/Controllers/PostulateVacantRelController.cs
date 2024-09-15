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
    public class PostulateVacantRelController : ControllerBase
    {
        private readonly IRepository<PostulateVacantRel> _apiRepository;
        public PostulateVacantRelController(IRepository<PostulateVacantRel> userRepository)
        {
            _apiRepository = userRepository;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PostulateVacantRel>>> GetAllPostulateVacantRel()
        {
            var PostulateVacantRel = await _apiRepository.GetAll();
            return Ok(PostulateVacantRel);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<PostulateVacantRel>> GetPostulateVacantRelsById(int id)
        {
            try
            {
                var PostulateVacantRel = await _apiRepository.GetById(id);

                if (PostulateVacantRel.Data == null)
                {
                    PostulateVacantRel.Estado.Descripcion = "No existen datos para esta consulta.";
                    return PostulateVacantRel;
                }
                return PostulateVacantRel;
            }
            catch (Exception ex)
            {
                return new ApiResponse<PostulateVacantRel>
                {
                    Estado = new Estado { Codigo = "500", Mensaje = "Error", Descripcion = ex.InnerException.Message },
                    Data = null
                };
            }
        }

        [HttpPost]
        public async Task<ApiResponse<string>> CreatePostulateVacantRel([FromBody] PostulateVacantRelDto PostulateVacantRelDto)
        {
            try
            {
                var PostulateVacantRel = new PostulateVacantRel
                {
                    Id = PostulateVacantRelDto.Id,
                    VacantId = PostulateVacantRelDto.VacantId,
                    PostulateId = PostulateVacantRelDto.PostulateId,
                    Active = PostulateVacantRelDto.Active,
                    IsEmployee = PostulateVacantRelDto.IsEmployee
                };
                var respuesta = await _apiRepository.Create(PostulateVacantRel, "");
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
        public async Task<ApiResponse<string>> UpdatePostulateVacantRel(int id, [FromBody] PostulateVacantRelDto updatePostulateVacantRel)
        {
            try
            {

                var existeupdatePostulateVacantRel = await _apiRepository.GetById(id);
                if (existeupdatePostulateVacantRel.Data == null)
                {
                    return new ApiResponse<string>
                    {
                        Estado = new Estado { Codigo = "404", Mensaje = "Error", Descripcion = "No existe este registro para actualizar" },
                        Data = null
                    };
                }

                existeupdatePostulateVacantRel.Data.Id = updatePostulateVacantRel.Id;
                existeupdatePostulateVacantRel.Data.VacantId = updatePostulateVacantRel.VacantId;
                existeupdatePostulateVacantRel.Data.PostulateId = updatePostulateVacantRel.PostulateId;
                existeupdatePostulateVacantRel.Data.Active = updatePostulateVacantRel.Active;
                existeupdatePostulateVacantRel.Data.IsEmployee = updatePostulateVacantRel.IsEmployee;

                var respuesta = await _apiRepository.Update(id, existeupdatePostulateVacantRel.Data);
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
        public async Task<ApiResponse<string>> DeletePermiso(int id)
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

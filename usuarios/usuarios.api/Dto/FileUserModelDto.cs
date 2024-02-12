using Microsoft.AspNetCore.Http;

namespace usuarios.api.Dto
{
    public class FileUserModelDto
    {
        public IFormFile File { get; set; }
    }
}

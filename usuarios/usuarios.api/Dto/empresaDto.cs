using System.ComponentModel.DataAnnotations;
using usuarios.core.validators;

namespace usuarios.api.Dto
{
    public class empresaDto
    {
        [Required]
        public string Nombre {get; set;}
        public bool Estado {get; set; }
    }
}

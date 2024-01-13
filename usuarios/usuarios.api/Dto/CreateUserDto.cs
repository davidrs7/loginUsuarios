using System.ComponentModel.DataAnnotations;
using usuarios.core.validators;

namespace usuarios.api.Dto
{
    public class CreateUserDto
    {

        public string Nombre { get; set; }
        [Required]
        //[passwordValidate]
        public string? Contraseña { get; set; }
        public string? NumDocumento { get; set; }
        public string? CorreoElectronico { get; set; }
        public string? Telefono { get; set; }
        public string? Direccion { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public DateTime FechaCreacion { get; set; }
        public int TipoDocumento { get; set; }
        public int SexoId { get; set; }
        public int? JefeId { get; set; }
        public int RolId { get; set; }
        public int CargoId { get; set; }
        public int EmpresaId { get; set; }
        public int? UsuarioIdOpcional { get; set; }
        public bool Estado { get; set; }
    }
}

namespace usuarios.api.Dto
{
    public class SesionDto
    { 
        public int UsuarioID { get; set; }
        public string Token { get; set; }
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
        public bool Estado { get; set; }

    }
}

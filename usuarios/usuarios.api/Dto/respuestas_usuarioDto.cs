namespace usuarios.api.Dto
{
    public class respuestas_usuarioDto
    {
        public int id { get; set; }
        public int id_pregunta { get; set; }
        public int id_respuesta { get; set; }
        public int id_usuario_califica { get; set; }
        public int id_usuario_calificado { get; set; }
        public string comentarios { get; set; }
        public DateTime fecha_accion { get; set; }
    }
}

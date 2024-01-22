namespace usuarios.api.Dto
{
    public class preguntaDto
    {
        public int id { get; set; }
        public string pregunta { get; set; }
        public bool estado { get; set; }
        public DateTime fecha_inicio { get; set; }
        public DateTime fecha_fin { get; set; }
    }
}

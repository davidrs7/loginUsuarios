namespace usuarios.api.Dto
{
    public class opciones_respuestaDto
    {
        public int id { get; set; }
        public int id_pregunta { get; set; }
        public string descripcion { get; set; }
        public bool estado { get; set; }
        public double peso { get; set; }
    }
}

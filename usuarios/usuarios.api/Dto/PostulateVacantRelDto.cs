namespace usuarios.api.Dto
{
    public class PostulateVacantRelDto
    {
        public int Id { get; set; }
        public int VacantId { get; set; }
        public int PostulateId { get; set; }
        public int Active { get; set; }
        public int IsEmployee { get; set; }
    }
}

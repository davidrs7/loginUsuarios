namespace usuarios.api.Dto
{
    public class EmploymentInformationDto
    {
        public int id { get; set; }
        public string CompanyName { get; set; }
        public string JobTitle { get; set; }
        public int EmployeeId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
}

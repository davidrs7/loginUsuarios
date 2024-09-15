namespace usuarios.api.Dto
{
    public class SurveyResponsesDto
    {
        public int id { get; set; }
        public int survey_id { get; set; }
        public int field_id { get; set; }
        public int user_id { get; set; }
        public int survey_header_id { get; set; }
        public string? response_value { get; set; }
    }
}

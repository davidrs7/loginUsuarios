using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.infra.Data.Modelos
{
    public class SurveyResponses
    {
        public int id { get;set; }
        public int survey_id { get;set; }
        public int field_id { get;set; }
        public int user_id { get;set; } 
        public int survey_header_id { get;set; }
        public string? response_value { get; set; } 
    }
}

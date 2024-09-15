using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using usuarios.infra.Data.Modelos;

namespace usuarios.infra.Data.ConfigTablas
{
    internal class SurveyResponsesConfig : IEntityTypeConfiguration<SurveyResponses>
    {
        void IEntityTypeConfiguration<SurveyResponses>.Configure(EntityTypeBuilder<SurveyResponses> entity)
        {
            entity.ToTable("survey_responses");
            entity.HasKey(e => e.id);
            entity.Property(e => e.survey_id).HasColumnName("survey_id");
            entity.Property(e => e.field_id).HasColumnName("field_id");
            entity.Property(e => e.user_id).HasColumnName("user_id");
            entity.Property(e => e.survey_header_id).HasColumnName("survey_header_id");
            entity.Property(e => e.response_value).HasColumnName("response_value"); 
        }
    }
}

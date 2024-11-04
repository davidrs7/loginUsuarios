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
    internal class EmploymentInformationConfig : IEntityTypeConfiguration<EmploymentInformation>
    {
        void IEntityTypeConfiguration<EmploymentInformation>.Configure(EntityTypeBuilder<EmploymentInformation> entity)
        {

            entity.ToTable("employmentinformation");
            entity.HasKey(e => e.id);
            entity.Property(e => e.CompanyName).HasColumnName("company_name");
            entity.Property(e => e.JobTitle).HasColumnName("job_title");
            entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            entity.Property(e => e.StartDate).HasColumnName("start_date");
            entity.Property(e => e.EndDate).HasColumnName("end_date");

        }
    }
}

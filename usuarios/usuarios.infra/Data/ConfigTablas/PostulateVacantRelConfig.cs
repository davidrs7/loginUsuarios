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
    internal class PostulateVacantRelConfig : IEntityTypeConfiguration<PostulateVacantRel>
    {
        void IEntityTypeConfiguration<PostulateVacantRel>.Configure(EntityTypeBuilder<PostulateVacantRel> entity)
        {
            entity.ToTable("postulate_vacant_rel");
            entity.HasKey(e => e.Id);
            entity.Property(e => e.VacantId).HasColumnName("VacantId");
            entity.Property(e => e.PostulateId).HasColumnName("PostulateId");
            entity.Property(e => e.Active).HasColumnName("Active");
            entity.Property(e => e.IsEmployee).HasColumnName("IsEmployee"); 
        }
    }
}

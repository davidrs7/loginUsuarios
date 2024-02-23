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
    internal class CompetenciaConfig  : IEntityTypeConfiguration<Competencia>
    {
        void IEntityTypeConfiguration<Competencia>.Configure(EntityTypeBuilder<Competencia> entity)
        {
            entity.ToTable("Competencias");
            entity.HasKey(e => e.id);
            entity.Property(e => e.competencia).HasColumnName("competencia");
            entity.Property(e => e.estado).HasColumnName("estado"); 
        }

    }
}

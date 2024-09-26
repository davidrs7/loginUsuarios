using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using usuarios.infra.Data.Modelos;

namespace usuarios.infra.Data.ConfigTablas
{
    internal class SexoConfig : IEntityTypeConfiguration<Sexo>
    {
        void IEntityTypeConfiguration<Sexo>.Configure(EntityTypeBuilder<Sexo> entity)
        {
           
                entity.ToTable("sexo");
                entity.Property(e => e.Descripcion).HasMaxLength(100);
                entity.Property(e => e.Estado)
                    .IsRequired()
                    .HasDefaultValueSql("'1'");
           
        }
    }
}

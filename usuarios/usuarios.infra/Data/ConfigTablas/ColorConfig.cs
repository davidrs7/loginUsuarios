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
    internal class ColorConfig : IEntityTypeConfiguration<Color>
    {
        void IEntityTypeConfiguration<Color>.Configure(EntityTypeBuilder<Color> entity)
        { 

            entity.ToTable("color");
            entity.HasIndex(e => e.Id, "Id");             
            entity.Property(e => e.Available).HasColumnName("Available");
            entity.Property(e => e.Hex).HasColumnName("Hex");

            entity.Property(e => e.Hex).HasMaxLength(255);


        }
    }
}

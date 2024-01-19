using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using usuarios.infra.Data.ConfigTablas;
using usuarios.infra.Data.Modelos;

namespace usuarios.infra.Context
{
    public  class login_tiinduxContext : DbContext
    {
        public login_tiinduxContext()
        {
        }

        public login_tiinduxContext(DbContextOptions<login_tiinduxContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Cargo> Cargos { get; set; } = null!;
        public virtual DbSet<Empresa> Empresas { get; set; } = null!;
        public virtual DbSet<Jerarquia> Jerarquias { get; set; } = null!;
        public virtual DbSet<Permiso> Permisos { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Sesione> Sesiones { get; set; } = null!;
        public virtual DbSet<Sexo> Sexos { get; set; } = null!;
        public virtual DbSet<Tiposdocumento> Tiposdocumentos { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;
        public virtual DbSet<rolesPermisos> rolesPermisos { get; set; } = null!;
        public virtual DbSet<Objetivo> Objetivos { get; set; } = null!;
        public virtual DbSet<EstadoAccion> EstadoAccion { get; set; } = null!;
        public virtual DbSet<AccionObjetivo> AccionesObjetivos { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            { 
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.ApplyConfiguration(new CargoConfig()); 
            modelBuilder.ApplyConfiguration(new EmpresasConfig());
            modelBuilder.ApplyConfiguration(new JerarquiaConfig());
            modelBuilder.ApplyConfiguration(new PermisoConfig()); 
            modelBuilder.ApplyConfiguration(new RolesConfig());
            modelBuilder.ApplyConfiguration(new SesionesConfig());
            modelBuilder.ApplyConfiguration(new SexoConfig());
            modelBuilder.ApplyConfiguration(new TipDocConfig());
            modelBuilder.ApplyConfiguration(new usuariosConfig()); 
            modelBuilder.ApplyConfiguration(new rolesPermisosConfig());
            modelBuilder.ApplyConfiguration(new ObjetivoConfig());
            modelBuilder.ApplyConfiguration(new EstadoAccionConfig());
            modelBuilder.ApplyConfiguration(new AccionesObjetivosConfig());

        }
         
    }
}

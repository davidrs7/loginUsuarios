namespace usuarios.api.Dto
{
    public class RolesDto
    { 
        public string Nombre { get; set;  }
        public string Descripcion { get; set;  }
        public int ColorId { get; set; }

        public int EmpresaId { get; set;  }
        public bool Estado { get; set; }
    }
}

using System;
using System.Collections.Generic; 

namespace usuarios.infra.Data.Modelos
{
    public partial class Color
    {
        public int Id { get; set; }
        public int Available { get; set; }
        public string Hex { get; set; }
    }
}

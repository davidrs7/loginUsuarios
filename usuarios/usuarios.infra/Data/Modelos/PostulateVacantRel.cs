using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.infra.Data.Modelos
{
    public class PostulateVacantRel
    {
        public int Id { get; set; }
        public int VacantId { get; set; }
        public int PostulateId { get; set; }
        public int Active { get; set; }
        public int IsEmployee { get; set; }
    }
}

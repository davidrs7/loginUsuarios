using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace usuarios.infra.Data.Modelos
{
    public class EmploymentInformation
    {
        public int id {  get; set; }
        public string CompanyName { get; set; }      
        public string JobTitle { get; set; }       
        public int EmployeeId { get; set; }         
        public DateTime StartDate { get; set; }      
        public DateTime? EndDate { get; set; }      

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDAGW.fuente.data
{
    public class empleadoData
    {
        public int id { get; set; }
        public int estado { get; set; }
        public int idPuesto { get; set; }
        public String nombre { get; set; }
        public String apellido { get; set; }
        public String direccion { get; set; }
        public String telefono { get; set; }
        public String dpi { get; set; }
        public String fechaNac { get; set; }

        public String puestos { get; set; }

    }
}
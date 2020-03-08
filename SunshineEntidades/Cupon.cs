using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Cupon
    {
        public int id { set; get; }
        public string nombre { set; get; }
        public string descripcion { set; get; }
        public int descuento { set; get; }
        public Nivel nivel { set; get; }
        public byte estado { set; get; }

        public Cupon()
        {
            nivel = new Nivel();
        }
    }
}

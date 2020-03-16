using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Producto
    {
        public int id { set; get; }
        public string nombre { set; get; }
        public string descripcion { set; get; }
        public int precio { set; get; }
        public Genero genero { set; get; }
        public TipoPrenda tipoPrenda { set; get; }
        
        public string imagen { set; get; }
        
        public Producto()
        {
            genero = new Genero();
            tipoPrenda = new TipoPrenda();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class DetPedido
    {
        public int id { set; get; }
        public int cantidad { set; get; }
        public Producto producto{ set; get; }
        public int subtotal { set; get; }
        public DateTime fechaPedido { set; get; }
        public Talla talla { set; get; }
        public Color color { set; get; }

        public DetPedido()
        {
            producto = new Producto();
            talla = new Talla();
            color = new Color();
        }
    }
}

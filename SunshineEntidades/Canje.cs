using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineEntidades
{
    public class Canje
    {
        public int id { set; get; }
        public Producto producto { set; get; }
        public ClienteCupon clienteCupon { set; get; }

        public Canje()
        {
            producto = new Producto();
            clienteCupon = new ClienteCupon();
        }
    }
}

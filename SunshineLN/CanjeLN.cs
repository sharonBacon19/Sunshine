using SunshineDatos;
using SunshineEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineLN
{
    public class CanjeLN
    {
        public static List<Canje> ObtenerTodos()
        {
            List<Canje> lista = new List<Canje>();
            DataSet ds = CanjeDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Canje registro = new Canje();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.producto = ProductoLN.Obtener(Convert.ToInt16(fila["IDPRODUCTO"]));
                registro.clienteCupon = ClienteCuponLN.Obtener(Convert.ToInt16(fila["IDCLIENTECUPON"]));
                lista.Add(registro);
            }
            return lista;
        }

        public static List<Canje> CanjePorProducto(int idProducto)
        {
            List<Canje> lista = CanjeLN.ObtenerTodos();
            List<Canje> canje = lista.Where(x => x.producto.id == idProducto).ToList();
            return canje;
        }

        public static void Insertar(Canje canje)
        {
            CanjeDatos.Insertar(canje);
        }
    }
}

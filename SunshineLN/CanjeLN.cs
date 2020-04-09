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
                registro.cliente = ClienteLN.ObtenerPorIdentificacion(Convert.ToString(fila["IDCLIENTE"]));
                registro.cupon = CuponLN.Obtener(Convert.ToInt16(fila["IDCUPON"]));
                lista.Add(registro);
            }
            return lista;
        }

        public static List<Canje> CanjePorCliente(string identifiacion)
        {
            List<Canje> lista = CanjeLN.ObtenerTodos();
            List<Canje> canje = lista.Where(x => x.cliente.identificacion == identifiacion).ToList();
            return canje;
        }

        public static void Insertar(Canje canje)
        {
            CanjeDatos.Insertar(canje);
        }
    }
}

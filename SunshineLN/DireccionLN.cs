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
    public class DireccionLN
    {
        public static List<Direccion> ObtenerTodos()
        {
            List<Direccion> lista = new List<Direccion>();
            DataSet ds = DireccionDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Direccion registro = new Direccion();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.provincia = ProvinciaLN.Obtener(Convert.ToInt16(fila["COD_PROVINCIA"]));
                registro.otrassennas = Convert.ToString(fila["OTRASSENNAS"]);
                registro.codigo_postal = Convert.ToString(fila["CODIGO_POSTAL"]);
                registro.cliente = ClienteLN.Obtener(Convert.ToInt16(fila["IDCLIENTE"]));

                lista.Add(registro);
            }
            return lista;
        }

        public static List<Direccion> DireccionPorCliente(int idCliente)
        {
            List<Direccion> lista = DireccionLN.ObtenerTodos();
            List<Direccion> cC = lista.Where(x => x.cliente.id == idCliente).ToList();
            return cC;
        }

        public static void Insertar(Direccion direccion)
        {
            DireccionDatos.Insertar(direccion);
        }
    }
}

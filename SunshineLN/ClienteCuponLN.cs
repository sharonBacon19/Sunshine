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
    public class ClienteCuponLN
    {
        public static List<ClienteCupon> ObtenerTodos()
        {
            List<ClienteCupon> lista = new List<ClienteCupon>();
            DataSet ds = ClienteDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                ClienteCupon registro = new ClienteCupon();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.cliente = ClienteLN.Obtener(Convert.ToInt16(fila["IDCLIENTE"]));
                registro.cupon.id = Convert.ToInt16(fila["IDCUPON"]);
                registro.codigoQR = Convert.ToInt32(fila["CODIGO_QR"]);

                lista.Add(registro);
            }
            return lista;
        }
        
        public static List<ClienteCupon> ClientePorCupon(int idCliente)
        {
            List<ClienteCupon> lista = ClienteCuponLN.ObtenerTodos();
            List<ClienteCupon> cC = lista.Where(x => x.cliente.id == idCliente).ToList();
            return cC;
        }

        public static List<ClienteCupon> CuponPorCliente(int idCupon)
        {
            List<ClienteCupon> lista = ClienteCuponLN.ObtenerTodos();
            List<ClienteCupon> cC = lista.Where(x => x.cupon.id == idCupon).ToList();
            return cC;
        }

        public static void Insertar(ClienteCupon clienteCupon)
        {
            ClienteCuponDatos.Insertar(clienteCupon);
        }
    }
}

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
    public class ClienteNivelLN
    {
        public static List<ClienteNivel> ObtenerTodos()
        {
            List<ClienteNivel> lista = new List<ClienteNivel>();
            DataSet ds = ClienteNivelDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                ClienteNivel registro = new ClienteNivel();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.cliente = ClienteLN.ObtenerPorIdentificacion(Convert.ToString(fila["IDCLIENTE"]));
                registro.montoActual = Convert.ToInt32(fila["MONTOACTUAL"]);
                registro.nivel = NivelLN.Obtener(Convert.ToInt16(fila["IDNIVEL"]));

                lista.Add(registro);
            }
            return lista;
        }

        public static List<ClienteNivel> ClientePorNivel(String identificacion)
        {
            List<ClienteNivel> lista = ClienteNivelLN.ObtenerTodos();
            List<ClienteNivel> cN = lista.Where(x => x.cliente.identificacion == identificacion).ToList();
            return cN;
        }

        public static List<ClienteNivel> NivelPorCliente(int idNIvel)
        {
            List<ClienteNivel> lista = ClienteNivelLN.ObtenerTodos();
            List<ClienteNivel> cN = lista.Where(x => x.nivel.id == idNIvel).ToList();
            return cN;
        }

        public static ClienteNivel Obtener(Cliente cliente)
        {
            List<ClienteNivel> lista = new List<ClienteNivel>();
            lista = ClienteNivelLN.ObtenerTodos();
            ClienteNivel n = new ClienteNivel();
            n = (lista.Find(elemento => elemento.cliente.identificacion == cliente.identificacion));
            return n;
        }

        public static void Insertar(ClienteNivel clienteNivel)
        {
            ClienteNivelDatos.Insertar(clienteNivel);
        }
    }
}

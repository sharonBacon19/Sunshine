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
    public class EncaPedidoLN
    {
        public static List<EncaPedido> ObtenerTodos()
        {
            List<EncaPedido> lista = new List<EncaPedido>();
            DataSet ds = EncaPedidoDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                EncaPedido registro = new EncaPedido();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.cliente = ClienteLN.Obtener(Convert.ToInt16(fila["IDCLIENTE"]));
                registro.total = Convert.ToInt32(fila["TOTAL"]);
                registro.detPedido = DetPedidoLN.Obtener(Convert.ToInt16(fila["IDDETPEDIDO"]));
                
                lista.Add(registro);
            }
            return lista;
        }

        public static List<EncaPedido> EncaPedidoPorCliente(int idCliente)
        {
            List<EncaPedido> lista = EncaPedidoLN.ObtenerTodos();
            List<EncaPedido> cC = lista.Where(x => x.cliente.id == idCliente).ToList();
            return cC;
        }

        public static List<EncaPedido> EncaPedidoPorDetPedido(int idDetPedido)
        {
            List<EncaPedido> lista = EncaPedidoLN.ObtenerTodos();
            List<EncaPedido> cC = lista.Where(x => x.detPedido.id == idDetPedido).ToList();
            return cC;
        }

        public static void Insertar(EncaPedido encaPedido)
        {
            EncaPedidoDatos.Insertar(encaPedido);
        }

        public static EncaPedido Obtener(int idEncaPedido)
        {
            List<EncaPedido> lista = new List<EncaPedido>();
            lista = EncaPedidoLN.ObtenerTodos();
            EncaPedido enc = new EncaPedido();
            enc = (lista.Find(elemento => elemento.id == idEncaPedido));
            return enc;
        }
    }
}

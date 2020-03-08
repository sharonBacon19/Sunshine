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
    public class DetPedidoLN
    {
        public static List<DetPedido> ObtenerTodos()
        {
            List<DetPedido> lista = new List<DetPedido>();
            DataSet ds = DetPedidoDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                DetPedido registro = new DetPedido();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.cantidad = Convert.ToInt16(fila["CANTIDAD"]);
                registro.producto.id = Convert.ToInt16(fila["IDPRODUCTO"]);
                registro.subtotal = Convert.ToInt32(fila["SUBTOTAL"]);
                registro.fechaPedido = Convert.ToDateTime(fila["FECHAPEDIDO"]);

                lista.Add(registro);
            }
            return lista;
        }

        public static DetPedido Obtener(int idDetPedido)
        {
            List<DetPedido> lista = new List<DetPedido>();
            lista = DetPedidoLN.ObtenerTodos();
            DetPedido det = new DetPedido();
            det = (lista.Find(elemento => elemento.id == idDetPedido));
            return det;
        }

        public static List<DetPedido> detPedidosPorProducto(int idProducto)
        {
            List<DetPedido> lista = DetPedidoLN.ObtenerTodos();
            List<DetPedido> cC = lista.Where(x => x.producto.id == idProducto).ToList();
            return cC;
        }

        public static void Insertar(DetPedido detPedido)
        {
            DetPedidoDatos.Insertar(detPedido);
        } 
    }
}

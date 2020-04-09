using SunshineEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunshineDatos
{
    public class DetPedidoDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaDetPedido");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "detPedido");
            return ds;
        }

        public static void Insertar(DetPedido detPedido)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_DetPedido");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@ID", detPedido.id);
            comando.Parameters.AddWithValue("@CANTIDAD", detPedido.cantidad);
            comando.Parameters.AddWithValue("@IDPRODUCTO", detPedido.producto.id);
            comando.Parameters.AddWithValue("@SUBTOTAL", detPedido.subtotal);
            comando.Parameters.AddWithValue("@FECHAPEDIDO", detPedido.fechaPedido);
            comando.Parameters.AddWithValue("@IDTALLA", detPedido.talla.id);
            comando.Parameters.AddWithValue("@IDCOLOR", detPedido.color.id);
            db.ExecuteNonQuery(comando);
        }
    }
}

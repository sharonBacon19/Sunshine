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
    public class EncaPedidoDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaEncaPedido");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "encaPedido");
            return ds;
        }

        public static void Insertar(EncaPedido encaPedido)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_EncaPedido");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@IDCLIENTE", encaPedido.cliente.id);
            comando.Parameters.AddWithValue("@TOTAL", encaPedido.total);
            comando.Parameters.AddWithValue("@IDDETPEDIDO", encaPedido.detPedido);
            db.ExecuteNonQuery(comando);
        }
    }
}

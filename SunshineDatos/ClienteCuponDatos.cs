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
    public class ClienteCuponDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaClienteCupon");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "clienteCupon");
            return ds;
        }



        public static void Insertar(ClienteCupon clienteCupon)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_ClienteCupon");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@IDCLIENTE", clienteCupon.cliente.id);
            comando.Parameters.AddWithValue("@IDCUPON", clienteCupon.cupon.id);
            comando.Parameters.AddWithValue("@CODIGO_QR", clienteCupon.codigoQR);
            db.ExecuteNonQuery(comando);
        }
    }
}

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
            comando.Parameters.AddWithValue("@IDCLIENTE", clienteCupon.cliente.identificacion);
            comando.Parameters.AddWithValue("@IDCUPON", clienteCupon.cupon.id);
            comando.Parameters.AddWithValue("@CODIGO_QR", clienteCupon.codigoQR);
            comando.Parameters.AddWithValue("@ESTADO", clienteCupon.estado);
            db.ExecuteNonQuery(comando);
        }

        public static void actualizarEstado(string identificacion, int estado)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Pa_ActualizarEstado");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@ESTADO", estado);
            comando.Parameters.AddWithValue("@IDCLIENTE", identificacion);
            db.ExecuteNonQuery(comando);
        }
    }
}

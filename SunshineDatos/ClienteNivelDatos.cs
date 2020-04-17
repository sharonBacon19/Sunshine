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
    public class ClienteNivelDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaClienteNivel");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "canje");
            return ds;
        }

        public static void Insertar(ClienteNivel clienteNivel)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_ClienteNivel");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@IDCLIENTE", clienteNivel.cliente.identificacion);
            comando.Parameters.AddWithValue("@MONTOACTUAL", clienteNivel.montoActual);
            comando.Parameters.AddWithValue("@IDNIVEL", clienteNivel.nivel.id);
            db.ExecuteNonQuery(comando);
        }

        public static void actualizar(string identificacion, int montoActual)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Pa_ActualizarMontoActual");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@MONTOACTUAL", montoActual);
            comando.Parameters.AddWithValue("@IDCLIENTE", identificacion);
            
            db.ExecuteNonQuery(comando);
        }

        public static void actualizarNivel(string identificacion, int idNivel)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Pa_ActualizarNivelDeCliente");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@IDNIVEL", idNivel);
            comando.Parameters.AddWithValue("@IDCLIENTE", identificacion);

            db.ExecuteNonQuery(comando);
        }
    }
}

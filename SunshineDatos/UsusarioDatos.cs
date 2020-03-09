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
    public class UsusarioDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListaUsuario");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "usuario");
            return ds;
        }

        public static void Insertar(Usuario usuario)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("Insertar_Usuaario");
            comando.CommandType = CommandType.StoredProcedure;
            //Parámetros
            comando.Parameters.AddWithValue("@TIPOUSUAIO", usuario.tipoUsuario);
            comando.Parameters.AddWithValue("@EMAIL", usuario.email);
            comando.Parameters.AddWithValue("@CONSTRASENNA", usuario.contrasenna);
            comando.Parameters.AddWithValue("@NOMBREUSUARIO", usuario.nombreUsuario);
            comando.Parameters.AddWithValue("@ESTADO", usuario.estado);
            db.ExecuteNonQuery(comando);
        }
    }
}

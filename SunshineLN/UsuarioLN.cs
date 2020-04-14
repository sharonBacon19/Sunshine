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
    public class UsuarioLN
    {
        public static List<Usuario> ObtenerTodos()
        {
            List<Usuario> lista = new List<Usuario>();
            DataSet ds = UsusarioDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Usuario registro = new Usuario();
                registro.id = Convert.ToInt16(fila["ID"]);
                registro.tipoUsuario = Convert.ToString(fila["TIPOUSUARIO"]);
                registro.email = Convert.ToString(fila["EMAIL"]);
                registro.contrasenna = Convert.ToString(fila["CONTRASENNA"]);
                registro.estado = Convert.ToInt16(fila["ESTADO"]);

                lista.Add(registro);
            }
            return lista;
        }

        public static Usuario Obtener(int idUsuario)
        {
            List<Usuario> lista = new List<Usuario>();
            lista = UsuarioLN.ObtenerTodos();
            Usuario usu = new Usuario();
            usu = (lista.Find(elemento => elemento.id == idUsuario));
            return usu;
        }

        public static Usuario ObtenerLogin(String email, String contrasenna)
        {
            List<Usuario> lista = new List<Usuario>();
            lista = UsuarioLN.ObtenerTodos();
            Usuario usu = new Usuario();
            usu = (lista.Find(elemento => elemento.email == email && elemento.contrasenna == contrasenna));
            return usu;
        }

        public static Usuario ObtenerPorContrasenna(string contra)
        {
            List<Usuario> lista = new List<Usuario>();
            lista = UsuarioLN.ObtenerTodos();
            Usuario usu = new Usuario();
            usu = (lista.Find(elemento => elemento.contrasenna == contra));
            return usu;
        }

        public static Usuario ObtenerPorEmail(string email)
        {
            List<Usuario> lista = new List<Usuario>();
            lista = UsuarioLN.ObtenerTodos();
            Usuario usu = new Usuario();
            usu = (lista.Find(elemento => elemento.email == email));
            return usu;
        }

        public static void Insertar(Usuario usuario)
        {
            UsusarioDatos.Insertar(usuario);
        }
    }
}

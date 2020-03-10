using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class Singin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlTipoIdentificacion.DataSource = TipoIdentificacionLN.ObtenerTodos();
                ddlTipoIdentificacion.DataTextField = "TIPO";
                ddlTipoIdentificacion.DataValueField = "ID";
                ddlTipoIdentificacion.DataBind();
            }
        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            String mensaje = "";
            try
            {               
                Usuario usu = new Usuario
                {
                    tipoUsuario = "Cliente",
                    contrasenna = Convert.ToString(txtContrasenna.Text),
                    email = Convert.ToString(txtEmail.Text),
                    estado = 1,
                };

                if (email_bien_escrito(usu.email))
                {
                    mensaje = "Email contiene un formato incorrecto";
                    lblMensaje.Text = mensaje;
                }
                else
                {
                    if (contrasenna_bien_escrita(usu.contrasenna))
                    {
                        mensaje = "contraseña contiene un formato incorrecto";
                    }
                }

                UsuarioLN.Insertar(usu);
                TipoIdentificacion tipo = TipoIdentificacionLN.Obtener(Convert.ToInt16(ddlTipoIdentificacion.SelectedValue));

                Cliente cliente = new Cliente
                {
                    fechaNacimiento = Convert.ToDateTime(txtFecha.Text),
                    identificacion = Convert.ToString(txtIdentificacion.Text),
                    nombreCompleto = Convert.ToString(txtNombre.Text),
                    tarjetaCredito = Convert.ToString(txtTarjetaCredito.Text),
                    tipoIdentificacion = tipo,
                    usuario = UsuarioLN.ObtenerPorContrasenna(usu.contrasenna)
                };

                ClienteLN.Insertar(cliente);
                Response.Redirect("login.aspx");

            }
            catch (Exception e1)
            {
                lblMensaje.Text = "Ha ocurrido un problema " + mensaje;
            }            
        }

        private Boolean email_bien_escrito(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)@\\w+([-.]\\w+)\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        private Boolean contrasenna_bien_escrita(String contrasenna)
        {
            Match matchLongitud = Regex.Match(contrasenna, @"^\w{8,15}\b");
            Match matchNumeros = Regex.Match(contrasenna, @"\d");
            Match matchEspeciales = Regex.Match(contrasenna, @"[ñÑ\-_¿.#¡]");
            Match matchMayusculas = Regex.Match(contrasenna, @"[A-Z]");

            if (!matchLongitud.Success || !matchMayusculas.Success || !matchNumeros.Success || !matchEspeciales.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //método para validación de tarjeta de crédito
    }
}
using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
                Usuario usu = new Usuario();
                usu = UsuarioLN.ObtenerLogin(Convert.ToString(txtEmail.Text), Convert.ToString(txtContrasenna.Text));

                if (usu != null)
                {
                    if (usu.tipoUsuario.Equals("Admin"))
                    {
                        Session["admin"] = usu;

                        Response.Redirect("inicioAdmin.aspx");
                    }
                    else
                    {
                    Session["cliente"] = ClienteLN.ObtenerPorUsuario(usu);

                    Response.Redirect("inicioCliente.aspx");
                    }
                    
                    
                }
                else
                {
                    //    ClientScript.RegisterStartupScript(this.GetType(),
                    //   "Login", "mensajeRedirect('Login','Verifique las credenciales','error','login.aspx')", true);
                    //
                    Response.Redirect("login.aspx");
                }
        }
    }
}
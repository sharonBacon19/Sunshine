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

            Response.Redirect("inicio.aspx");
            //if (IsValid)
            //{
            //    UsuarioBicicleta user = new UsuarioBicicleta();
            //    user.nombreUsuario = txtNombreUsuario.Text;
            //    user.password = txtPassword.Text;
            //    user = UsuarioBicicletaLN.Obtener(user);
            //    if (user != null)
            //    {
            //        Session["user"] = user;
            //ClientScript.RegisterStartupScript(
            //this.GetType(),
            //"Login", "mensajeRedirect('Login','Credenciales correctas','success','inicio.aspx')",
            //           true
            //           );
            //                }
            //                else
            //                {
            //                    ClientScript.RegisterStartupScript(
            //                   this.GetType(),
            //                   "Login",
            //"mensajeRedirect('Login','Verifique las credenciales','error','login.aspx')",
            //                   true
            //                   );
            //                }

        }

            
        }
}
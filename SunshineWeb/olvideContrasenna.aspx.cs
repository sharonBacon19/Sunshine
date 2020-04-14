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
    public partial class olvideContrasenna : System.Web.UI.Page
    {
        private Cliente cliente;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cliente = (Cliente)Session["cliente"];
            }
        }

        protected void btnOlvide_Click(object sender, EventArgs e)
        {
            Usuario usuario = UsuarioLN.ObtenerPorEmail(txtEmail.Text);

            if (usuario != null)
            {
                lblMensaje.Text = "La contraseña actual es: " + usuario.contrasenna;
            }
            else
            {
                lblMensaje.Text = "El email no coincide";
            }
        }
    }
}
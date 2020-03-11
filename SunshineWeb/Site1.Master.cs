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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cliente"] != null)
            {
                lblNombreCliente.Visible = true;
                ImgNIvel.Visible = true;

                Cliente cliente = (Cliente) Session["cliente"];
                lblNombreCliente.Text = cliente.nombreCompleto;

                ClienteNivel cN = ClienteNivelLN.Obtener(cliente);
                ImgNIvel.ImageUrl = cN.nivel.Imagen;

            }
        }
    }
}
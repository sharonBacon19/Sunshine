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
    public partial class VistaCliente : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Cliente)Session["cliente"] != null)
            {
                Cliente cliente = (Cliente)Session["cliente"];
                lblNombreCliente.Text = cliente.nombreCompleto;

                ClienteNivel cN = new ClienteNivel();
                cN = ClienteNivelLN.Obtener(cliente.identificacion);

                Nivel n = NivelLN.Obtener(cN.nivel.id);
                ImgNIvel.ImageUrl = n.Imagen;
                lblNombreCliente.Visible = true;
                ImgNIvel.Visible = true;
                btnCerrarSesion.Visible = true;
                //MenuCliente.Visible = true;

            }
            
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            if (Session["cliente"] != null)
            {
                Session["cliente"] = null;
                List<DetPedido> lista = new List<DetPedido>();
                Session["lista"] = lista;
                Response.Redirect("inicio.aspx");
            }

        }
    }
}
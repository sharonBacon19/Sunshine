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

    public partial class asignarCliente : System.Web.UI.Page
    {
        Cliente cliente = new Cliente();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id;
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    id = Convert.ToString(Request.QueryString["id"]);

                    cliente = ClienteLN.ObtenerPorIdentificacion(id);
                    listaCupon();

                    lblNombreCliente.Text = cliente.nombreCompleto;

                    ClienteNivel cN = ClienteNivelLN.Obtener(cliente.identificacion);
                    lblNivelCliente.Text = cN.nivel.nombre;
                    imagenNivel.ImageUrl += cN.nivel.Imagen;

                    ddlCupon.DataSource = CuponLN.ObtenerTodos();
                    ddlCupon.DataTextField = "Nombre";
                    ddlCupon.DataValueField = "ID";
                    ddlCupon.DataBind();

                    ddlCupon_SelectedIndexChanged(null, null);
                }
            }
        }

        private void listaCupon()
        {
            grvListado.DataSource = ClienteCuponLN.ClientePorCupon(cliente.identificacion);
            grvListado.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaCliente.aspx");
        }

        protected void ddlCupon_SelectedIndexChanged(object sender, EventArgs e)
        {
            Cupon cupon = CuponLN.Obtener(Convert.ToInt16(ddlCupon.SelectedValue));
            imgCupon.Visible = true;
            imgCupon.ImageUrl = cupon.Imagen;
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {

        }
    }
}
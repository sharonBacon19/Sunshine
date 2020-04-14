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
    }
}
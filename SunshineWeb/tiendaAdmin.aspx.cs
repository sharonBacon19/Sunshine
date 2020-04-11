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
    public partial class tiendaAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlGenero.DataSource = GeneroLN.ObtenerTodos();
                ddlGenero.DataTextField = "NOMBRE";
                ddlGenero.DataValueField = "ID";
                ddlGenero.DataBind();

                ddlTipoPrenda.DataSource = TipoPrendaLN.ObtenerTodos();
                ddlTipoPrenda.DataTextField = "DESCRIPCION";
                ddlTipoPrenda.DataValueField = "ID";
                ddlTipoPrenda.DataBind();

                listaProducto.DataSource = ProductoLN.ObtenerTodos(ddlGenero.SelectedValue, ddlTipoPrenda.SelectedValue);
                listaProducto.DataBind();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            listaProducto.DataSource = ProductoLN.ObtenerTodos(ddlGenero.SelectedValue, ddlTipoPrenda.SelectedValue);
            listaProducto.DataBind();
        }
    }
}
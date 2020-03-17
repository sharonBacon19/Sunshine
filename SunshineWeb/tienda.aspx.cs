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
    public partial class tienda : System.Web.UI.Page
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
            }

        }

        public List<Producto> listaProductos_GetData()
        {
            return ProductoLN.ObtenerTodos();
        }

        protected void btnVer_Command(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            Response.Redirect("productoVista.aspx?id=" + id);
        }
    }
}
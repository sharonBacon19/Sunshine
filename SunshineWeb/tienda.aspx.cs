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

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Producto> listaProductos_GetData()
        {
            return ProductoLN.ObtenerTodos();
        }

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
   
    }
}
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
    public partial class listaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listaClientes();
            }   
        }


        private void listaClientes()
        {
            grvListado.DataSource = ClienteLN .ObtenerTodos();
            grvListado.DataBind();
        }

        protected void btnAsignar_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            string idCliente = Convert.ToString(id);

            Response.Redirect("asignarCliente.aspx?id=" + idCliente);

        }
    }
}
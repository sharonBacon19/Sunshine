using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class finalizarCompra : System.Web.UI.Page
    {
        private static List<Cupon> listaCupones = new List<Cupon>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                
                
                Cliente cliente = (Cliente)Session["cliente"];
                List<ClienteCupon> lista = ClienteCuponLN.ClientePorCupon(cliente.identificacion);

                foreach (ClienteCupon cC in lista)
                {
                    Cupon cupon = CuponLN.Obtener(cC.cupon.id);
                    listaCupones.Add(cupon);

                }
                ddlCupon.DataSource = listaCupones;
                ddlCupon.DataTextField = "Nombre";
                ddlCupon.DataValueField = "ID";
                ddlCupon.DataBind();
            }
        }

        //public void imagenCupon()
        //{
        //    while ()
        //    {

        //    }   
        //    foreach (Cupon cupon in listaCupones)
        //        {
        //            if (ddlCupon.SelectedValue.Equals("1"))
        //            {
        //                imgCupon.ImageUrl = cupon.Imagen;

        //            }
        //        }

            
        //}
        
        
    }
}
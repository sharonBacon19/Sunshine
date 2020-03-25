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
        private List<Cupon> listaCupones;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                listaCupones = new List<Cupon>();
                Cliente cliente = (Cliente)Session["cliente"];
                List<ClienteCupon> lista = ClienteCuponLN.ClientePorCupon(cliente.identificacion);

                foreach (ClienteCupon cC in lista)
                {
                    Cupon cupon = CuponLN.Obtener(cC.cupon.id);
                    listaCupones.Add(cupon);

                }

                ddlProvincia.DataSource = ProvinciaLN.ObtenerTodos();
                ddlProvincia.DataTextField = "dscProvincia";
                ddlProvincia.DataValueField = "codProvincia";
                ddlProvincia.DataBind();

                ddlCupon.DataSource = listaCupones;
                ddlCupon.DataTextField = "Nombre";
                ddlCupon.DataValueField = "ID";
                ddlCupon.DataBind();
                imagenCupon();
            }
        }

        private void imagenCupon()
        {
            
            //foreach (Cupon cupon in listaCupones)
            //{
                switch (ddlCupon.SelectedValue)
                {
                    case "1":
                    imgCupon.ImageUrl = "images/imagenes/concha.png";
                    
                    break;
                    case "2":
                    imgCupon.ImageUrl = "images/imagenes/coral.png";
                    break;
                    case "3":
                    imgCupon.ImageUrl = "images/imagenes/caballito.png";
                    break;
                    case "4":
                    imgCupon.ImageUrl = "images/imagenes/tsunami.png";
                    break;

                    default:
                        break;

                }
            //}


        }


    }
}
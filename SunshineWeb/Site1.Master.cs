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
            
                if((Cliente)Session["cliente"]!=null)
                {
                    Cliente cliente = (Cliente)Session["cliente"];
                    lblNombreCliente.Text = cliente.nombreCompleto;
                    
                    ClienteNivel cN = new ClienteNivel(); 
                    cN=ClienteNivelLN.Obtener(cliente.identificacion);

                    Nivel n = NivelLN.Obtener(cN.nivel.id);
                    ImgNIvel.ImageUrl = n.Imagen;
                    lblNombreCliente.Visible = true;
                    ImgNIvel.Visible = true;
                    //btnCerrarSesion.Visible = true;
                }

               

                

                

                

        }

        //protected void btnCerrarSesion_Click(object sender, EventArgs e)
        //{
        //    if((Cliente)Session["cliente"] != null)
        //    {
        //        Session["cliente"] = null;
        //        btnCerrarSesion.Visible = false;
        //        ImgNIvel.Visible = false;
        //    }
            
        //}
    }
}
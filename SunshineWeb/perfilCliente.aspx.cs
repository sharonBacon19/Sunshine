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
    public partial class perfilCliente : System.Web.UI.Page
    {
        public static int porcentaje = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                imgNiveles.ImageUrl = "images/imagenes/infoNiveles.png";
                imgCupones.ImageUrl = "images/imagenes/infoCupones.png";
                if (Session["cliente"] != null)
                {
                    Cliente cliente = (Cliente)Session["cliente"];

                    lblNombre.Text = cliente.nombreCompleto;
                    lblIdentificacion.Text = cliente.identificacion;
                    lblFechaNacimiento.Text = cliente.fechaNacimiento.ToString();

                    ClienteNivel cNivel = new ClienteNivel();
                    cNivel = ClienteNivelLN.ObtenerClienteNivel(cliente.identificacion);
                    lblNivel.Text = cNivel.nivel.nombre;
                    imagenNivel.ImageUrl += cNivel.nivel.Imagen;
                    porcentaje = calcularPorcentaje(cNivel.montoActual);
                


            }

            }
            
        }
        public int calcularPorcentaje(int montoCliente)
        {
            

            if (montoCliente!=0)
            {
                return (montoCliente / 150000) * 100;
            }
            else
            {
                return 10;
            }
        }

       

    }
}
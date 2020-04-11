﻿using SunshineEntidades;
using SunshineLN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunshineWeb
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Usuario)Session["admin"] != null)
                {
                    btnCerrarSesion.Visible = true;

                }
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Session["admin"] = null;

                Response.Redirect("inicio.aspx");
            }

        }
    }
}
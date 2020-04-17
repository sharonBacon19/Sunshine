<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singin.aspx.cs" Inherits="SunshineWeb.Singin" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Aviato E-Commerce Template">
  
  <meta name="author" content="Themefisher.com">

  <title>Sunshine | Registrarse</title>
<link rel="shortcut icon" type="image/x-icon" href="images/iconoS.png" />
  
  <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Revolution Slider -->
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/fonts/font-awesome/css/font-awesome.css">

  <!-- REVOLUTION STYLE SHEETS -->
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/css/settings.css">
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/css/layers.css">
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/css/navigation.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">

</head>

<body id="body">
<form class="text-left clearfix" runat="server">
<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="images/imagenes/sunshine4.png" alt="" width="100" height="100">
          </a>
          <h2 class="text-center">Crea una cuenta nueva</h2>
          
            <div class="form-group">              
                <asp:TextBox ID="txtNombre" class="form-control" placeholder="Nombre" runat="server"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                         ErrorMessage="* El nombre es requerido" ControlToValidate="txtNombre"
                         ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
           <br />
            <div class="form-group">
                 <asp:TextBox ID="txtFecha" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                <%-- CAMBIAR VALIDACION DE LA FECHA --%>
                <br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="* La fecha es requerida" ControlToValidate="txtFecha" 
                            foreColor="red" SetFocusOnError="true" Display="Dynamic"
                            ValidationGroup="registrar">
                     </asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ValidationExpression=""></asp:RegularExpressionValidator>--%>
            </div>

            <div class="form-group">
                <asp:Label ID="lblTipoIdentificacion" class="form-control" Text="Tipo de Identificación" runat="server"></asp:Label>
                
                <asp:DropDownList ID="ddlTipoIdentificacion" class="form-control" runat="server"></asp:DropDownList>
               
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                      ErrorMessage="* El tipo de identificación es requerido" ControlToValidate="ddlTipoIdentificacion"
                      ValidationGroup="signin"  ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>

            </div>

            
            <div class="form-group">
               <asp:TextBox ID="txtIdentificacion" class="form-control" placeholder="Identificación" runat="server"></asp:TextBox>
                  <br />
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                      ErrorMessage="* La identificación es requerida" ControlToValidate="txtIdentificacion"
                      ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
           
            <div class="form-group">
               <asp:TextBox ID="txtTarjetaCredito" class="form-control" placeholder="Número Tarjeta" runat="server"></asp:TextBox>
                  <br />
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                      ErrorMessage="* El número de tarjeta es requerido" ControlToValidate="txtTarjetaCredito"
                      ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>    
            
            <div class="form-group">
                <asp:Label ID="Label1" class="form-control" Text="Provincia" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" class="form-control" runat="server">
                    
                    
                </asp:DropDownList>
                <br />
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                      ErrorMessage="* La provincia es requerida" ControlToValidate="ddlProvincia"
                      ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">              
                <asp:TextBox ID="txtCodigo" class="form-control" placeholder="Código postal" runat="server"></asp:TextBox>
           
            <br />
                    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                         ErrorMessage="* El código postal es requerido" ControlToValidate="txtCodigo"
                         ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>
            

             <div class="form-group">              
                <asp:TextBox ID="txtOtras" class="form-control" placeholder="Otras señas" runat="server"></asp:TextBox>
           
            <br />
                    
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                         ErrorMessage="* El campo de otras señas requerido" ControlToValidate="txtOtras"
                         ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>            
           

            <div class="form-group">              
                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server"></asp:TextBox>
           
            <br />
                    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                         ErrorMessage="* El email es requerido" ControlToValidate="txtEmail"
                         ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>
            

            <div class="form-group">              
                <asp:TextBox ID="txtContrasenna" class="form-control" TextMode="Password" placeholder="Contraseña" runat="server"></asp:TextBox>
                    
            
            <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="* La contraseña es requerida" ControlToValidate="txtContrasenna"
                        ValidationGroup="signin" SetFocusOnError="true" foreColor="red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>
            

            <div class="form-group">
                <asp:Label ID ="lblMensaje" runat="server" visible="false"  CssClass="alert alert-danger alter-common col-md-6"></asp:Label>
            </div>
           
            <br />

            <div class="text-center">
              <asp:Button runat="server" ID="btnSignin" ValidationGroup="signin" class="btn btn-main text-center" Text="Registrarse" OnClick="btnSignin_Click"></asp:Button>
            </div>
        
          <p class="mt-20">¿Ya tienes una cuenta?<a href="login.aspx"> Login</a></p>          
        </div>
      </div>
    </div>
  </div>
</section>
  </form>
    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="plugins/instafeed-js/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="plugins/SyoTimer/build/jquery.syotimer.min.js"></script>
    
    <!-- Revolution Slider -->
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/jquery.themepunch.revolution.min.js"></script>
    
    <!-- Revolution Slider -->
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/assets/warning.js"></script>  



    <!-- Google Mapl -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
  <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    


  </body>
  </html>
<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="crearCliente.aspx.cs" Inherits="SunshineWeb.crearCliente" %>




<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">          
          <h2 class="text-center">Crear cliente</h2>
          
            <div class="form-group">              
                <asp:TextBox ID="txtNombre" class="form-control" placeholder="Nombre Cliente" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                         ErrorMessage="* El nombre del cliente es requerido" ControlToValidate="txtNombre"
                         ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                 <asp:TextBox ID="txtFecha" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="* La fecha es requerida" ControlToValidate="txtFecha" 
                            ForeColor="Red" SetFocusOnError="true" Display="Dynamic"
                            ValidationGroup="registrar">
                     </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblTipoIdentificacion" class="form-control" Text="Tipo de Identificación" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlTipoIdentificacion" class="form-control" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                      ErrorMessage="* El tipo de identificación es requerido" ControlToValidate="ddlTipoIdentificacion"
                      ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>


            <div class="form-group">
               <asp:TextBox ID="txtIdentificacion" class="form-control" placeholder="Identificación" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                      ErrorMessage="* La identificación es requerida" ControlToValidate="txtIdentificacion"
                      ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
               <asp:TextBox ID="txtTarjetaCredito" class="form-control" placeholder="Número Tarjeta" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                      ErrorMessage="* El número de tarjeta es requerido" ControlToValidate="txtTarjetaCredito"
                      ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>    

            <div class="form-group">
                <asp:Label ID="Label1" class="form-control" Text="Provincia" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" class="form-control" runat="server">
                    
                    
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                      ErrorMessage="* La provincia es requerida" ControlToValidate="ddlProvincia"
                      ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">              
                <asp:TextBox ID="txtCodigo" class="form-control" placeholder="Código postal" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                         ErrorMessage="* El código postal es requerido" ControlToValidate="txtCodigo"
                         ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>

             <div class="form-group">              
                <asp:TextBox ID="txtOtras" class="form-control" placeholder="Otras señas" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                         ErrorMessage="* El campo de otras señas requerido" ControlToValidate="txtOtras"
                         ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>            

            <div class="form-group">              
                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                         ErrorMessage="* El email del cliente es requerido" ControlToValidate="txtEmail"
                         ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">              
                <asp:TextBox ID="txtContrasenna" class="form-control" TextMode="Password" placeholder="Contraseña" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="* La contraseña es requerida" ControlToValidate="txtContrasenna"
                        ValidationGroup="signin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID ="lblMensaje" runat="server"></asp:Label>
            </div>
            <div class="text-center">
              <asp:Button runat="server" ID="btnSignin" ValidationGroup="signin" class="btn btn-main text-center" Text="Registrar Cliente" OnClick="btnSignin_Click"></asp:Button>
            </div>       
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>
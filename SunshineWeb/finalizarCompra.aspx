<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="finalizarCompra.aspx.cs" Inherits="SunshineWeb.finalizarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
      <div class="checkout shopping">
        <div class="container">
         <div class="row">
           <div class="col-md-6">
             <div class="block">
                <h4 class="widget-title">Detalles de pago</h4>
                     <div class="checkout-product-details">
                      <div class="payment">
                        <div class="card-details">
                              <div class="form-group">                                
                                  <asp:Label ID="lblNombre"  runat="server" Text="Nombre"></asp:Label>
                                  <asp:TextBox ID="txtNombre" runat="server" class="form-control"  ReadOnly="true"></asp:TextBox>
                              </div>
                            <div class="form-group ">
                                  <asp:Label ID="lblProvincia"  runat="server" Text="Provincia"></asp:Label>
                                  <asp:TextBox ID="txtProvinica" runat="server" class="form-control" ReadOnly="true"  ></asp:TextBox>  
                              </div>
                              <div class="form-group" >
                                 <asp:Label ID="lblCodigoPostal"  runat="server" Text="Código Postal"></asp:Label>
                                 <asp:TextBox ID="txtCodigoPostal" runat="server" class="form-control"  ReadOnly="true"></asp:TextBox>
                             </div>
                              <div class="form-group" >
                                  <asp:Label ID="lblOtrasSennas"  runat="server" Text="Otras Señas"></asp:Label>
                                  <asp:TextBox ID="txtOtrasSennas" runat="server" class="form-control"   ReadOnly="true"></asp:TextBox>
                              </div>
                              <div class="form-group" >
                                 <asp:Label ID="lblTarjeta"  runat="server" Text="Número de Tarjeta"></asp:Label>
                                 <asp:TextBox ID="txtTarjeta" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>                                 
                              </div>
                             <%-- <div class="form-group" >
                                 <asp:Label ID="lblFechaTarjeta"  runat="server" Text="Fecha de expiración"></asp:Label>
                                 <asp:TextBox ID="txtFechaTarjeta" runat="server" class="form-control" placeholder="(MM/YY)" ></asp:TextBox>                                    
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*La fecha de expiración de la tarjeta es requerida" ControlToValidate="txtFechaTarjeta" ValidationGroup="confirmar"
                                  SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                              </div>
                              <div class="form-group ">
                                 <asp:Label ID="lblCodigoTarjeta"  runat="server" Text="Código de tarjeta"></asp:Label>
                                 <asp:TextBox ID="txtCodigoTarjeta" runat="server" class="form-control" ></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* Sólo se pueden ingresar 3 números" ForeColor="red" ControlToValidate="txtTarjeta" ValidationGroup="confirmar" 
                                  ValidationExpression="[0-9]{3}"></asp:RegularExpressionValidator>  
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*El código de la tarjeta es requerida" ControlToValidate="txtCodigoTarjeta" ValidationGroup="confirmar" 
                                  SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                              </div>--%>
                            
                            <br />
                            <div class="form-group">
                               <br />
                              <asp:Label ID="lblSubTotal" class="text-right" Text="SubTotal" runat="server"></asp:Label>
                              <asp:TextBox ID="txtSubTotal" class="form-control" placeholder="" runat="server"></asp:TextBox>
                               <br />       
                               <asp:Label ID="lblTotal" class="text-right" Text="Total" runat="server"></asp:Label>
                               <asp:TextBox ID="txtTotal" class="form-control" placeholder="" runat="server"></asp:TextBox>
                           </div>
                            <br />
                                <asp:Button runat="server" ID="btnConfirmar" ValidationGroup="confirmar" Text="Confirmar Compra" class="btn btn-main right" OnClick="btnConfirmar_Click"/>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

             <%-- SE PUEDE COLOCAR UN LIST O GRID PARA VER UN RESUMEN DE LA COMPRA --%>
            <div class="col-md-6">
               <div class="product-checkout-details">
                  <div class="block">
                     <h4 class="widget-title">Productos</h4>
                       <div class="media product-card">
                         <asp:GridView ID="grvListado"  runat="server" Width="100%" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-Height="100%" 
                            RowStyle-HorizontalAlign="Center" RowStyle-BorderColor="Transparent" RowStyle-BorderStyle="None"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="Transparent" 
                            BorderColor="Transparent" CellPadding="50" CellSpacing="50" AlternatingRowStyle-BackColor="#f0f0f0" Height="100%" AutoGenerateColumns="false">
                             <Columns>
                                 <asp:TemplateField HeaderText="Producto">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("producto.Imagen") %>' Width="100" Height="100" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" DataFormatString="{0:0}"/>
                                <asp:BoundField DataField="producto.precio" HeaderText="Precio" DataFormatString="{0:0} c/u"/>
                                 <asp:TemplateField HeaderText="Aplicar Cupón">
                                      <ItemTemplate>
                                           <asp:Button ID="btnAplicar" CssClass="btn btn-small mt-10"  Text="Aplicar" runat="server" />
                                      </ItemTemplate>
                                  </asp:TemplateField> 
                             </Columns>
                           <HeaderStyle CssClass="table-info" />
                        </asp:GridView>                       
                       </div>  
                     </div>


                   <%-- CUPONES --%>
                   <div class="block">
                      <h4 class="widget-title">Cupones</h4>
                        <div class="media product-card">
                            
                            
                            <asp:Label runat="server" ID="lblMensajeCupon" Visible="true" Text="Seleccione una prenda para aplicar el descuento"></asp:Label>
                            <br />
                            <br />
                          <a class="pull-left" >
                             <asp:Image id="imgCupon" Width="150px" Height="150px" runat="server" ></asp:Image>
                          </a>
                         <div class="media-body">                            
                             <h4 class="media-heading">Cupón</h4>
                               <asp:DropDownList ID="ddlCupon" class="form-control" runat="server" OnSelectedIndexChanged="ddlCupon_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>                      
                            
                         </div>
                       </div>
                     </div>

                       
                        <%--<li>
                            <asp:Label ID="lblSubTotal" class="form-control" Text="SubTotal" runat="server"></asp:Label>
                        <asp:TextBox ID="txtSubTotal" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </li>   
                        <li>
                           <asp:Label ID="lblTotal" class="form-control" Text="SubTotal" runat="server"></asp:Label>
                        <asp:TextBox ID="txtTotal" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </li>--%>
                     

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>

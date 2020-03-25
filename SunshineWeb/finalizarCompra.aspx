<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="finalizarCompra.aspx.cs" Inherits="SunshineWeb.finalizarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
   <div class="checkout shopping">
      <div class="container">
         <div class="row">
            <div class="col-md-8">
               <div class="block billing-details">
                  <h4 class="widget-title">Detalles de la compra</h4>
                  <form class="checkout-form">
                     <div class="form-group">
                         
                         <%-- datagrid para mostrar lista de productos --%>

                        
                     </div>
                  </form>
               </div>
               <div class="block">
                  <h4 class="widget-title">Método de pago</h4>
                  <p>Detalles del pago</p>
                  <div class="checkout-product-details">
                     <div class="payment">
                        <div class="card-details">
                           <%--<form  class="checkout-form">--%>
                              <div class="form-group">
                                  <%-- CAMBIAR POR ASP:LBL Y MOSTRAR LOS DATOS DEL CLIENTE Y COMPRA--%>
                                 
                                  <asp:Label ID="lblNombre"  runat="server" Text="Nombre"></asp:Label>
                                  <asp:TextBox ID="txtNombre" runat="server" class="form-control"  ></asp:TextBox>
                                 <%--<input  id="card-number" class="form-control"   type="tel" placeholder="•••• •••• •••• ••••">--%>
                              </div>
                              <%--<div class="form-group half-width padding-right">
                          --%> <div class="form-group ">
                                  <asp:Label ID="lblProvincia"  runat="server" Text="Provincia"></asp:Label>
                                  <asp:DropDownList ID="ddlProvincia" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    
                                 <%--<label for="card-expiry">Fecha de expiración (MM/YY) <span class="required">*</span></label>
                                 <input id="card-expiry" class="form-control" type="tel" placeholder="MM / YY">--%>
                              </div>
                              <div class="form-group" >
                                 <asp:Label ID="lblCodigoPostal"  runat="server" Text="Código Postal"></asp:Label>
                                  <asp:TextBox ID="txtCodigoPostal" runat="server" class="form-control"  ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                          ErrorMessage="*El código postal es requerido" ControlToValidate="txtCodigoPostal"
                                          ValidationGroup="confirmar" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ErrorMessage="* Sólo se pueden ingresar 5 números" ForeColor="red" ValidationExpression="[0-9]{5}"
                                    ControlToValidate="txtTarjeta" ValidationGroup="confirmar">

                                </asp:RegularExpressionValidator>    

                              </div>
                            <div class="form-group" >
                                  <asp:Label ID="lblOtrasSennas"  runat="server" Text="Otras Señas"></asp:Label>
                                  <asp:TextBox ID="txtOtrasSennas" runat="server" class="form-control"  ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                          ErrorMessage="*Las señas son requeridas" ControlToValidate="txtOtrasSennas"
                                          ValidationGroup="confirmar" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                              </div>
                            <div class="form-group" >
                                 <asp:Label ID="lblTarjeta"  runat="server" Text="Número de Tarjeta"></asp:Label>
                                  <asp:TextBox ID="txtTarjeta" runat="server" class="form-control" placeholder="**** **** **** ****" ></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ErrorMessage="* Sólo se pueden ingresar 16 números" ForeColor="red" ValidationExpression="[0-9]{16}"
                                    ControlToValidate="txtTarjeta" ValidationGroup="confirmar">

                                </asp:RegularExpressionValidator>    
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                          ErrorMessage="*El número de tarjeta es requerido" ControlToValidate="txtTarjeta"
                                          ValidationGroup="confirmar" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                              </div>
                            <div class="form-group" >
                                 <asp:Label ID="lblFechaTarjeta"  runat="server" Text="Fecha de expiración"></asp:Label>
                                  <asp:TextBox ID="txtFechaTarjeta" runat="server" class="form-control" placeholder="(MM/YY)" ></asp:TextBox>
                                    
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                          ErrorMessage="*La fecha de expiración de la tarjeta es requerida" ControlToValidate="txtFechaTarjeta"
                                          ValidationGroup="confirmar" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                              </div>
                            <div class="form-group ">
                               <asp:Label ID="lblCodigoTarjeta"  runat="server" Text="Código de tarjeta"></asp:Label>
                                  <asp:TextBox ID="txtCodigoTarjeta" runat="server" class="form-control" ></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="* Sólo se pueden ingresar 3 números" ForeColor="red"
                                    ControlToValidate="txtTarjeta" ValidationGroup="confirmar" ValidationExpression="[0-9]{3}">

                                </asp:RegularExpressionValidator>  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                          ErrorMessage="*El código de la tarjeta es requerida" ControlToValidate="txtCodigoTarjeta"
                                          ValidationGroup="confirmar" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                              </div>
                              <asp:Button runat="server" ID="btnConfirmar" ValidationGroup="confirmar" Text="Confirmar Compra" class="btn btn-main right" />
                           <%--</form>--%>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

             <%-- SE PUEDE COLOCAR UN LIST O GRID PARA VER UN RESUMEN DE LA COMPRA --%>
            <div class="col-md-4">
               <div class="product-checkout-details">
                  <div class="block">
                     <h4 class="widget-title">Productos</h4>
                     <div class="media product-card">
                        <a class="pull-left" href="product-single.html">
                           <img class="media-object" src="images/shop/cart/cart-1.jpg" alt="Image" />
                        </a>
                        <div class="media-body">
                           <h4 class="media-heading"><a href="product-single.html">Ambassador Heritage 1921</a></h4>
                           <p class="price">1 x $249</p>
                           
                        </div>
                     </div>
                    
                        
                        
                        
                     </div>
                   <%-- CUPONES --%>
                   <div class="block">
                     <h4 class="widget-title">Cupones</h4>

                    <div class="media product-card">
                        <a class="pull-left" >
                            <asp:Image id="imgCupon" Width="150px" Height="150px" runat="server" ></asp:Image>
                        </a>
                        <div class="media-body">
                            
                           <h4 class="media-heading">Cupón</h4>
                            <%--<asp:Label class="media-heading" ID="lblCupon" runat="server"></asp:Label>
                            <asp:Label class="media-heading" ID="lblDescuento" runat="server"></asp:Label>--%>
                            <asp:DropDownList ID="ddlCupon" class="form-control" runat="server">
                            </asp:DropDownList>

                           <%--<p class="price">1 x $249</p>--%>
                           
                        </div>
                     </div>


                   </div>
                     <ul class="summary-prices">
                        <li>
                           <span>Subtotal:</span>
                           <span class="price">$190</span>
                        </li>
                        <li>
                           <span>Shipping:</span>
                           <span>Free</span>
                        </li>
                     </ul>
                     <div class="summary-total">
                        <span>Total</span>
                        <span>$250</span>
                     </div>
                     <div class="verified-icon">
                        <img src="images/shop/verified.png">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
   <!-- CUPONES -->
   <div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-body">
               
                
                  <%--
                     <input class="form-control" type="text" placeholder="Enter Coupon Code">
                 
                  <button type="submit" class="btn btn-main">Apply Coupon</button>--%>
               
            </div>
         </div>
      </div>
   </div>
</asp:Content>

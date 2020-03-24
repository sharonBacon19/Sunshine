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
                  <h4 class="widget-title">Billing Details</h4>
                  <form class="checkout-form">
                     <div class="form-group">
                         <%-- CAMBIAR POR ASP:LBL Y MOSTRAR LOS DATOS DEL CLIENTE Y COMPRA--%>
                        <label for="full_name">Nombre</label>

                        <input type="text" class="form-control" id="full_name" placeholder="">
                     </div>
                     <div class="form-group">
                        <label for="user_address">Dirección</label>
                        <input type="text" class="form-control" id="user_address" placeholder="">
                     </div>
                     <div class="checkout-country-code clearfix">
                        <div class="form-group">
                           <label for="user_post_code">Zip Code</label>
                           <input type="text" class="form-control" id="user_post_code" name="zipcode" value="">
                        </div>
                        <div class="form-group" >
                           <label for="user_city">City</label>
                           <input type="text" class="form-control" id="user_city" name="city" value="">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="user_country">Country</label>
                        <input type="text" class="form-control" id="user_country" placeholder="">
                     </div>
                  </form>
               </div>
               <div class="block">
                  <h4 class="widget-title">Payment Method</h4>
                  <p>Credit Cart Details (Secure payment)</p>
                  <div class="checkout-product-details">
                     <div class="payment">
                        <div class="card-details">
                           <form  class="checkout-form">
                              <div class="form-group">
                                 <label for="card-number">Número de Tarjeta <span class="required">*</span></label>
                                 <input  id="card-number" class="form-control"   type="tel" placeholder="•••• •••• •••• ••••">
                              </div>
                              <div class="form-group half-width padding-right">
                                 <label for="card-expiry">Fecha de expiración (MM/YY) <span class="required">*</span></label>
                                 <input id="card-expiry" class="form-control" type="tel" placeholder="MM / YY">
                              </div>
                              <div class="form-group half-width padding-left">
                                 <label for="card-cvc">Código de Tarjeta <span class="required">*</span></label>
                                 <input id="card-cvc" class="form-control"  type="tel" maxlength="4" placeholder="***" >
                              </div>
                              <a href="confirmation.html" class="btn btn-main mt-20">Confirmar Compra</a >
                           </form>
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

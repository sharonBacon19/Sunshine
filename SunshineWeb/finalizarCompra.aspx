<%@ Page Title="" Language="C#"  MasterPageFile="~/VistaCliente.Master" AutoEventWireup="true" CodeBehind="finalizarCompra.aspx.cs" Inherits="SunshineWeb.finalizarCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SunShine | Finalizar Compra</title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Finalizar Compra</h1>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
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
                                  <asp:TextBox ID="txtProvinica" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>  
                              </div>
                              <div class="form-group" >
                                 <asp:Label ID="lblCodigoPostal"  runat="server" Text="Código Postal"></asp:Label>
                                 <asp:TextBox ID="txtCodigoPostal" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                             </div>
                              <div class="form-group" >
                                  <asp:Label ID="lblOtrasSennas"  runat="server" Text="Otras Señas"></asp:Label>
                                  <asp:TextBox ID="txtOtrasSennas" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                              </div>
                              <div class="form-group" >
                                 <asp:Label ID="lblTarjeta"  runat="server" Text="Número de Tarjeta"></asp:Label>
                                 <asp:TextBox ID="txtTarjeta" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>                                 
                              </div>    
                              
                            <br />
                            
                            
                                <div class="form-group ">
                                <br />
                                <asp:Label ID="lblSubTotal" Text="SubTotal" runat="server"></asp:Label>
                                <asp:TextBox ID="txtSubTotal" class="form-control " runat="server" Text="" ReadOnly="true"></asp:TextBox>
                                <br />                           
                                <asp:Label ID="lblTotal"  Text="Total" runat="server"></asp:Label>
                                <asp:TextBox ID="txtTotal" class="form-control" runat="server" Text="" ReadOnly="true"></asp:TextBox> 
                                    
                            </div>
                            
                                
                                <div class="form-group" >
                                 <asp:Label ID="lblMensaje"  runat="server" CssClass="alert alert-danger alert-common col-xs-12"></asp:Label>                                
                                 <asp:Label ID="lblMensajeC" runat="server" Visible="false" CssClass="alert alert-success alert-common col-xs-12"></asp:Label>                                
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

                <%-- CUPONES --%>
                   <div class="block">
                      <h4 class="widget-title">Cupones</h4>
                        <div class="media product-card">
                          <a class="pull-left" >
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Image id="imgCupon" Width="150px" Height="150px" runat="server" Visible ="false"></asp:Image>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlCupon" EventName="SelectedIndexChanged"/>
                                </Triggers>
                            </asp:UpdatePanel>
                          </a>
                         <div class="media-body">                            
                             <asp:label runat="server" ID="lblCupon" Text="Cupón" class="widget-title"></asp:label>
                               <asp:DropDownList ID="ddlCupon" class="form-control" runat="server" OnSelectedIndexChanged="ddlCupon_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>  
                             <asp:Label ID="lblMensajeCupon" Visible="false" Text="No tiene cupones disponibles" runat="server" CssClass="alert alert-danger alert-common col-xs-12"></asp:Label>
                         </div>
                       </div>
                     </div>


                  <div class="block">
                     <h4 class="widget-title">Productos</h4>

                      <%-- MENSAJE --%>
                       <div class="media product-card">
                         <asp:GridView ID="grvListado"  Width="100%" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-Height="100%" 
                            RowStyle-HorizontalAlign="Center" RowStyle-BorderColor="white" RowStyle-BorderStyle="None"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="Transparent" 
                            BorderColor="Transparent" CellPadding="50" CellSpacing="50" AlternatingRowStyle-BackColor="#f0f0f0" Height="100%" 
                            runat="server" AutoGenerateColumns="false">
                             <Columns>
                                 <asp:TemplateField HeaderText="Producto">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("producto.Imagen") %>' Width="100" Height="100" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" DataFormatString="{0:0}"/>
                                <asp:BoundField DataField="producto.precio" HeaderText="Precio" DataFormatString="{0:0} c/u"/>
                                  <asp:TemplateField HeaderText="">
                                      <ItemTemplate>
                                           <asp:Button ID="btnAplicar" CssClass="btn btn-main btn-small"  Text="Aplicar Descuento" runat="server" CommandArgument='<%# Eval("producto.id") %>' OnCommand="btnAplicar_Command" />
                                      </ItemTemplate>
                                  </asp:TemplateField>  
                             </Columns>
                           <HeaderStyle CssClass="table-info" />
                        </asp:GridView>                       
                       </div>  
                      <br />
                     
                     </div>
                   <%-- PRODUCTOS CON DESCUENTO --%>
                   <div class="block">
                      <h4 class="widget-title">Producto a aplicar descuento:</h4>
                       <%--<asp:Label ID="lblAplicar" runat="server" Text="Producto a aplicar descuento:" CssClass="widget-title"></asp:Label>--%>
                        <div class="media product-card">
                          <a class="pull-left" >
                              <br />
                              <asp:Label ID="lblProdNombre" runat="server" Text="" Visible="false" CssClass=""></asp:Label>
                            <br />
                            <br />
                            <asp:Image ID="prodIm" runat="server" ImageUrl="" Width="100" Height="100" visible="false"/>
                        </a>
                            <asp:Label ID="lblProdDesc" Visible="false" Text="No se puede aplicar el descuento" runat="server" CssClass="alert alert-danger alert-common col-xs-12"></asp:Label>
                         
                       </div>
                     </div>
                   

                     
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>

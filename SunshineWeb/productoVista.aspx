<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="productoVista.aspx.cs" Inherits="SunshineWeb.productoVista" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="single-product">
	<div class="container">
		<div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
						<div class='carousel-outer'>
							<!-- me art lab slider -->
							<div class='carousel-inner '>
								<div class='item active'>
									<asp:Image ID="ImgPr" ImageUrl="" runat="server"  Width="400" Height="400"/>
								</div>							
								
						</div>
							
							<!-- sag sol -->
							<%--<a class='left carousel-control' href='#carousel-custom'>
								<i class="tf-ion-ios-arrow-left"></i>
							</a>
							<a class='right carousel-control' href='#carousel-custom'>
								<i class="tf-ion-ios-arrow-right"></i>
							</a>--%>
						</div>
						
						<!-- thumb -->
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0' class='active'>
								<asp:Image ID="Image1" ImageUrl="" runat="server"  Width="75" Height="75"/>
							</li>							
						</ol>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-details">
					<asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
					<br />
					<asp:Label ID="lblPrecio" runat="server" Text=""></asp:Label>
					<br />
					<asp:Label ID="lblDescripcion" runat="server" Text=""></asp:Label>

					<div class="color-swatches">
						<span>Color:</span>
						<asp:DropDownList ID="ddlColor" runat="server">
						</asp:DropDownList>
					</div>
					<div class="product-size">
						<span>Talla:</span>
						<asp:DropDownList ID="ddlTalla" runat="server">
						</asp:DropDownList>
					</div>
					<div class="product-quantity">
						<span>Cantidad:</span>
						<div class="product-quantity-slider">
							<asp:TextBox ID="txtCantidad" Text="1" TextMode="Number" runat="server"></asp:TextBox>
						</div>
					</div>
					<br />
					<asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
					<br /><br />
					<asp:Button ID="btnAddCarrito" runat="server" CssClass="btn btn-main mt-20" Text="Agregar al Carrito" OnClick="btnAddCarrito_Click"/>
					<asp:Button ID="btnVolver" runat="server" CssClass="btn btn-main mt-20" Text="Volver" OnClick="btnVolver_Click"/>
				</div>
			</div>
		</div>
		
	</div>
   </section>
</asp:Content>

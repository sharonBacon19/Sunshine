<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="SunshineWeb.carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Carrito </title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Mi Carrito</h1>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
   
    <asp:ListView ID="listaProducto" runat="server" GroupItemCount="3" ItemType="SunshineEntidades.DetPedido" SelectMethod="listaProducto_GetData">
             <%-- No hay datos --%>
        <EmptyDataTemplate>
            <div class="col-lg-4">
                No hay datos
            </div>
        </EmptyDataTemplate>
             <%-- Item es vacío --%>
        <EmptyItemTemplate>
            <div class="card text-center border-primary mb-4">
            </div>
        </EmptyItemTemplate>
             <%-- Fila o grupo --%>
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
        </GroupTemplate>
             <%-- Información de cada item --%>
        <ItemTemplate>
            <div class="col-lg-4">
            <div class="card text-center border-primary mb-4">
                <div class="card-body" runat="server">
					<asp:Image ID="ImgP" class="card-title" runat="server" ImageUrl="<%#: Item.producto.imagen%>" Width="200" Height="200"></asp:Image>
                    <h5 class="card-title"><%#: Item.producto.nombre %></h5>
                    <br />
                    <asp:Label ID="lblCanidad" runat="server" Text="Cantidad: "></asp:Label> <%#:Item.cantidad %>
                    <br />
                    <asp:label ID="lblTalla" runat="server" Text="Talla: "></asp:label> <%#:Item.talla.tipoTalla%>
                    <br />
                     <asp:label ID="lblColor" runat="server" Text="Color: "></asp:label> <%#: Item.color.tipoColor%>
                    <br />
                    <asp:Button ID="btnQuitar" CssClass="btn btn-main mt-20"  Text="Quitar" runat="server" CommandArgument="<%#: Item.producto.id %>" OnCommand="btnQuitar_Command"/>             
                    <br /><br />
                </div>                        
            </div>
         </div>
        </ItemTemplate>
             <%-- Plantilla del contenido --%>        
        <LayoutTemplate>
            <div class="container">
                <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
            </div>
        </LayoutTemplate>
    </asp:ListView>

    <section class="products section" style="position:center">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="widget">
					<div class="form-group">
                        <asp:Label ID="lblSubTotal" class="form-control" Text="SubTotal" runat="server"></asp:Label>
                        <asp:TextBox ID="txtSubTotal" class="form-control" placeholder="" runat="server"></asp:TextBox>
                    </div>
               </div>
            </div>
        </div>
     </div>
    </section>

</asp:Content>

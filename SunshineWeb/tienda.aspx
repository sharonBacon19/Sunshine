<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tienda.aspx.cs" Inherits="SunshineWeb.tienda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Sunshine | Tienda</title>

  
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form runat="server">--%>
   <%-- Header titulo --%>
    <section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
                    <h1 class="page-name">Tienda</h1>
                    </div>
			</div>
		</div>
	</div>
</section>

    <section class="products section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="widget">
					<h4 class="widget-title">Ordenar por Categorías</h4>
					<div class="form-group">
                        <asp:Label ID="lblGenero" class="form-control" Text="Género" runat="server"></asp:Label>
                        <asp:DropDownList ID="ddlGenero" class="form-control" runat="server">
                            <asp:listitem Value="0" Text="Género" Selected="True" >
                            </asp:listitem>
                        </asp:DropDownList>
                        <asp:Label ID="lblTipoPrenda" class="form-control" Text="Tipo" runat="server"></asp:Label>
                        <asp:DropDownList ID="ddlTipoPrenda" class="form-control" runat="server">
                            <asp:listitem Value="0" Text="Tipo" Selected="True" >
                            </asp:listitem>
                        </asp:DropDownList>

                        
                    </div>
	            </div>
				<div class="widget product-category">
					<h4 class="widget-title">Categorías</h4>
					<div class="panel-group commonAccordion" id="accordion" role="tablist" aria-multiselectable="true">
					  	<div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      	<h4 class="panel-title">
						        	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          	Shoes
						        	</a>
						      	</h4>
						    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>
<asp:ListView ID="listaProducto" runat="server"
             GroupItemCount="3"
             ItemType="SunshineEntidades.Producto"
             SelectMethod="listaProductos_GetData"
             >
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
					<asp:Image ID="ImgP" class="card-title" runat="server" ImageUrl="<%#: Item.imagen%>" Width="200" Height="200"></asp:Image>
                    <h5 class="card-title"><%#: Item.descripcion %></h5>
                   <asp:Label ID="precio" Text="Precio: " runat="server"> <p class="card-text"><%# Eval("precio","{0:0}Colones")%></p></asp:Label>
					<asp:Label ID="talla" Text="Tallas: " runat="server"><h5 class="card-title"><%#: Item.talla %></h5></asp:Label>     
                    
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
    
<%--    </form>--%></asp:Content>

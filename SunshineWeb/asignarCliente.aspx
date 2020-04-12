<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="asignarCliente.aspx.cs" Inherits="SunshineWeb.asignarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Asignar Cupón </title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Asignar cupón</h1>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
    <div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
          <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <div class="block">                    
                      <h2>
                         <asp:Label ID="lblCuponesQueTiene" runat="server" Text="Cupones actuales"></asp:Label>
                      </h2>

                      <asp:GridView ID="grvListado" Width="100%" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-Height="100%" 
                            RowStyle-HorizontalAlign="Center" RowStyle-BorderColor="white" RowStyle-BorderStyle="None"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="Transparent" 
                            BorderColor="Transparent" CellPadding="50" CellSpacing="50" AlternatingRowStyle-BackColor="#f0f0f0" Height="100%" 
                            runat="server" AutoGenerateColumns="false">
                             <Columns>           
                                  <asp:TemplateField HeaderText="Cupón">
                                     <ItemTemplate>
                                         <asp:Image ID="imagen" runat="server" ImageUrl='<%# Eval("cupon.Imagen") %>' Width="100" Height="100" />
                                     <ItemStyle BorderStyle="Groove" HorizontalAlign="Center" width="200" 
                                        Height="100" Wrap="True"/>
                                     </ItemTemplate>
                                      </asp:TemplateField>
                                <asp:BoundField ControlStyle-BorderColor="Transparent" DataField="cupon.nombre" HeaderText="Nombre"/>                               
                             </Columns>
                           <HeaderStyle/>
                        </asp:GridView> 



                  </div>
                </div>
            </div>
        </div>
        </div>
    </div>   
</asp:Content>
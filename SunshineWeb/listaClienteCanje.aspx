﻿<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="listaClienteCanje.aspx.cs" Inherits="SunshineWeb.listaClienteCanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sunshine | Lista de Clientes </title>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-header">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-12">
				    <div class="content">
					    <h1 class="page-name">Canje de cupones</h1>
                        <ol class="breadcrumb">
						<li>Clientes</li>
					</ol>
				    </div>
			    </div>
		    </div>
	    </div>
    </section>
    <div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
         <div class="col-md-6">

          <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <div class="block">
                    <div class="product-list"> 
                        <asp:GridView ID="grvListado" Width="100%" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-Height="100%" 
                            RowStyle-HorizontalAlign="Center" RowStyle-BorderColor="white" RowStyle-BorderStyle="None"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" HeaderStyle-BorderColor="Transparent" 
                            BorderColor="Transparent" CellPadding="50" CellSpacing="50" AlternatingRowStyle-BackColor="#f0f0f0" Height="100%" 
                            runat="server" AutoGenerateColumns="false">
                             <Columns>
                                 <asp:BoundField ControlStyle-BorderColor="Transparent" DataField="nombreCompleto" HeaderText="Cliente"/>
                                <asp:BoundField ControlStyle-BorderColor="Transparent" DataField="identificacion" HeaderText="Identificación"/>
                                <asp:BoundField DataField="tarjetaCredito" HeaderText="Terjeta de Crédito"/> 
                                  <asp:TemplateField HeaderText="">
                                      <ItemTemplate>
                                           <asp:Button ID="btnCanje" CssClass="btn btn-main btn-small"  Text="Ver Canjes" runat="server" CommandArgument='<%# Eval("identificacion") %>' OnCommand="btnCanje_Command"/>
                                      </ItemTemplate>
                                  </asp:TemplateField> 
                             </Columns>                          
                        </asp:GridView> 
                    </div>
                  </div>
                </div>
            </div>
        </div>
        </div>
    </div>   
    </div>   
</asp:Content>
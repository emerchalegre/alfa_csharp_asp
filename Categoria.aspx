<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Categoria.aspx.cs" Inherits="Categoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" CssClass="table table-condensed table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="cat_id" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="cat_id" HeaderText="cat_id" InsertVisible="False" ReadOnly="True" SortExpression="cat_id" Visible="False" />
            <asp:HyperLinkField DataTextField="cat_nome" HeaderText="Categoria" DataNavigateUrlFields="cat_id" DataNavigateUrlFormatString="~/Categoria.aspx?cat={0}" />
            
        </Columns>

    </asp:GridView>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DsGeralTableAdapters.TbCategoriaTableAdapter"></asp:ObjectDataSource>
    
</asp:Content>


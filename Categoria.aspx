<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Categoria.aspx.cs" Inherits="Categoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
        

         <LayoutTemplate>
            <div runat="server" id="itemPlaceholder"></div>
        </LayoutTemplate>
        
        <ItemSeparatorTemplate>
            <hr />

        </ItemSeparatorTemplate>

        <ItemTemplate>
            <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("cat_nome") %>'></asp:Label>
            <asp:HyperLink ID="linkCategoria" runat="server" Text='<%# Eval("cat_nome") %>' NavigateUrl='<%# Eval("cat_id", "~/Noticia.aspx?cat={0}") %>'></asp:HyperLink>
        </ItemTemplate>
       

    </asp:ListView>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DsGeralTableAdapters.TbCategoriaTableAdapter"></asp:ObjectDataSource>
    
    <br /><br />

    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="4" QueryStringField="pag">
        <Fields>
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowNextPageButton="true"/>
        </Fields>
    </asp:DataPager>
</asp:Content>


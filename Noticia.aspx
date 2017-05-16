<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Noticia.aspx.cs" Inherits="Noticia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--<asp:Image ID="Image" runat="server" ImageUrl="~/Upload/teste.png" /> -->
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="not_id" DataSourceID="ObjectDataSource1">
        <EmptyDataTemplate>
            Nenhum dado foi retornado.
        </EmptyDataTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="">Código:
                <asp:Label ID="not_idLabel" runat="server" Text='<%# Eval("not_id") %>' />
                <br />
                Título:
                <asp:Label ID="not_tituloLabel" runat="server" Text='<%# Eval("not_titulo") %>' />
                <br />
                Texto:
                <asp:Label ID="not_textoLabel" runat="server" Text='<%# Eval("not_texto") %>' />
                <br />
                Data:
                <asp:Label ID="not_dataLabel" runat="server" Text='<%# Eval("not_data") %>' />
                <br />
                Arquivo:
                <!--<asp:Label ID="not_imagemLabel" runat="server" Text='<%# Eval("not_imagem") %>' /> -->
                <asp:Image Height="200" runat="server" ImageUrl='<%# String.Format("~/Upload/{0}", Eval("not_imagem"))%>' />
                <br />
                Categoria:
                <asp:Label ID="cat_idLabel" runat="server" Text='<%# Eval("cat_nome") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
                <asp:DataPager ID="DataPager1"  PageSize="1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNotWithCat" TypeName="DsGeralTableAdapters.TbNoticiaTableAdapter"></asp:ObjectDataSource>
    
    
</asp:Content>


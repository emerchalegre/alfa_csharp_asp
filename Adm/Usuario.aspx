<%@ Page Title="" Language="VB" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="Usuario.aspx.vb" Inherits="Adm_Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnListagem" runat="server" Text="Listagem" />
            <asp:Button ID="btnCadastro" runat="server" Text="Cadastro" />

            <asp:MultiView ID="MultViewUsuario" runat="server">
                <asp:View ID="tabListagem" runat="server">

                </asp:View>
                <asp:View ID="tabCadastro" runat="server">

                </asp:View>
            </asp:MultiView>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


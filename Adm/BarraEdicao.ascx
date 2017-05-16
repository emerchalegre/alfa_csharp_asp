<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BarraEdicao.ascx.cs" Inherits="Adm_BarraEdicao" %>
<asp:Button CssClass="btn btn-default" ID="btnNovo" runat="server" Text="Novo" />
<asp:Button CssClass="btn btn-default" ID="btnGravar" runat="server" Text="Gravar" />
<asp:Button CssClass="btn btn-default" ID="btnAlterar" runat="server" Text="Alterar" />
<asp:Button CssClass="btn btn-default" ID="btnCancelar" runat="server" Text="Cancelar" />
<asp:Button CssClass="btn btn-default" ID="btnExcluir" runat="server" Text="Excluir"
    OnClientClick="return confirm('Deseja realmente excluir esse registro?');" />
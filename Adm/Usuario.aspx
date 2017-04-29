<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="false" CodeFile="Usuario.aspx.cs" Inherits="Adm_Usuario" %>

<%@ Register Src="~/Adm/BarraEdicao.ascx" TagPrefix="uc1" TagName="BarraEdicao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnListagem" runat="server" Text="Listagem" />
            <asp:Button ID="btnCadastro" runat="server" Text="Cadastro" />

            <asp:MultiView ID="MultViewUsuario" runat="server">




                <asp:View ID="tabListagem" runat="server">
                    <asp:Panel ID="pnlBusca" runat="server" DefaultButton="btnBuscar">
                        Buscar: <asp:TextBox ID="edBusca" runat="server" Width="160px"/>
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                    </asp:Panel>
                    <asp:GridView ID="gridUsuario" runat="server" AutoGenerateColumns="False" DataKeyNames="usu_id" DataSourceID="DsUsuario" AllowSorting="true">

                        <Columns>
                            <asp:BoundField DataField="usu_id" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="usu_id" />
                            <asp:BoundField DataField="usu_nome" HeaderText="Nome" SortExpression="usu_nome" />
                            <asp:BoundField DataField="usu_login" HeaderText="Login" SortExpression="usu_login" />
                            <asp:CheckBoxField DataField="usu_ativo" HeaderText="Ativo" SortExpression="usu_ativo" />
                            <asp:CommandField HeaderText="Selecionar" SelectText="Selecionar" ButtonType="Link" ShowSelectButton="true" />
                        </Columns>

                    </asp:GridView>
                    <asp:ObjectDataSource ID="DsUsuario" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DsGeralTableAdapters.TbUsuarioTableAdapter"></asp:ObjectDataSource>
                </asp:View>


                <asp:View ID="tabCadastro" runat="server">
                    <asp:TextBox ID="edUsuId" runat="server" Visible="false"></asp:TextBox>
                    <uc1:BarraEdicao runat="server" ID="BarraEdicao" />
                    
                    <p>
                        Nome:<br />
                        <asp:TextBox ID="edtUsuNome" runat="server"></asp:TextBox>
                        <br />
                        Login:<br />
                        <asp:TextBox ID="edtUsuLogin" runat="server"></asp:TextBox>
                        <br />
                        Senha:<br />
                        <asp:TextBox ID="edtSenha" runat="server"></asp:TextBox>
                        <br />
                        Ativo:<br />
                        <asp:CheckBox ID="chkUsuAtivo" runat="server"></asp:CheckBox>
                    </p>

                </asp:View>


            </asp:MultiView>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


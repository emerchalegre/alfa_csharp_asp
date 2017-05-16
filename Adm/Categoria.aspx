<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="Categoria.aspx.cs" Inherits="Adm_Categoria" %>

<%@ Register Src="~/Adm/BarraEdicao.ascx" TagPrefix="uc1" TagName="BarraEdicao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanelCategoria" runat="server">
       <ContentTemplate>
           <div class="container">
               <div class="row" style="margin-left: 20px;">
                   <button class="btn btn-info" runat="server" onserverclick="btnListagem_Click">Listagem</button>
                   <button class="btn btn-primary" runat="server" onserverclick="btnCadastro_Click">Cadastro</button>
               </div> 
               <br />
           
            
            <asp:MultiView ID="MultiViewCategoria" runat="server">
                <asp:View ID="tabListagem" EnableTheming="true" runat="server">
                    <h1 class="danger">Listagem de Categorias</h1>
                    <asp:GridView CssClass="table table-bordered table-responsive text-center" ID="grdCategoria" runat="server" AutoGenerateColumns="False" 
                        AllowSorting="true" DataKeyNames="cat_id" DataSourceID="dsCategoria"
                        OnSelectedIndexChanged="grdCategoria_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="cat_id" HeaderText="Código"
                                InsertVisible="False" ReadOnly="True" SortExpression="cat_id" />
                    
                            <asp:BoundField DataField="cat_nome" HeaderText="Nome"
                                SortExpression="cat_nome" />

                            <asp:CommandField ControlStyle-CssClass="btn btn-warning" SelectText="Selecionar"
                                ButtonType="Button" ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsCategoria" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                        TypeName="DsGeralTableAdapters.TbCategoriaTableAdapter"></asp:ObjectDataSource>
                </asp:View>

                <asp:View ID="tabCadastro" runat="server">
                    <asp:TextBox ID="edtCatId" runat="server" Visible="false" />
            
                    <p><uc1:BarraEdicao runat="server" ID="BarraEdicao" /></p>

                    <div class="form-group">
                        <label for="edtCatNome">Nome</label>
                        <input type="text" runat="server" class="form-control" id="edtCatNome" placeholder="Categoria" />
                    </div>
                </asp:View>
            </asp:MultiView>
               </div>
        </ContentTemplate>
        
    </asp:UpdatePanel>
</asp:Content>

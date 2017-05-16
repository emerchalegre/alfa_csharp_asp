<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="Noticia.aspx.cs" Inherits="Adm_Noticia" %>

<%@ Register Src="~/Adm/BarraEdicao.ascx" TagPrefix="uc1" TagName="BarraEdicao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanelNoticia" runat="server">
       <ContentTemplate>
           <div class="container">
               <div class="row" style="margin-left: 20px;">
                   <button class="btn btn-info" runat="server" onserverclick="btnListagem_Click" >Listagem</button>
                   <button class="btn btn-primary" runat="server" onserverclick="btnCadastro_Click" >Cadastro</button>
               </div> 
               
               <br />
               
               <asp:MultiView ID="MultiViewNotica" runat="server">
                <asp:View ID="tabListagem" EnableTheming="true" runat="server">
                    <h1 class="danger">Listagem de Noticias</h1>
                    <asp:GridView CssClass="table table-bordered table-responsive text-center" ID="grdNoticias" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="not_id" DataSourceID="dsNoticia" OnSelectedIndexChanged="grdNoticias_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="not_id" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="not_id" />
                            <asp:BoundField DataField="not_titulo" HeaderText="Título" SortExpression="not_titulo" />
                            <asp:BoundField DataField="not_texto" HeaderText="Texto" SortExpression="not_texto" />
                            <asp:BoundField DataField="not_data" HeaderText="Data" SortExpression="not_data" />
                            <asp:BoundField DataField="not_imagem" HeaderText="Imagem" SortExpression="not_imagem" />
                            <asp:BoundField DataField="cat_id" HeaderText="Categoria ID" SortExpression="cat_id" Visible="False" />
                            <asp:BoundField DataField="cat_nome" HeaderText="Categoria" SortExpression="cat_nome" />
                            <asp:CommandField ControlStyle-CssClass="btn btn-warning" SelectText="Selecionar"
                                ButtonType="Button" ShowSelectButton="true" >
                            <ControlStyle CssClass="btn btn-warning" />
                            </asp:CommandField>
                            
                        </Columns>
                    </asp:GridView>
                    
                    <asp:ObjectDataSource ID="dsNoticia" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNotWithCat"
                        TypeName="DsGeralTableAdapters.TbNoticiaTableAdapter">
                    </asp:ObjectDataSource>
                </asp:View>

                <asp:View ID="tabCadastro" runat="server">
                    
                    <asp:TextBox ID="edtNotId" runat="server" Visible="false" />
            
                    <uc1:BarraEdicao runat="server" ID="BarraEdicao" />

                    <div class="form-group">
                        <label for="edtNotTitulo">Título</label>
                        <input type="text" runat="server" class="form-control" id="edtNotTitulo" placeholder="Título" />
                    </div>
                    <div class="form-group">
                        <label for="edtNotTexto">Texto</label>
                        <textarea class="form-control" runat="server" rows="8" id="edtNotTexto" placeholder="Texto" />
                    </div>
                    <div class="form-group">
                        <span style="margin-left: -15px;" class="col-lg-12">
                            <label>Selecione o arquivo</label>
                        </span>
                        <span style="margin-left: -15px;" class="col-md-6">
                            <asp:FileUpload ID="FileUpload1" onchange="fileinfo();" style="display:none;" runat="server" />
                            <asp:TextBox ID="edtArquivo" CssClass="form-control" runat="server" />
                        </span>
                        <span class="col-md-6">
                        <button type="button" id="btnUpload" class="btn btn-file" runat="server">Browse</button>
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="cbCategoria">Categoria</label>
                        <select class="form-control" style="width: 250px;" id="cbCategoria" name="cbCategoria" runat="server"></select>
                    </div>
                </asp:View>
            </asp:MultiView>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function fileinfo() {
            document.getElementById('<%=edtArquivo.ClientID %>').value = document.getElementById('<%=FileUpload1.ClientID%>').value;
        }

        function setCategoria(cat_id) {
            document.getElementById("ContentPlaceHolder1_cbCategoria").value = cat_id;
        }
        
    </script>
    
</asp:Content>


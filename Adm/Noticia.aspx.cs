using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adm_Noticia : System.Web.UI.Page
{
    private string Diretorio = "../Upload/";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            btnListagem_Click(null, null);

        BarraEdicao.BtnNovo.Click += btnNovo_Click;
        BarraEdicao.BtnAlterar.Click += btnAlterar_Click;
        BarraEdicao.BtnGravar.Click += btnGravar_Click;
        BarraEdicao.BtnCancelar.Click += btnCancelar_Click;
        BarraEdicao.BtnExcluir.Click += btnExcluir_Click;
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        ScriptManager.GetCurrent(this).RegisterPostBackControl(this.BarraEdicao.BtnGravar);
        btnUpload.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");

    }

    private void PopulateCbCategoria()
    {
        DsGeralTableAdapters.TbCategoriaTableAdapter adapter = new DsGeralTableAdapters.TbCategoriaTableAdapter();
        DsGeral.TbCategoriaDataTable datable = adapter.GetData();

        cbCategoria.DataSource = datable;
        cbCategoria.DataValueField = "cat_id";
        cbCategoria.DataTextField = "cat_nome";
        cbCategoria.DataBind();
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        if (!IsPostBack)
            habilitarCampos(false);
    }

    private void habilitarCampos(bool habilitar)
    {
        edtNotTitulo.Disabled = !habilitar;
        edtNotTexto.Disabled = !habilitar;
        cbCategoria.Disabled = !habilitar;
        btnUpload.Disabled = !habilitar;
        edtArquivo.Enabled = habilitar;
        BarraEdicao.BtnGravar.Enabled = habilitar;
        BarraEdicao.BtnCancelar.Enabled = habilitar;

        habilitar = !habilitar;
        BarraEdicao.BtnNovo.Enabled = habilitar;
        BarraEdicao.BtnAlterar.Enabled = habilitar;
        BarraEdicao.BtnExcluir.Enabled = habilitar;
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "", "onActiveCadastro();", true);
    }

    private void btnExcluir_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(edtNotId.Text))
            return;

        Noticia not = new Noticia();
        string retorno = not.excluir(int.Parse(edtNotId.Text));

        if (!string.IsNullOrEmpty(retorno))
        {
            Funcoes.mostrarMensagem(this, retorno);
            return;
        }
        else
        {
            Funcoes.mostrarMensagem(this, "Registro excluído com sucesso!");
        }

        atualizarCampos(0);
        atualizarDados();
        btnListagem_Click(null, null);
    }

    private void btnCancelar_Click(object sender, EventArgs e)
    {
        atualizarCampos(retornaIdSelecionado());
        habilitarCampos(false);
    }

    private void btnGravar_Click(object sender, EventArgs e)
    {
        string retorno;
        Noticia cat = new Noticia();

        if(FileUpload1.HasFile)
        {
            string extension = System.IO.Path.GetExtension(FileUpload1.FileName);
            if(extension == ".jpg" || extension == ".png")
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                var imgDir = HttpContext.Current.Server.MapPath(string.Format(@"~/Upload/{0}", filename));
                FileUpload1.SaveAs(imgDir);
                edtArquivo.Text = this.FileUpload1.FileName;
            }
            else
            {
                Funcoes.mostrarMensagem(this, "Somente permitidas imagens png e jpg");
                return;
            }
        }
        
        if (string.IsNullOrEmpty(edtNotId.Text))
            retorno = cat.inserir(edtNotTitulo.Value, edtNotTexto.Value, this.FileUpload1.FileName, Convert.ToInt32(cbCategoria.Value));
        else
            retorno = cat.editar(Convert.ToInt32(edtNotId.Text), edtNotTitulo.Value, edtNotTexto.Value, edtArquivo.Text, Convert.ToInt32(cbCategoria.Value));

        if (!string.IsNullOrEmpty(retorno))
        {
            Funcoes.mostrarMensagem(this, retorno);
            return;
        }
        else
        {
            Funcoes.mostrarMensagem(this, "Registro salvo com sucesso!");
        }
        
        habilitarCampos(false);
        atualizarDados();
        btnListagem_Click(null, null);
    }

    private void btnAlterar_Click(object sender, EventArgs e)
    {
        habilitarCampos(!string.IsNullOrEmpty(edtNotId.Text));
    }

    private void btnNovo_Click(object sender, EventArgs e)
    {
        atualizarCampos(0);
        habilitarCampos(true);
    }

    protected void btnListagem_Click(object sender, EventArgs e)
    {
        MultiViewNotica.ActiveViewIndex = 0;
    }

    protected void btnCadastro_Click(object sender, EventArgs e)
    {
        MultiViewNotica.ActiveViewIndex = 1;
        PopulateCbCategoria();
    }
    private void atualizarDados()
    {
        dsNoticia.DataBind();
        grdNoticias.DataBind();
    }
    private void atualizarCampos(int not_id)
    {
        if (not_id <= 0)
        {
            edtNotId.Text = "";
            edtNotTitulo.Value = "";
            edtNotTexto.Value = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "setCategoria('');", true);
        }
        else
        {
            Noticia not = new Noticia(not_id);
            edtNotId.Text = not.Not_id.ToString();
            edtNotTitulo.Value = not.Not_titulo;
            edtNotTexto.Value = not.Not_texto;
            edtArquivo.Text = not.Not_imagem;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "setCategoria('"+not.Cat_id+"');", true);

        }
    }
    private int retornaIdSelecionado()
    {
        if (grdNoticias.SelectedDataKey != null)
            return int.Parse(grdNoticias.SelectedDataKey[0].ToString());
        else
            return 0;
    }
    protected void grdNoticias_SelectedIndexChanged(object sender, EventArgs e)
    {
        atualizarCampos(retornaIdSelecionado());
        btnCadastro_Click(null, null);
    }
}
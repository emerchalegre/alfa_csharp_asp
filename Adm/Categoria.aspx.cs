using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adm_Categoria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            btnListagem_Click(null, null);

        BarraEdicao.BtnNovo.Click += btnNovo_Click;
        BarraEdicao.BtnAlterar.Click += btnAlterar_Click;
        BarraEdicao.BtnGravar.Click += btnGravar_Click;
        BarraEdicao.BtnCancelar.Click += btnCancelar_Click;
        BarraEdicao.BtnExcluir.Click += btnExcluir_Click;
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        if (!IsPostBack)
            habilitarCampos(false);
    }

    private int retornaIdSelecionado()
    {
        if (grdCategoria.SelectedDataKey != null)
            return int.Parse(grdCategoria.SelectedDataKey[0].ToString());
        else
            return 0;
    }

    protected void btnListagem_Click(object sender, EventArgs e)
    {
        MultiViewCategoria.ActiveViewIndex = 0;
    }

    protected void btnCadastro_Click(object sender, EventArgs e)
    {
        MultiViewCategoria.ActiveViewIndex = 1;
    }

    private void atualizarCampos(int cat_id)
    {
        if (cat_id <= 0)
        {
            edtCatId.Text = "";
            edtCatNome.Text = "";
        }
        else
        {
            Categoria cat = new Categoria(cat_id);
            edtCatId.Text = cat.Cat_id.ToString();
            edtCatNome.Text = cat.Cat_nome;
        }
    }

    private void habilitarCampos(bool habilitar)
    {
        edtCatNome.Enabled = habilitar;
        BarraEdicao.BtnGravar.Enabled = habilitar;
        BarraEdicao.BtnCancelar.Enabled = habilitar;

        habilitar = !habilitar;
        BarraEdicao.BtnNovo.Enabled = habilitar;
        BarraEdicao.BtnAlterar.Enabled = habilitar;
        BarraEdicao.BtnExcluir.Enabled = habilitar;
    }

    protected void btnNovo_Click(object sender, EventArgs e)
    {
        atualizarCampos(0);
        habilitarCampos(true);
    }
    
    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        habilitarCampos(!string.IsNullOrEmpty(edtCatId.Text));
    }
    
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        atualizarCampos(retornaIdSelecionado());
        habilitarCampos(false);
    }
    
    protected void btnGravar_Click(object sender, EventArgs e)
    {
        string retorno;
        Categoria cat = new Categoria();

        if (string.IsNullOrEmpty(edtCatId.Text))
            retorno = cat.inserir(edtCatNome.Text);
        else
            retorno = cat.editar(int.Parse(edtCatId.Text), edtCatNome.Text);

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
    }

    private void atualizarDados()
    {
        dsCategoria.DataBind();
        grdCategoria.DataBind();
    }

    protected void btnExcluir_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(edtCatId.Text))
            return;

        Categoria cat = new Categoria();
        string retorno = cat.excluir(int.Parse(edtCatId.Text));

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
    }

    protected void grdCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        atualizarCampos(retornaIdSelecionado());
        btnCadastro_Click(null, null);
    }
}
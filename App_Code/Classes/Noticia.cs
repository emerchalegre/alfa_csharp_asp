using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Noticia
/// </summary>
public class Noticia
{
    private DsGeralTableAdapters.TbNoticiaTableAdapter dsNoticia = new DsGeralTableAdapters.TbNoticiaTableAdapter();
    private int not_id;
    private string not_titulo;
    private string not_texto;
    private string not_imagem;
    private int cat_id;

    public int Not_id {
        get { return not_id; }
    }
    public string Not_titulo {
        get { return not_titulo; }
        set { not_titulo = value; }
    }
    public string Not_texto {
        get { return not_texto; }
        set { not_texto = value; }
    }
    public string Not_imagem {
        get { return not_imagem; }
        set { not_imagem = value; }
    }
    public int Cat_id {
        get { return cat_id; }
        set { cat_id = value; }
    }

    public Noticia()
    {
        
    }

    public Noticia(int not_id)
    {
        DsGeral.TbNoticiaDataTable tbNoticia = new DsGeral.TbNoticiaDataTable();
        dsNoticia.FillByNotId(tbNoticia, not_id);

        if (tbNoticia.Rows.Count > 0)
        {
            DsGeral.TbNoticiaRow regNoticia = (DsGeral.TbNoticiaRow)tbNoticia.Rows[0];
            this.not_id = regNoticia.not_id;
            this.not_titulo = regNoticia.not_titulo;
            this.not_texto = regNoticia.not_texto;
            this.not_imagem = regNoticia.not_imagem;
            this.cat_id = regNoticia.cat_id;
        }
    }
    private string validarCampos(string not_titulo, string not_texto)
    {
        if (string.IsNullOrEmpty(not_titulo))
            return "O Título deve ser informado!";
        if (string.IsNullOrEmpty(not_texto))
            return "O Texto deve ser informado!";
        return "";
    }

    public string inserir(string not_titulo, string not_texto, string not_imagem, int cat_id)
    {
        string retorno = validarCampos(not_titulo, not_texto);
        if (!string.IsNullOrEmpty(retorno))
            return retorno;

        try
        {
            dsNoticia.Insert(not_titulo, not_texto, DateTime.Now, not_imagem, cat_id);
            return "";
        }
        catch (Exception e)
        {
            return "Erro ao inserir a noticia: " + e.Message;
        }
    }

    public string editar(int not_id, string not_titulo, string not_texto, string not_imagem, int cat_id)
    {
        string retorno = validarCampos(not_titulo, not_texto);
        if (!string.IsNullOrEmpty(retorno))
            return retorno;

        try
        {
            dsNoticia.Update(not_titulo, not_texto, not_imagem, cat_id, not_id);
            return "";
        }
        catch (Exception e)
        {
            return "Erro ao editar a noticia: " + e.Message;
        }
    }

    public string excluir(int not_id)
    {
        try
        {
            dsNoticia.Delete(not_id);
            return "";
        }
        catch (Exception e)
        {
            return "Erro ao excluir a noticia: " + e.Message;
        }
    }
}
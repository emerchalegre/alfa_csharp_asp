﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adm_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack){
            if (Funcoes.verUsuarioLogado(Session["Usuario"] as Usuario))
                Response.Redirect("~/Adm/Inicio.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        
        ControleLogin controleLogin = new ControleLogin();
        Console.WriteLine(edtLogin.Value);
        if (controleLogin.buscarUsuario(edtLogin.Value, edtSenha.Value))
        {
            Usuario usuario = new Usuario(edtLogin.Value);
            Session["Usuario"] = usuario;
            Response.Redirect("~/Adm/Inicio.aspx");
        }
        else
        {
            Funcoes.mostrarMensagem(this, "Usuário o senha inválida!");
        }

    }
}
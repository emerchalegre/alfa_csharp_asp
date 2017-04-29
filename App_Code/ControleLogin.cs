using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ControleLogin
/// </summary>
public class ControleLogin
{
	public ControleLogin()
	{


		//
		// TODO: Add constructor logic here
		//
	}

    public bool buscarUsuario(string usuario, string senha)
    {

        if (string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(senha)){
            return false;
        }

        DsGeral.TbUsuarioDataTable tbUsuario = new DsGeral.TbUsuarioDataTable();
        DsGeralTableAdapters.TbUsuarioTableAdapter dsUsuario = new DsGeralTableAdapters.TbUsuarioTableAdapter();
        dsUsuario.FillByLoginAndPass(tbUsuario, usuario, senha);

        return (tbUsuario.Rows.Count > 0);


    }

}
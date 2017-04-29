using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

public class Funcoes
{
    public static void mostrarMensagem(Page pagina, string mensagem)
    {
        ScriptManager.RegisterStartupScript(pagina, pagina.GetType(), Guid.NewGuid().ToString(),
            "alert('" + mensagem + "');", true);
    }
}
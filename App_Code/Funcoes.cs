using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;

public class Funcoes
{
    public static void mostrarMensagem(Page pagina, string mensagem)
    {
        ScriptManager.RegisterStartupScript(pagina, pagina.GetType(), Guid.NewGuid().ToString(),
            "alert('" + mensagem + "');", true);
    }

    public static bool verUsuarioLogado(Usuario usuario)
    {
        return ((usuario != null) && (usuario.Usu_ativo));
    }

    public static bool enviarEMail(string mail, string assunto, string mensagem)
    {

        if (string.IsNullOrEmpty(mail))
        {
        }

        try
        {
            
            SmtpClient cliente = new SmtpClient("smtp.gmail.com", 587);
            cliente.EnableSsl = true;

            MailAddress remetente = new MailAddress("contato@gmail.com", "teste");
            MailAddress destinatario = new MailAddress(mail);
            MailMessage mailMessage = new MailMessage(remetente, destinatario);
            mailMessage.Subject = assunto;
            mailMessage.Body = mensagem;
            mailMessage.IsBodyHtml = true;

            NetworkCredential credencial = new NetworkCredential("contato@gmail.com", "123456");

            cliente.Credentials = credencial;
            cliente.Send(mailMessage);
            return true;


        }catch(Exception e){

        }

        return true;
    }

}
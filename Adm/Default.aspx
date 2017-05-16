<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Adm_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link href="../Content/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../Content/css/signin.css" rel="stylesheet" />
    <script type="text/javascript">

        (function () {

            document.addEventListener('DOMContentLoaded', function () {
                //document.getElementById("edtLogin").focus();
            });

        })();

    </script>
    
</head>
<body>
    <div class="container">

      <form class="form-signin" id="form1" runat="server" >
        <h2 class="form-signin-heading">Login</h2>
        <input type="text" runat="server" id="edtLogin" class="form-control" placeholder="Login" />
        <input type="password" runat="server" id="edtSenha" class="form-control" placeholder="Senha" />
        <button id="btnLogin"  class="btn btn-lg btn-primary btn-block" runat="server" type="submit" onserverclick="btnLogin_Click">Entrar</button>
      </form>

    </div>
</body>

    

</html>


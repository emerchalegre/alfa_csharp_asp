<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Adm_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>

    <script type="text/javascript">

        (function () {

            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById("edtLogin").focus();
            });

        })();

    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="pnLogin" runat="server">
        Login:<br />
        <asp:TextBox ID="edtLogin" runat="server" ClientIDMode="Static"></asp:TextBox>
        <br />
        Senha:<br />
        <asp:TextBox ID="edtSenha" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
    </asp:Panel>
    </div>
    </form>
</body>

    

</html>


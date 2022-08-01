<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logueo.aspx.cs" Inherits="PronosticWeb.Logueo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
    .style17
    {
        text-align: center;
    }
    .style18
    {
        color: #003399;
        font-size: xx-large;
    }
    .style22
    {
        width: 733px;
    }
    .style23
    {
        width: 719px;
    }
    .style25
    {
        width: 190px;
        text-align: center;
        height: 64px;
        background-color: #66CCFF;
    }
    .style26
    {
        width: 190px;
        text-align: center;
        height: 68px;
        background-color: #66CCFF;
    }
    .style27
    {
        font-family: Arial, Helvetica, sans-serif;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1" style="height: 336px; ">
        <div class="style17">
            <span class="style13"><span class="style18"><strong>LOGIN</strong></span></span><strong><br />
        </strong>
        </div>
        <table class="style9">
            <tr>
                <td class="style23" rowspan="2">
                    </td>
                <td class="style26">
                    <span class="style27"><strong>USUARIO</strong></span><br />
                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </td>
                <td class="style22" rowspan="2">
                </td>
            </tr>
            <tr>
                <td class="style25" style="font-family: Arial, Helvetica, sans-serif">
                    <span class="style5"><strong>CONTRASEÑA<br />
                    </strong><asp:TextBox ID="txtContra" 
                        runat="server" Width="128px"></asp:TextBox>
                    </span><br />
                    </td>
            </tr>
            <tr>
                <td class="style12" colspan="3" style="text-align: center">
                    <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" Text="Login" 
                        Width="136px" />
                </td>
            </tr>
            <tr>
                <td class="style17" colspan="3">
&nbsp;
                    <asp:Label ID="LblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style17" colspan="3">
                    <asp:HyperLink ID="BackPag" runat="server" style="text-align: justify" 
                        NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
        </table>
    
            
    
    </div>
    </form>
</body>
</html>

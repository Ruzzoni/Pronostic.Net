<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PronosticWeb.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 167px;
        }
        .style2
        {
            width: 1360px;
        }
        .style3
        {
            width: 167px;
            height: 75px;
            text-align: left;
        }
        .style4
        {
            width: 1360px;
            height: 75px;
            text-align: left;
        }
        .style5
        {
            height: 75px;
            text-align: center;
        }
        .style6
        {
            width: 167px;
            height: 408px;
        }
        .style7
        {
            width: 1360px;
            height: 408px;
        }
        .style8
        {
            height: 408px;
        }
        .style9
        {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%; height: 542px;">
            <tr>
                <td class="style3">
                </td>
                <td class="style4">
                </td>
                <td class="style5">
                    <asp:HyperLink ID="AccessLogin" runat="server" NavigateUrl="~/Logueo.aspx">Iniciar Sesion</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="style6">
                </td>
                <td class="style7">
                    <span class="style9"><strong>PRONOSTICO PARA EL DIA DE HOY:<br />
                    </strong></span><br />
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" Height="304px" style="text-align: center" 
                        Width="605px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
                        BorderWidth="1px">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </td>
                <td class="style8">
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

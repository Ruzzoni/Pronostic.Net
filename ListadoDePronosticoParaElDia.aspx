<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ListadoDePronosticoParaElDia.aspx.cs" Inherits="PronosticWeb.ListadoDePronosticoParaElDia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style17
    {}
    .style18
    {
        font-size: x-large;
    }
    .style19
    {
        width: 126px;
    }
    .style20
    {
        width: 126px;
        height: 23px;
    }
    .style21
    {
        height: 23px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="style18" colspan="4" style="text-align: center; font-weight: 700">
            Listado de pronosticos para el dia seleccionado</td>
    </tr>
    <tr>
        <td class="style17" rowspan="4">
        </td>
        <td class="style19">
            &nbsp;</td>
        <td class="style17">
        </td>
        <td class="style17" rowspan="4">
        </td>
    </tr>
    <tr>
        <td class="style20">
            FECHA:</td>
        <td class="style21">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </td>
    </tr>
    <tr>
        <td class="style19">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style19">
            &nbsp;</td>
        <td style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                Width="774px">
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
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2" style="text-align: center">
            <asp:Label ID="LblError" runat="server" 
                style="color: #FF0000; text-align: center; font-weight: 700"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2" style="text-align: center">
            <asp:Button ID="BttnBuscarPronoscico" runat="server" 
                onclick="BttnBuscarPronoscico_Click" Text="Buscar" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

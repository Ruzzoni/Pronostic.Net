<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="RegistrarUnPronostico.aspx.cs" Inherits="PronosticWeb.RegistrarUnPronostico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style17
    {
        height: 23px;
            text-align: center;
            color: #FF0000;
            font-weight: 700;
        }
    .style18
    {
        width: 413px;
    }
    .style19
    {
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style17">
        </td>
        <td class="style17" colspan="2">
            <asp:GridView ID="GridViewCiudades" runat="server" BackColor="White" 
                BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                Height="285px" Width="589px" 
                >
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
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
        <td class="style17">
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
        <td class="style18">
            FECHA:</td>
        <td>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style18">
            HORA:</td>
        <td>
            <asp:DropDownList ID="DropDownListHora" runat="server" Width="198px">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style18">
            TEMPERATURA MAX:</td>
        <td>
            <asp:TextBox ID="TboxTempMax" runat="server" Width="196px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style18">
            TEMPERATURA MIN:</td>
        <td>
            <asp:TextBox ID="TboxTempMin" runat="server" Width="196px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style18">
            VELOCIDAD DEL VIENTO:</td>
        <td>
            <asp:TextBox ID="TboxVelViento" runat="server" Width="196px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style18">
            TIPO DE CIELO:</td>
        <td>
            <asp:DropDownList ID="DropDownListCielo" runat="server" Height="23px" 
                Width="195px">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style18">
            PROBABILIDAD DE LLUVIAS Y TORMENTAS:</td>
        <td>
            <asp:CheckBox ID="CboxTormentaYLluvia" runat="server" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style17">
        </td>
        <td class="style17" colspan="2">
            <asp:Label ID="LblError" runat="server"></asp:Label>
        </td>
        <td class="style17">
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style19" colspan="2">
            <asp:Button ID="Crear" runat="server" Text="Enviar" onclick="Crear_Click" 
                Width="142px" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style19" colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ListadoDePronosticoPorCiudad.aspx.cs" Inherits="PronosticWeb.ListadoDePronosticoPorCiudad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style17
        {
            font-size: xx-large;
            font-family: Arial;
        height: 40px;
    }
        .style18
        {
            width: 245px;
        }
        .style20
        {
            width: 937px;
        }
        .style21
        {
            height: 23px;
        }
        .style22
        {
            width: 937px;
            text-align: center;
            height: 34px;
        }
        .style23
        {
            width: 937px;
            height: 23px;
            text-align: center;
            font-weight: 700;
        }
        .style24
        {
            width: 153px;
            height: 30px;
        }
        .style25
        {
            height: 30px;
        }
        .style26
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style17" colspan="3" style="text-align: center; font-weight: 700;">
                Listado de Pronosticos por Ciudad</td>
        </tr>
        <tr>
            <td class="style18" rowspan="4" style="text-align: left">
                &nbsp;</td>
            <td class="style20">
                &nbsp;</td>
            <td rowspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                <table style="width: 76%; margin-left: 117px;">
                    <tr>
                        <td class="style24">
                            PAIS:</td>
                        <td class="style25">
&nbsp;&nbsp;<asp:DropDownList ID="DropDownListPais" runat="server" 
                                onselectedindexchanged="DropDownListPais_SelectedIndexChanged" 
                                style="margin-left: 0px" Width="158px" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            </td>
                        <td class="style26">
                            </td>
                    </tr>
                    <tr>
                        <td class="style21" colspan="2">
                            <asp:GridView ID="GridView1" runat="server" Height="122px" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="704px" 
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4">
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
                    </tr>
                    <tr>
                        <td class="style21" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style21" colspan="2">
                            <asp:GridView ID="GridView2" runat="server" Width="703px" CellPadding="4" 
                                ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21" colspan="2">
                            &nbsp;</td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td class="style23">
                <asp:Label ID="LblError" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style22">
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

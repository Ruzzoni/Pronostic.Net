<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ABMCiudades.aspx.cs" Inherits="PronosticWeb.ABMCiudades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style17
        {
            font-size: xx-large;
            font-family: Arial;
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
            width: 153px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style17" colspan="3" style="text-align: center">
                <strong>ABM de CIUDADES</strong></td>
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
                        <td class="style21">
                            CODIGO DE CIUDAD:</td>
                        <td>
                            <asp:TextBox ID="TboxImputCodigoC" runat="server" Width="169px"></asp:TextBox>
&nbsp;<asp:Button ID="BttnBuscarCodigoC" runat="server" onclick="BttnBuscarCodigoC_Click" Text="Buscar" />
                        &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style21">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style21">
                            NOMBRE:</td>
                        <td>
                            <asp:TextBox ID="TboxImputNombreC" runat="server" Width="175px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            PAIS:</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="174px">
                            </asp:DropDownList>
                        </td>
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
                <asp:Button ID="BttnAgregar" runat="server" onclick="BttnAgregar_Click" 
                    Text="Agregar" />
&nbsp;<asp:Button ID="BttnBaja" runat="server" onclick="BttnBaja_Click" Text="Eliminar" />
&nbsp;<asp:Button ID="BttnModificar" runat="server" onclick="BttnModificar_Click" 
                    Text="Modificar" />
                <br />
                <asp:Button ID="BttnClean" runat="server" onclick="BttnClean_Click" 
                    Text="Limpiar Formulario" />
            </td>
        </tr>
    </table>
</asp:Content>

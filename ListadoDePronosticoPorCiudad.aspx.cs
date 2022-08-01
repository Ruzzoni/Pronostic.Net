using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

namespace PronosticWeb
{
    public partial class ListadoDePronosticoPorCiudad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try 
            {
                if (Session["UsuarioEmp"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                if (!IsPostBack)
                {
                    DropDownListPais.DataSource = LogicaPais.ListPaises();
                    DropDownListPais.DataTextField = "Nombre";
                    DropDownListPais.DataValueField = "Codigo";
                    DropDownListPais.DataBind();

                    Pais P = LogicaPais.BuscarPais(DropDownListPais.SelectedItem.Value.ToString().Trim());
                    GridView1.DataSource = LogicaCiudad.ListCiudad(P.Codigo.ToString().Trim());
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Ciudad C = LogicaCiudad.BuscarCiudad(GridView1.SelectedRow.Cells[1].Text.ToString().Trim());
                List<Pronostico> P = LogicaPronostico.ListPronosticDeCiudad(C);
                if (P.Count > 0)
                {
                    GridView2.DataSource = P;
                    GridView2.DataBind();
                }
                else
                {
                    LblError.Text = "No hay pronosticos para la Ciudad celeccionada.";
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }

        protected void DropDownListPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Pais P = LogicaPais.BuscarPais(DropDownListPais.SelectedItem.Value.ToString().Trim());
                GridView1.DataSource = LogicaCiudad.ListCiudad(P.Codigo.ToString().Trim());
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }
    }
}
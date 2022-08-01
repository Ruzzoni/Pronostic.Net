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
    public partial class ListadoDePronosticoParaElDia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioEmp"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void BttnBuscarPronoscico_Click(object sender, EventArgs e)
        {
            try
            {
                LblError.Text = "";
                DateTime fecha = new DateTime(Calendar1.SelectedDate.Year, Calendar1.SelectedDate.Month, Calendar1.SelectedDate.Day, 0, 0, 0);
                List<Pronostico> Lista= LogicaPronostico.ListaPronosticParaLaFecha(fecha);


                if (Lista.Count > 0)
                {
                    GridView1.DataSource = Lista;
                    GridView1.DataBind();
                   
                }
                else 
                {
                    LblError.Text = "No hay pronostico asosiado al dia seleccionado.";
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }
    }
}
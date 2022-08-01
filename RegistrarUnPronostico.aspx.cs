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
    public partial class RegistrarUnPronostico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioEmp"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                GridViewCiudades.DataSource = LogicaCiudad.ListarTodasLasCiudades();
                GridViewCiudades.DataBind();
                DropDownListHora.DataSource = Horas();
                DropDownListHora.DataBind();
                DropDownListCielo.DataSource = Cielo();
                DropDownListCielo.DataBind();
            }
        }
        
        public static List<string> Horas()
        {
            List<string> Horas = new List<string>();

            Horas.Add("00");
            Horas.Add("01");
            Horas.Add("02");
            Horas.Add("03");
            Horas.Add("04");
            Horas.Add("05");
            Horas.Add("06");
            Horas.Add("07");
            Horas.Add("08");
            Horas.Add("09");
            Horas.Add("10");
            Horas.Add("11");
            Horas.Add("12");
            Horas.Add("13");
            Horas.Add("14");
            Horas.Add("15");
            Horas.Add("16");
            Horas.Add("17");
            Horas.Add("18");
            Horas.Add("19");
            Horas.Add("20");
            Horas.Add("21");
            Horas.Add("22");
            Horas.Add("23");

            return Horas;
        }
        
        public static List<string> Cielo()
        {
            List<string> cielo = new List<string>();

            cielo.Add("despejado");
            cielo.Add("parcialmente nuboso");
            cielo.Add("nuboso");

            return cielo;
        }

        protected void Crear_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fecha = new DateTime(Calendar1.SelectedDate.Year, Calendar1.SelectedDate.Month, Calendar1.SelectedDate.Day, Convert.ToInt32(DropDownListHora.SelectedItem.ToString()), 0, 0);
               
                if (fecha == null || TboxTempMax.Text == "" || TboxTempMin.Text == "" || DropDownListCielo.SelectedItem == null || TboxVelViento.Text == "")
                {
                    LblError.Text = "Error deve rellenar todo el formulario.";
                }
                else
                {
                    Ciudad C = LogicaCiudad.BuscarCiudad(GridViewCiudades.SelectedRow.Cells[1].Text.ToString());
                    Pronostico P = new Pronostico(0, fecha, Convert.ToInt32(TboxTempMax.Text), Convert.ToInt32(TboxTempMin.Text), 
                        Convert.ToInt32(TboxVelViento.Text), DropDownListCielo.SelectedItem.ToString(), CboxTormentaYLluvia.Checked,
                        LogicaUsuarioEmp.BuscarEmp(((UsuarioEmp)Session["UsuarioEmp"]).NombreUsuario), C);
                    LogicaPronostico.AgregarPronostico(P);
                    LblError.Text = "Pronostico agregado exitosamente.";
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }
    }
}
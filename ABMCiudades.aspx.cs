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
    public partial class ABMCiudades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioEmp"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
            }
        }

        protected void BttnBuscarCodigoC_Click(object sender, EventArgs e)
        {
            LblError.Text = "";
            try
            {
                List<Pais> ListP = new List<Pais>();
                string codigoC = TboxImputCodigoC.Text.Trim();
                Ciudad C = (Ciudad)Logica.LogicaCiudad.BuscarCiudad(codigoC);
                ListP = Logica.LogicaPais.ListPaises();


                if (C == null)
                {
                    LblError.Text = "Seleccione el pais al que quiere agretar la ciudad y complete el formulario.";
                    DropDownList1.DataSource = ListP;
                    DropDownList1.DataTextField = "Nombre";
                    DropDownList1.DataValueField = "Codigo";
                    DropDownList1.DataBind();
                }
                else
                {
                    List<Pais> ListDeLaCiudad = LogicaCiudad.ListPaisDeCiudad(TboxImputCodigoC.Text);
                    DropDownList1.DataSource = ListDeLaCiudad;
                    DropDownList1.DataTextField = "Nombre";
                    DropDownList1.DataBind();
                    TboxImputNombreC.Text = C.NombreC.ToString();
                    this.ActivoBotonesBM();
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }


        protected void BttnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (TboxImputCodigoC.Text == "")
                {
                    LblError.Text = "Error debe ingresar un codigo a buscar.";
                }
                else
                {
                    Ciudad unaC = new Ciudad(TboxImputCodigoC.Text.Trim(), TboxImputNombreC.Text.Trim());
                    Logica.LogicaCiudad.AgregaCiudad(unaC, DropDownList1.SelectedValue.ToString());
                    this.LimpioFormulario();
                    LblError.Text = "Ciudad agregada exitosamente.";
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }

        protected void BttnBaja_Click(object sender, EventArgs e)
        {
            try
            {
                if (TboxImputCodigoC.Text == "")
                {
                    LblError.Text = "Error debe ingresar un codigo a buscar.";
                }
                else
                {
                    Ciudad Ci = new Ciudad(TboxImputCodigoC.Text.Trim(), TboxImputNombreC.Text.Trim());
                    LogicaCiudad.BajaCiudad(Ci);
                    this.LimpioFormulario();
                    LblError.Text = "Pais Eliminado con exito";
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }

        protected void BttnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (TboxImputCodigoC.Text == "")
                {
                    LblError.Text = "Error debe ingresar un codigo a buscar.";
                }
                else
                {
                    Ciudad Ci = new Ciudad(TboxImputCodigoC.Text.Trim(), TboxImputNombreC.Text.Trim());
                    LogicaCiudad.ModificaCiudad(Ci);
                    this.LimpioFormulario();
                    LblError.Text = "Pais Modificado con exito";
                }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }
        }

        protected void BttnClean_Click(object sender, EventArgs e)
        {
            this.LimpioFormulario();
        }   


        private void ActivoBotonesA()
        {
            BttnModificar.Enabled = false;
            BttnBaja.Enabled = false;
            BttnAgregar.Enabled = true;
            BttnBuscarCodigoC.Enabled = false;
        }
        private void ActivoBotonesBM()
        {
            BttnModificar.Enabled = true;
            BttnBaja.Enabled = true;
            BttnAgregar.Enabled = false;
            BttnBuscarCodigoC.Enabled = false;
        }
        private void LimpioFormulario()
        {
            TboxImputCodigoC.Text = "";
            TboxImputNombreC.Text = "";
            List<Pais> lista = new List<Pais>();
            DropDownList1.DataSource = lista;
            DropDownList1.DataBind();
            LblError.Text = "";
        }
    }
}
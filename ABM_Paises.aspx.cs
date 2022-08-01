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
    public partial class ABM_Paises : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioEmp"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void BttnBuscarCodigoP_Click(object sender, EventArgs e)
        {
            LblError.Text = "";
            try
            {
                string codigoP = TboxImputCodigoPais.Text.Trim();
                Pais P = (Pais)Logica.LogicaPais.BuscarPais(codigoP);

                if (TboxImputCodigoPais.Text == "")
                {
                    this.LimpioFormulario();
                    LblError.Text = "Error debe ingresar un codigo a buscar.";
                }
                else if (TboxImputCodigoPais.Text.Length >= 4 || TboxImputCodigoPais.Text.Length <= 2)
                {
                    this.LimpioFormulario();
                    LblError.Text = "Deve ingresar un codigo de 3 Caracteres";
                }
                else if (P == null)
                {
                    this.ActivoBotonesA();
                    LblError.Text = "No existe este pais";
                }
                else
                {
                    List<Ciudad> lista = LogicaCiudad.ListCiudad(P.Codigo);
                    TboxImputCodigoPais.Text = P.Codigo.ToString();
                    TboxImputNombreP.Text = P.Nombre.ToString();
                    DropListCiudadesDeP.DataSource = lista;
                    DropListCiudadesDeP.DataTextField = "NombreC";
                    DropListCiudadesDeP.DataValueField = "CodigoC";
                    DropListCiudadesDeP.DataBind();
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
                if (TboxImputCodigoPais.Text == "")
                {
                    LblError.Text = "Debe primero buscar un codigo para despues agregarlo.";
                }
                else
                {
                    Pais unP = new Pais(TboxImputCodigoPais.Text.Trim(), TboxImputNombreP.Text.Trim(), null);
                    Logica.LogicaPais.AgregarPais(unP);
                    this.LimpioFormulario();
                    LblError.Text = "Pais agregado exitosamente.";
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
                if (TboxImputCodigoPais.Text == "")
                {
                    LblError.Text = "Debe primero buscar un codigo para despues Eliminarlo.";
                }
                else
                {             
                    Pais P = new Pais(TboxImputCodigoPais.Text.Trim(), TboxImputNombreP.Text.Trim(), Logica.LogicaCiudad.ListCiudad(TboxImputCodigoPais.Text.Trim()));
                    LogicaPais.BajarPais(P);
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
                Pais P = new Pais(TboxImputCodigoPais.Text.Trim(), TboxImputNombreP.Text.Trim(), Logica.LogicaCiudad.ListCiudad(TboxImputCodigoPais.Text.Trim()));
                LogicaPais.ModificaPais(P);
                this.LimpioFormulario();
                LblError.Text = "Pais Modificado con exito";
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
            BttnBuscarCodigoP.Enabled = false;
        }
        private void ActivoBotonesBM()
        {
            BttnModificar.Enabled = true;
            BttnBaja.Enabled = true;
            BttnAgregar.Enabled = false;
            BttnBuscarCodigoP.Enabled = false;
        }
        private void LimpioFormulario()
        {
            TboxImputCodigoPais.Text = "";
            TboxImputNombreP.Text = "";
            List<Ciudad> lista = new List<Ciudad>();
            DropListCiudadesDeP.DataSource = lista;
            DropListCiudadesDeP.DataBind();
            LblError.Text = "";
        }
        private void BotonesDesactivados()
        {
            BttnModificar.Enabled = false;
            BttnBaja.Enabled = false;
            BttnAgregar.Enabled = false;
        }
    }
}
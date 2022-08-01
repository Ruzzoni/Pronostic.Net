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
    public partial class ABMUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioEmp"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void BttnBuscarUsu_Click(object sender, EventArgs e)
        {
            LblError.Text = "";
            try
            {
                string usu = TboxImputUsu.Text.Trim();
                UsuarioEmp U = (UsuarioEmp)Logica.LogicaUsuarioEmp.BuscarEmp(usu);
                Session["ABMUsuario"] = U;

                if (TboxImputUsu.Text == "")
                {
                    LblError.Text = "Error debe ingresar un nombre de usuario a buscar.";
                }
                else if (U == null)
                {
                    Session["ABMUsuario"] = null;
                    this.LimpioFormulario();
                    LblError.Text = "no existe este usuario";
                }
                else
                {
                    Session["ABMUsuario"] = U;
                    TboxImputUsu.Text = U.NombreUsuario.ToString();
                    TboxImputNombreComp.Text = U.NombreCompleto.ToString();
                    TboxImputContra.Text = U.Contra.ToString();
                    this.ActivoBotonesB();
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
                if (TboxImputUsu.Text == "")
                {
                    LblError.Text = "Debe primero buscar un codigo para despues agregarlo.";
                }
                else
                {
                    UsuarioEmp unE = new UsuarioEmp(TboxImputUsu.Text.Trim(), TboxImputContra.Text.Trim(), TboxImputNombreComp.Text.Trim());
                    Logica.LogicaUsuarioEmp.AltaEmp(unE);
                    this.LimpioFormulario();
                    LblError.Text = "Usuario agregado exitosamente.";
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
                if (TboxImputUsu.Text == "")
                {
                    LblError.Text = "Debe primero buscar un codigo para despues agregarlo.";
                }
                else
                {
                    UsuarioEmp unE = new UsuarioEmp(TboxImputUsu.Text.Trim(), TboxImputContra.Text.Trim(), TboxImputNombreComp.Text.Trim());
                    Logica.LogicaUsuarioEmp.BajaEmp(unE);
                    this.LimpioFormulario();
                    LblError.Text = "Usuario eliminado exitosamente.";
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
                if (TboxImputUsu.Text == "")
                {
                    LblError.Text = "Debe primero buscar un codigo para despues agregarlo.";
                }
                else
                {
                    UsuarioEmp unE = new UsuarioEmp(TboxImputUsu.Text.Trim(), TboxImputContra.Text.Trim(), TboxImputNombreComp.Text.Trim());
                    Logica.LogicaUsuarioEmp.ModificarEmp(unE);
                    this.LimpioFormulario();
                    LblError.Text = "Usuario modificado exitosamente.";
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
            BttnBuscarUsu.Enabled = false;
        }
        private void ActivoBotonesB()
        {
            BttnBaja.Enabled = true;
            BttnAgregar.Enabled = false;
            BttnBuscarUsu.Enabled = false;
        }
        private void ActivoBotonesM()
        {
            BttnModificar.Enabled = true;
        }
        private void LimpioFormulario()
        {
            TboxImputUsu.Text = "";
            TboxImputNombreComp.Text = "";
            TboxImputContra.Text = "";
            LblError.Text = "";
        }
    }
}
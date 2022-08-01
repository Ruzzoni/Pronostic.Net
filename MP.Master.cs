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
    public partial class MP : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            try
            {
                if (Session["UsuarioEmp"] is EntidadesCompartidas.UsuarioEmp)
                {
                    UsuarioEmp emp = (UsuarioEmp)Session["UsuarioEmp"];
                    txtUserLogin.Text = emp.NombreCompleto;
                    ABMpais.Enabled = true;
                    ABMciudad.Enabled = true;
                    ABMusuarios.Enabled = true;
                    RegistPronostic.Enabled = true;
                    ListProXCiudad.Enabled = true;
                    ListProXDia.Enabled = true;
                }
                else
                {
                    txtUserLogin.Visible = false;
                    ABMpais.Enabled = false;
                    ABMciudad.Enabled = false;
                    ABMusuarios.Enabled = false;
                    RegistPronostic.Enabled = false;
                    ListProXCiudad.Enabled = false;
                    ListProXDia.Enabled = false;
                }
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["UsuarioEmp"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}
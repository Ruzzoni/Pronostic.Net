using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using EntidadesCompartidas;

namespace PronosticWeb
{
    public partial class Logueo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUser.Text == null)
                LblError.Text = "Error debe ingresar un nombre de usuario";

            if (txtContra.Text == null)
                LblError.Text = "Error debe ingresar una password";

            try
            {
                EntidadesCompartidas.UsuarioEmp unUsu = LogicaUsuarioEmp.Logeo(txtUser.Text, txtContra.Text);
                if (unUsu != null)
                {
                    Session["UsuarioEmp"] = unUsu;
                    Response.Redirect("WelcomePage.aspx");
                }
                else
                    LblError.Text = "Nombre de usuario o contraseña incorrectos.";
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message;
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class UsuarioEmp
    {
        private string nombreUsu;
        private string contra;
        private string nombreCompleto;


        public string NombreUsuario
        {
            get { return nombreUsu; }
            set { nombreUsu = value; }
        }

        public string Contra
        {
            get { return contra; }
            set { contra = value; }
        }

        public string NombreCompleto
        {
            get { return nombreCompleto; }
            set { nombreCompleto = value; }
        }

        public UsuarioEmp(string pNombreUsu, string pContra, string pNombreCompleto)
        {
            NombreUsuario = pNombreUsu;
            Contra = pContra;
            NombreCompleto = pNombreCompleto;
        }
    }
}

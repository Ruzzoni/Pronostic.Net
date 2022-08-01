using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Ciudad
    {
        private string codigoC;
        private string nombreC;

        public string CodigoC
        {
            get { return codigoC; }
            set { codigoC = value; }
        }

        public string NombreC
        {
            get { return nombreC; }
            set { nombreC = value; }
        }

        public Ciudad(string pCodigoC, string pNombreC) 
        {
            CodigoC = pCodigoC;
            NombreC = pNombreC;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Pais
    {
        private string codigo;
        private string nombre;
        private List<Ciudad> ciudades; 

        public string Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public List<Ciudad> Ciudades 
        {
            get { return ciudades; }
            set { ciudades = value; }
        }

        public Pais(string pCodigo, string pNombre, List<Ciudad> pCiudades)
        { 
            Codigo = pCodigo;
            Nombre = pNombre;
            Ciudades = pCiudades;
        }

    }
}

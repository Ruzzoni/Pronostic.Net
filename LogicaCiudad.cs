using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using EntidadesCompartidas;

namespace Logica
{
    public class LogicaCiudad
    {
        public static Ciudad BuscarCiudad(string codigoC) 
        {
            return PersistenciaCiudad.BuscarCiudad(codigoC);
        }

        public static void AgregaCiudad(Ciudad C, string pais) 
        {
            PersistenciaCiudad.AgregarCiudad(C, pais);
        }

        public static void BajaCiudad(Ciudad C) 
        {
            PersistenciaCiudad.EliminarCiudad(C);
        }

        public static void ModificaCiudad(Ciudad C)
        {
            PersistenciaCiudad.ModificarCiudad(C);
        }

        public static List<Ciudad> ListarTodasLasCiudades()
        { 
            return PersistenciaCiudad.ListarTodasCiudades();
        }

        public static List<Ciudad> ListCiudad(string codigoP)
        {
            return PersistenciaCiudad.ListarCiudadesDelPais(codigoP);
        }

        public static List<Pais> ListPaisDeCiudad(string codigoC)
        {
            return PersistenciaPais.ListarPaisesDeCiudad(codigoC);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using EntidadesCompartidas;

namespace Logica
{
    public class LogicaPais
    {
        public static Pais BuscarPais(string codigoP)
    {
            return PersistenciaPais.BuscarPais(codigoP);
    }

        public static void AgregarPais(Pais P)
        {
            if (P is Pais)
            {
                PersistenciaPais.AgregoPais(P);
            }
            else if( P == null )
            {
                throw new Exception("Error no hay Pais que agregar");
            }
        }

        public static void BajarPais(Pais P)
        {
            PersistenciaPais.BajaPais(P);
        }

        public static void ModificaPais(Pais P)
        {
            PersistenciaPais.ModificarPais(P);
        }

        public static List<Pais> ListPaises()
        {
            return PersistenciaPais.ListarPaises();
        }

    }
}

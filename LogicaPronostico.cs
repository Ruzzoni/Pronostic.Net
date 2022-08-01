using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaPronostico
    {
        public static List<Pronostico> ListarPronosticosHoy()
        {
            return PersistenciaDePronosticos.ListPronosticos();
        }

        public static void AgregarPronostico(Pronostico P)
        {
            PersistenciaDePronosticos.Agregar(P);
        }

        public static List<Pronostico> ListaPronosticParaLaFecha(DateTime Fecha)
        {
            return PersistenciaDePronosticos.ListaConFecha(Fecha);
        }

        public static List<Pronostico> ListPronosticDeCiudad(Ciudad C)
        {
            return PersistenciaDePronosticos.ListaPronosticosDeCiudad(C);
        }
    }
}

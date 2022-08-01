using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaUsuarioEmp
    {
        public static UsuarioEmp BuscarEmp(string emp)
        {
            return PersistenciaUsuarioEmp.BuscarEmp(emp);
        }

        public static void AltaEmp(UsuarioEmp emp)
        {
            PersistenciaUsuarioEmp.AgregarEmp(emp);
        }

        public static void BajaEmp(UsuarioEmp emp)
        {
            PersistenciaUsuarioEmp.BajaEmp(emp);
        }

        public static void ModificarEmp(UsuarioEmp emp)
        {
            PersistenciaUsuarioEmp.ModificarEmp(emp);
        }

        public static UsuarioEmp Logeo(string login, string contra) 
        {
            UsuarioEmp emp = PersistenciaUsuarioEmp.Login(login, contra);
            return emp;
        }
    }
}

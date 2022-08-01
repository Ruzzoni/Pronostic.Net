using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaDePronosticos
    {
        public static List<Pronostico> ListPronosticos()
        {
            List<Pronostico> listPronostic = new List<Pronostico>(); ;
            SqlDataReader _Reader;

            SqlConnection _Conexion = new SqlConnection(Conexion.Cnn);
            SqlCommand _Comando = new SqlCommand("ListPronosticosDeHoy", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;
            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Pronostico P = new Pronostico(Convert.ToInt32(_Reader["Codigo"].ToString()),
                            Convert.ToDateTime(_Reader["FechaYHora"].ToString()),
                            Convert.ToInt32(_Reader["TemperaturaMAX"].ToString()),
                            Convert.ToInt32(_Reader["TemperaturaMIN"].ToString()),
                            Convert.ToInt32(_Reader["VelocidadViento"].ToString()),
                            _Reader["TipoDeCielo"].ToString(),
                            Convert.ToBoolean(_Reader["ProbLluviasYTormentas"].ToString()),
                            PersistenciaUsuarioEmp.BuscarEmp(_Reader["Usuario"].ToString()),
                            PersistenciaCiudad.BuscarCiudad(_Reader["CodigoCiudad"].ToString()));
                        listPronostic.Add(P);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return listPronostic;
        }

        public static List<Pronostico> ListaPronosticosDeCiudad(Ciudad C)
        {
            List<Pronostico> listPronostic = new List<Pronostico>(); ;
            SqlDataReader _Reader;

            SqlConnection _Conexion = new SqlConnection(Conexion.Cnn);
            SqlCommand _Comando = new SqlCommand("ListPronosticosDeCiudad", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@codigoCiudad", C.CodigoC);

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Pronostico Pro = new Pronostico(Convert.ToInt32(_Reader["Codigo"].ToString()),
                            Convert.ToDateTime(_Reader["FechaYHora"].ToString()),
                            Convert.ToInt32(_Reader["TemperaturaMAX"].ToString()),
                            Convert.ToInt32(_Reader["TemperaturaMIN"].ToString()),
                            Convert.ToInt32(_Reader["VelocidadViento"].ToString()),
                            _Reader["TipoDeCielo"].ToString(),
                            Convert.ToBoolean(_Reader["ProbLluviasYTormentas"].ToString()),
                            PersistenciaUsuarioEmp.BuscarEmp(_Reader["Usuario"].ToString()),
                            PersistenciaCiudad.BuscarCiudad(_Reader["CodigoCiudad"].ToString()));
                        listPronostic.Add(Pro);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return listPronostic;
        }

        public static List<Pronostico> ListaConFecha(DateTime Fecha)
        {
            List<Pronostico> listPronostic = new List<Pronostico>(); ;
            SqlDataReader _Reader;

            SqlConnection _Conexion = new SqlConnection(Conexion.Cnn);
            SqlCommand _Comando = new SqlCommand("PronosticoParaLaFecha", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@fecha", Fecha);

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Pronostico Pro = new Pronostico(Convert.ToInt32(_Reader["Codigo"].ToString()),
                            Convert.ToDateTime(_Reader["FechaYHora"].ToString()),
                            Convert.ToInt32(_Reader["TemperaturaMAX"].ToString()),
                            Convert.ToInt32(_Reader["TemperaturaMIN"].ToString()),
                            Convert.ToInt32(_Reader["VelocidadViento"].ToString()),
                            _Reader["TipoDeCielo"].ToString(),
                            Convert.ToBoolean(_Reader["ProbLluviasYTormentas"].ToString()),
                            PersistenciaUsuarioEmp.BuscarEmp(_Reader["Usuario"].ToString()),
                            PersistenciaCiudad.BuscarCiudad(_Reader["CodigoCiudad"].ToString()));
                        listPronostic.Add(Pro);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return listPronostic;
        }

        public static void Agregar(Pronostico p) 
        {
            SqlConnection _Conexion = new SqlConnection(Conexion.Cnn);
            SqlCommand _Comando = new SqlCommand("AgregarPronostico", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@Ciudad", p.C.CodigoC);
            _Comando.Parameters.AddWithValue("@Usuario", p.Emp.NombreUsuario);
            _Comando.Parameters.AddWithValue("@FechaYHora", p.FechaYHora);
            _Comando.Parameters.AddWithValue("@TemperaturaMAX", p.TempMax);
            _Comando.Parameters.AddWithValue("@TemperaturaMIN", p.TempMin);
            _Comando.Parameters.AddWithValue("@VelocidadViento", p.VelocidadViento);
            _Comando.Parameters.AddWithValue("@TipoDeCielo", p.TipoCielo);
            _Comando.Parameters.AddWithValue("@ProbLluviasYTormentas", p.ProbLLuviaYTormenta);


            SqlParameter _Retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _Retorno.Direction = ParameterDirection.ReturnValue;
            _Comando.Parameters.Add(_Retorno);

            try
            {
                _Conexion.Open();
                _Comando.ExecuteNonQuery();

                int oAfectados = (int)_Comando.Parameters["@Retorno"].Value;

                if (oAfectados == -1)
                    throw new Exception("Error, No se puede agregar un pronostico ya existente.");
                else if (oAfectados == -2)
                    throw new Exception("Error, No se realizao la transaccion.");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _Conexion.Close();
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Pronostico
    {
        private int codigo;
        private DateTime fechaYHora;
        private int tempMax;
        private int tempMin;
        private int velocidadViento;
        private string tipoCielo;
        private bool probLLuviaYTormenta;
        UsuarioEmp emp;
        Ciudad c;


        public int Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }
        public DateTime FechaYHora
        {
            get { return fechaYHora; }
            set { fechaYHora = value; }
        }
        public int TempMax
        {
            get { return tempMax; }
            set { tempMax = value; }
        }
        public int TempMin
        {
            get { return tempMin; }
            set { tempMin = value; }
        }
        public int VelocidadViento
        {
            get { return velocidadViento; }
            set { velocidadViento = value; }
        }
        public string TipoCielo
        {
            get { return tipoCielo; }
            set { tipoCielo = value; }
        }
        public bool ProbLLuviaYTormenta
        {
            get { return probLLuviaYTormenta; }
            set { probLLuviaYTormenta = value; }
        }
        public UsuarioEmp Emp
        {
            set
            {
                if (value == null)
                    throw new Exception("No hay empleado asosiado al Pronostico.");
                else
                    emp = value;
            }
            get { return emp; }
        }
        public Ciudad C
        {
            set
            {
                if (value == null)
                    throw new Exception("No hay Ciudad asosiado al Pronostico.");
                else
                    c = value;
            }
            get { return c; }
        }

        public Pronostico(int pCodigo, DateTime pFechaYHora, int pTempMax, int pTempMin, int pVelocidadViento, string pTipoCielo, bool pProbLLuviaYTormenta, UsuarioEmp pEmp, Ciudad pCiudad)
        {
            Codigo = pCodigo;
            FechaYHora = pFechaYHora;
            TempMax = pTempMax;
            TempMin = pTempMin;
            VelocidadViento = pVelocidadViento;
            TipoCielo = pTipoCielo;
            ProbLLuviaYTormenta = pProbLLuviaYTormenta;
            Emp = pEmp;
            C = pCiudad;
        }
    }
}

using CDAGW.fuente.conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CDAGW.fuente.modelos
{
    public class puestoModelo
    {


        public DataSet tblPuesto()
        {
            DataSet ds = new DataSet();

            using (SqlConnection oConexion = new SqlConnection(Conexion.conexionBD))
            {
                oConexion.Open();
                SqlCommand cmd = new SqlCommand("sp_puestos", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@i_operacion", 4);
                SqlDataAdapter DA = new SqlDataAdapter();

             

              

                try
                {

                    DA.SelectCommand = cmd;
                    DA.Fill(ds);

                    oConexion.Close();
                    return ds;


                }
                catch (Exception ex)
                {
                    return ds;
                }
                finally
                {
                    oConexion.Close();
                }

            }
        }
    }
}
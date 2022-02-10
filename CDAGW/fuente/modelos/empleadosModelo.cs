using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CDAGW.fuente.conexion;
using CDAGW.fuente.data;



namespace CDAGW.fuente.modelos
{
    public class empleadosModelo
    {

        public  bool addPersonas(empleadoData empleadodata)

        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.conexionBD))
            {
                SqlCommand cmd = new SqlCommand("sp_empleados", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@i_operacion", 1);

                cmd.Parameters.AddWithValue("@i_nombre", empleadodata.nombre);
                cmd.Parameters.AddWithValue("@i_apellido", empleadodata.apellido);
                cmd.Parameters.AddWithValue("@i_direccion", empleadodata.direccion);
                cmd.Parameters.AddWithValue("@i_dpi", empleadodata.dpi);
                cmd.Parameters.AddWithValue("@i_fechaNac", empleadodata.fechaNac);
                cmd.Parameters.AddWithValue("@i_idPuesto", empleadodata.idPuesto);


                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }
                finally { oConexion.Close(); }

            }

        }

        public bool deletePersonas(empleadoData empleadodata)

        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.conexionBD))
            {
                SqlCommand cmd = new SqlCommand("sp_empleados", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@i_operacion", 3);

                cmd.Parameters.AddWithValue("@i_id", empleadodata.id);
                


                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }
                finally { oConexion.Close(); }

            }

        }

        public bool updatePersonas(empleadoData empleadodata)

        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.conexionBD))
            {
                SqlCommand cmd = new SqlCommand("sp_empleados", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@i_operacion", 2);
                cmd.Parameters.AddWithValue("@i_id", empleadodata.id);
                cmd.Parameters.AddWithValue("@i_nombre", empleadodata.nombre);
                cmd.Parameters.AddWithValue("@i_apellido", empleadodata.apellido);
                cmd.Parameters.AddWithValue("@i_direccion", empleadodata.direccion);
                cmd.Parameters.AddWithValue("@i_dpi", empleadodata.dpi);
                cmd.Parameters.AddWithValue("@i_fechaNac", empleadodata.fechaNac);
                cmd.Parameters.AddWithValue("@i_idPuesto", empleadodata.idPuesto);




                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }
                finally { oConexion.Close(); }

            }

        }


        public  List<empleadoData> listarPersonas()
        {
            List<empleadoData> oListaDatos = new List<empleadoData>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.conexionBD))
            {
                SqlCommand cmd = new SqlCommand("sp_empleados", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@i_operacion", 1);
                cmd.Parameters.AddWithValue("@i_estado", 1);




                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            oListaDatos.Add(new empleadoData()
                            {
                                id = Convert.ToInt32(dr["01"]),
                                nombre = dr["02"].ToString(),
                                apellido = dr["03"].ToString(),
                                direccion = dr["04"].ToString(),
                                telefono = dr["05"].ToString(),
                                dpi = dr["06"].ToString(),
                                puestos = dr["07"].ToString(),


                            });
                        }
                        return oListaDatos;
                    }


                }
                catch (Exception ex)
                {
                    return oListaDatos;
                }
                finally
                {
                    oConexion.Close();
                }

            }
        }


        public DataSet tblEmpleados()
        {
            DataSet ds = new DataSet();
          
            using (SqlConnection oConexion = new SqlConnection(Conexion.conexionBD))
            {
                oConexion.Open();
                SqlCommand cmd = new SqlCommand("sp_empleados", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@i_operacion", 4);
                cmd.Parameters.AddWithValue("@i_estado", 1);
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
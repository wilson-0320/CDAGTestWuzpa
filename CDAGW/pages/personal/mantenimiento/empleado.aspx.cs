using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDAGW.pages.personal.mantenimiento
{
    public partial class empleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            tblLlenadoEmpleado();
            listLlneadoPuesto();
        }

        private void tblLlenadoEmpleado()
        {
            CDAGW.fuente.modelos.empleadosModelo clsModEmpleado = new CDAGW.fuente.modelos.empleadosModelo();
            try
            {
                 tblEmpleados.DataSource = clsModEmpleado.tblEmpleados();
                 tblEmpleados.DataBind();
            }
            catch (Exception ex)
            {
                ///tbDireccion.Text = ex + "";
            }

        }

        private void listLlneadoPuesto()
        {
            CDAGW.fuente.modelos.puestoModelo clsModPuesto = new CDAGW.fuente.modelos.puestoModelo();
            try
            {
                listp.DataSource = clsModPuesto.tblPuesto();
                listp.DataBind();
            }
            catch (Exception ex)
            {
                ///tbDireccion.Text = ex + "";
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            fuente.data.empleadoData clsDataEmpleado = new fuente.data.empleadoData();
            clsDataEmpleado.apellido = tbApellido.Text;
            clsDataEmpleado.nombre = tbNombre.Text;
            clsDataEmpleado.direccion = tbDireccion.Text;
            clsDataEmpleado.dpi = tbDpi.Text;
            clsDataEmpleado.telefono = tbTelefono.Text;
            clsDataEmpleado.fechaNac = (tbFechaNac.Text);
            clsDataEmpleado.idPuesto = 1;
            CDAGW.fuente.modelos.empleadosModelo clsModEmpleado = new CDAGW.fuente.modelos.empleadosModelo();

            clsModEmpleado.updatePersonas(clsDataEmpleado);

            // clsDataEmpleado.idPuesto = Int32.Parse(listPuesto.Text);


        }

       

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            fuente.data.empleadoData clsDataEmpleado = new fuente.data.empleadoData();
            clsDataEmpleado.id = Int32.Parse(TextBox1.Text);
            CDAGW.fuente.modelos.empleadosModelo clsModEmpleado = new CDAGW.fuente.modelos.empleadosModelo();

            clsModEmpleado.deletePersonas(clsDataEmpleado);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            fuente.data.empleadoData clsDataEmpleado = new fuente.data.empleadoData();
            clsDataEmpleado.apellido = tbApellido.Text;
            clsDataEmpleado.nombre = tbNombre.Text;
            clsDataEmpleado.direccion = tbDireccion.Text;
            clsDataEmpleado.dpi = tbDpi.Text;
            clsDataEmpleado.telefono = tbTelefono.Text;
            clsDataEmpleado.fechaNac = (tbFechaNac.Text);
            clsDataEmpleado.idPuesto = 1;
            clsDataEmpleado.id = Int32.Parse(TextBox1.Text);
            CDAGW.fuente.modelos.empleadosModelo clsModEmpleado = new CDAGW.fuente.modelos.empleadosModelo();

            clsModEmpleado.addPersonas(clsDataEmpleado);
        }
    }
}
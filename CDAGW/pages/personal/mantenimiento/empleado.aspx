<%@ Page Title="" Language="C#" MasterPageFile="~/Comunes/Site.Master" AutoEventWireup="true" CodeBehind="empleado.aspx.cs" Inherits="CDAGW.pages.personal.mantenimiento.empleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-dark">
                </div>
                <div class="card-body">
                    <div class="basic-form">
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-user"></i></span>
                                    </div>

                                     <asp:TextBox ID="tbNombre" runat="server" MaxLength="50" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-user"></i></span>
                                    </div>

                                    <asp:TextBox ID="tbApellido" runat="server" MaxLength="50" CssClass="form-control" Placeholder="Apellido" ></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-address-book"></i></span>
                                    </div>

                                    <asp:TextBox ID="tbDireccion" runat="server" MaxLength="100" CssClass="form-control" placeholder="Dirección"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-phone"></i></span>
                                    </div>

                                   <asp:TextBox ID="tbTelefono" runat="server" TextMode="Phone" MaxLength="8" CssClass="form-control" placeholder="Telefono"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-id-card"></i></span>
                                    </div>

                                   <asp:TextBox ID="tbDpi" runat="server" MaxLength="13" CssClass="form-control" placeholder="Dpi"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-birthday-cake"></i></span>
                                    </div>

                                     <asp:TextBox ID="tbFechaNac" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-sort"></i></span>
                                    </div>
                                   
                                    
                                    <select class="js-example-theme-single" id="listaPuesto">
                                    <asp:Repeater ID="listp" runat="server">
                                        <ItemTemplate>
                                        <option value="<%# Eval("ID")%>"><%# Eval("Puesto")%></option>
                                            </ItemTemplate>
                                    </asp:Repeater>
                                    </select>

                                </div>
                            </div>
                        

                        </div>


                        <div class="row">
                            <div class="col-sm-3">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                 </div>
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-save"></i></span>
                                    </div>

                                    <asp:Button ID="btnSave" runat="server" Text="Guardar" CssClass="btn btn-info" OnClick="btnSave_Click" />

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-save"></i></span>
                                    </div>

                                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-info" OnClick="Button1_Click"  />

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group flex-nowrap">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="addon-wrapping001"><i class="fa fa-save"></i></span>
                                    </div>

                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-info" OnClick="btnEliminar_Click"  />

                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>



        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-dark">
                   Reporte de empleados registrados
                </div>
                <div class="card-body">
                    <div class="basic-form">
                        <div class="row">
                            <div class="col-sm-4">
                               
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table class="table table-bordered">
                                            <thead class="thead-dark">
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Direccion</th>
                                                <th>Telefono</th>
                                                <th>DPI</th>
                                                <th>Fecha de nacimiento</th>
                                            </thead>
                                            <tbody>
                                        <asp:Repeater ID="tblEmpleados" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                   
                                                     <td><%# Eval("01")  %></td>
                                                     <td><%# Eval("02")  %></td>
                                                     <td><%# Eval("03")  %></td>
                                                     <td><%# Eval("04")  %></td>
                                                     <td><%# Eval("05")  %></td>
                                                     <td><%# Eval("06")  %></td>
                                                     <td><%# Eval("07")  %></td>

                                                </tr>

                                                <div></div>
                                                
                                           
                                            </ItemTemplate>
                                            
                                        </asp:Repeater>
                                             </tbody>
                                         </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="btnEliminar" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

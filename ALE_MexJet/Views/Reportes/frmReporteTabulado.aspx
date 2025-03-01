﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmReporteTabulado.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Reportes.frmReporteTabulado" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Tabulado de Horas e Importes Anuales</span>
                    </div>
                </div>
                <div class="well-g">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset class="Personal">
                                <legend>
                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Búsqueda General</span>
                                </legend>
                                <div class="col-sm-12">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblMatricula" Text="Matricula" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxComboBox runat="server" ID="cboMatricula" NullText="Seleccione" Theme="Office2010Black"></dx:ASPxComboBox>
                                            </td>
                                            <td></td>
                                            <td style="text-align: center;" colspan="4">
                                                <dx:ASPxLabel Theme="Office2010Black" runat="server" Text="Rango de Fechas" Font-Bold="True" Font-Size="Small"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblCliente" Text="Cliente" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxComboBox runat="server" ID="cboCiente" NullText="Seleccione" Theme="Office2010Black"></dx:ASPxComboBox>
                                            </td>
                                            <td></td>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblFechaDesde" Text="Desde" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxDateEdit runat="server" ID="dtFechaDesde" NullText="Seleccione" Theme="Office2010Black">
                                                    <DropDownButton>
                                                        <Image IconID="scheduling_calendar_16x16"></Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td style="text-align: left;"></td>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblHasta" Text="Hasta" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxDateEdit runat="server" ID="dtFechaHasta" NullText="Seleccione" Theme="Office2010Black">
                                                    <DateRangeSettings StartDateEditID="dtFechaDesde"></DateRangeSettings>
                                                    <DropDownButton>
                                                        <Image IconID="scheduling_calendar_16x16"></Image>
                                                    </DropDownButton>
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblContrato" Text="Contrato" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxComboBox runat="server" ID="cboContrato" NullText="Seleccione" Theme="Office2010Black"></dx:ASPxComboBox>
                                            </td>
                                            <td colspan="6"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblGrupoModelo" Text="Grupo Modelo" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxComboBox runat="server" ID="cboGrupoModelo" NullText="Seleccione" Theme="Office2010Black"></dx:ASPxComboBox>
                                            </td>
                                            <td colspan="6"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblBase" Text="Base" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxComboBox runat="server" ID="cboBase" NullText="Seleccione" Theme="Office2010Black"></dx:ASPxComboBox>
                                            </td>
                                            <td colspan="6"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <dx:ASPxLabel runat="server" ID="lblDetalle" Text="Detalle" Theme="Office2010Black" Visible="false"></dx:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;">
                                                <dx:ASPxCheckBox runat="server" ID="chkDetalle" Theme="Office2010Black" Visible="false"></dx:ASPxCheckBox>
                                            </td>
                                            <td colspan="6"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7"></td>
                                            <td>
                                                <dx:ASPxButton runat="server" ID="btnGenerar" Text="Generar" OnClick ="btnGenerar_Click" Theme="Office2010Black"></dx:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <table style="width:100%">
                            <tr>
                                <td colspan="3" style="text-align:right">
                                    
                                    <dx:ASPxButton ID="btnExcelR2" runat="server" Text="Excel" OnClick="btnExcel_Click" Theme="Office2010Black"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        
                        <asp:UpdatePanel ID="upaReport" runat="server" OnUnload="upaReport_Unload">
                            <ContentTemplate>
                                <asp:Panel ID="pnlReporteTab" runat="server" ScrollBars="Horizontal" Visible="false" Width="100%">
                                    <table style="width:2000px" border="0">
                                        <tr>
                                            <td style="width:10%"  rowspan="3">
                                                <asp:Image ID="imgMexJet" runat="server" Width="150px" Height="80px"  ImageUrl="~/img/mexjet_p.png" />
                                            </td>
                                            <td style="width:80%; text-align:center" colspan="23">
                                                <asp:Label ID="lblAle" runat="server" Text="Aerolineas Ejecutivas S.A. de C.V." Font-Size="X-Large"></asp:Label>
                                            </td>
                                            <td style="width:10%" rowspan="3">
                                                <asp:Image ID="imgAle" runat="server" Width="150px" Height="80px"  ImageUrl="~/img/colors/blue/logo-ale.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:center" colspan="23">
                                                <asp:Label ID="lblRepo" runat="server" Text="Reporte Tabulado" Font-Size="Large"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:center" colspan="23">
                                                <asp:Label ID="lblPer" runat="server" Text="" Font-Size="Small"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>    
                                            <td></td>                                      
                                            <td style="text-align:center" colspan="23">
                                                <asp:Label ID="lblFechaRep" runat="server" Font-Size="Small"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td colspan="23"></td>
                                            <td>Matricula: <asp:Label ID="lblSeleccionMatricula" Text="Todos" runat="server" Font-Size="Small"></asp:Label> </td>                                                                                
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td colspan="23"></td>                                      
                                            <td>Cliente: <asp:Label ID="lblSeleccionCliente" Text="Todos" runat="server" Font-Size="Small"></asp:Label></td>                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td colspan="23"></td>                                                                                  
                                            <td>Contrato: <asp:Label ID="lblSeleccionContrato" Text="Todos" runat="server" Font-Size="Small"></asp:Label></td>                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td colspan="23"></td>                                                                                                                              
                                            <td>Grupo Modelo: <asp:Label ID="lblSeleccionGrupoModelo" Text="Todos" runat="server" Font-Size="Small"></asp:Label></td>                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td colspan="23"></td>                                                                                                                                                                          
                                            <td>Base: <asp:Label ID="lblSeleccionBase" Text="Todos" runat="server" Font-Size="Small"></asp:Label></td>
                                        </tr>

                                    </table>
                                    <br />
                                    <asp:GridView ID="gvTabulado" runat="server" AutoGenerateColumns="false" Width="2000px">
                                        <HeaderStyle Font-Size="X-Small" ForeColor="White" BackColor="#181A50" />
                                        <RowStyle Font-Size="XX-Small" />
                                        <Columns>
                                            <asp:BoundField DataField="IdRemision" HeaderText="No. Remisión" />
                                            <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                            <asp:BoundField DataField="ClaveContrato" HeaderText="Clave Contrato" />
                                            <asp:BoundField DataField="CodigoCliente" HeaderText="Clave Cliente" />
                                            <asp:BoundField DataField="FechaRemision" HeaderText="Fecha Remision" />
                                            <asp:BoundField DataField="Ruta" HeaderText="Ruta" />
                                            <asp:BoundField DataField="HrsVueloNal" HeaderText="Hrs Vuelo Nal" />
                                            <asp:BoundField DataField="HrsVueloInt" HeaderText="Hrs Vuelo Int" />
                                            <asp:BoundField DataField="ImpVueloNal" HeaderText="Imp Vuelo Nal" />
                                            <asp:BoundField DataField="ImpVueloInt" HeaderText="Imp Vuelo Int" />
                                            <asp:BoundField DataField="ImpEsperaNal" HeaderText="Imp Espera Nal" />
                                            <asp:BoundField DataField="ImpEsperaInt" HeaderText="Imp Espera Int" />
                                            <asp:BoundField DataField="ImpPernoctaNal" HeaderText="Imp Pernocta Nal" />
                                            <asp:BoundField DataField="ImpPernoctaInt" HeaderText="Imp Pernocta Int" />
                                            <asp:BoundField DataField="HrsEsperaNal" HeaderText="Hrs Espera Nal" />
                                            <asp:BoundField DataField="HrsEsperaInt" HeaderText="Hrs Espera Int" />
                                            <asp:BoundField DataField="PernoctasNal" HeaderText="Pernoctas Nal" />
                                            <asp:BoundField DataField="PernoctasInt" HeaderText="Pernoctas Int" />

                                            <asp:BoundField DataField="ImporteFactura" HeaderText="Importe Factura" />
                                            <asp:BoundField DataField="MonedaFactura" HeaderText="Moneda Factura" />
                                            <asp:BoundField DataField="TipoCambio" HeaderText="Tipo de Cambio" />

                                            <asp:BoundField DataField="TRIP" HeaderText="Trip" />
                                            <asp:BoundField DataField="TipoPierna" HeaderText="Tipo Pierna" />
                                            <asp:BoundField DataField="Matricula" HeaderText="Matricula" />
                                            <asp:BoundField DataField="Flota" HeaderText="Flota" />
                                            <asp:BoundField DataField="GrupoModelo" HeaderText="Grupo Modelo" />
                                            <asp:BoundField DataField="BaseCliente" HeaderText="Base Cliente" />

                                            <asp:BoundField DataField="TipoCliente" HeaderText="Tipo Cliente" />
                                            <asp:BoundField DataField="TipoPaquete" HeaderText="Tipo Paquete" />
                                            
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnExcel" />
                                <asp:PostBackTrigger ControlID="btnExcelR2" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <table style="width:100%">
                            <tr>
                                <td colspan="3" style="text-align:right">
                                    <dx:ASPxButton ID="btnExcel" runat="server" Text="Excel" OnClick="btnExcel_Click" Theme="Office2010Black"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        
                    </div>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>

</asp:Content>

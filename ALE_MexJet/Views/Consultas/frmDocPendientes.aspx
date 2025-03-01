﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmDocPendientes.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Consultas.frmDocPendientes" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Documentos Pendientes</span>
                    </div>
                </div>
                <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
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
                                            <td style="text-align: left">
                                                <dx:ASPxLabel Theme="Office2010Black" runat="server" Text="Cliente:" Font-Bold="True"></dx:ASPxLabel>
                                            </td>
                                            <td style="width: 45%;">
                                                <dx:ASPxComboBox ToolTip="Cliente" ID="ddlClientes" runat="server" Theme="Office2010Black" EnableTheming="True" NullText="Seleccione un Cliente" AutoPostBack="true" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged">
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td style="text-align: center" colspan="2">
                                                <dx:ASPxLabel Theme="Office2010Black" runat="server" Text="Rango de Fechas" Font-Bold="True" Font-Size="Small"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr style="height: 10px;">
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <dx:ASPxLabel Theme="Office2010Black" Font-Bold="True" runat="server" Text="Contrato:"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" OnUnload="UpdatePanel1_Unload">
                                                    <ContentTemplate>
                                                        <dx:ASPxComboBox ToolTip="Contrato" ID="ddlContrato" NullText="Seleccione un Contrato" runat="server" Theme="Office2010Black" EnableTheming="True">
                                                        </dx:ASPxComboBox>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlClientes" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td>
                                                <dx:ASPxDateEdit Caption="Desde:" ID="dFechaIni" ClientInstanceName="dFechaIni" NullText="Fecha Inicial" runat="server" ToolTip="Fecha Inicial" Theme="Office2010Black" >
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" SetFocusOnError="True" CausesValidation="True" >
                                                        <RegularExpression ValidationExpression =""></RegularExpression>
                                                         <RequiredField ErrorText="Fecha inicial es requerida" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td style="text-align: right">
                                                <dx:ASPxDateEdit Caption="Hasta:" ID="dFechaFin" ClientInstanceName="dFechaFin" runat="server" Theme="Office2010Black" ToolTip="Fecha Final" NullText="Fecha Final" >
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" SetFocusOnError="True" CausesValidation="True" >
                                                        <RegularExpression ValidationExpression =""></RegularExpression>
                                                         <RequiredField ErrorText="Fecha final es requerida" IsRequired="True" />       
                                                    </ValidationSettings>
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr style="height: 10px;">
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <dx:ASPxLabel Theme="Office2010Black" Font-Bold="True" runat="server" Text="Tipo Búsqueda:"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxRadioButtonList ID="rblFiltro" Theme="Office2010Black" runat="server" RepeatDirection="Horizontal">
                                                    <Items>
                                                        <dx:ListEditItem Text="Bitacoras Pendienes" Value="1" Selected="true" />
                                                        <dx:ListEditItem Text="Remsiones Pendienes" Value="2" />
                                                        <dx:ListEditItem Text="Pre-facturas Pendienes" Value="3" />
                                                    </Items>
                                                </dx:ASPxRadioButtonList>
                                            </td>
                                            <td></td>
                                            <td style="text-align: right">
                                                <dx:ASPxButton ID="btnBusqueda" Text="Buscar" runat="server" Theme="Office2010Black" OnClick="btnBusqueda_Click">
                                                </dx:ASPxButton>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <asp:UpdatePanel runat="server" ID="upGv" UpdateMode="Conditional" OnUnload="UpdatePanel1_Unload">
                                <ContentTemplate>
                                    <div>
                                        <dx:ASPxGridView ID="gvDocPend" runat="server" AutoGenerateColumns="false" Font-Size="Small" ToolTip="Resultado"
                                            ClientInstanceName="gvDocPend" EnableTheming="True" Width="100%" Styles-Header-HorizontalAlign="Center"
                                            Theme="Office2010Black" StylesPopup-EditForm-ModalBackground-Opacity="90">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Aeronave Matrícula" FieldName="AeronaveMatricula" VisibleIndex="0" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="Fecha" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center" Width="150px" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Folio Real" FieldName="FolioReal" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Cliente" FieldName="VueloClienteId" VisibleIndex="3" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Contrato" FieldName="VueloContratoId" VisibleIndex="4" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Origen" FieldName="Origen" VisibleIndex="5" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Destino" FieldName="Destino" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Salida" FieldName="OrigenVuelo" VisibleIndex="7" HeaderStyle-HorizontalAlign="Center" Width="150px" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Llegada" FieldName="DestinoVuelo" VisibleIndex="8" HeaderStyle-HorizontalAlign="Center" Width="150px" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsPager Position="TopAndBottom" Visible="true">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100" Visible="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                        </dx:ASPxGridView>

                                    </div>
                                    <div>
                                        <dx:ASPxGridView ID="gvRemisiones" runat="server" AutoGenerateColumns="false" Font-Size="Small" ToolTip="Resultado"
                                            ClientInstanceName="gvRemisiones" EnableTheming="True" Width="100%" Styles-Header-HorizontalAlign="Center"
                                            Theme="Office2010Black" StylesPopup-EditForm-ModalBackground-Opacity="90">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Matrícula" FieldName="AeronaveMatricula" VisibleIndex="0" HeaderStyle-HorizontalAlign="Center" Width="90px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="FechaRemision" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center" Width="90px" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="No <br />Remision" FieldName="IdRemision" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center" Width="80px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Cliente" FieldName="VueloClienteId" VisibleIndex="3" HeaderStyle-HorizontalAlign="Center" Width="90px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Contrato" FieldName="VueloContratoId" VisibleIndex="4" HeaderStyle-HorizontalAlign="Center" Width="90px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ruta" FieldName="Ruta" VisibleIndex="5" HeaderStyle-HorizontalAlign="Center" Width="110px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tarifa <br /> Nacional" FieldName="TarifaNacional" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center" Width="90px" PropertiesTextEdit-DisplayFormatString="N2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tarifa <br />Internacional" FieldName="TarifaInternacional" VisibleIndex="7" HeaderStyle-HorizontalAlign="Center" Width="100px" PropertiesTextEdit-DisplayFormatString="N2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Vuelo <br />Nacional" FieldName="TiempoVueloNacional" VisibleIndex="8" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Vuelo <br />Internacional" FieldName="TiempoVueloInternacional" VisibleIndex="9" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Espera <br />Nacional" FieldName="TiempoEsperaNacional" VisibleIndex="10" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Espera <br />Internacional" FieldName="TiempoEsperaInternacional" VisibleIndex="11" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pernocta <br />Nacional" FieldName="PernoctasNacional" VisibleIndex="12" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pernocta <br />Internacional" FieldName="PernoctasInternacional" VisibleIndex="13" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings  HorizontalScrollBarMode="Auto" />
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsPager Position="TopAndBottom" Visible="true"> 
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100" Visible="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                        </dx:ASPxGridView>
                                    </div>
                                    <div>
                                        <dx:ASPxGridView ID="gvPreFactura" runat="server" AutoGenerateColumns="false" Font-Size="Small" ToolTip="Resultado"
                                            ClientInstanceName="gvPreFactura" EnableTheming="True" Width="100%" Styles-Header-HorizontalAlign="Center"
                                            Theme="Office2010Black" StylesPopup-EditForm-ModalBackground-Opacity="90">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Matrícula" FieldName="Matricula" VisibleIndex="0" HeaderStyle-HorizontalAlign="Center" Width="90px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Fecha <br />Pre-factura" FieldName="FechaCreacion" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center" Width="80px" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pre-factura" FieldName="IdPrefactura" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center" Width="80px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Cliente" FieldName="CodigoCliente" VisibleIndex="3" HeaderStyle-HorizontalAlign="Center" Width="90px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Contrato" FieldName="ClaveContrato" VisibleIndex="4" HeaderStyle-HorizontalAlign="Center" Width="90px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ruta" FieldName="RUTA" VisibleIndex="5" HeaderStyle-HorizontalAlign="Center" Width="110px"  PropertiesTextEdit-MaxLength="10" PropertiesTextEdit-ValidationSettings-Display="Dynamic">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tarifa <br /> Nacional" FieldName="TarifaNacional" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center" Width="90px" PropertiesTextEdit-DisplayFormatString="G">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tarifa <br />Internacional" FieldName="TarifaInternacional" VisibleIndex="7" HeaderStyle-HorizontalAlign="Center" Width="100px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Vuelo <br />Nacional" FieldName="TiempoVueloNacional" VisibleIndex="8" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Vuelo <br />Internacional" FieldName="TiempoVueloInternacional" VisibleIndex="9" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Espera <br />Nacional" FieldName="TiempoEsperaNacional" VisibleIndex="10" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiempo Espera <br />Internacional" FieldName="TiempoEsperaInternacional" VisibleIndex="11" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pernocta <br />Nacional" FieldName="PernoctasNacional" VisibleIndex="12" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pernocta <br />Internacional" FieldName="PernoctasInternacional" VisibleIndex="13" HeaderStyle-HorizontalAlign="Center" Width="120px">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings HorizontalScrollBarMode="Auto" />
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsPager Position="TopAndBottom" Visible="true">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100" Visible="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                        </dx:ASPxGridView>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnBusqueda" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <div style="text-align: right">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional" OnUnload="UpdatePanel1_Unload">
                                    <ContentTemplate>
                                        <dx:ASPxLabel runat="server" Font-Bold="True" Theme="Office2010Black" Text="Exportar a: "></dx:ASPxLabel>
                                        &nbsp;<dx:ASPxButton ID="btnExcel" Theme="Office2010Black" ToolTip="Exportar" runat="server" Text="Excel" OnClick="btnExcel_Click"></dx:ASPxButton>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnExcel" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                <asp:UpdatePanel runat="server" ID="UpdatePanel3" OnUnload="UpdatePanel1_Unload">
                    <ContentTemplate>
                        <dx:ASPxHiddenField ID="hfFiltro" runat="server" />
                        <dx:ASPxHiddenField ID="hfCliente" runat="server" />
                        <dx:ASPxHiddenField ID="hfContrato" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
</asp:Content>

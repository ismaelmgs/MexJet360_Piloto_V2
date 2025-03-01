﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmContrato.aspx.cs" Inherits="ALE_MexJet.Views.CreditoCobranza.frmContrato" UICulture="es" Culture="es-MX" %>

<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var lastCountry = null;
        function OnCountryChanged(cmbCountry) {
            debugger;
            if (gvTramoPactado.GetEditor("Destino").InCallback())
                lastCountry = cmbCountry.GetValue().toString();
            else
                gvTramoPactado.GetEditor("Destino").PerformCallback(cmbCountry.GetValue().toString());
            hdnOrigen.Set("Name", cmbCountry.GetValue().toString());
        }

        function OnEndCallback(s, e) {
            if (lastCountry) {
                gvTramoPactado.GetEditor("Destino").PerformCallback(lastCountry);
                lastCountry = null;
            }
        }

        function OnInit(s, e) {
            var errorTextElement = document.getElementById("myDiv").getElementsByClassName("dxeOutOfRWarn")[0];
            errorTextElement.innerText = "Period should be between " + se1.GetMinValue() + " and " + se1.GetMaxValue();
        }

        function OnMarcaChanged(cmbCountry) {
            debugger;
            if (gvRangosCombustible.GetEditor("IdModelo").InCallback())
                lastCountry = cmbCountry.GetValue().toString();
            else
                gvRangosCombustible.GetEditor("IdModelo").PerformCallback(cmbCountry.GetValue().toString());
        }

        function OnEndCallback(s, e) {
            if (lastCountry) {
                debugger;
                gvRangosCombustible.GetEditor("IdModelo").PerformCallback(lastCountry);
                lastCountry = null;
            }
        }
    </script>
    <%--<link href="../../css/disabled-styles.css" rel="stylesheet" />--%>
    <style type="text/css">
        /* Estilos para hacer mas legibles los campos deshabilitados */
        .dxeEditArea_Office2010Black.dxeDisabled_Office2010Black, .dxeEditArea_Office2010Black.dxeDisabled_Office2010Black td.exe,
        .dxeDisabled_Office2010Black, .dxeDisabled_Office2010Black td.exe,
        .dxeDisabled_Office2003Blue, .dxeDisabled_Office2003Blue td.dxe,
        .dxeEditArea.dxeDisabled, .dxeEditArea.dxeDisabled td.exe,
        .dxeDisabled .dxeMemoEditArea, .dxeDisabled .dxeMemoEditArea td.exe,
        .dxeTextBox, .dxeTextBox td.exe {
            background-color: #EEEEEE;
            color: black;
            opacity: 0.8;
        }

        .dxeMemo_Office2003Blue, .dxeMemo_Office2003Blue td.exe {
            border: 1px solid #6a6a6a;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row header1">
        <div class="col-md-12">
            <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Contrato</span>
        </div>
    </div>
    <br />
    <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
    <dx:ASPxPageControl ID="ASPxPageControl1" Theme="Office2010Black" runat="server" Width="100%" Height="350px"
        TabAlign="Justify" ActiveTabIndex="0" EnableTabScrolling="true" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
        <TabStyle Paddings-PaddingLeft="50px" Paddings-PaddingRight="50px" />
        <ContentStyle>
            <Paddings PaddingLeft="40px" />
        </ContentStyle>
        <TabPages>
            <dx:TabPage Text="1 Datos Generales" Enabled="true">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                        <dx:ASPxPanel ID="pnlDatosGenerales" Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1" id="field1" runat="server">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Nombre/Razón Social Cliente</span>
                                                </legend>
                                                <asp:Panel id="myPanel" runat="server" CssClass="col-sm-12">
                                                    <table width="100%" border="0">
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesCliente" Theme="Office2010Black" runat="server" Text="Cliente:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxComboBox runat="server" ID="cboGeneralesClientes" AutoPostBack="true" OnSelectedIndexChanged="cboGeneralesClientes_SelectedIndexChanged" Theme="Office2010Black" NullText="Seleccionar">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 10px;"></td>

                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesDescRazonSocial" runat="server" Text="Nombre/Razón Social:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxLabel ID="lblGeneralesRazonSocial" runat="server" Width="50%"></dx:ASPxLabel>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesContrato" Theme="Office2010Black" runat="server" Text="Contrato:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtGeneralesContrato" runat="server" Theme="Office2010Black" MaxLength="5" ValidationSettings-SetFocusOnError="True" ValidationSettings-ValidateOnLeave="True">
                                                                    <ValidationSettings RequiredField-IsRequired="true" RegularExpression-ValidationExpression="^[a-zA-Z0-9ñÑáÁéÉíÍóÓúÚ]+$" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                                        RegularExpression-ErrorText="Error en la información ingresada" RequiredField-ErrorText="El campo es requerido">
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 10px;"></td>

                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesFechaContrato" runat="server" Theme="Office2010Black" Text="Fecha Contrato:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxDateEdit ID="DtGeneralesFechaContrato" runat="server" Theme="Office2010Black" UseMaskBehavior="true" TimeSectionProperties-Visible="false">
                                                                    <DropDownButton>
                                                                        <Image IconID="scheduling_calendar_16x16"></Image>
                                                                    </DropDownButton>
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesVendedor" Theme="Office2010Black" runat="server" Text="Vendedor:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxComboBox ID="cboGeneralesVendedor" Theme="Office2010Black" NullText="Seleccionar" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 10px;"></td>

                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesFechaInicioVuelo" runat="server" Theme="Office2010Black" Text="Fecha Inicio Vuelo:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxDateEdit ID="dtGeneralesFechaInicioVuelo" runat="server" Theme="Office2010Black" UseMaskBehavior="true" TimeSectionProperties-Visible="false">
                                                                    <DropDownButton>
                                                                        <Image IconID="scheduling_calendar_16x16"></Image>
                                                                    </DropDownButton>
                                                                </dx:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesEjecutivo" Theme="Office2010Black" runat="server" Text="Ejecutivo:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="padding-top: 5px;">
                                                                <dx:ASPxComboBox ID="cboGeneralesEjcutivo" NullText="Seleccionar" runat="server" Theme="Office2010Black">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 10px;"></td>

                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesGrupoModelo" runat="server" Theme="Office2010Black" Text="Grupo de Modelo Contratado:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <br />
                                                                <dx:ASPxComboBox ID="cboGeneralesModelo" Theme="Office2010Black" NullText="Seleccionar" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesPaquete" Theme="Office2010Black" runat="server" Text="Paquete Contratado:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <dx:ASPxComboBox ID="cboGeneralesPaquete" NullText="Seleccionar" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 10px;"></td>

                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesMesesGracia" Theme="Office2010Black" runat="server" Text="Meses de Gracia:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxSpinEdit runat="server" Theme="Office2010Black" AllowUserInput="false" ID="spinGeneralesMesesGracia" ShowOutOfRangeWarning="false" MinValue="0" MaxValue="9999" AllowNull="false">
                                                                </dx:ASPxSpinEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesAñoContratado" Theme="Office2010Black" runat="server" Text="Año Contratados:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="padding-top: 8px;">
                                                                <dx:ASPxSpinEdit ID="spinGeneralesAñosContrato" AllowUserInput="false" Theme="Office2010Black" runat="server" MaxValue="12" MinValue="1" AllowNull="false">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxSpinEdit>
                                                            </td>
                                                            <td style="width: 10px;"></td>

                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesHorasContratasAño" Theme="Office2010Black" runat="server" Text="Horas contratadas Año:*">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <br />
                                                                <dx:ASPxTextBox ID="txtGeneralesHorasContratadasAño" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]*" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesHorasContratadastot" runat="server" Theme="Office2010Black" Text="Horas contratadas total:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <dx:ASPxTextBox ID="txtGeneralesHorasContratadasTot" Theme="Office2010Black" OnValueChanged="txtGeneralesHorasContratadasTot_ValueChanged" AutoPostBack="true" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]*" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 10px;"></td>

                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesMatricula" Theme="Office2010Black" runat="server" Text="Matrícula:"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left;" valign="middle">
                                                                <dx:ASPxTextBox ID="txtGeneralesMatricula" Theme="Office2010Black" runat="server" MaxLength="10">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="False" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesHorasAcumulables" Theme="Office2010Black" runat="server" Text="% de Horas no usadas acumulables:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="padding-top: 8px;">
                                                                <dx:ASPxTextBox ID="txtGeneralesHorasAcumulables" Theme="Office2010Black" runat="server" MaxLength="6">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 10px;"></td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="ASPxLabel10" Theme="Office2010Black" runat="server" Text="Estatus:"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxComboBox runat="server" ID="cboGeneralesEstatusCliente" Theme="Office2010Black"></dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" OnUnload="UpdatePanel1_Unload">
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <dx:ASPxUploadControl ID="upContrato" runat="server" NullText="Solo PDF"
                                                                            OnFileUploadComplete="upContrato_FileUploadComplete" UploadMode="Auto" AutoStartUpload="true"
                                                                            ShowProgressPanel="true">
                                                                            <ValidationSettings MaxFileSize="10194304" AllowedFileExtensions=".pdf" />
                                                                            <BrowseButton Text="Seleccione un Contrato" />
                                                                            <UploadButton Text="Cargar Documento Seleccionado"></UploadButton>
                                                                            <ClientSideEvents FileUploadComplete="function(s,e) {                                                                                                                                                                                                                                             
                                                                                                        lblMensajeFile.SetText('El archivo se adjunto correctamente');
                                                                                                }" />
                                                                        </dx:ASPxUploadControl>
                                                                    </ContentTemplate>

                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="lkbtnDownloadPDF" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td style="text-align: left; font-size: small;">
                                                                <asp:LinkButton Text="" ID="lkbtnDownloadPDF" OnClick="lkbtnDownloadPDF_Click" runat="server" AutoPostBack="true" ToolTip="Click aqui para descargar" HorizontalAlign="Center">
                                                                </asp:LinkButton>
                                                            </td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left; color: green;">
                                                                <dx:ASPxLabel ID="lblMensajeFile" ClientInstanceName="lblMensajeFile" runat="server" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td colspan="4"></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Membresía y Anualidad </span>
                                                </legend>
                                                <asp:Panel id="PanelMembresiaAnualidad" runat="server" CssClass="col-sm-12">
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width: 25%"></td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel runat="server" ID="lblGeneralesMonedaPagoMembresia" Theme="Office2010Black" Text="Moneda de pago:*"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxComboBox runat="server" ID="cboGeneralesMonedaPago" Theme="Office2010Black" NullText="Seleccione">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Pesos" Value="1" />
                                                                        <dx:ListEditItem Text="Dólares" Value="2" />
                                                                    </Items>
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 25%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%"></td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesAnticipio" runat="server" Theme="Office2010Black" Text="Anticipo Inicial:*">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtGeneralesAnticipo" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 25%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%"></td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesFijoAnual" Theme="Office2010Black" runat="server" Text="Fijo Anual:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtGeneralesFijoAnual" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 25%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%"></td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesRenovacion" Theme="Office2010Black" runat="server" Text="Renovación:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtGeneralesRenovacion" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 25%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%"></td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesPrenda" runat="server" Theme="Office2010Black" Text="Prenda:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtGeneralesPrenda" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 25%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%"></td>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblGeneralesCostoDirRenovacion" Theme="Office2010Black" runat="server" Text="Incremento Costo Directo por Renovación:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtGeneraesCostoDirPorRenovacion" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 25%"></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <asp:Panel id="PanelTipoBase" runat="server" CssClass="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div style="margin-left: -12px;">
                                                        <div class="col-md-12">
                                                            <div class="col-sm-10">
                                                                <dx:ASPxGridView ID="gvBase" runat="server" KeyFieldName="IdBase" AutoGenerateColumns="False"
                                                                    OnStartRowEditing="gvBase_StartRowEditing"
                                                                    OnCellEditorInitialize="gvBase_CellEditorInitialize"
                                                                    OnRowInserting="gvBase_RowInserting"
                                                                    OnRowUpdating="gvBase_RowUpdating"
                                                                    OnRowValidating="gvBase_RowValidating"
                                                                    OnCancelRowEditing="gvBase_CancelRowEditing"
                                                                    OnCommandButtonInitialize="gvBase_CommandButtonInitialize"
                                                                    OnRowDeleting="gvBase_RowDeleting"
                                                                    Width="100%" Theme="Office2010Black"
                                                                    SettingsBehavior-ConfirmDelete="true">
                                                                    <Columns>
                                                                        <dx:GridViewCommandColumn ButtonType="Button" ShowEditButton="True" ShowNewButtonInHeader="true" ShowUpdateButton="True" Caption="Acciones" ShowDeleteButton="true" VisibleIndex="3"></dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataComboBoxColumn Caption="Tipo Base" FieldName="TipoBase" VisibleIndex="2">
                                                                            <PropertiesComboBox ValueType="System.Int32" NullText="Seleccione">
                                                                                <Items>
                                                                                    <dx:ListEditItem Text="Predeterminada" Value="1"></dx:ListEditItem>
                                                                                    <dx:ListEditItem Text="Alternas" Value="2"></dx:ListEditItem>
                                                                                </Items>
                                                                                <ValidationSettings ErrorText="Error en la informaci&#243;n ingresada" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                                </ValidationSettings>
                                                                            </PropertiesComboBox>
                                                                        </dx:GridViewDataComboBoxColumn>
                                                                        <dx:GridViewDataComboBoxColumn Caption="Base" FieldName="Aeropuerto" VisibleIndex="1">
                                                                            <PropertiesComboBox NullText="Seleccione">
                                                                                <ValidationSettings ErrorText="Error en la informaci&#243;n ingresada" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                                </ValidationSettings>
                                                                            </PropertiesComboBox>
                                                                        </dx:GridViewDataComboBoxColumn>
                                                                    </Columns>
                                                                    <SettingsCommandButton>
                                                                        <UpdateButton Text="Guardar">
                                                                        </UpdateButton>
                                                                    </SettingsCommandButton>
                                                                </dx:ASPxGridView>
                                                            </div>
                                                            <div class="col-sm-2" style="text-align: center;">
                                                                <dx:ASPxCheckBox Text="Reasigna Remisiones:" ID="chkReasigna" runat="server" TextAlign="Left"></dx:ASPxCheckBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">

                                                    <div class="col-sm-10">
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <dx:ASPxLabel runat="server" ID="lblGeneralesNotas" Text="Notas:" Theme="Office2010Black"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxMemo runat="server" Native="false" ID="txtGeneralesMemo" Width="100%" Theme="Office2003Blue" Height="80px" MaxLength="500">
                                                                    </dx:ASPxMemo>
                                                                </td>
                                                                <td style="width: 10px;"></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-sm-2"></div>
                                                </div>
                                            </fieldset>
                                        </asp:Panel>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Facturación 3.3</span>
                                                </legend>
                                                <asp:Panel id="PanelFacturacion" runat="server" CssClass="row">
                                                    <table>
                                                        <tr>
                                                            <td style="width:5%">
                                                            </td>
                                                            <td style="width:20%; text-align:left">
                                                                <dx:ASPxLabel ID="lblMetodoPago" runat="server" Text="Metodo de pago:" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="width:30%">
                                                                <dx:ASPxComboBox ID="ddlMetodoPago" Theme="Office2010Black" NullText="Seleccionar" runat="server" Width="350px">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                                <%--<asp:DropDownList ID="ddlMetodoPago" runat="server" Width="100%"></asp:DropDownList>--%>
                                                            </td>
                                                            <td style="width:45%">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4" style="height:10px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td style="width:20%; text-align:left">
                                                                <dx:ASPxLabel ID="lblFormaPago" runat="server" Text="Forma de pago:" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxComboBox ID="ddlFormaPago" Theme="Office2010Black" NullText="Seleccionar" runat="server" Width="350px">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                                <%--<asp:DropDownList ID="ddlFormaPago" runat="server" Width="100%"></asp:DropDownList>--%>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4" style="height:10px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td style="width:20%; text-align:left">
                                                                <dx:ASPxLabel ID="lblUsoCFDI" runat="server" Text="Uso de CFDI:" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxComboBox ID="ddlUsoCFDI" Theme="Office2010Black" NullText="Seleccionar" runat="server" Width="350px">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4" style="height:10px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td style="width:20%; text-align:left">
                                                                <dx:ASPxLabel ID="lblFormatoEdoCta" runat="server" Text="Formato de Estado de cuenta:" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxComboBox ID="ddlFormatoEdoCta" Theme="Office2010Black" NullText="Seleccionar" runat="server" Width="350px">
                                                                    <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                        
                                                </asp:Panel>
                                                
                                            </fieldset>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div style="text-align: right;">
                                                <dx:ASPxButton runat="server" ID="btnGeneralesSiguiente" Text="Siguiente" Theme="Office2010Black" OnClick="btnGeneralesSiguiente_Click"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="2 Tarifas" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                        <dx:ASPxPanel ID="PnlTarifas" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasDescClaveCleinte" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasClaveCliente"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasClaveContrato"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasDescTipoPaquete" Text="Tipo de Paquete:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasTipoPaquete"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasDescGrupoAeronave" Text="Grupo Modelo:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasGrupoAeronave"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" ID="upaTarifaVuelo" OnUnload="UpdatePanel1_Unload">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <fieldset class="Personal1">
                                                        <legend>
                                                            <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Vuelo</span>
                                                        </legend>
                                                        <asp:Panel ID="PanelVuelo" runat="server"  CssClass="col-sm-12">
                                                            <table width="100%" border="0">
                                                                <tr>
                                                                    <td style="text-align: left;">
                                                                        <dx:ASPxLabel ID="lblTarifasCostoDirNac" runat="server" Theme="Office2010Black" Text="Costo Directo Nacional(USD):"></dx:ASPxLabel>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxTextBox ID="txtTarifasCostoDirNac" runat="server" MaxLength="15">
                                                                            <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                                <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <dx:ASPxLabel ID="lblTarifasCostoDirInter" runat="server" Theme="Office2010Black" Text="Costo Directo Internacional(USD):"></dx:ASPxLabel>
                                                                        <br />
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxTextBox ID="txtTarifasCostoDirInter" runat="server" MaxLength="15" Theme="Office2010Black">
                                                                            <ValidationSettings SetFocusOnError="true" ValidateOnLeave="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                                <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;">
                                                                        <dx:ASPxLabel ID="lblTarifasCombustible" runat="server" Theme="Office2010Black" Text="Combustible:"></dx:ASPxLabel>
                                                                    </td>
                                                                    <td>
                                                                        <div class="col-sm-6" style="margin-left: -20px;">
                                                                            <dx:ASPxRadioButton runat="server" ID="rdlTarifasCombustible" Text="Si" AutoPostBack="true" OnCheckedChanged="rdlTarifasCombustible_CheckedChanged1" Checked="true" GroupName="TarifasCombustible"></dx:ASPxRadioButton>
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <dx:ASPxRadioButton runat="server" ID="rdlTarifasNoCombustible" AutoPostBack="true" OnCheckedChanged="rdlTarifasNoCombustible_CheckedChanged1" Text="No" Checked="false" GroupName="TarifasCombustible"></dx:ASPxRadioButton>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;">
                                                                        <dx:ASPxLabel ID="lblTarifasCalculoPrecioCombustible" runat="server" Theme="Office2010Black" Text="Cálculo precio de combustible:*"></dx:ASPxLabel>
                                                                        <br />
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxComboBox ID="cboTarifaCalculoPrecioCombustible" NullText="Seleccione" AutoPostBack="true" Theme="Office2010Black" OnSelectedIndexChanged="cboTarifaCalculoPrecioCombustible_SelectedIndexChanged" runat="server">
                                                                            <Items>
                                                                                <dx:ListEditItem Text="Ninguno" Value="-1" Selected="true" />
                                                                                <dx:ListEditItem Text="Rango" Value="0" />
                                                                                <dx:ListEditItem Text="Promedio" Value="1" />
                                                                                <dx:ListEditItem Text="Real" Value="2" />
                                                                                <dx:ListEditItem Text="Horas Descuento" Value="3" />
                                                                            </Items>
                                                                            <ValidationSettings ErrorDisplayMode="Text" SetFocusOnError="true" ErrorTextPosition="Bottom">
                                                                                <RequiredField ErrorText="El campo es requerido" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxComboBox>
                                                                        <br />
                                                                    </td>
                                                                    <td style="text-align: left;">
                                                                        <dx:ASPxLabel ID="lblTarifaConsumo" runat="server" Theme="Office2010Black" Text="Consumo Galones/Hr:"></dx:ASPxLabel>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxTextBox ID="txtTarifaConsumo" Theme="Office2010Black" runat="server" MaxLength="15">
                                                                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                <RegularExpression ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" ErrorText="Error en la información ingresada" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;">
                                                                        <dx:ASPxLabel ID="lblFactorTramosNal" runat="server" Theme="Office2010Black" Text="Factor a Tramos Nacionales:"></dx:ASPxLabel>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxTextBox ID="txtFactorTramNal" Theme="Office2010Black" runat="server" MaxLength="15">
                                                                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                <RegularExpression ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" ErrorText="Error en la información ingresada" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                    <td style="text-align: left;">
                                                                        <dx:ASPxLabel ID="lblFactorTramosInt" runat="server" Theme="Office2010Black" Text="Factor a Tramos Internacionales:"></dx:ASPxLabel>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxTextBox ID="txtFactorTramInt" Theme="Office2010Black" runat="server" MaxLength="15">
                                                                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                <RegularExpression ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" ErrorText="Error en la información ingresada" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center;">
                                                                        <div class="col-sm-1">
                                                                            <asp:ImageButton ID="imbComunicao" runat="server" ToolTip="Ver tabla de factores comunicado 1ro de Mayo" ImageUrl="~/img/iconos/find.png" Height="24" Width="24" 
                                                                                OnClick="imbComunicao_Click"/>
                                                                        </div>
                                                                        <div class="col-sm-10">
                                                                            <dx:ASPxRadioButtonList ID="rblFactorCombustible" runat="server" Width="100%" RepeatDirection="Horizontal"
                                                                                AutoPostBack="true" OnValueChanged="rblFactorCombustible_ValueChanged">
                                                                                <Items>
                                                                                    <dx:ListEditItem Text="Factor Combustible Comunicado 1ro de Mayo" Value="1" />
                                                                                    <dx:ListEditItem Text="Factor Combustible Contratos Nuevos" Value="2" />
                                                                                </Items>
                                                                            </dx:ASPxRadioButtonList>
                                                                        </div>
                                                                        <div class="col-sm-1">
                                                                            <asp:ImageButton ID="imbContratosNvos" runat="server" ToolTip="Ver tabla para nuevos contratos" ImageUrl="~/img/iconos/find.png" Height="24" Width="24" 
                                                                                OnClick="imbContratosNvos_Click"/>
                                                                        </div>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>

                                                                <%--<tr>
                                                                    <td colspan="2">
                                                                        <dx:ASPxLabel ID="ASPxLabel15" Theme="Office2010Black" runat="server" Text="¿Aplica Factor de Combustible 1ro de Abril?:"></dx:ASPxLabel>
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center;">
                                                                        <div class="col-sm-1">
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxCheckBox ID="chkAplicaFactCombustible" Theme="Office2010Black" runat="server" TextAlign="Left" CheckState="Unchecked">
                                                                            </dx:ASPxCheckBox>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <dx:ASPxLabel ID="ASPxLabel16" Theme="Office2010Black" runat="server" Text="¿Aplica Factor de Combustible Contratos Nuevos?:"></dx:ASPxLabel>
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center;">
                                                                        <div class="col-sm-1">
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxCheckBox ID="ASPxCheckBox1" Theme="Office2010Black" runat="server" TextAlign="Left" CheckState="Unchecked">
                                                                            </dx:ASPxCheckBox>
                                                                        </div>
                                                                    </td>
                                                                </tr>--%>

                                                                <tr>
                                                                    <td colspan="2">
                                                                        <dx:ASPxLabel ID="lblTarifaPrecioCombustibleInternacional" Theme="Office2010Black" runat="server" Text="¿Precio Combustible internacional Especial?:"></dx:ASPxLabel>
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center;">
                                                                        <div class="col-sm-1">
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxCheckBox ID="chkTarifasPrecioEspecial" Theme="Office2010Black" runat="server" AutoPostBack="true" TextAlign="Left" CheckState="Unchecked" OnCheckedChanged="chkTarifasPrecioEspecial_CheckedChanged">
                                                                            </dx:ASPxCheckBox>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="col-sm-12">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <dx:ASPxGridView ID="gvTarifaCombustible"
                                                                                    ClientInstanceName="gvTarifaCombustible" Visible="false" Theme="Office2010Black" runat="server" AutoGenerateColumns="False"
                                                                                    KeyFieldName="IdCombustible"
                                                                                    Styles-Header-HorizontalAlign="Center"
                                                                                    OnRowInserting="gvTarifaCombustible_RowInserting"
                                                                                    OnRowUpdating="gvTarifaCombustible_RowUpdating"
                                                                                    OnStartRowEditing="gvTarifaCombustible_StartRowEditing"
                                                                                    OnRowDeleting="gvTarifaCombustible_RowDeleting"
                                                                                    OnCellEditorInitialize="gvTarifaCombustible_CellEditorInitialize"
                                                                                    OnCommandButtonInitialize="gvTarifaCombustible_CommandButtonInitialize"
                                                                                    OnRowValidating="gvTarifaCombustible_RowValidating" SettingsBehavior-ConfirmDelete="true"
                                                                                    Width="100%">
                                                                                    <Columns>
                                                                                        <dx:GridViewDataDateColumn Caption="Fecha" FieldName="Fecha" VisibleIndex="1">
                                                                                            <PropertiesDateEdit DisplayFormatString="" NullText="Seleccione fecha">
                                                                                                <ValidationSettings ErrorText="Error en la informaci&#243;n ingresada" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                                                </ValidationSettings>
                                                                                                <DropDownButton>
                                                                                                    <Image IconID="scheduling_calendar_16x16"></Image>
                                                                                                </DropDownButton>
                                                                                            </PropertiesDateEdit>
                                                                                        </dx:GridViewDataDateColumn>
                                                                                        <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="Importe" Caption="Importe">
                                                                                            <PropertiesTextEdit>
                                                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                                                </ValidationSettings>
                                                                                            </PropertiesTextEdit>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewCommandColumn ButtonType="Button" ShowDeleteButton="true" ShowEditButton="True" ShowNewButtonInHeader="true" ShowUpdateButton="True" Caption="Acciones" VisibleIndex="3"></dx:GridViewCommandColumn>
                                                                                    </Columns>
                                                                                    <SettingsCommandButton>
                                                                                        <UpdateButton Text="Guardar"></UpdateButton>
                                                                                    </SettingsCommandButton>
                                                                                </dx:ASPxGridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="chkTarifasPrecioEspecial" EventName="CheckedChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Tiempo de Espera</span>
                                                </legend>
                                                <asp:Panel ID="PanelTiempoTarifas" runat="server" CssClass="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel ID="lblTarifaCobroEspera" runat="server" Theme="Office2010Black" Text="Cobro:"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <div style="margin-left: 110px;">
                                                                        <dx:ASPxRadioButtonList ID="rdlListTarifaCoroEspera" ClientInstanceName="rdlListTarifaCoroEspera" OnSelectedIndexChanged="rdlListTarifaCoroEspera_SelectedIndexChanged" AutoPostBack="true" runat="server" SelectedIndex="0">
                                                                            <Items>
                                                                                <dx:ListEditItem Selected="true" Text="Si" Value="1" />
                                                                                <dx:ListEditItem Text="No" Value="0" />
                                                                            </Items>
                                                                        </dx:ASPxRadioButtonList>
                                                                    </div>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>
                                                                    <div class="col-sm-7">
                                                                        <dx:ASPxLabel ID="lblTarifaTarifa" runat="server" Theme="Office2010Black" Text="Tarifa en Dlls(fija):"></dx:ASPxLabel>
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <div class="col-sm-7">
                                                                        <dx:ASPxLabel ID="lblTarifaPorcentaje" runat="server" Theme="Office2010Black" Text="% de Tarifa de Vuelo (Variable)"></dx:ASPxLabel>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel ID="lblTarifaTiempoEsperaNaciona" runat="server" Theme="Office2010Black" Text="Nacional:"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <div class="col-sm-1"></div>
                                                                    <div class="col-sm-1">
                                                                        <dx:ASPxTextBox ID="txtTarifaTiempoEsperaNacionaFija" AutoPostBack="true" ClientInstanceName="txtTarifaTiempoEsperaNacionaFija" OnTextChanged="txtTarifaTiempoEsperaNacionaFija_TextChanged" Theme="Office2010Black" runat="server" Text="0" ReadOnlyStyle-BackColor="Silver">
                                                                            <ValidationSettings ErrorText="Error en la información ingresada" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                            </ValidationSettings>
                                                                            <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                        </dx:ASPxTextBox>
                                                                    </div>
                                                                    <br />
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <div class="col-sm-1"></div>
                                                                    <div class="col-sm-1">
                                                                        <dx:ASPxTextBox ID="txtTarifaTiempoEsperaNacionaVariable" AutoPostBack="true" OnTextChanged="txtTarifaTiempoEsperaNacionaVariable_TextChanged" ClientInstanceName="txtTarifaTiempoEsperaNacionaVariable" Theme="Office2010Black" Text="0" runat="server">
                                                                            <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                            </ValidationSettings>
                                                                            <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                        </dx:ASPxTextBox>
                                                                    </div>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel ID="lblTarifaIntercional" runat="server" Theme="Office2010Black" Text="Internacional:"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <div class="col-sm-1"></div>
                                                                    <div class="col-sm-1">
                                                                        <dx:ASPxTextBox ID="txtTarifaTiempoEsperaInternacinalFija" OnTextChanged="txtTarifaTiempoEsperaInternacinalFija_TextChanged" AutoPostBack="true" ClientInstanceName="txtTarifaTiempoEsperaInternacinalFija" Theme="Office2010Black" Text="0" runat="server">
                                                                            <ValidationSettings ErrorText="Error en la información ingresada" ErrorTextPosition="Bottom" ErrorDisplayMode="Text" SetFocusOnError="true">
                                                                                <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                            </ValidationSettings>
                                                                            <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                        </dx:ASPxTextBox>
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <div class="col-sm-1"></div>
                                                                    <div class="col-sm-1">
                                                                        <dx:ASPxTextBox ID="txtTarifaTiempoEsperaInternacinalNacional" OnTextChanged="txtTarifaTiempoEsperaInternacinalNacional_TextChanged" AutoPostBack="true" ClientInstanceName="txtTarifaTiempoEsperaInternacinalNacional" Theme="Office2010Black" Text="0" runat="server">
                                                                            <ValidationSettings ErrorText="Error en la información ingresada" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                            </ValidationSettings>
                                                                            <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                        </dx:ASPxTextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Pernoctas</span>
                                                </legend>
                                                <asp:Panel ID="PanelPernoctasTarifas" runat="server" CssClass="col-sm-12">
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblTarifaPernoctasCobro" Theme="Office2010Black" runat="server" Text="Cobro:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <div style="margin-left: 110px;">
                                                                    <dx:ASPxRadioButtonList ID="rdlListTarifaCobro" AutoPostBack="true" OnSelectedIndexChanged="rdlListTarifaCobro_SelectedIndexChanged1" runat="server">
                                                                        <Items>
                                                                            <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                                            <dx:ListEditItem Text="No" Value="0" />
                                                                        </Items>
                                                                    </dx:ASPxRadioButtonList>
                                                                </div>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <div class="col-sm-7">
                                                                    <dx:ASPxLabel ID="lblTarifaTaridaDlls" Theme="Office2010Black" runat="server" Text="Tarifa en Dlls(fija):"></dx:ASPxLabel>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                            <td>
                                                                <div class="col-sm-7">
                                                                    <dx:ASPxLabel ID="txtTarifaTarifaDll" Theme="Office2010Black" runat="server" Text="% de Tarifa de Vuelo (Variable):"></dx:ASPxLabel>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblTarifaNacional" runat="server" Theme="Office2010Black" Text="Nacional:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaNacionalFija" AutoPostBack="true" OnTextChanged="txtTarifaNacionalFija_TextChanged" Theme="Office2010Black" Text="0" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                        </ValidationSettings>
                                                                        <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                            <td></td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaNacionalVarable" AutoPostBack="true" OnTextChanged="txtTarifaNacionalVarable_TextChanged" Theme="Office2010Black" Text="0" runat="server">
                                                                        <ValidationSettings SetFocusOnError="true" ErrorText="Error en la información ingresada" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                        </ValidationSettings>
                                                                        <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblTarifaInternacional" Theme="Office2010Black" runat="server" Text="Internacional:"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaInternacionalFija" AutoPostBack="true" OnTextChanged="txtTarifaInternacionalFija_TextChanged" Theme="Office2010Black" Text="0" runat="server">
                                                                        <ValidationSettings SetFocusOnError="true" ErrorText="Error en la información ingresada" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                        </ValidationSettings>
                                                                        <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>

                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaInternacionalVariable" AutoPostBack="true" OnTextChanged="txtTarifaInternacionalVariable_TextChanged" Theme="Office2010Black" Text="0" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                        </ValidationSettings>
                                                                        <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <asp:Panel ID="PanelIncrementInflacion" runat="server" CssClass="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Incrementos por Inflación</span>
                                                </legend>
                                                <div class="col-sm-12">
                                                    <table width="100%" border="0">
                                                        <tr>
                                                            <td colspan="2">
                                                                <dx:ASPxLabel ID="lblBaseInflacion" Theme="Office2010Black" runat="server" Text="Base de Inflación"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-7">
                                                                    <dx:ASPxLabel ID="lblIncrementoPorcentaje" Theme="Office2010Black" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%"></dx:ASPxLabel>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxLabel ID="lblPuntos" runat="server" Theme="Office2010Black" Text="+X Puntos"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-7" style="text-align: center;">
                                                                    <dx:ASPxLabel ID="lblTope" runat="server" Theme="Office2010Black" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tope Máximo"></dx:ASPxLabel>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;" valign="middle">
                                                                <dx:ASPxLabel ID="lblCostoDirNacional" runat="server" Theme="Office2010Black" Text="Costo Directo Nacional:"></dx:ASPxLabel>
                                                                <br />
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxComboBox ID="cboTarifaCostoDirectro" NullText="Seleccione" Theme="Office2010Black" runat="server">
                                                                    </dx:ASPxComboBox>
                                                                    <br />
                                                                </div>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtTarifaCostoDirectoNacionalPorcentajeNacional" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaCostoDirectoNacionalPuntos" Theme="Office2010Black" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaCostoDirectoNacionalTopeMaximo" Theme="Office2010Black" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblTarifaCostoDirectoInternacional" runat="server" Theme="Office2010Black" Text="Costo Directo Internacional:"></dx:ASPxLabel>
                                                                <br />
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxComboBox ID="cboTarifaCostoDirectoInternacional" NullText="Seleccione" Theme="Office2010Black" runat="server"></dx:ASPxComboBox>
                                                                    <br />
                                                                </div>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtTarifaCostoDirectoInternacionalPorcentaje" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaCostoDirectoInternacionalPuntos" Theme="Office2010Black" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaCostoDirectoInternacionalTopeMaximo" Theme="Office2010Black" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                <dx:ASPxLabel ID="lblTarifaFijoAnual" runat="server" Theme="Office2010Black" Text="Fijo Anual:"></dx:ASPxLabel>
                                                                <br />
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxComboBox ID="cboTarifaFijoAnual" NullText="Seleccione" Theme="Office2010Black" runat="server"></dx:ASPxComboBox>
                                                                    <br />
                                                                </div>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtTarifaFijoanualPorcentaje" Theme="Office2010Black" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarifaFijoAnualPuntos" Theme="Office2010Black" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-1"></div>
                                                                <div class="col-sm-1">
                                                                    <dx:ASPxTextBox ID="txtTarfaFijoAnualMaximo" Theme="Office2010Black" runat="server">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                </div>

                                                <br />
                                                <div class="row">
                                                    <div class="col-sm-10">
                                                        <table width="47%" border="0">
                                                            <tr>
                                                                <td align="left">
                                                                    <dx:ASPxLabel runat="server" ID="lblAplicaIncremento" Text="Aplicar incremento en:" Theme="Office2010Black"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxRadioButtonList ID="rblIncrementoTarifa" ClientInstanceName="rblIncrementoTarifa" runat="server" SelectedIndex="0">
                                                                        <Items>
                                                                            <dx:ListEditItem Text="Siempre en enero" Value="1" />
                                                                            <dx:ListEditItem Text="En mes de Aniversario" Value="2" />
                                                                            <dx:ListEditItem Text="Nunca" Value="3" Selected="true" />
                                                                        </Items>
                                                                    </dx:ASPxRadioButtonList>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="row">
                                                    <div class="col-sm-10">
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <dx:ASPxLabel runat="server" ID="lblTarifasNotas" Text="Notas:" Theme="Office2010Black"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxMemo runat="server" Native="false" ID="txtTarifasMemo" Width="100%" Theme="Office2003Blue" Height="80px" MaxLength="500">
                                                                    </dx:ASPxMemo>
                                                                </td>
                                                                <td style="width: 10px;"></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-sm-2"></div>
                                                </div>

                                            </fieldset>
                                        </div>
                                    </asp:Panel>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnTarifaAnterior" Text="Anterior" Theme="Office2010Black" OnClick="btnTarifaAnterior_Click" Style="margin-left: -15px;"></dx:ASPxButton>
                                            </div>
                                            <div class="col-sm-10"></div>
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnTarifaSiguiente" Text="Siguiente" Theme="Office2010Black" OnClick="btnTarifaSiguiente_Click" Style="margin-right: -15px;"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:UpdateProgress ID="upgPrueba" runat="server" AssociatedUpdatePanelID="upaTarifaVuelo">
                                        <ProgressTemplate>
                                            <asp:Label ID="lblPrueba" runat="server" Text="Procesando..."></asp:Label>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="3 Cobros y Descuentos" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:ASPxPanel ID="PnlCobrosyDescuentos" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosDescClaveCleinte" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosClaveCliente"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosClaveContrato"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosDescTipoPaquete" Text="Tipo de Paquete:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosTipoPaquete"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosDescGrupoAeronave" Text="Grupo de Aeronave:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosGrupoAeronave"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </div>



                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Descuento de horas de paquete</span>
                                                </legend>
                                                <asp:Panel id="PanelDescuentoHorasPaquete" runat="server" CssClass="col-md-12">
                                                    <table width="100%">
                                                        <tr>
                                                            <td colspan="2">
                                                                <dx:ASPxLabel ID="lblFerrysConCargo" Theme="Office2010Black" runat="server"
                                                                    Text="Ferrys con cargo">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 40px">&nbsp;
                                                            </td>
                                                            <td colspan="2">
                                                                <dx:ASPxLabel ID="lblEsperalibre" Theme="Office2010Black" runat="server" Text="Espera Libre"></dx:ASPxLabel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel ID="ASPxLabel5" Theme="Office2010Black" runat="server"
                                                                    Text="Ninguno">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxRadioButton ID="rdlCobroFerrysNinguno" runat="server"
                                                                    GroupName="Ferrys">
                                                                </dx:ASPxRadioButton>
                                                            </td>
                                                            <td style="width: 40px">&nbsp;
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Theme="Office2010Black" Text="¿Aplica espera libre?">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxCheckBox Theme="Office2010Black" ID="chkCobroAplicaEsperaLibre" runat="server"></dx:ASPxCheckBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="ASPxLabel7" runat="server"
                                                                    Text="Todos">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxRadioButton ID="rdlCobroFerrysTodos" runat="server"
                                                                    Checked="false" GroupName="Ferrys">
                                                                </dx:ASPxRadioButton>
                                                            </td>
                                                            <td style="width: 40px">&nbsp;
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxLabel ID="ASPxLabel8" Theme="Office2010Black" runat="server" Text="Horas por vuelo">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtCobroHorasVuelo" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="lblReposicionamiento" runat="server"
                                                                    Text="Ferrys de Reposicionamiento">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxRadioButton ID="rdlCobroFerrysReposicionamiento" runat="server" Checked="false" GroupName="Ferrys">
                                                                </dx:ASPxRadioButton>
                                                            </td>
                                                            <td style="width: 40px">&nbsp;
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="lblFactorHrsVuelo" runat="server" Text="Factor de hrs de vuelo"></dx:ASPxLabel>
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtFactorHrsVuelo" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Pernoctas</span>
                                                </legend>
                                                <asp:Panel id="PanelPernoctasCobrosDesc" runat="server" CssClass="col-md-12">
                                                    <table width="100%">
                                                        <tr>
                                                            <td colspan="2">
                                                                <div class="col-sm-3"></div>
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="lblPernoctasNacional" runat="server"
                                                                    Text="Nacional">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="col-sm-4">
                                                                    <dx:ASPxLabel Theme="Office2010Black" ID="lblPernoctasInternacional" runat="server" Text="Internacional">
                                                                    </dx:ASPxLabel>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="lblDescuentanPernoctasNacional" runat="server" Text="Se descuentan">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlDescuentanPernoctasNacional" runat="server" AutoPostBack="true" OnCheckedChanged="rdlDescuentanPernoctasNacional_CheckedChanged" Checked="false" Text="Si" GroupName="DescuentanPernoctasNacional">
                                                                    </dx:ASPxRadioButton>
                                                                </div>
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlNoDescuentanPernoctasNacional" runat="server" Checked="true" AutoPostBack="true" OnCheckedChanged="rdlNoDescuentanPernoctasNacional_CheckedChanged" Text="No" GroupName="DescuentanPernoctasNacional">
                                                                    </dx:ASPxRadioButton>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlDescuentanPernoctasInternacional" runat="server" AutoPostBack="true"
                                                                        OnCheckedChanged="rdlDescuentanPernoctasInternacional_CheckedChanged"
                                                                        GroupName="DescuentanPernoctasInternacional" Checked="false"
                                                                        Text="Si">
                                                                    </dx:ASPxRadioButton>
                                                                </div>
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlNoDescuentanPernoctasInternacional"
                                                                        AutoPostBack="true" OnCheckedChanged="rdlNoDescuentanPernoctasInternacional_CheckedChanged" runat="server" GroupName="DescuentanPernoctasInternacional" Checked="true"
                                                                        Text="No">
                                                                    </dx:ASPxRadioButton>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="lblPernoctaFactorConversion" runat="server"
                                                                    Text="Factor de conversión a hrs de vuelo">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtPernoctaFactorConversionNacional" runat="server" Text="0">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                    </ValidationSettings>
                                                                    <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td colspan="2">
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtPernoctaFactorConversionInternacional" Text="0" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                    </ValidationSettings>
                                                                    <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblDescuentoPernoctasLibres" Text="Número de pernoctas libres anual"></dx:ASPxLabel>
                                                            </td>
                                                            <td colspan="2" valign="top">
                                                                <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtDescuentoPernoctasLibres" Text="0">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                    </ValidationSettings>
                                                                    <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td style="padding-left: 40px;">
                                                                <br />
                                                                <dx:ASPxCheckBoxList Theme="Office2010Black" runat="server" ID="chkListDescuentosPrecnoctas">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Descuento" Value="1" />
                                                                        <dx:ListEditItem Text="Cobro" Value="2" />
                                                                    </Items>
                                                                </dx:ASPxCheckBoxList>
                                                            </td>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>&nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Tiempo de Espera</span>
                                                </legend>
                                                <asp:Panel id="PanelTiempoEsperaCobrosDesc" runat="server" CssClass="col-md-12">
                                                    <table width="100%">
                                                        <tr>
                                                            <td colspan="2">
                                                                <div class="col-sm-3"></div>
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="ASPxLabel1" runat="server" Text="Nacional"></dx:ASPxLabel>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="col-sm-4">
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxLabel Theme="Office2010Black" ID="ASPxLabel2" runat="server" Text="Internacional"></dx:ASPxLabel>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="ASPxLabel3" runat="server" Text="Se descuentan"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlDescuentanTiempoEsperaNacional" AutoPostBack="true" OnCheckedChanged="rdlDescuentanTiempoEsperaNacional_CheckedChanged" runat="server" GroupName="DescuentanTiempoEsperaNacional" Checked="false" Text="Si"></dx:ASPxRadioButton>
                                                                </div>
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlNoDescuentanTiempoEsperaNacional" AutoPostBack="true" OnCheckedChanged="rdlNoDescuentanTiempoEsperaNacional_CheckedChanged" runat="server" Checked="true" GroupName="DescuentanTiempoEsperaNacional" Text="No"></dx:ASPxRadioButton>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlDescuentanTiempoEsperaInternaacional" AutoPostBack="true" OnCheckedChanged="rdlDescuentanTiempoEsperaInternaacional_CheckedChanged" runat="server" Checked="false" GroupName="DescuentanTiempoEsperaInternaacional" Text="Si"></dx:ASPxRadioButton>
                                                                </div>
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton ID="rdlNoDescuentanTiempoEsperaInternaacional" AutoPostBack="true" OnCheckedChanged="rdlNoDescuentanTiempoEsperaInternaacional_CheckedChanged" runat="server" Checked="true" Text="No" GroupName="DescuentanTiempoEsperaInternaacional"></dx:ASPxRadioButton>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel Theme="Office2010Black" ID="ASPxLabel4" runat="server" Text="Factor de conversión a hrs de vuelo"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtTiempoEsperaFactorHrsVueloNal" Text="0" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                    </ValidationSettings>
                                                                    <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td colspan="2">
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtTiempoEsperaFactorHrsVueloInt" Text="0" runat="server">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" />
                                                                    </ValidationSettings>
                                                                    <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Tiempo a Facturar</span>
                                                </legend>
                                                <asp:Panel id="PanelTiempoFacturar" runat="server" CssClass="col-md-12">
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width: 25%">&nbsp;
                                                                <dx:ASPxRadioButton ID="rdlTiempoFacturarCalzo" runat="server"
                                                                    Text="Calzo" GroupName="TiempoFacturar">
                                                                </dx:ASPxRadioButton>
                                                            </td>
                                                            <td style="width: 25%">
                                                                <br />
                                                            </td>
                                                            <td style="width: 25%" rowspan="2">
                                                                <dx:ASPxRadioButtonList ID="rblSeCobraFerryHelicoptero" runat="server">
                                                                    <Items>
                                                                        <dx:ListEditItem  Text="Si se cobran ferry en helicoptero" Value="1" Selected="true" />
                                                                        <dx:ListEditItem  Text="NO se cobran ferry en helicoptero" Value="2" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </td>
                                                            <td style="width: 25%" rowspan="2">&nbsp;
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtHelicopteroMasMinutos" runat="server" Caption="+Minutos Helicoptero">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]*" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%">&nbsp;
                                                                <dx:ASPxRadioButton ID="rdlTiempoFacturarVuelo" runat="server"
                                                                    Text="Vuelo" GroupName="TiempoFacturar">
                                                                </dx:ASPxRadioButton>
                                                            </td>
                                                            <td style="width: 25%">
                                                                <dx:ASPxTextBox Theme="Office2010Black" ID="txtTiempoFacturarMasMinutos" runat="server" Caption="+Minutos">
                                                                    <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                        <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]*" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <%--<td style="width: 25%">
                                                                
                                                            </td>
                                                            <td style="width: 25%">&nbsp;

                                                            </td>--%>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Cobro Servicio con Cargo</span>
                                                </legend>
                                                <asp:Panel id="PanelServicioCargo" runat="server" CssClass="col-md-12">
                                                    <dx:ASPxGridView ID="gvServicioConCargo" Theme="Office2010Black" runat="server" AutoGenerateColumns="false" Width="100%" KeyFieldName="IdServicioConCargo">
                                                        <SettingsPager Visible="False" Mode="ShowAllRecords"></SettingsPager>
                                                        <SettingsEditing Mode="Inline"></SettingsEditing>
                                                        <SettingsBehavior AllowGroup="False" AllowDragDrop="false"></SettingsBehavior>
                                                        <SettingsDataSecurity AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="2" Caption="&#191;Se cobra?"></dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn Caption="Servicio con cargo." FieldName="ServicioConCargoDescripcion" VisibleIndex="0">
                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Servicio con cargo." Visible="False" VisibleIndex="1">
                                                                <EditFormSettings Visible="True"></EditFormSettings>
                                                            </dx:GridViewDataComboBoxColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                </asp:Panel>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <asp:Panel id="PanelTramoPactado" runat="server" CssClass="col-sm-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Tramo Pactado</span>
                                                </legend>
                                                <table>
                                                    <tr>
                                                        <td colspan="2">
                                                            <dx:ASPxLabel ID="lblCobrosAplicaTramo" Theme="Office2010Black" runat="server" Text="¿Aplica tramo pactado?"></dx:ASPxLabel>
                                                        </td>
                                                        <td colspan="2" style="text-align: center;">
                                                            <div class="col-sm-1">
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxCheckBox ID="chkCobrosAplicaTramo" Theme="Office2010Black" runat="server" AutoPostBack="true" TextAlign="Left" CheckState="Checked" OnCheckedChanged="chkCobrosAplicaTramo_CheckedChanged">
                                                                </dx:ASPxCheckBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <div class="col-md-12">
                                                    <dx:ASPxHiddenField ID="hdnOrigen" ClientInstanceName="hdnOrigen" runat="server" ViewStateMode="Enabled"></dx:ASPxHiddenField>
                                                    <dx:ASPxGridView ID="gvTramoPactado" runat="server"
                                                        ClientInstanceName="gvTramoPactado"
                                                        KeyFieldName="IdTramo"
                                                        OnCellEditorInitialize="gvTramoPactado_CellEditorInitialize"
                                                        OnRowInserting="gvTramoPactado_RowInserting"
                                                        OnRowUpdating="gvTramoPactado_RowUpdating"
                                                        OnRowValidating="gvTramoPactado_RowValidating"
                                                        OnRowDeleting="gvTramoPactado_RowDeleting"
                                                        OnCancelRowEditing="gvTramoPactado_CancelRowEditing"
                                                        OnCommandButtonInitialize="gvTramoPactado_CommandButtonInitialize"
                                                        Theme="Office2010Black" AutoGenerateColumns="false" Width="100%">
                                                        <SettingsPager Visible="true" Position="TopAndBottom">
                                                            <PageSizeItemSettings Items="1, 10, 20, 50, 100">
                                                            </PageSizeItemSettings>
                                                        </SettingsPager>
                                                        <Settings ShowGroupPanel="True" />
                                                        <SettingsEditing EditFormColumnCount="3"></SettingsEditing>
                                                        <SettingsBehavior AllowGroup="true" AllowDragDrop="true" ConfirmDelete="True"></SettingsBehavior>
                                                        <Columns>
                                                            <dx:GridViewDataComboBoxColumn Caption="Origen" FieldName="Origen" VisibleIndex="0">
                                                                <EditFormSettings Visible="True"></EditFormSettings>
                                                                <PropertiesComboBox EnableSynchronization="False"
                                                                    IncrementalFilteringMode="Contains"
                                                                    TextFormatString="{1}"
                                                                    DropDownStyle="DropDown"
                                                                    OnItemsRequestedByFilterCondition="ASPxComboBox_OnItemsRequestedByFilterConditionOrigen"
                                                                    FilterMinLength="0"
                                                                    NullText="Seleccione una opción"
                                                                    EnableCallbackMode="true" CallbackPageSize="10">
                                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
                                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                                    </ValidationSettings>
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Destino" FieldName="Destino" Visible="True" VisibleIndex="1">
                                                                <EditFormSettings Visible="True"></EditFormSettings>
                                                                <PropertiesComboBox ValueType="System.Int32"
                                                                    IncrementalFilteringMode="Contains"
                                                                    TextFormatString="{1}"
                                                                    DropDownStyle="DropDown"
                                                                    OnItemsRequestedByFilterCondition="ASPxComboBox_OnItemsRequestedByFilterConditionDestino"
                                                                    OnItemRequestedByValue="ASPxComboBox_OnItemRequestedByValue"
                                                                    FilterMinLength="0"
                                                                    NullText="Seleccione una opción"
                                                                    EnableCallbackMode="true" CallbackPageSize="10">
                                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                                    </ValidationSettings>
                                                                    <ClientSideEvents EndCallback="OnEndCallback" />
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                            <dx:GridViewCommandColumn ButtonType="Button" VisibleIndex="3" Caption="&#191;Se cobra?" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn FieldName="TiempoVuelo" Caption="Tiempo." VisibleIndex="2">
                                                                <EditFormSettings Visible="True"></EditFormSettings>
                                                                <PropertiesTextEdit MaxLength="5" NullText="00:00" NullDisplayText="00:00">
                                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                                        <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ValidationExpression="^[0-0][0-8]:[0-5][0-9]$"></RegularExpression>
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsCommandButton>
                                                            <UpdateButton Text="Guardar"></UpdateButton>
                                                        </SettingsCommandButton>
                                                    </dx:ASPxGridView>
                                                </div>


                                                <br />
                                                <div class="row">

                                                    <div class="col-sm-10">
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <dx:ASPxLabel runat="server" ID="lblCobrosDescuentosNotas" Text="Notas:" Theme="Office2010Black"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxMemo runat="server" Native="false" ID="txtCobrosDescuentosMemo" Width="100%" Theme="Office2003Blue" Height="80px" MaxLength="500">
                                                                    </dx:ASPxMemo>
                                                                </td>
                                                                <td style="width: 10px;"></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-sm-2"></div>
                                                </div>

                                            </fieldset>
                                        </asp:Panel>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnAnteriorCobros" Text="Anterior" Theme="Office2010Black" OnClick="btnAnteriorCobros_Click" Style="margin-left: -15px;"></dx:ASPxButton>
                                            </div>
                                            <div class="col-sm-10"></div>
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnSigCobros" Text="Siguiente" Theme="Office2010Black" OnClick="btnSigCobros_Click" Style="margin-right: -15px;"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="4 Intercambios" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:ASPxPanel ID="PnlIntercambio" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1" style="width: 102.5%; margin-left: -15px;">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosDescClaveCleinte" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosClaveCliente"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosClaveContrato"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosDescTipoPaquete" Text="Tipo de Paquete:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosTipoPaquete"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosDescGrupoAeronave" Text="Grupo de Aeronave:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblIntercambiosGrupoAeronave"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <asp:Panel id="PanelIntercambio" runat="server" CssClass="row">
                                        <fieldset class="Personal1">
                                            <legend>
                                                <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Intercambios</span>
                                            </legend>
                                            <div class="col-md-12">
                                                <dx:ASPxGridView ID="gvIntercambios"
                                                    runat="server"
                                                    AutoGenerateColumns="false"
                                                    KeyFieldName="IdIntercambio"
                                                    Width="100%"
                                                    OnRowDeleting="gvIntercambios_RowDeleting"
                                                    OnRowUpdating="gvIntercambios_RowUpdating"
                                                    OnRowInserting="gvIntercambios_RowInserting"
                                                    OnCellEditorInitialize="gvIntercambios_CellEditorInitialize"
                                                    OnRowValidating="gvIntercambios_RowValidating"
                                                    OnCancelRowEditing="gvIntercambios_CancelRowEditing"
                                                    OnStartRowEditing="gvIntercambios_StartRowEditing"
                                                    OnCommandButtonInitialize="gvIntercambios_CommandButtonInitialize"
                                                    Theme="Office2010Black">
                                                    <SettingsPager Visible="False"></SettingsPager>
                                                    <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                                    <SettingsBehavior AllowGroup="False" AllowDragDrop="false" ConfirmDelete="True"></SettingsBehavior>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="GrupoModelo" FieldName="GrupoModelo" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="IdGrupoModelo" FieldName="IdGrupoModelo" Visible="False" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataCheckColumn Caption="Aplica Ferry" FieldName="AplicaFerry" VisibleIndex="2"></dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataTextColumn Caption="Factor" FieldName="Factor" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Tarifa Nacional Dlls" FieldName="TarifaNal" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Tarifa Internacional Dlls" FieldName="TarifaInt" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Galones / Hr de Vuelo" FieldName="Galones" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Costo Directo Nacional Dlls" FieldName="CostoDirectoNal" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Costo Directo Internacional Dlls" FieldName="CostoDirectoInt" VisibleIndex="8"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewCommandColumn ButtonType="Button" VisibleIndex="9" Caption="Acciones" ShowEditButton="True" ShowNewButtonInHeader="true" ShowUpdateButton="True" ShowDeleteButton="true"></dx:GridViewCommandColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <UpdateButton Text="Guardar"></UpdateButton>
                                                    </SettingsCommandButton>
                                                    <SettingsPopup EditForm-Width="700px" CustomizationWindow-HorizontalAlign="RightSides" EditForm-VerticalAlign="Below"></SettingsPopup>
                                                    <Templates>
                                                        <EditForm>

                                                            <div class="row" style="padding: 4px 3px 4px">
                                                                <dx:ASPxPageControl runat="server" ClientInstanceName="gvIntercambioEdit" ID="gvIntercambioEdit" Width="100%" OnLoad="pageControl_Load">
                                                                    <TabPages>
                                                                        <dx:TabPage Text="Generales" Visible="true">
                                                                            <ContentCollection>
                                                                                <dx:ContentControl>
                                                                                    <div class="row">
                                                                                        <div class="col-md-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel ID="lblIntercambioEditorGrupoModelo" Theme="Office2010Black" Font-Bold="true" runat="server" Text="Grupo Modelo*"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-8">
                                                                                            <dx:ASPxComboBox ID="cboIntercambioEditorGrupoModelo" DropDownRows="4" runat="server" Width="100%" Theme="Office2010Black" NullText="Seleccione" Value='<%# Eval("IdGrupoModelo")%>'>
                                                                                                <ValidationSettings ErrorText="Error en la informaci&#243;n ingresada" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                                                </ValidationSettings>
                                                                                            </dx:ASPxComboBox>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-md-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel ID="lblIntercambioEditorFacto" Theme="Office2010Black" Font-Bold="true" runat="server" Text="Factor"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-8">
                                                                                            <dx:ASPxTextBox ID="txtIntercambiosEditorFactor" Width="100%" runat="server" Theme="Office2010Black" Text='<%# Eval("Factor")%>'>
                                                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                                                </ValidationSettings>

                                                                                            </dx:ASPxTextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-md-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel ID="lblIntercambiosEditorFerry" Theme="Office2010Black" Font-Bold="true" runat="server" Text="Aplica Ferry"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-1" style="text-align: left;">
                                                                                            <dx:ASPxCheckBox ID="chkIntercambiosEditorFerry" Theme="Office2010Black" runat="server" Value='<%# Eval("AplicaFerry")%>' ValueType="System.Boolean"></dx:ASPxCheckBox>
                                                                                        </div>
                                                                                    </div>
                                                                                </dx:ContentControl>
                                                                            </ContentCollection>
                                                                        </dx:TabPage>
                                                                        <dx:TabPage Text="Tarifas" Visible="true">
                                                                            <ContentCollection>
                                                                                <dx:ContentControl>
                                                                                    <div class="row">
                                                                                        <div class="col-md-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblIntercambiosTarifaNacionalDll" Font-Bold="true" Text="Tarifa Nacional Dlls"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-8">
                                                                                            <dx:ASPxTextBox Theme="Office2010Black" ID="txtIntercambiosEditorTarifaNacionalDll" runat="server" Width="100%" Text='<%# Eval("TarifaNal")%>'>
                                                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                                                </ValidationSettings>
                                                                                            </dx:ASPxTextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-md-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblIntercambiosTarifaInternacionalDll" Font-Bold="true" Text="Tarifa Internacional Dlls"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-8">
                                                                                            <dx:ASPxTextBox Theme="Office2010Black" ID="txtIntercambiosTarifaInternacionalDll" runat="server" Width="100%" Text='<%# Eval("TarifaInt")%>'>
                                                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                                                </ValidationSettings>
                                                                                            </dx:ASPxTextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                </dx:ContentControl>
                                                                            </ContentCollection>
                                                                        </dx:TabPage>
                                                                        <dx:TabPage Text="Costos" Visible="true">
                                                                            <ContentCollection>
                                                                                <dx:ContentControl>
                                                                                    <div class="row">
                                                                                        <div class="col-sm-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel Theme="Office2010Black" ID="lblTarifasEditorGalonesHHr" runat="server" Font-Bold="true" Text="Galones / Hr de vuelo"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-8">
                                                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" Width="100%" ID="txtTarifasEditorCostoDirecto" Text='<%# Eval("Galones")%>'>
                                                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                                                </ValidationSettings>
                                                                                            </dx:ASPxTextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-sm-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel Theme="Office2010Black" ID="lblCostoDirectoNacional" runat="server" Font-Bold="true" Text="Costo Directo Nacional Dlls"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-8">
                                                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" Width="100%" ID="txtCostoDirectoNacional" Text='<%# Eval("CostoDirectoNal")%>'>
                                                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                                                </ValidationSettings>
                                                                                            </dx:ASPxTextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-sm-4" style="text-align: left;">
                                                                                            <dx:ASPxLabel Theme="Office2010Black" ID="lblCostoDirectoInternacional" runat="server" Font-Bold="true" Text="Costo Directo Internacional Dlls"></dx:ASPxLabel>
                                                                                        </div>
                                                                                        <div class="col-md-8">
                                                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" Width="100%" ID="txtCostoDirectointernacional" Text='<%# Eval("CostoDirectoInt")%>'>
                                                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                                                </ValidationSettings>
                                                                                            </dx:ASPxTextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                </dx:ContentControl>
                                                                            </ContentCollection>
                                                                        </dx:TabPage>
                                                                    </TabPages>
                                                                </dx:ASPxPageControl>
                                                            </div>
                                                            <div style="text-align: right; padding: 2px" class="row">
                                                                <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ValidateRequestMode="Enabled" ReplacementType="EditFormUpdateButton"
                                                                    runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                    runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                            </div>

                                                        </EditForm>
                                                    </Templates>
                                                </dx:ASPxGridView>
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                            </div>
                                            <br />
                                            <div class="row">

                                                <div class="col-sm-10">
                                                    <table width="100%">
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel runat="server" ID="lblIntercambioNotas" Text="Notas:" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxMemo runat="server" Native="false" ID="txtIntercambioMemo" Width="100%" Theme="Office2003Blue" Height="80px" MaxLength="500">
                                                                </dx:ASPxMemo>
                                                            </td>
                                                            <td style="width: 10px;"></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="col-sm-2"></div>
                                            </div>


                                        </fieldset>
                                    </asp:Panel>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnAntIntercambio" Text="Anterior" Theme="Office2010Black" OnClick="btnAntIntercambio_Click" Style="margin-left: -15px;"></dx:ASPxButton>
                                            </div>
                                            <div class="col-sm-10"></div>
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnSigIntercambio" Text="Siguiente" Theme="Office2010Black" OnClick="btnSigIntercambio_Click" Style="margin-right: -15px;"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </div>


                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="5 Giras y Fechas Pico" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:ASPxPanel ID="PnlGirasFechas" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasDescClaveCleinte" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasClaveCliente"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasClaveContrato"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasDescTipoPaquete" Text="Tipo de Paquete:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasTipoPaquete"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasDescGrupoAeronave" Text="Grupo de Aeronave:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasGrupoAeronave"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <br />
                                            <table width="100%">
                                                <tr>
                                                    <td colspan="2">
                                                        <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGirasGirayFechaPico" Text="Giras y Fechas Pico"></dx:ASPxLabel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGirasCondicionesGiraEspera" Text="Condiciones de Aplicación de Gira x Espera"></dx:ASPxLabel>
                                                        </div>
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGirasCondicionesGiraEsper" Text="Condiciones de Aplicación de Gira x Horario"></dx:ASPxLabel>
                                                        </div>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionEspera1" Text="1.- Vuelo sale de base y regresa a base el mismo día"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionHora1" Text="1.- Vuelo sale de base y regresa a base el mismo día"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionEspera2" Text="2.- Tener 2 o más piernas"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionHora2" Text="2.- Tener 2 o más piernas"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionEspera3" Text="3.- Todas las piernas deben llevar Pax"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionHora3" Text="3.- Todas las piernas deben llevar Pax"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionEspera4" Text="4.- Tiempo no exceda el doble o triple o cuadruple del  tiempo de vuelo según se especifique."></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionHora4" Text="4.- Vuelo se debe realizar dentro de un rango  de horario  de salida y regreso del vuelo"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionEspera5" Text="Si cumple las condiciones  aplica el factor especificado  a las horas de vuelo"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-10">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraCondicionHora5" Text="Si cumple las condiciones  aplica el factor especificado  a las horas de vuelo"></dx:ASPxLabel>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <asp:Panel id="PanelAplicaGira" runat="server" CssClass="col-md-12">
                                            <fieldset class="Personal1">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGirasAplicaGiraEspera" Text="Aplica Gira X Espera"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxCheckBox Theme="Office2010Black" runat="server" ID="chkGirasAplicaEspera" OnCheckedChanged="chkGirasAplicaEspera_CheckedChanged" AutoPostBack="true">
                                                                <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraNumeroVesesTiempoVuelo" Text="Número de veces de tiempo de vuelo"></dx:ASPxLabel>
                                                        </td>
                                                        <td colspan="2">
                                                            <dx:ASPxSpinEdit Theme="Office2010Black" runat="server" ID="spnGiraNumeroVesesTiempoVuelo" AllowUserInput="false" ShowOutOfRangeWarning="false" MinValue="1" MaxValue="100" AllowNull="false">
                                                                <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom"></ValidationSettings>
                                                                <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraAplicaHora" Text="Aplica Gira X Horario"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxCheckBox Theme="Office2010Black" runat="server" ID="chkGiraAplicaHorario" AutoPostBack="true" OnCheckedChanged="chkGiraAplicaHorario_CheckedChanged">
                                                                <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraHoraInicio" Text="Hora de Inicio"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox runat="server" Theme="Office2010Black" ID="txtGiraHoraInicio">
                                                                <ValidationSettings ErrorDisplayMode="Text" ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ValidationExpression="^[0-2][0-9]:[0-5][0-9]$"></RegularExpression>
                                                                </ValidationSettings>
                                                                <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td>
                                                            <div class="col-sm-6">
                                                                <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraHoraFin" Text="Hora de Fin"></dx:ASPxLabel>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <dx:ASPxTextBox runat="server" Theme="Office2010Black" ID="txtGiraHoraFin">
                                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ValidationExpression="^[0-2][0-9]:[0-5][0-9]$"></RegularExpression>
                                                                    </ValidationSettings>
                                                                    <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                                </dx:ASPxTextBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGirasPorcentajesDescuentoHoras" Text="% de descuento a las horas"></dx:ASPxLabel>
                                                        </td>
                                                        <td colspan="2">
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtGirasPorcentajesDescuentoHoras">
                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                </ValidationSettings>
                                                                <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </asp:Panel>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <asp:Panel id="PanelAplicaFactor" runat="server" CssClass="col-md-12">
                                            <fieldset class="Personal1">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraAplicaFactorFechaPico" Text="Aplica Factor x Fecha Pico"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxCheckBox Theme="Office2010Black" runat="server" AutoPostBack="true" OnCheckedChanged="ChkGiraAplicaFactorFechaPico_CheckedChanged" ID="ChkGiraAplicaFactorFechaPico">
                                                                <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblGiraFactorFechaPico" Text="Factor x Fecha Pico"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtGiraFactorFechaPico">
                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                </ValidationSettings>
                                                                <ReadOnlyStyle BackColor="#eeeeee"></ReadOnlyStyle>
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <br />
                                                <div class="row">

                                                    <div class="col-sm-10">
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <dx:ASPxLabel runat="server" ID="lblGirasFechaPicoNotas" Text="Notas:" Theme="Office2010Black"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxMemo runat="server" Native="false" ID="txtGirasFechaPicoMemo" Width="100%" Theme="Office2003Blue" Height="80px" MaxLength="500">
                                                                    </dx:ASPxMemo>
                                                                </td>
                                                                <td style="width: 10px;"></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-sm-2"></div>
                                                </div>
                                            </fieldset>
                                        </asp:Panel>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnAntGiras" Text="Anterior" Theme="Office2010Black" OnClick="btnAntGiras_Click" Style="margin-left: -15px;"></dx:ASPxButton>
                                            </div>
                                            <div class="col-sm-10"></div>
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnSigGiras" Text="Siguiente" Theme="Office2010Black" OnClick="btnSigGiras_Click" Style="margin-right: -15px;"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="6 Rangos Combustible" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:ASPxPanel ID="pnlRangosCombustible" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1" style="width: 102.5%; margin-left: -15px;">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosDescClaveCleinte" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosClaveCliente"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosClaveContrato"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosDescTipoPaquete" Text="Tipo de Paquete:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosTipoPaquete"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosDescGrupoAeronave" Text="Grupo de Aeronave:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblRangosGrupoAeronave"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <asp:Panel id="PanelRangoCombustible" runat="server" CssClass="row">
                                        <fieldset class="Personal1">
                                            <legend>
                                                <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Rangos de combustible</span>
                                            </legend>
                                            <div class="col-md-12">
                                                <dx:ASPxGridView ID="gvRangosCombustible" runat="server" ClientInstanceName="gvRangosCombustible"
                                                    AutoGenerateColumns="false"
                                                    OnCellEditorInitialize="gvRangosCombustible_CellEditorInitialize"
                                                    OnRowDeleting="gvRangosCombustible_RowDeleting"
                                                    OnRowUpdating="gvRangosCombustible_RowUpdating"
                                                    OnRowInserting="gvRangosCombustible_RowInserting"
                                                    OnRowValidating="gvRangosCombustible_RowValidating"
                                                    OnCommandButtonInitialize="gvRangosCombustible_CommandButtonInitialize"
                                                    Width="100%" KeyFieldName="IdRango"
                                                    Theme="Office2010Black">
                                                    <SettingsPager Visible="true" Position="TopAndBottom" ShowSeparators="true" Summary-Visible="true">
                                                        <PageSizeItemSettings Visible="true" Items="10,20,50,100">
                                                        </PageSizeItemSettings>
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="EditForm" EditFormColumnCount="2"></SettingsEditing>
                                                    <SettingsBehavior AllowGroup="False" AllowDragDrop="false"></SettingsBehavior>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="Grupo Modelo" VisibleIndex="2" FieldName="DescripcionGrupoModelo">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Grupo Modelo" VisibleIndex="3" Visible="false" FieldName="IdGrupoModelo">
                                                            <PropertiesComboBox>
                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                </ValidationSettings>
                                                            </PropertiesComboBox>

                                                            <EditFormSettings Visible="True"></EditFormSettings>
                                                            <PropertiesComboBox EnableSynchronization="False" NullText="Seleccione una opción"
                                                                EnableCallbackMode="true" CallbackPageSize="10">
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataTextColumn Caption="Desde" VisibleIndex="5" FieldName="Desde">
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                    <RegularExpression ErrorText="Error en la informaci&#243;n ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?"></RegularExpression>

                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>

                                                            <EditFormSettings Visible="True"></EditFormSettings>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Hasta" VisibleIndex="6" FieldName="Hasta">
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Incremento" VisibleIndex="7" FieldName="Incremento">
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                    <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewCommandColumn ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" ShowNewButtonInHeader="True" ShowInCustomizationForm="True" VisibleIndex="8"></dx:GridViewCommandColumn>
                                                        <dx:GridViewDataComboBoxColumn FieldName="idTipo" Caption="Tipo" VisibleIndex="4">
                                                            <PropertiesComboBox ValueType="System.Int32">
                                                                <Items>
                                                                    <dx:ListEditItem Text="Nacional" Value="1"></dx:ListEditItem>
                                                                    <dx:ListEditItem Text="Internacional" Value="2"></dx:ListEditItem>
                                                                </Items>

                                                                <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                                    <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                </ValidationSettings>
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <UpdateButton Text="Guardar"></UpdateButton>
                                                    </SettingsCommandButton>
                                                </dx:ASPxGridView>
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                            </div>
                                            <br />
                                            <div class="row">

                                                <div class="col-sm-10">
                                                    <table width="100%">
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel runat="server" ID="lblRangosCombustibleNotas" Text="Notas:" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxMemo runat="server" Native="false" ID="txtRangosCombustibleMemo" Width="100%" Theme="Office2003Blue" Height="80px" MaxLength="500">
                                                                </dx:ASPxMemo>
                                                            </td>
                                                            <td style="width: 10px;"></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="col-sm-2"></div>
                                            </div>

                                        </fieldset>
                                    </asp:Panel>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnAntRango" Text="Anterior" Theme="Office2010Black" OnClick="btnAntRango_Click" Style="margin-left: -15px;"></dx:ASPxButton>
                                            </div>
                                            <div class="col-sm-10"></div>
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnSigRango" Text="Siguiente" Theme="Office2010Black" OnClick="btnSigRango_Click" Style="margin-right: -15px;"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="7 Caracteristicas Especiales" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:ASPxPanel ID="PnlCaracteristicasEspeciales" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1" style="width: 102.5%; margin-left: -15px;">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasDescClaveCleinte" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasClaveCliente"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasClaveContrato"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasDescTipoPaquete" Text="Tipo de Paquete:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasTipoPaquete"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasDescGrupoAeronave" Text="Grupo de Aeronave:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCaracteristicasGrupoAeronave"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <asp:Panel id="PanelCaractEspeciales" runat="server" CssClass="row">
                                        <fieldset class="Personal1">
                                            <legend>
                                                <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Caracteristicas Especiales</span>
                                            </legend>
                                            <div class="row">
                                                <table width="98%">
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasTMSV" Text="Tiempo mínimo anticipado para solicitar vuelo desde base  (Hrs)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracteristicasTMSV" MaxLength="50"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="ASPxLabel9" Text="Tiempo mínimo anticipado para solicitar vuelo fuera de base nacional  (Hrs)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtTiempoMinSolVloFueraBase" MaxLength="5" MaskSettings-Mask="00:00"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasTMSVCA" Text="Tiempo mínimo anticipado para solicitar vuelo fuera de base Internacional  (Texto)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracteristicasTMSVCA" MaxLength="50"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasTiempoMinimoAnticipoSolicitud" Text="Tiempo mínimo anticipado para solicitar vuelo  en dia feriado  (Texto)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracteristicasTiempoMinimoAnticipoSolicitud" MaxLength="50"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="ASPxLabel11" Text="Rango de acomodo de vuelo en dia feriado  (Hrs)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtRangoAcomodoVloDiaFeriado" MaxLength="5" MaskSettings-Mask="00:00">
                                                                
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="ASPxLabel12" Text="Reprogramar salida antes de salida programada  (Hrs)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtReprogSalidaAntesProg" MaxLength="5" MaskSettings-Mask="00:00"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteriticasPenalizacionCancelacionExtemporaneaVuelo" Text="Penalización por cancelación extemporanea de vuelo"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div class="col-md-12">
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton runat="server" ID="rdlCaracteristicasPenalizacionCancelacionExtemporaneaVuelo" GroupName="CaracteristicasPenalizacionCancelacionExtemporaneaVuelo" Text="Si"></dx:ASPxRadioButton>
                                                                </div>
                                                                <div class="col-sm-2">
                                                                    <dx:ASPxRadioButton runat="server" ID="rdlCaracteristicasSinPenalizacionCancelacionExtemporaneaVuelo" GroupName="CaracteristicasPenalizacionCancelacionExtemporaneaVuelo" Text="No"></dx:ASPxRadioButton>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="ASPxLabel13" Text="Cancelación anticipada saliendo de base  (Hrs)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCancelacionAntSalBase" MaxLength="5" MaskSettings-Mask="00:00" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="ASPxLabel14" Text="Cancelación anticipada saliendo fuera de base  (Hrs)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCancelacionAntSalFueraBase" MaxLength="5" MaskSettings-Mask="00:00" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracterisiticasPenalizacionAle" Text="Penalización a Ale por incumplimiento del servicio (Texto)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracterisitcasCaracterisiticasPenalizacionAle" MaxLength="100" Width="100%"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracterisiticasPenalizacionCliente" Text="Penalización al cliente por demoras (Texto)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracterisiticasPenalizacionCliente" MaxLength="100" Width="100%"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasAntiguedad" Text="Antigüedad máxima de aeronave a asignar (Texto)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracterisiticasAñosAntiguedad" MaxLength="1"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasTMCV" Text="Tiempo mínimo para cancelación de vuelo (Texto)"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracteristicasTMCV" MaxLength="50"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasAcuerdosEspeciales" Text="Acuerdos Especiales"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxTextBox Theme="Office2010Black" runat="server" ID="txtCaracteristicasAcuerdosEspeciales" MaxLength="100" Width="100%"></dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasDerechosVuelosSimultaneos" Text="Derecho a vuelos simultáneos"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div class="col-md-12">
                                                                <div class="col-sm-1" style="text-align: left">
                                                                    <dx:ASPxCheckBox Theme="Office2010Black" runat="server" ID="chkCaracteristicasDerechosVuelosSimultaneos"></dx:ASPxCheckBox>
                                                                </div>
                                                                <div class="col-sm-2" style="text-align: right">
                                                                    <dx:ASPxLabel runat="server" Theme="Office2010Black" Text="Cuantos:"></dx:ASPxLabel>
                                                                </div>
                                                                <div class="col-sm-2" style="text-align: left">
                                                                    <dx:ASPxTextBox ID="txtCaracteristicasCuantos" runat="server" MaxLength="1" Theme="Office2010Black">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                                <div class="col-sm-3" style="text-align: right">
                                                                    <dx:ASPxLabel runat="server" Theme="Office2010Black" Text="Factor:"></dx:ASPxLabel>
                                                                </div>
                                                                <div class="col-sm-4" style="text-align: left">
                                                                    <dx:ASPxTextBox ID="txtFactorVueloSim" runat="server" MaxLength="5" Theme="Office2010Black">
                                                                        <ValidationSettings ErrorText="Error en la información ingresada" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RegularExpression ErrorText="Error en la información ingresada" ValidationExpression="[0-9]+(\.[0-9][0-9]?[0-9]?[0-9]?)?" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblCaracteristicasComentarios" Text="Comentario"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxMemo Theme="Office2010Black" runat="server" ID="txtCaracteristicasComentarios" MaxLength="1000" Width="100%" Height="100%"></dx:ASPxMemo>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <br />
                                            <div class="row">

                                                <div class="col-sm-10">
                                                    <table width="100%">
                                                        <tr>
                                                            <td align="left">
                                                                <dx:ASPxLabel runat="server" ID="lblCaracteristicasEspecialesNotas" Text="Notas:" Theme="Office2010Black"></dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxMemo runat="server" Native="false" ID="txtCaracteristicasEspecialesMemo" Width="100%" Theme="Office2003Blue" Height="80px" MaxLength="500">
                                                                </dx:ASPxMemo>
                                                            </td>
                                                            <td style="width: 10px;"></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="col-sm-2"></div>
                                            </div>

                                        </fieldset>
                                    </asp:Panel>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnAntCaracteristicas" Text="Anterior" Theme="Office2010Black" OnClick="btnAntCaracteristicas_Click" Style="margin-left: -15px;"></dx:ASPxButton>
                                            </div>
                                            <div class="col-sm-10"></div>
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnSigCaracteristicas" Text="Siguiente" Theme="Office2010Black" OnClick="btnSigCaracteristicas_Click" Style="margin-left: -15px;"></dx:ASPxButton>                                                
                                            </div>
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="8 Preferencias" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:ASPxPanel ID="pnlPreferencias" runat="server" Width="100%" BackColor="White">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <fieldset class="Personal1" style="width: 102.5%; margin-left: -15px;">
                                                <legend>
                                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                </legend>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasDescClaveCliente" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasClaveCliente"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasClaveContrato"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasDesTipoPaquete" Text="Tipo de Paquete:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasTipoPaquete"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasDescGrupoAeronave" Text="Grupo de Aeronave:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblPreferenciasGrupoAeronave"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <fieldset class="Personal1">
                                            <legend>
                                                <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Preferencias</span>
                                            </legend>
                                            <asp:Panel id="PanelPreferencias" runat="server" CssClass="row">
                                                <table>
                                                    <tr style="height: 40px">
                                                        <td style="width: 30px"></td>
                                                        <td style="text-align: left; width: 200px">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasPuntualidad" Text="Puntualidad"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciaPuntualidad" DropDownStyle="DropDownList" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Muy Puntual" />
                                                                    <dx:ListEditItem Value="2" Text="Puntual" />
                                                                    <dx:ListEditItem Value="3" Text="Impuntual" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width: 100px"></td>
                                                        <td style="text-align: left; width: 180px">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasTipoProteccion" Text="Tipo de Protección"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciaTipoProteccion" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Escoltas" />
                                                                    <dx:ListEditItem Value="2" Text="Escoltas con Avanzada" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width: 100px"></td>
                                                        <td style="text-align: left; width: 200px">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasFlexibilidadCambios"  Text="Flexibilidad en cambios"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasFlexibilidadCambios" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Flexible" />
                                                                    <dx:ListEditItem Value="2" Text="Flexible Condicionado" />
                                                                    <dx:ListEditItem Value="3" Text="Inflexible" />
                                                                </Items>
                                                            </dx:ASPxComboBox>

                                                        </td>
                                                    </tr>

                                                    <tr style="height: 40px">
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasMomentoSolicitaVuelo" Text="En qué momento solicita su vuelo"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasMomentoSolicitaVuelo" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Con más de una Semana" />
                                                                    <dx:ListEditItem Value="2" Text="En la semana (7 días)" />
                                                                    <dx:ListEditItem Value="3" Text="Ultimo momento" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasTamanioFamilia" Text="Tamaño de Familia"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasTamanioFamilia" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Pequeña (2-3)" />
                                                                    <dx:ListEditItem Value="2" Text="Mediana (4-6)" />
                                                                    <dx:ListEditItem Value="3" Text="Grande (6-9)" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasFBOAeropuertos" Text="Preferencias de FBO o aeropuertos"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasFBOAeropuertos" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Predeterminado" />
                                                                    <dx:ListEditItem Value="2" Text="El de su elección" />
                                                                    <dx:ListEditItem Value="3" Text="Indistinto" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 40px">
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasQuienRealizaReservaciones" Text="¿Quien realiza sus reservaciones?"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasQuienRealizaReservaciones" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Cliente directamente" />
                                                                    <dx:ListEditItem Value="2" Text="Asistente" />
                                                                    <dx:ListEditItem Value="3" Text="Ventas" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasPreferenciaContacto" Text="Preferencia de contacto"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasPreferenciaContacto" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                    <dx:ListEditItem Value="1" Text="Teléfono" />
                                                                    <dx:ListEditItem Value="2" Text="Correo electrónico" />
                                                                    <dx:ListEditItem Value="3" Text="WhatsApp" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasFavoresClienteALE" Text="Favores del Cliente a ALE"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasFavoresClienteALE" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 40px">
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasFavoresALECliente" Text="Favores de ALE al Cliente"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbxPreferenciasFavoresALECliente" runat="server" ValueType="System.String" NullText="Seleccione una opción" Theme="Office2010Black">
                                                                <Items>
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr style="height: 100px">
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasAnticipaServicios" Text="Anticipa sus servicios"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciasAnticipaServicios" ClientInstanceName="rdlPreferenciasAnticipaServicios" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Nunca" Value="1" />
                                                                        <dx:ListEditItem Text="Regularmente" Value="2" />
                                                                        <dx:ListEditItem Text="Siempre" Value="3" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasComisariatoEspecial" Text="Comisariato especial"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciasComisariatoEspecial" ClientInstanceName="rdlPreferenciasComisariatoEspecial" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                        <dx:ListEditItem Text="No" Value="2" />
                                                                        <dx:ListEditItem Text="A veces" Value="3" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciaPreocupaCosto" Text="Le preocupa el costo"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciaPreocupaCosto" ClientInstanceName="rdlPreferenciaPreocupaCosto" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                        <dx:ListEditItem Text="No" Value="2" />
                                                                        <dx:ListEditItem Text="En ocaciones" Value="3" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 100px">
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasMascotas" Text="Mascotas"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciasMascotas" ClientInstanceName="rdlPreferenciasMascotas" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                        <dx:ListEditItem Text="No" Value="2" />
                                                                        <dx:ListEditItem Text="A veces" Value="3" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciaServiciosOtroProveedor" Text="Usa los servicios de otro proveedor"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciaServiciosOtroProveedor" ClientInstanceName="rdlPreferenciaServiciosOtroProveedor" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                        <dx:ListEditItem Text="No" Value="2" />
                                                                        <dx:ListEditItem Text="A veces" Value="3" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasAeronavePropia" Text="Tiene aeronave propia"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciasAeronavePropia" ClientInstanceName="rdlPreferenciasAeronavePropia" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                        <dx:ListEditItem Text="No" Value="2" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 100px">
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasIntercambiospagosServicios" Text="Utiliza intercambios para pagos de servicios"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciasIntercambiospagosServicios" ClientInstanceName="rdlPreferenciasIntercambiospagosServicios" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                        <dx:ListEditItem Text="No" Value="2" />
                                                                        <dx:ListEditItem Text="A veces" Value="3" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align: left;">
                                                            <dx:ASPxLabel Theme="Office2010Black" runat="server" ID="lblPreferenciasTransporteTerrestreEspecial" Text="Transporte Terrestre Especial"></dx:ASPxLabel>
                                                        </td>
                                                         <td>
                                                            <div style="margin-left: 0px;">
                                                                <dx:ASPxRadioButtonList ID="rdlPreferenciasTransporteTerrestreEspecial" ClientInstanceName="rdlPreferenciasTransporteTerrestreEspecial" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                        <dx:ListEditItem Text="No" Value="2" />
                                                                        <dx:ListEditItem Text="A veces" Value="3" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </fieldset>
                                    </div>
                                     <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnAntPreferencias" Text="Anterior" Theme="Office2010Black" OnClick="btnAntPreferencias_Click" Style="margin-left: -15px;"></dx:ASPxButton>
                                            </div>
                                            <div class="col-sm-10"></div>
                                            <div class="col-sm-1">
                                                <dx:ASPxButton runat="server" ID="btnTerminar" Text="Guardar" Theme="Office2010Black" OnClick="btnTerminar_Click" Style="margin-right: -15px;"></dx:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>

    <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above" HeaderText="Aviso" AllowDragging="true" ShowCloseButton="true" Width="300">
        <ClientSideEvents PopUp="function(s, e) { tbLogin.Focus(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel2" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxImage ID="ASPxImage2" runat="server" ShowLoadingImage="true" ImageUrl="~/img/iconos/Information2.ico"></dx:ASPxImage>
                                        <dx:ASPxTextBox ID="tbLogin" ReadOnly="true" Border-BorderStyle="None" Height="1px" runat="server" Width="1px" ClientInstanceName="tbLogin"></dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbl" runat="server" ClientInstanceName="lbl" Text="ASPxLabel"></dx:ASPxLabel>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btOK" runat="server" Text="OK" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0">
                                            <ClientSideEvents Click="function(s, e) {popup.Hide(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                            <div>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


    <dx:ASPxPopupControl ID="ppFactorCombustible" runat="server" ClientInstanceName="popup" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above" HeaderText="Factor de Combustible" AllowDragging="true" ShowCloseButton="true" Width="300">
        <ClientSideEvents PopUp="function(s, e) { tbLogin.Focus(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlFactorCombustible" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table>
                                <tr>
                                    <td colspan="2" style="text-align:center">
                                        <asp:Label ID="lblTituloFactores" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="gvFactoresComb" runat="server" AutoGenerateColumns="false" CssClass="table"
                                            style="border-top: 1px solid #484848; border-left: 1px solid #484848;border-right: 1px solid #484848; border-bottom: 1px solid #484848;">
                                            <Columns>
                                                <asp:BoundField DataField="RangoInferior" HeaderText="Rango Inferior" />
                                                <asp:BoundField DataField="RangoSuperior" HeaderText="Rango Superior" />
                                                <asp:BoundField DataField="FactorAplicar" HeaderText="Factor Aplicar" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center">
                                        <dx:ASPxButton ID="btnCerrarFactores" runat="server" Text="Cerrar" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0">
                                            <ClientSideEvents Click="function(s, e) { ppFactorCombustible.Hide(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                            <div>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmExtensionesHorario.aspx.cs" Inherits="ALE_MexJet.Views.CreditoCobranza.frmExtensionesHorario" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Styles/Controls.css" />

    <style type="text/css">
        .bordes td {
            border: solid;
        }

         .t:disabled { 
             background: #000000;
         }

    </style>
    <script type="text/javascript">
        function CerrarModalCorreo() {

            ppEnviarMailReporte.Hide();


        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxPanel ID="pnlPrincipal" runat="server" Width="100%" BackColor="White" Style="border-radius: 14px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Solicitud de Extensión de Servicios</span>
                    </div>
                </div>
                <br />

                <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />

                <asp:UpdatePanel ID="upaPrincipal" runat="server" OnUnload="upaPrincipal_Unload">
                    <ContentTemplate>
                        <asp:Panel ID="pnlPrincipalTrabajo" runat="server">
                            <table style="width: 100%">
                            <tr>
                                <td style="width: 5%"></td>
                                <td style="width: 90%">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 25%"></td>
                                            <td style="width: 25%"></td>
                                            <td style="width: 25%"></td>
                                            <td style="width: 25%"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <dx:ASPxLabel ID="lblDetalleVuelo" runat="server" Font-Size="Larger" Font-Bold="true" Text="Detalles de Vuelo" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblEstacion" runat="server" Text="Estación:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlEstacion" runat="server" Theme="Office2010Black" NullText="Seleccione una opción"
                                                    ClientInstanceName="ddlEstacion" OnItemsRequestedByFilterCondition="ddlOrigen_ItemsRequestedByFilterCondition"
                                                    OnItemRequestedByValue="ddlOrigen_ItemRequestedByValue" EnableCallbackMode="true">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                        <RequiredField ErrorText="El campo es requerido." IsRequired="true" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td colspan="2">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblAeropuertoOrigen" runat="server" Text="Procedencia:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlOrigen" runat="server" Theme="Office2010Black" NullText="Seleccione una opción"
                                                    ClientInstanceName="ddlOrigen" OnItemsRequestedByFilterCondition="ddlOrigen_ItemsRequestedByFilterCondition"
                                                    OnItemRequestedByValue="ddlOrigen_ItemRequestedByValue" EnableCallbackMode="true">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                        <RequiredField ErrorText="El campo es requerido." IsRequired="true" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td colspan="2">
                                                <dx:ASPxLabel ID="lblNombreAeropuertoO" runat="server" Text="" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblAeropuertoDestino" runat="server" Text="Destino:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlDestino" runat="server" Theme="Office2010Black" NullText="Seleccione una opción"
                                                    ClientInstanceName="ddlDestino" OnItemsRequestedByFilterCondition="ddlOrigen_ItemsRequestedByFilterCondition"
                                                    OnItemRequestedByValue="ddlOrigen_ItemRequestedByValue" EnableCallbackMode="true">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                        <RequiredField ErrorText="El campo es requerido." IsRequired="true" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td colspan="2">
                                                <dx:ASPxLabel ID="lblNombreAeropuertoD" runat="server" Text="" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblFechaVuelo" runat="server" Text="Fecha:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxDateEdit ID="txtFechaVuelo" runat="server" TimeSectionProperties-TimeEditProperties-EditFormat="Custom"
                                                    TimeSectionProperties-Visible="true" EditFormatString="dd/MM/yyyy hh:mm tt" Theme="Office2010Black">
                                                    <DropDownButton>
                                                        <Image IconID="scheduling_calendar_16x16"></Image>
                                                    </DropDownButton>
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                        <RequiredField IsRequired="true" ErrorText="El campo es requerido." />
                                                    </ValidationSettings>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dx:ASPxLabel ID="lblMatricula" runat="server" Text="Matricula:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlMatricula" runat="server" NullText="Seleccione una opción" Theme="Office2010Black"></dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblPiloto" runat="server" Text="Piloto:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlPiloto" runat="server" NullText="Seleccione una opción" Theme="Office2010Black">
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td>
                                                <dx:ASPxLabel ID="lblCopiloto" runat="server" Text="Copiloto:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlCopiloto" runat="server" NullText="Seleccione una opción" Theme="Office2010Black">
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 10px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblTipoSolicitud" runat="server" Text="Tipo de Solicitud:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlTipoSolicitud" runat="server" NullText="Seleccione una opción" Theme="Office2010Black">
                                                    <Items>
                                                        <dx:ListEditItem Text="Extensión" Value="1" />
                                                        <dx:ListEditItem Text="Antelación" Value="2" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td>
                                                <dx:ASPxLabel ID="lblTipoOperacion" runat="server" Text="Tipo de Operación:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlTipoOperacion" runat="server" NullText="Seleccione una opción" Theme="Office2010Black">
                                                    <Items>
                                                        <dx:ListEditItem Text="Llegada" Value="1" />
                                                        <dx:ListEditItem Text="Salida" Value="2" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 10px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblCombustible" runat="server" Text="Combustible:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlCombustible" runat="server" NullText="Seleccione una opción" Theme="Office2010Black">
                                                    <Items>
                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                        <dx:ListEditItem Text="No" Value="2" />
                                                    </Items>
                                                      <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                        <RequiredField ErrorText="El campo es requerido." IsRequired="true" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td>
                                                <dx:ASPxLabel ID="lblEstatus" runat="server" Text="Estatus:" Theme="Office2010Black" Visible="false"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="ddlEstatus" runat="server" NullText="Seleccione una opción" Visible="false" Theme="Office2010Black">
                                                    <Items>
                                                        <dx:ListEditItem Text="Registrada" Value="1" />
                                                        <dx:ListEditItem Text="Modificada" Value="2" />
                                                        <dx:ListEditItem Text="Cancelada" Value="3" />
                                                    </Items>
                                                      <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                                        <RequiredField ErrorText="El campo es requerido." IsRequired="true" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 5%"></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 20px"></td>
                            </tr>
                            <tr>
                                <td style="width: 5%"></td>
                                <td style="width: 90%">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 25%"></td>
                                            <td style="width: 25%"></td>
                                            <td style="width: 25%"></td>
                                            <td style="width: 25%"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <dx:ASPxLabel ID="lblDetalleHorarios" runat="server" Font-Size="Larger" Font-Bold="true" Text="Detalles de Horarios"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 10px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblHorario" runat="server" Text="Horario UTC de Cierre / Apertura:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <dx:ASPxTextBox ID="txtTiempoAC" runat="server" NullText="00:00" Theme="Office2010Black">
                                                                <MaskSettings Mask="HH:mm" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <%--<td style="width:10%">
                                                            <dx:ASPxComboBox ID="ddlHorasA" runat="server" Theme="Office2010Black" Width="60px"></dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:1%">
                                                            :
                                                        </td>
                                                        <td style="width:89%">
                                                            <dx:ASPxComboBox ID="ddlMinutosA" runat="server" Theme="Office2010Black" Width="60px"></dx:ASPxComboBox>
                                                        </td>--%>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 10px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblMinutos" runat="server" Text="Duración (minutos):" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtMinutos" runat="server" Theme="Office2010Black" OnTextChanged="txtMinutos_TextChanged" AutoPostBack="true"></dx:ASPxTextBox>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 10px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblHorarioSolicitado" runat="server" Text="Horario UTC Solicitado:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td colspan="2">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="width: 30%">
                                                            <dx:ASPxLabel ID="lblTSalida" runat="server" Text="Salida:" Theme="Office2010Black"></dx:ASPxLabel>
                                                        </td>
                                                        <td style="width: 70%">
                                                            <dx:ASPxTextBox ID="txtTSalida" runat="server" NullText="00:00" Theme="Office2010Black">
                                                                <MaskSettings Mask="HH:mm" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <%--<td style="width:10%">
                                                            <dx:ASPxComboBox ID="ddlTSalidaH" runat="server" Width="50px" Theme="Office2010Black"></dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:1%">
                                                            :
                                                        </td>
                                                        <td style="width:59%; text-align:left">
                                                            <dx:ASPxComboBox ID="ddlTSalidaM" runat="server" Width="50px" Theme="Office2010Black"></dx:ASPxComboBox>
                                                        </td>--%>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 30%">
                                                            <dx:ASPxLabel ID="lblTLlegada" runat="server" Text="Llegada:" Theme="Office2010Black"></dx:ASPxLabel>
                                                        </td>
                                                        <td style="width: 70%">
                                                            <dx:ASPxTextBox ID="txtTLlegada" runat="server" NullText="00:00" Theme="Office2010Black">
                                                                <MaskSettings Mask="HH:mm" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <%--<td style="width:10%">
                                                            <dx:ASPxComboBox ID="ddlTLlegadaH" runat="server" Width="50px" Theme="Office2010Black"></dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:1%">
                                                            :
                                                        </td>
                                                        <td style="width:59%">    
                                                            <dx:ASPxComboBox ID="ddlTLlegadaM" runat="server" Width="50px" Theme="Office2010Black"></dx:ASPxComboBox>
                                                        </td>--%>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 10px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblMotivo" runat="server" Text="Motivo:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="txtMotivo" runat="server" Native="false" Width="100%" Theme="Office2010Black" Height="80px" MaxLength="500"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 10px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="lblPuesto" runat="server" Text="Puesto:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="txtPuesto" runat="server" Native="false" Width="100%" Theme="Office2010Black" Height="80px" MaxLength="500"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 5%"></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Theme="Office2010Black"></dx:ASPxButton>
                                    <dx:ASPxButton ID="btnImprimir" runat="server" Text="Imprimir" OnClick="btnImprimir_Click" Theme="Office2010Black"></dx:ASPxButton>
                                    <dx:ASPxButton ID="btnEnviar" runat="server" Text="Enviar" Theme="Office2010Black" ClientSideEvents-Click="function(s, e) 
                                                                 {
                                                                    ppEnviarMailReporte.Show(); 

                                                                    txtPara.SetText('');
                                                                    txtConCopia.SetText('');
                                                                    txtConCopiaOculta.SetText('');
                                                                    memoObservaciones.SetText('');

                                                                 }">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnImprimir" />
                    </Triggers>
                </asp:UpdatePanel>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <dx:ASPxPopupControl ID="ppEnviarMailReporte" runat="server" ClientInstanceName="ppEnviarMailReporte" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="Enviar Correo" AllowDragging="True" Theme="Office2010Black" Width="600px" Height="150px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlModal" runat="server" DefaultButton="btnEnviarMail">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel runat="server" ID="lblPara" Text="Para:" Height="30px" Width="30px"></dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtPara" runat="server" Width="100%" Theme="Office2010Black" ClientInstanceName="txtPara">
                                            <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                <RegularExpression ErrorText="Correo invalido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            </ValidationSettings>
                                            <InvalidStyle BackColor="LightPink" />
                                        </dx:ASPxTextBox>
                                        <br />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel ID="lblConCopia" runat="server" Theme="Office2010Black" Text="CC:" Height="30px" Width="30px"></dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtConCopia" runat="server" Width="100%" Theme="Office2010Black" ClientInstanceName="txtConCopia">
                                            <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                <RegularExpression ErrorText="Correo invalido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            </ValidationSettings>
                                            <InvalidStyle BackColor="LightPink" />
                                        </dx:ASPxTextBox>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel ID="lblConCopiaOculta" runat="server" Theme="Office2010Black" Text="CCO:" Height="30px" Width="30px"></dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtConCopiaOculta" runat="server" Width="100%" Theme="Office2010Black" ClientInstanceName="txtConCopiaOculta">
                                            <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                <RegularExpression ErrorText="Correo invalido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            </ValidationSettings>
                                            <InvalidStyle BackColor="LightPink" />
                                        </dx:ASPxTextBox>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="lblObservaciones" runat="server" Theme="Office2010Black" Text="Observaciones:" Visible="true"></dx:ASPxLabel>
                                    </td>
                                    <td style="width: 100%">
                                        <dx:ASPxMemo ID="memoObservaciones" runat="server" Text="" NullText="Agregue alguna observación." Width="100%" Height="100px" Theme="Office2010Black" Visible="true" MaxLength="1000" ClientInstanceName="memoObservaciones">
                                        </dx:ASPxMemo>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: center; width: 100%">
                                <table style="margin: 0px 85px; width: 100%">
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0" ClientSideEvents-Click="function(s, e) 
                                                                 {
                                                                    ppEnviarMailReporte.Hide(); 
                                                                 }">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnEnviarMail" runat="server" Text="Enviar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0"
                                                OnClick="btnEnviarMail_Click">
                                                <ClientSideEvents Click="CerrarModalCorreo" />
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

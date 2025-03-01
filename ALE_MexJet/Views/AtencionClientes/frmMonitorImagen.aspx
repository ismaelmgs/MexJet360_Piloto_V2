﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmMonitorImagen.aspx.cs" Inherits="ALE_MexJet.Views.AtencionClientes.frmMonitorImagen" UICulture="es" Culture="es-MX" %>

<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showpp(x) {
            ppImg.SetHeaderText(x);
            ppImg.Show();
        }

        function showppC(x) {
            ppCheck.SetHeaderText(x);
            ppCheck.Show();
        }

        function hidepp() {
            ppImg.Hide();
        }

        function showalert() {
            popup.Show();
        }

        var editIndex;
        function OnBatchStartEditingGrid(s, e) {
            editIndex = e.visibleIndex;
        }

        function OnCheckContactChanged(s, e) {

            var changedValue = s.GetValue();
            var RowsVisibles = gvPersonas.GetVisibleRowsOnPage();
            if (changedValue) {
                for (var i = 0; i < RowsVisibles ; i++) {
                    if (editIndex == i)
                        gvPersonas.batchEditApi.SetCellValue(i, "Arrivo", false);
                }
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Monitor Imagen</span>
                    </div>
                </div>
                <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                <div class="row">
                    <div class="col-md-12">
                        <br />
                        <fieldset class="Personal">
                            <legend>
                                <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Búsqueda General</span>
                            </legend>
                            <div class="col-sm-12">
                                <table style="width: 100%">
                                    <tr>
                                        <td width="25%" align="center">
                                            <dx:ASPxTextBox ID="txtTextoBusqueda" runat="server" ToolTip="Texto de Busqueda" Width="200px" Theme="Office2010Black" NullText="Ingrese la información a buscar"></dx:ASPxTextBox>
                                        </td>
                                        <td width="25%" align="center">
                                            <dx:ASPxComboBox ID="ddlTipoBusqueda" runat="server" ToolTip="Tipo Búsqueda" NullText="Tipo de Búsqueda" Theme="Office2010Black" EnableTheming="True">
                                                <Items>
                                                    <dx:ListEditItem Text="Clave Contrato" Value="1"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Matrícula" Value="2"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Código  Cliente" Value="3"></dx:ListEditItem>
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </td>
                                        <td width="25%" align="center">
                                            <dx:ASPxDateEdit ToolTip="Fecha" ID="deFecha" ClientInstanceName="deFecha" NullText="Fecha de Búsqueda" runat="server" Theme="Office2010Black">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td width="25%" align="center">
                                            <dx:ASPxButton ID="btnBusqueda" Text="Buscar" Theme="Office2010Black" ToolTip="Buscar" runat="server" OnClick="btnBuscar_Click"></dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-12" style="margin-left: -15px; width: 103%;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnUnload="UpdatePanel1_Unload" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="col-sm-12">
                                    <dx:ASPxGridView ID="gvImagen" runat="server" AutoGenerateColumns="False" Font-Size="Small"
                                        ClientInstanceName="gvImagen" EnableTheming="True" KeyFieldName="IdTramo;TipoVuelo" ToolTip="Resultado" Styles-Header-HorizontalAlign="Center"
                                        Theme="Office2010Black" Width="100%" StylesPopup-EditForm-ModalBackground-Opacity="90" OnRowCommand="gvImagen_RowCommand">
                                        <Columns>
                                            <dx:GridViewDataColumn VisibleIndex="0" Caption="Tipo" HeaderStyle-HorizontalAlign="Center">
                                                <DataItemTemplate>
                                                    <dx:ASPxImage runat="server" ID="imgTemplate" Width="15px" Height="15px" ImageAlign="AbsMiddle"
                                                        ImageUrl='<%# "~/img/iconos/" + Eval("TipoVuelo") %>'>
                                                    </dx:ASPxImage>
                                                </DataItemTemplate>
                                            </dx:GridViewDataColumn>
                                            <dx:GridViewDataTextColumn Caption="Tipo Vuelo" FieldName="TipoVuelo" Visible="false" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="IdTramo" FieldName="IdTramo" ShowInCustomizationForm="True" Visible="false" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="TRIP" FieldName="DescTRIP" ShowInCustomizationForm="True" Visible="true" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Fecha" FieldName="FECHA" ShowInCustomizationForm="True" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy HH:mm">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Ruta" FieldName="RUTA" ShowInCustomizationForm="True" VisibleIndex="3" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Matrícula" FieldName="MATRICULA" ShowInCustomizationForm="True" VisibleIndex="4" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Código </br>  Cliente" FieldName="CODIGOCLIENTE" ShowInCustomizationForm="True" VisibleIndex="5" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="No. Solicitud" FieldName="IdSolicitud" Visible="true" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn Caption="Comisariato" FieldName="COMISARIATO" ShowInCustomizationForm="True" VisibleIndex="7" HeaderStyle-HorizontalAlign="Center">
                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                </PropertiesCheckEdit>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataCheckColumn Caption="Captura </br>Checklist" FieldName="CapturaCheck" ShowInCustomizationForm="True" VisibleIndex="8" HeaderStyle-HorizontalAlign="Center">
                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                </PropertiesCheckEdit>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn Caption="No PAX" FieldName="NOPAX" ShowInCustomizationForm="True" VisibleIndex="9" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataColumn Caption="Acciones">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <DataItemTemplate>
                                                    <dx:ASPxButton Text="Pasajeros" Theme="Office2010Black" ID="btn" runat="server" CommandArgument='<%# Eval("IdTramo") %>' CommandName="Seleccione" AutoPostBack="true" ToolTip="Personas">
                                                    </dx:ASPxButton>
                                                    <dx:ASPxButton Text="Preferencias" Theme="Office2010Black" ID="btnPreferencias" CommandArgument='<%# Eval("IdSolicitud") %>' runat="server" CommandName="Preferencias" AutoPostBack="true" ToolTip="Preferencias">
                                                    </dx:ASPxButton>
                                                    <dx:ASPxButton Text="Checklist" Theme="Office2010Black" ID="btnCheck" CommandArgument='<%# Eval("IdTramo") %>' runat="server" CommandName="Check" AutoPostBack="true" ToolTip="Checklist">
                                                    </dx:ASPxButton>
                                                    <dx:ASPxButton Text="Interiores" Theme="Office2010Black" ID="btnInteriores" CommandArgument='<%# Eval("IdTramo") %>' runat="server" CommandName="Interiores" AutoPostBack="true" ToolTip="Interiores">
                                                    </dx:ASPxButton>
                                                </DataItemTemplate>
                                            </dx:GridViewDataColumn>
                                        </Columns>
                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsPager Position="TopAndBottom" Visible="true">
                                            <PageSizeItemSettings Items="1, 10, 20, 50, 100" Visible="true">
                                            </PageSizeItemSettings>
                                        </SettingsPager>
                                        <Settings ShowGroupPanel="True" />
                                        <SettingsSearchPanel Visible="true" />
                                    </dx:ASPxGridView>
                                    <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvImagen">
                                    </dx:ASPxGridViewExporter>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnBusqueda" EventName="Click" />
                                <asp:PostBackTrigger ControlID="btnExcel" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div style="text-align: right">
                            <dx:ASPxLabel runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                            &nbsp;<dx:ASPxButton ID="btnExcel" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click" ToolTip="Exportar a Excel">
                            </dx:ASPxButton>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>

    <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above" HeaderText="Aviso" AllowDragging="true" ShowCloseButton="true" Width="300">
        <ClientSideEvents PopUp="function(s, e) { tbLogin.Focus(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" OnUnload="UpdatePanel1_Unload" UpdateMode="Always">
                    <ContentTemplate>
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
                                        <ClientSideEvents Click="function(s, e) {popup.Hide(); ppNotaInteriores.Hide(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ClientInstanceName="ppImg" Width="550px" Theme="Office2010Black" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above"
        ID="ppImg" runat="server" Modal="True" AllowDragging="true">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" OnUnload="UpdatePanel1_Unload" UpdateMode="Always">
                    <ContentTemplate>
                        <table style="width: 100%" id="tPersonas" runat="server">
                            <tr>
                                <td colspan="2">
                                    <fieldset>
                                        <legend>PAX</legend>
                                        <%--     <dx:ASPxGridView ID="gvPersonas" runat="server" AutoGenerateColumns="False" Font-Size="Small" ToolTip="Resultado" 
                                            ClientInstanceName="gvPersonas" EnableTheming="True" KeyFieldName="IdPax"  EnableRowsCache="false"
                                            OnCellEditorInitialize="gvPersonas_CellEditorInitialize"
                                            OnBatchUpdate="gvPersonas_BatchUpdate"  OnRowUpdating="gvPersonas_RowUpdating" Styles-Header-HorizontalAlign ="Center"      
                                            Theme="Office2010Black" Width="100%" >
                                              <ClientSideEvents BatchEditStartEditing="OnBatchStartEditingGrid" EndCallback ="function(s, e) {ppImg.Hide(); }"/>
                                                <Columns>
                                                <dx:GridViewDataTextColumn Caption="IdPax" FieldName="IdPax"  VisibleIndex="0" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre" Width="250px" FieldName="NombrePax" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center">
                                                         <EditFormSettings Visible="false" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn Caption="Arrivo" FieldName="Arrivo" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                                      <PropertiesCheckEdit AllowGrayed="true" AllowGrayedByClick="false" ValueChecked="1" ValueUnchecked="0" ValueType="System.Int32">
                                                    </PropertiesCheckEdit>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataTextColumn Caption="Hora llegada"  FieldName="HoraLlegada" VisibleIndex="3" HeaderStyle-HorizontalAlign="Center">
                                                    <PropertiesTextEdit   MaskSettings-Mask="HH:mm" >
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                              <SettingsPager Mode="ShowAllRecords">
                                              </SettingsPager>
                                              <SettingsPopup>
                                                <EditForm HorizontalAlign="WindowCenter" VerticalAlign="Middle" Width="400px" />
                                                <CustomizationWindow HorizontalAlign="WindowCenter" VerticalAlign="Middle"/>
                                              </SettingsPopup>
                                              <SettingsEditing  Mode="Batch"  BatchEditSettings-EditMode="Cell" BatchEditSettings-StartEditAction="Click"/>    
                                              <SettingsText CommandBatchEditUpdate="Guardar Configuración" Title="Acciones" CommandBatchEditCancel="Revertir Cambios" />
                                        </dx:ASPxGridView>--%>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <dx:ASPxButton ID="bNewPasajero" runat="server" Text="Nuevo Pasajero" Theme="Office2010Black" OnClick="bNewPasajero_Click"></dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </div>
                                                    </div>
                                                    <dx:ASPxGridView ID="gvPasajeros" runat="server" AutoGenerateColumns="False" Font-Size="Small"
                                                        ClientInstanceName="gvPasajeros" EnableTheming="True" KeyFieldName="IdPax"
                                                        OnCellEditorInitialize="gvPasajeros_CellEditorInitialize" OnRowDeleting="gvPasajeros_RowDeleting"
                                                        OnRowInserting="gvPasajeros_RowInserting" OnRowUpdating="gvPasajeros_RowUpdating"
                                                        OnStartRowEditing="gvPasajeros_StartRowEditing" OnRowValidating="gvPasajeros_RowValidating"
                                                        OnCustomButtonCallback="gvPasajeros_CustomButtonCallback" Styles-Header-HorizontalAlign="Center"
                                                        Theme="Office2010Black" Width="580px" OnCancelRowEditing="gvPasajeros_CancelRowEditing">
                                                        <ClientSideEvents EndCallback="function (s, e) {
                                                                                    if (s.cpShowPopup)
                                                                                    {
                                                                                        delete s.cpShowPopup;
                                                                                        lbl.SetText(s.cpText);
                                                                                        popup.Show();
                                                                                    }
                                                                                }" />
                                                        <Columns>

                                                            <dx:GridViewDataComboBoxColumn FieldName="NombrePax" Caption="Nombre Pax" VisibleIndex="0" Visible="true">
                                                                <PropertiesComboBox ValueField="NombrePax" ClientInstanceName="NombrePax"
                                                                    IncrementalFilteringMode="Contains"
                                                                    TextFormatString="{1}"
                                                                    DropDownStyle="DropDown"
                                                                    OnItemsRequestedByFilterCondition="Pasajeros_OnItemsRequestedByFilterCondition"
                                                                    OnItemRequestedByValue="Pasajeros_OnItemRequestedByValue"
                                                                    FilterMinLength="0"
                                                                    NullText="Seleccione una opción"
                                                                    EnableCallbackMode="true" CallbackPageSize="10">
                                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                                    </ValidationSettings>
                                                                    <ClientSideEvents EndCallback="function (s, e){
                                                                                 if(s.cpV2 == '1'){  delete s.cpV2; NombrePax.SetText('');}
                                                                                }" />
                                                                </PropertiesComboBox>
                                                                <EditFormSettings Visible="True"></EditFormSettings>
                                                            </dx:GridViewDataComboBoxColumn>

                                                            <dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones" ShowDeleteButton="True" CellStyle-CssClass="col-lg-6" ShowEditButton="True" ShowNewButton="false"
                                                                ShowInCustomizationForm="False" VisibleIndex="6">
                                                            </dx:GridViewCommandColumn>
                                                        </Columns>
                                                        <SettingsBehavior ConfirmDelete="True" />
                                                        <SettingsEditing Mode="Inline"></SettingsEditing>
                                                        <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />
                                                        <SettingsCommandButton>
                                                            <UpdateButton Text="Guardar">
                                                            </UpdateButton>
                                                            <CancelButton></CancelButton>
                                                            <EditButton>
                                                                <Image Height="20px" ToolTip="Modificar" Width="20px">
                                                                </Image>
                                                            </EditButton>
                                                            <DeleteButton>
                                                                <Image Height="20px" ToolTip="Eliminar" Width="20px">
                                                                </Image>
                                                            </DeleteButton>
                                                        </SettingsCommandButton>
                                                    </dx:ASPxGridView>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <br />
                                                <dx:ASPxButton ID="btnNuevoP" runat="server" Text="Alta Nuevo Pasajero" OnClick="btnNuevoP_Click" Theme="Office2010Black">
                                                </dx:ASPxButton>
                                                            <br />

                                                        </div>
                                                    </div>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 50px"></td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Tripulación</legend>
                                        <dx:ASPxGridView ID="gvTripulacion" runat="server" AutoGenerateColumns="False" Font-Size="Small" ToolTip="Resultado"
                                            ClientInstanceName="gvTripulacion" EnableTheming="True" EnableRowsCache="false" Styles-Header-HorizontalAlign="Center"
                                            Theme="Office2010Black" Width="100%">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="NOMBRE" VisibleIndex="0" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="TIPO" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                        </dx:ASPxGridView>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                        <br></br>
                        <table style="width: 100%" id="tPreferencias" runat="server">
                            <tr>
                                <td style="width: 25%; height: 100px;">Preferencias: </td>
                                <td>
                                    <dx:ASPxMemo Width="100%" Height="75px" ReadOnly="false" ID="mPreferencia" runat="server" ToolTip="Preferencia">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; height: 100px;">Comisariato: </td>
                                <td>
                                    <dx:ASPxMemo Width="100%" ReadOnly="false" Height="75px" ID="mComisariato" runat="server" ToolTip="Comisariato">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; height: 100px;">Notas: </td>
                                <td>
                                    <dx:ASPxMemo ID="mNota" ReadOnly="false" runat="server" Width="100%" Height="75px" ToolTip="Notas">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                        </table>

                        <br></br>
                        <div style="text-align: right">
                            <dx:ASPxButton ID="btnSalir" ClientInstanceName="btnSalir" ToolTip="Salir" runat="server" Text="Salir" Theme="Office2010Black">
                                <ClientSideEvents Click="function() {ppImg.Hide(); }" />
                            </dx:ASPxButton>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="ppAltaPasajeros" runat="server" ClientInstanceName="ppAltaPasajeros" Width="400px" Height="200px" CloseAction="CloseButton" CloseOnEscape="true" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" AllowDragging="true" HeaderText="Alta Pasajero">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel5" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <dx:ASPxLabel runat="server" Text="Nombre Pasajero:" Theme="Office2010Black">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtNombreP" ClientInstanceName="txtNombreP" runat="server" NullText="Nombre Pasajero" Theme="Office2010Black">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:15px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel runat="server" Text="Apellido Pasajero:" Theme="Office2010Black">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtApellidoP"  ClientInstanceName="txtApellidoP" runat="server" NullText="Apellido Pasajero" Theme="Office2010Black">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:15px"></td>
                                </tr>
                                <tr>
                                    <td >
                                        <dx:ASPxButton ID="btnguardaP" runat="server" Theme="Office2010Black" OnClick="btnguardaP_Click" Text="Guardar">
                                            <ClientSideEvents Click="function() { ppAltaPasajeros.Hide(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td >
                                        <dx:ASPxButton ID="btnCancelaP" runat="server" Theme="Office2010Black" Text="Cancelar">
                                           <ClientSideEvents Click="function() { ppAltaPasajeros.Hide(); txtApellidoP.SetText(''); txtNombreP.SetText('');  } " />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ClientInstanceName="ppCheck" Width="900px" Theme="Office2010Black" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above"
        ID="ppCheck" runat="server" Modal="True" AllowDragging="true">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" OnUnload="UpdatePanel1_Unload" UpdateMode="Always">
                    <ContentTemplate>
                        <table style="width: 100%" id="Table1" runat="server">
                            <tr>
                                <td>

                                    <dx:ASPxGridView ID="gvImgP" ClientInstanceName="gvImgP" runat="server" Styles-Header-HorizontalAlign="Center" Theme="Office2010Black"
                                        KeyFieldName="IdImagen" Width="100%"
                                        AutoGenerateColumns="False" Font-Size="Small" ToolTip="Resultado">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="IdImagen" FieldName="IdImagen" VisibleIndex="0" Visible="false" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Descripcion" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Asignada" FieldName="Asignada" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="IdPadre" FieldName="IdPadre" VisibleIndex="3" Visible="false" HeaderStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Templates>
                                            <DetailRow>
                                                <br />
                                                <dx:ASPxGridView ID="gvImgD" runat="server" KeyFieldName="IdImagenD;IdControl;IdTramo" OnBeforePerformDataSelect="gvImgD_BeforePerformDataSelect"
                                                    Width="100%" Styles-Header-HorizontalAlign="Center" Theme="Office2010Black" Font-Size="Small" AutoGenerateColumns="false"
                                                    OnCellEditorInitialize="gvImgD_CellEditorInitialize" OnBatchUpdate="gvImgD_BatchUpdate"
                                                    OnRowUpdating="gvImgD_RowUpdating">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="IdImagenD" FieldName="IdImagenD" VisibleIndex="0" Visible="false" HeaderStyle-HorizontalAlign="Center">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripción" FieldName="DescripcionD" VisibleIndex="1" HeaderStyle-HorizontalAlign="Center">
                                                            <EditFormSettings Visible="false" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Asignada" FieldName="AsignadaD" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                                            <EditFormSettings Visible="false" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="IdControl" FieldName="IdControl" VisibleIndex="3" Visible="false" HeaderStyle-HorizontalAlign="Center">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="IdSolicitud" FieldName="IdSolicitud" VisibleIndex="4" Visible="false" HeaderStyle-HorizontalAlign="Center">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataCheckColumn Caption="Abordado </br> Preflight" FieldName="AbordadoPre" VisibleIndex="5" HeaderStyle-HorizontalAlign="Center">
                                                        </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataMemoColumn Caption="Observaciones </br> Preflight" FieldName="ObservacionesPre" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center" PropertiesMemoEdit-NullDisplayText="" UnboundType="String">
                                                        </dx:GridViewDataMemoColumn>
                                                        <dx:GridViewDataCheckColumn Caption="Abordada </br> Postflight" FieldName="AbordadoPos" VisibleIndex="7" HeaderStyle-HorizontalAlign="Center">
                                                        </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataMemoColumn Caption="Observaciones </br> Postflight" FieldName="ObservacionesPos" VisibleIndex="8" HeaderStyle-HorizontalAlign="Center" PropertiesMemoEdit-NullDisplayText="" UnboundType="String">
                                                        </dx:GridViewDataMemoColumn>
                                                    </Columns>
                                                    <Settings ShowFooter="True" />
                                                    <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Cell" BatchEditSettings-StartEditAction="Click" />
                                                    <SettingsText CommandBatchEditUpdate="Guardar Checklist" Title="Acciones" CommandBatchEditCancel="Revertir Cambios" />
                                                </dx:ASPxGridView>
                                                <br />
                                            </DetailRow>
                                        </Templates>
                                        <SettingsDetail ShowDetailRow="true" />
                                        <Settings VerticalScrollBarMode="Auto" VerticalScrollableHeight="300" />
                                    </dx:ASPxGridView>

                                </td>
                            </tr>
                        </table>
                        </br>
                          <br></br>
                        <div style="text-align: right">
                            <dx:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="btnSalir" OnClick="ASPxButton1_Click" Text="Salir" Theme="Office2010Black" ToolTip="Salir">
                                <ClientSideEvents Click="function() {ppCheck.Hide(); }" />
                            </dx:ASPxButton>
                        </div>
                        </br>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="ppNotaInteriores" runat="server" ClientInstanceName="ppNotaInteriores" Width="400px" Height="200px" CloseAction="CloseButton" CloseOnEscape="true" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" AllowDragging="true" HeaderText="Interiores">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel2" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <dx:ASPxLabel runat="server" Text="Notas :" Theme="Office2010Black">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxMemo ClientInstanceName="mNotaI" ID="mNotaI" runat="server" Width="100%" Height="150px" Theme="Office2010Black">
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:15px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnAceptar" runat="server" ClientInstanceName="btnAceptar" Theme="Office2010Black" Text="Aceptar" OnClick="btnAceptar_Click">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnCancelar" runat="server" ClientInstanceName="btnCancelar" Theme="Office2010Black" Text="Cancelar">
                                            <ClientSideEvents Click="function(s,e){ ppNotaInteriores.Hide();  mNotaI.SetText(''); }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <asp:UpdatePanel ID="up" runat="server" OnUnload="UpdatePanel1_Unload">
        <ContentTemplate>
            <dx:ASPxHiddenField runat="server" ID="hfidSolicitud">
            </dx:ASPxHiddenField>
            <dx:ASPxHiddenField runat="server" ID="hfCheck">
            </dx:ASPxHiddenField>
            <dx:ASPxHiddenField runat="server" ID="hfImagen">
            </dx:ASPxHiddenField>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="frmPasajero.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Catalogos.frmPasajero" %>

<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="~/../../../JS/jquery/jquery-1.8.3.js"></script>
    <style type="text/css">
        
        .cColor1
        {
            background-color: white !important;
        }
        .cColor2
        {
            background-color: #cccccc  !important;
        }
    </style>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            txtTextoBusquedaHabilitar();
            $('.combo').change(txtTextoBusquedaHabilitar);
        };
        function txtTextoBusquedaHabilitar() {
            var filtro = $(".combo").find(':selected').val();
            if (filtro == 0 || filtro == 4 || filtro == 3) {
                $(".txtBusqueda").attr('disabled', '-1');
                $(".txtBusqueda").val('');
            }
            else
                $(".txtBusqueda").removeAttr('disabled');
        }
        //function OnSaveClick(s, e) {
        //    gvPasajero.UpdateEdit();
        //}
        function CerrarModalPerfilPasajero() {
            ModalPerfilPasajero.Hide();
        }
        function CambioValorAlergias() {

            var ValorSeleccionado = rdlAlergias.GetValue();

            var elem = txtAlergias.GetInputElement();

            if (ValorSeleccionado == "1") {

                txtAlergias.SetEnabled(true);
                
                $(elem).removeClass('cColor2');
                $(elem).addClass('cColor1');
            }
            else if (ValorSeleccionado == "2") {

                txtAlergias.SetEnabled(false);

                $(elem).removeClass('cColor1');
                $(elem).addClass('cColor2');
            }
        }
        function CondicionesMedicasEspeciales() {

            var ValorSeleccionado = rdlCondicionesMedicasEspeciales.GetValue();

            var elem = txtCondicionesMedicasEspeciales.GetInputElement();

            if (ValorSeleccionado == "1") {

                txtCondicionesMedicasEspeciales.SetEnabled(true);
                
                $(elem).removeClass('cColor2');
                $(elem).addClass('cColor1');
            }
            else if (ValorSeleccionado == "2") {

                txtCondicionesMedicasEspeciales.SetEnabled(false);
               
                $(elem).removeClass('cColor1');
                $(elem).addClass('cColor2');
            }

        }
        function CambioValorFobias() {

            var ValorSeleccionado = rdlFobias.GetValue();

            var elem = txtFobias.GetInputElement();

            if (ValorSeleccionado == "1") {

                txtFobias.SetEnabled(true);
                
                $(elem).removeClass('cColor2');
                $(elem).addClass('cColor1');
            }
            else if (ValorSeleccionado == "2") {

                txtFobias.SetEnabled(false);

                $(elem).removeClass('cColor1');
                $(elem).addClass('cColor2');
            }
        }


        function CambioValorMultipleNacionalidades() {

            var ValorSeleccionado = rdlMultipleNacionalidades.GetValue();

            var elem = txtMultipleNacionalidades.GetInputElement();

            if (ValorSeleccionado == "1") {

                txtMultipleNacionalidades.SetEnabled(true);
                
                $(elem).removeClass('cColor2');
                $(elem).addClass('cColor1');
            }
            else if (ValorSeleccionado == "2") {

                txtMultipleNacionalidades.SetEnabled(false);
                
                $(elem).removeClass('cColor1');
                $(elem).addClass('cColor2');
            }
        }
    </script>
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span class="FTitulo">&nbsp;&nbsp;Pasajero</span>
                    </div>
                </div>
                <div class="well-g">
                    <div class="row">
                        <div class="col-md-12">
                            <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                            <fieldset class="Personal">
                                <legend>
                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Búsqueda General</span>
                                </legend>
                                <div class="col-sm-12">
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtTextoBusqueda" CssClass="txtBusqueda" placeholder="Ingrese la información a buscar" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:DropDownList runat="server" CssClass="combo" ID="ddlTipoBusqueda">
                                            <asp:ListItem Text="[Sin Filtro]" Value="0" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="Nombre" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Codigo Cliente" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Solo activos" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Solo inactivos" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <dx:ASPxButton CssClass="FBotton" ID="btnBusqueda" Text="Buscar" runat="server" Theme="Office2010Black" OnClick="btnBusqueda_Click"></dx:ASPxButton>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <dx:ASPxButton CssClass="FBotton" ID="btnNuevo" runat="server" Text="Nuevo" Theme="Office2010Black" OnClick="btnNuevo_Click"></dx:ASPxButton>
                        </div>
                        <%--<div class="col-md-6" style="text-align: right;">
                            <dx:ASPxLabel CssClass="FExport" runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                            &nbsp;<dx:ASPxButton CssClass="FBotton" ID="btnExcel" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExcel_Click"></dx:ASPxButton>
                        </div>--%>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12" style="margin-left: -15px; width: 103%;">
                            <asp:UpdatePanel runat="server" UpdateMode="Always" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <div class="col-sm-12">
                                        <dx:ASPxGridView CssClass="FGrid" ID="gvPasajero" runat="server" AutoGenerateColumns="False"
                                            ClientInstanceName="gvCliente" EnableTheming="True" KeyFieldName="IdPasajero"
                                            Styles-Header-HorizontalAlign="Center"
                                            Theme="Office2010Black" Width="100%" OnRowCommand="gvPasajero_RowCommand">
                                            <ClientSideEvents EndCallback="function (s, e) {
                                        if (s.cpShowPopup)
                                        {
                                            delete s.cpShowPopup;
                                            lbl.SetText(s.cpText);
                                            popup.Show();
                                        }
                                    }" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="CodigoCliente" ShowInCustomizationForm="True" Caption="Código Cliente" VisibleIndex="0">
                                                    <%-- <PropertiesTextEdit MaxLength="5">
                                                        <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>--%>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Nombre" FieldName="first_name" VisibleIndex="1">
                                                    <%--<PropertiesComboBox>
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" ErrorText="Error en la informaci&#243;n ingresada.">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                    <EditFormSettings Visible="False" VisibleIndex="1" />--%>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="last_name" ShowInCustomizationForm="True" Caption="Apellidos" VisibleIndex="2">
                                                    <%--<PropertiesTextEdit MaxLength="200">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>--%>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Estatus" FieldName="Status" VisibleIndex="3">
                                                    <PropertiesComboBox TextField="CategoryName" ValueField="Status" ValueType="System.Int32" NullText="Seleccione una opci&#243;n">
                                                        <%--<ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        </ValidationSettings>--%>
                                                        <Items>
                                                            <dx:ListEditItem Text="Inactivo" Value="0" />
                                                            <dx:ListEditItem Text="Activo" Value="1" />
                                                        </Items>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <%--<dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones" ShowDeleteButton="True" ShowEditButton="True" ShowNewButton="false"
                                                    ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <CustomButtons>
                                                    <dx:GridViewCommandColumnCustomButton Styles-Style-CssClass="FBotton" Text="Contactos" Image-ToolTip="Contactos y Preferencias" />
                                                   </CustomButtons>
                                                </dx:GridViewCommandColumn>--%>
                                                <dx:GridViewDataColumn Caption="Acciones" Visible="true" VisibleIndex="4" CellStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <DataItemTemplate>
                                                        <dx:ASPxButton Text="Editar" CssClass="FBotton" Theme="Office2010Black" ID="btnEditar" runat="server" CommandArgument='<%# Eval("IdPasajero") %>' CommandName="Edita" AutoPostBack="true" ToolTip="Edita Pasajero" HorizontalAlign="Center">
                                                        </dx:ASPxButton>
                                                        <dx:ASPxButton Text="Eliminar" CssClass="FBotton" Theme="Office2010Black" ID="btnEliminar" runat="server" CommandArgument='<%# Eval("IdPasajero") %>' CommandName="Elimina" AutoPostBack="true" ToolTip="Elimina Pasajero" HorizontalAlign="Center">
                                                            <ClientSideEvents Click="function(s, e){  e.processOnServer = confirm('¿Está seguro que desea eliminar el registro?');}" />
                                                        </dx:ASPxButton>
                                                    </DataItemTemplate>
                                                    <EditFormSettings Visible="false" />
                                                </dx:GridViewDataColumn>
                                            </Columns>
                                            <%--<SettingsBehavior ConfirmDelete="True" />--%>
                                            <StylesPager Pager-CssClass="FNumPag"></StylesPager>
                                            <SettingsPager Position="TopAndBottom">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <%--<SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>--%>
                                            <Settings ShowGroupPanel="True" />
                                            <%--<SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />--%>
                                            <%--<SettingsPopup>--%>
                                            <%--<EditForm HorizontalAlign="Center" VerticalAlign="Above" Modal="true" CloseOnEscape="True" Width="400px" />--%>
                                            <%--</SettingsPopup>--%>
                                            <SettingsSearchPanel Visible="true" />
                                            <%-- <SettingsCommandButton>
                                                <UpdateButton Text="Guardar">
                                                </UpdateButton>
                                                <CancelButton></CancelButton>--%>
                                            <%--<EditButton Styles-Style-CssClass="FBotton">
                                                    <Image Height="20px" ToolTip="Modificar" Width="20px">
                                                    </Image>
                                                </EditButton>--%>
                                            <%--<DeleteButton Styles-Style-CssClass="FBotton">
                                                    <Image Height="20px" ToolTip="Eliminar" Width="20px">
                                                    </Image>
                                                </DeleteButton>--%>
                                            <%--</SettingsCommandButton>--%>
                                            <%--<Templates>
                                                <EditForm>
                                                    <dx:ASPxPanel runat="server" DefaultButton="Update">
                                                        <PanelCollection>
                                                            <dx:PanelContent>
                                                                <dx:ASPxGridViewTemplateReplacement ID="EditFormEditors" ReplacementType="EditFormEditors" runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                                <div class="row">
                                                                    <table>
                                                                        <tr>
                                                                            <td width="50%">&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxButton runat="server" CssClass="UpdatePersonal" ID="Update" Theme="Office2010Black" UseSubmitBehavior="true" AutoPostBack="false" Text="Guardar" Style="padding: 2px; margin-right: 2px; margin-left: 12px; font-size: 12px;">
                                                                                    <ClientSideEvents Click="function (s, e) { OnSaveClick(s, e); }" />
                                                                                </dx:ASPxButton>
                                                                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                                </ContentTemplate>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxPanel>
                                                </EditForm>
                                            </Templates>--%>
                                        </dx:ASPxGridView>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo2" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnBusqueda" EventName="Click" />
                                    <%--<asp:PostBackTrigger ControlID="btnExcel" />
                                    <asp:PostBackTrigger ControlID="btnExportar" />--%>
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6">
                            <dx:ASPxButton CssClass="FBotton" ID="btnNuevo2" runat="server" Text="Nuevo" Theme="Office2010Black" OnClick="btnNuevo_Click"></dx:ASPxButton>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right;">
                            <dx:ASPxLabel CssClass="FExport" runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                            &nbsp;<dx:ASPxButton CssClass="FBotton" ID="btnExportar" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton>
                        </div>--%>
                    </div>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
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

    <dx:ASPxPopupControl ID="ModalPerfilPasajero" runat="server" ClientInstanceName="ModalPerfilPasajero" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="Perfil del Pasajero" AllowDragging="True" Theme="Office2010Black" Width="1300px" Height="550px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlPerfilPasajero" runat="server" DefaultButton="btnGuardarPerfilPasajero" BackColor="White">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset class="Personal1" style="width: 102.5%; margin-left: -15px;">
                                        <legend>
                                            <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Datos del Pasajero</span>
                                        </legend>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                                                <dx:ASPxLabel runat="server" ID="lblClaveCliente1" Text="Código Cliente: " Height="17px" Width="95px" Font-Bold="true"></dx:ASPxLabel>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: -200px; margin-right: auto; vertical-align: middle;">
                                                                <dx:ASPxLabel runat="server" ID="lblClaveCliente2" Text="" Height="15px" Width="245px"></dx:ASPxLabel>
                                                            </div>
                                                            <dx:ASPxComboBox ID="cbxCodigoCliente" runat="server" ValueType="System.String" Visible="false" NullText="Seleccione una opci&#243;n"></dx:ASPxComboBox>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                                                <dx:ASPxLabel runat="server" ID="lblNombrePasajero1" Text="Nombre Pasajero: " Height="17px" Width="110px" Font-Bold="true"></dx:ASPxLabel>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: -140px; margin-right: auto; vertical-align: middle;">
                                                                <dx:ASPxLabel runat="server" ID="lblNombrePasajero2" Text="" Height="17px" Width="245px"></dx:ASPxLabel>
                                                            </div>
                                                            <dx:ASPxTextBox ID="txtNombrePasajero" runat="server" Width="245px" Theme="Office2010Black" MaxLength="500" Visible="false">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                                                <dx:ASPxLabel runat="server" ID="lblApellidosPasajero1" Text="Apellidos Pasajero: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: -140px; margin-right: auto; vertical-align: middle;">
                                                                <dx:ASPxLabel runat="server" ID="lblApellidosPasajero2" Text="" Height="17px" Width="245px"></dx:ASPxLabel>
                                                            </div>
                                                            <dx:ASPxTextBox ID="txtApellidosPasajero" runat="server" Width="250px" Theme="Office2010Black" MaxLength="500" Visible="false">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                            <br />
                                                            <div style="margin-left: -36px; margin-right: auto; vertical-align: middle;">
                                                                <dx:ASPxLabel runat="server" ID="lblEstatus" Text="Estatus: " Height="17px" Width="100px" Font-Bold="true"></dx:ASPxLabel>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <br />
                                                            <br />
                                                            <dx:ASPxComboBox ID="cbxEstatus" runat="server" ValueType="System.String" NullText="Seleccione una opci&#243;n">
                                                                <Items>
                                                                    <dx:ListEditItem Text="Inactivo" Value="0" />
                                                                    <dx:ListEditItem Text="Activo" Value="1" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <fieldset class="Personal1">
                                    <legend>
                                        <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Perfil</span>
                                    </legend>
                                    <div class="row">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <div style="margin-left: -75px; margin-right: auto; vertical-align: middle;">
                                                        <dx:ASPxLabel runat="server" ID="lblPasatiempo" Text="Pasatiempo:" Height="30px" Width="50px" Font-Bold="true"></dx:ASPxLabel>
                                                    </div>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtPasatiempo" runat="server" Width="240px" Theme="Office2010Black" MaxLength="500">
                                                    </dx:ASPxTextBox>
                                                    <br />
                                                </td>
                                                <td></td>
                                                <td>
                                                    <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblPerfilLinkedin" runat="server" Theme="Office2010Black" Text="Perfil de LinkedIn:" Height="30px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                    </div>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtPerfilLinkedin" runat="server" Width="240px" Theme="Office2010Black" MaxLength="200">
                                                    </dx:ASPxTextBox>
                                                    <br />
                                                </td>
                                                <td></td>
                                                <td>
                                                    <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblPerfilFacebook" runat="server" Theme="Office2010Black" Text="Perfil de Facebook:" Height="30px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                    </div>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtPerfilFacebook" runat="server" Width="240px" Theme="Office2010Black" MaxLength="200">
                                                    </dx:ASPxTextBox>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblPerfilInstragram" runat="server" Theme="Office2010Black" Text="Perfil de Instagram:" Height="30px" Width="150px" Font-Bold="true"></dx:ASPxLabel>
                                                    </div>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtPerfilInstragram" runat="server" Width="240px" Theme="Office2010Black" MaxLength="200">
                                                    </dx:ASPxTextBox>
                                                    <br />
                                                </td>
                                                <td></td>
                                                <td>
                                                    <div style="margin-left: -8px; margin-right: auto; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblPerfilTwitter" runat="server" Theme="Office2010Black" Text="Perfil de Twitter:" Height="30px" Width="115px" Font-Bold="true"></dx:ASPxLabel>
                                                    </div>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtPerfilTwitter" runat="server" Width="240px" Theme="Office2010Black" MaxLength="200">
                                                    </dx:ASPxTextBox>
                                                    <br />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div style="margin-left: 23px;">
                                                        <dx:ASPxRadioButtonList ID="rdlAlergias" ClientInstanceName="rdlAlergias" runat="server" SelectedIndex="0" Caption="Alergias:">
                                                            <Items>
                                                                <dx:ListEditItem Text="Si" Value="1" />
                                                                <dx:ListEditItem Text="No" Value="2" />
                                                            </Items>
                                                            <CaptionSettings Position="Top" />
                                                            <ClientSideEvents SelectedIndexChanged="CambioValorAlergias" />
                                                        </dx:ASPxRadioButtonList>
                                                    </div>
                                                </td>
                                                <td style="text-align: left">
                                                    <div style="margin-left: 10px; margin-right: auto; margin-top: 20px; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblCualesAlergias" runat="server" Theme="Office2010Black" Text="¿Cuales?: " Width="10px" Visible="true"></dx:ASPxLabel>
                                                        <dx:ASPxTextBox ID="txtAlergias" ClientInstanceName="txtAlergias" runat="server" Width="400px" Theme="Office2010Black" MaxLength="500" Visible="true">
                                                        </dx:ASPxTextBox>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="margin-left: 158px;">
                                                        <dx:ASPxRadioButtonList ID="rdlCondicionesMedicasEspeciales" ClientInstanceName="rdlCondicionesMedicasEspeciales" runat="server" SelectedIndex="0" Caption="Condiciones Médicas Especiales:">
                                                            <Items>
                                                                <dx:ListEditItem Text="Si" Value="1" />
                                                                <dx:ListEditItem Text="No" Value="2" />
                                                            </Items>
                                                            <CaptionSettings Position="Top" />
                                                            <ClientSideEvents SelectedIndexChanged="CondicionesMedicasEspeciales" />
                                                        </dx:ASPxRadioButtonList>
                                                    </div>
                                                </td>
                                                <td style="text-align: left">
                                                    <div style="margin-left: -125px; margin-right: auto; margin-top: 33px; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblCondicionesMedicasEspeciales" runat="server" Theme="Office2010Black" Text="¿Cuales?: " Height="13px" Width="70px" Visible="true"></dx:ASPxLabel>
                                                        <dx:ASPxTextBox ID="txtCondicionesMedicasEspeciales" ClientInstanceName="txtCondicionesMedicasEspeciales" runat="server" Width="400px" Theme="Office2010Black" MaxLength="500" Visible="true">
                                                        </dx:ASPxTextBox>
                                                    </div>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                    <div style="margin-left: 23px;">
                                                        <dx:ASPxRadioButtonList ID="rdlFobias" ClientInstanceName="rdlFobias" runat="server" SelectedIndex="0" Caption="Fobias:">
                                                            <Items>
                                                                <dx:ListEditItem Text="Si" Value="1" />
                                                                <dx:ListEditItem Text="No" Value="2" />
                                                            </Items>
                                                            <CaptionSettings Position="Top" />
                                                            <ClientSideEvents SelectedIndexChanged="CambioValorFobias" />
                                                        </dx:ASPxRadioButtonList>
                                                    </div>
                                                </td>
                                                <td style="text-align: left">
                                                    <div style="margin-left: 10px; margin-right: auto; margin-top: 33px; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblCualesFobias" runat="server" Theme="Office2010Black" Text="¿Cuales?: " Height="13px" Width="10px" Visible="true"></dx:ASPxLabel>
                                                        <dx:ASPxTextBox ID="txtFobias" ClientInstanceName="txtFobias" runat="server" Width="400px" Theme="Office2010Black" MaxLength="500" Visible="true">
                                                        </dx:ASPxTextBox>
                                                    </div>
                                                </td>
                                                <td>
                                                    <br />
                                                    <div style="margin-left: 158px;">
                                                        <dx:ASPxRadioButtonList ID="rdlMultipleNacionalidades" ClientInstanceName="rdlMultipleNacionalidades" runat="server" SelectedIndex="0" Caption="Tiene multiples nacionalidades:">
                                                            <Items>
                                                                <dx:ListEditItem Text="Si" Value="1" />
                                                                <dx:ListEditItem Text="No" Value="2" />
                                                            </Items>
                                                            <CaptionSettings Position="Top" />
                                                            <ClientSideEvents SelectedIndexChanged="CambioValorMultipleNacionalidades" />
                                                        </dx:ASPxRadioButtonList>
                                                    </div>
                                                </td>
                                                <td style="text-align: left">
                                                    <div style="margin-left: -125px; margin-right: auto; margin-top: 50px; vertical-align: middle;">
                                                        <dx:ASPxLabel ID="lblMultipleNacionalidades" runat="server" Theme="Office2010Black" Text="¿Cuales?: " Height="13px" Width="70px" Visible="true"></dx:ASPxLabel>
                                                        <dx:ASPxTextBox ID="txtMultipleNacionalidades" ClientInstanceName="txtMultipleNacionalidades" runat="server" Width="400px" Theme="Office2010Black" MaxLength="500" Visible="true">
                                                        </dx:ASPxTextBox>
                                                    </div>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 25%">
                                                    <br />
                                                    <div style="margin-left: 23px;">
                                                        <dx:ASPxCheckBoxList ID="ckblRestriccionesAlimenticias" runat="server" ValueType="System.String" Caption="Restricciones Alimenticias:" RepeatColumns="2" RepeatLayout="Table">
                                                            <Items>
                                                                <dx:ListEditItem Text="Vegetariano" Value="1" />
                                                                <dx:ListEditItem Text="Vegano" Value="2" />
                                                                <dx:ListEditItem Text="Kosher" Value="3" />
                                                                <dx:ListEditItem Text="Gluten" Value="4" />
                                                                <dx:ListEditItem Text="Free" Value="5" />
                                                                <dx:ListEditItem Text="No Alcohol" Value="6" />
                                                                <dx:ListEditItem Text="No mariscos" Value="7" />
                                                                <dx:ListEditItem Text="No Lácteos" Value="8" />
                                                                <dx:ListEditItem Text="No Próteinas" Value="9" />
                                                                <dx:ListEditItem Text="Orgánico" Value="10" />
                                                            </Items>
                                                            <CaptionSettings Position="Top" />
                                                        </dx:ASPxCheckBoxList>
                                                    </div>
                                                </td>
                                                <td style="width: 25%">
                                                    <br />
                                                    <div style="margin-left: 80px;">
                                                        <dx:ASPxCheckBoxList ID="ckblDeportes" runat="server" ValueType="System.String" Caption="Deportes:" RepeatColumns="2" RepeatLayout="Table">
                                                            <Items>
                                                                <dx:ListEditItem Text="Golf" Value="1" />
                                                                <dx:ListEditItem Text="Equitación" Value="2" />
                                                                <dx:ListEditItem Text="Tenis" Value="3" />
                                                                <dx:ListEditItem Text="Caza" Value="4" />
                                                                <dx:ListEditItem Text="Atomovilismo" Value="5" />
                                                                <dx:ListEditItem Text="Pesca" Value="6" />
                                                                <dx:ListEditItem Text="Soccer" Value="7" />
                                                                <dx:ListEditItem Text="Americano" Value="8" />
                                                                <dx:ListEditItem Text="Box" Value="9" />
                                                                <dx:ListEditItem Text="Vela" Value="10" />
                                                            </Items>
                                                            <CaptionSettings Position="Top" />
                                                        </dx:ASPxCheckBoxList>
                                                    </div>
                                                </td>
                                                <td style="width: 25%">
                                                    <div style="margin-left: 100px;">
                                                        <dx:ASPxRadioButtonList ID="rdlEstadoCivil" ClientInstanceName="rdlEstadoCivil" runat="server" SelectedIndex="0" Caption="Estado Civil:">
                                                            <Items>
                                                                <dx:ListEditItem Text="Casado" Value="1" />
                                                                <dx:ListEditItem Text="Soltero" Value="2" />
                                                            </Items>
                                                            <CaptionSettings Position="Top" />
                                                        </dx:ASPxRadioButtonList>
                                                    </div>
                                                </td>
                                                <td style="width: 25%">
                                                    <div style="margin-left: 30px;">
                                                    <dx:ASPxRadioButtonList ID="rdlProtocoloCliente" ClientInstanceName="rdlProtocoloCliente" runat="server" SelectedIndex="0" Caption="Protocolo del Cliente:">
                                                        <Items>
                                                            <dx:ListEditItem Text="Restrictivo" Value="1" />
                                                            <dx:ListEditItem Text="Formal" Value="2" />
                                                            <dx:ListEditItem Text="Amigable" Value="3" />
                                                            <dx:ListEditItem Text="Indiferente" Value="4" />
                                                        </Items>
                                                        <CaptionSettings Position="Top" />
                                                    </dx:ASPxRadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-sm-1">
                                        <div style="text-align: center; width: 100%">
                                            <table style="margin: 0px 85px; width: 100%">
                                                <tr>
                                                    <td>
                                                        <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0" OnClick="btnCancelar_Click" ClientSideEvents-Click="function(s, e)
                                                                 {
                                                                    ModalPerfilPasajero.Hide(); 
                                                                 }">
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxButton ID="btnGuardarPerfilPasajero" runat="server" Text="Guardar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0" OnClick="btnGuardarPerfilPasajero_Click">
                                                            <ClientSideEvents Click="CerrarModalPerfilPasajero" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>

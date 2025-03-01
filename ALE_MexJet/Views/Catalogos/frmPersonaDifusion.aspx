﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmPersonaDifusion.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Catalogos.frmPersonaDifusion" %>

<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="~/../../../JS/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            txtTextoBusquedaHabilitar();
            $('.combo').change(txtTextoBusquedaHabilitar);
        };
        function txtTextoBusquedaHabilitar() {
            var filtro = $(".combo").find(':selected').val();
            if (filtro == 0 || filtro == 2 || filtro == 3) {
                $(".txtBusqueda").attr('disabled', '-1');
                $(".txtBusqueda").val('');
            }
            else
                $(".txtBusqueda").removeAttr('disabled');
        }
        function OnSaveClick(s, e) {
            gvListaDifusion.UpdateEdit();
        }
       
    </script>
    <dx:ASPxPanel ID="pnlPrincipalPersonaDifusion" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span class="FTitulo">&nbsp;&nbsp;Personas</span>
                    </div>
                </div>
                <div class="well-g">
                    <div class="row">
                        <div class="col-md-12">
                            <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                            <fieldset class="Personal">
                                <legend>
                                    <span style="font-family: arial; text-align: center;">Búsqueda General</span>
                                </legend>
                                <div class="col-sm-12">
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtTextoBusqueda" CssClass="txtBusqueda" placeholder="Ingrese la información a buscar" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:DropDownList runat="server" CssClass="combo" ID="ddlTipoBusqueda">
                                            <asp:ListItem Text="[Sin Filtro]" Value="0" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="Nombre" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Solo Activas" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Solo Inactivas" Value="3"></asp:ListItem>
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
                        <div class="col-md-6" style="text-align: right;">
                            <dx:ASPxLabel CssClass="FExport" runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                            &nbsp;<dx:ASPxButton CssClass="FBotton" ID="btnExcel" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExcel_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-12" style="margin-left: -15px; width: 103%;">
                            <asp:UpdatePanel runat="server" UpdateMode="Always" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <div class="col-sm-12">
                                        <dx:ASPxGridView CssClass="FGrid" ID="gvPersona" runat="server" AutoGenerateColumns="False"
                                            ClientInstanceName="gvPersona" EnableTheming="True" KeyFieldName="IdPersonaDifusion"
                                            Styles-Header-HorizontalAlign="Center"
                                            Theme="Office2010Black" Width="100%" StylesPopup-EditForm-ModalBackground-Opacity="90" OnRowCommand="gvPersona_RowCommand">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn Caption="¿Activo?" FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataColumn Caption="Acciones" Visible="true" VisibleIndex="6" CellStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <DataItemTemplate>
                                                        <dx:ASPxButton Text="Editar" Theme="Office2010Black" ID="btnEditaPersona" runat="server" CommandArgument='<%# Eval("IdPersonaDifusion") %>' CommandName="Edita" AutoPostBack="true" ToolTip="Editar" HorizontalAlign="Center">
                                                        </dx:ASPxButton>
                                                        <dx:ASPxButton Text="Eliminar" Theme="Office2010Black" ID="btnEliminaPersona" runat="server" CommandArgument='<%# Eval("IdPersonaDifusion") %>' CommandName="Elimina" AutoPostBack="true" ToolTip="Eliminar" HorizontalAlign="Center">
                                                            <ClientSideEvents Click="function(s, e){  e.processOnServer = confirm('¿Está seguro que desea eliminar el registro?\n\nSe eliminarán las Listas en las que se encuentra la persona.');}" />
                                                        </dx:ASPxButton>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataColumn>
                                            </Columns>
                                            <StylesPager Pager-CssClass="FNumPag"></StylesPager>
                                            <SettingsPager Position="TopAndBottom">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <SettingsSearchPanel Visible="true" />
                                        </dx:ASPxGridView>
                                        <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvPersona">
                                        </dx:ASPxGridViewExporter>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo" />
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo2" />
                                    <asp:PostBackTrigger ControlID="btnExcel" />
                                    <asp:PostBackTrigger ControlID="ASPxButton2" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6">
                            <dx:ASPxButton CssClass="FBotton" ID="btnNuevo2" runat="server" Text="Nuevo" Theme="Office2010Black" OnClick="btnNuevo_Click"></dx:ASPxButton>
                        </div>
                        <div class="col-sm-6" style="text-align: right;">
                            <dx:ASPxLabel CssClass="FExport" runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                            &nbsp;<dx:ASPxButton CssClass="FBotton" ID="ASPxButton2" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExcel_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <dx:ASPxPopupControl ID="ppPersonaDifusion" runat="server" ClientInstanceName="ppPersonaDifusion" CloseAction="CloseButton" CloseOnEscape="false" Modal="true"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="" AllowDragging="true" ShowCloseButton="true" Width="800" Height="400">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlPersonaCreacionEdicion" runat="server" DefaultButton="btnGuardarPersona">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset class="Personal1" style="width: 102.5%; margin-left: -15px;">
                                        <legend>
                                            <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Datos de la Persona</span>
                                        </legend>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -75px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblTitulo" Text="Titulo: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxComboBox ID="cbxTitulo" runat="server" ValueType="System.String" NullText="Seleccione una opci&#243;n">
                                                                                <ValidationSettings EnableCustomValidation="True" ValidationGroup="VGPersona"
                                                                                    ErrorDisplayModE="ImageWithText" ErrorTextPosition="Right" SetFocusOnError="True">
                                                                                    <RequiredField ErrorText="El campo es requerido." IsRequired="True" />
                                                                                </ValidationSettings>
                                                                            </dx:ASPxComboBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -63px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblNombre" Text="Nombre: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxTextBox ID="txtNombre" runat="server" Width="250px" Theme="Office2010Black" MaxLength="250">
                                                                                 <ValidationSettings EnableCustomValidation="True" ValidationGroup="VGPersona"
                                                                                    ErrorDisplayModE="ImageWithText" ErrorTextPosition="Right" SetFocusOnError="True">
                                                                                    <RequiredField ErrorText="El campo es requerido." IsRequired="True" />
                                                                                </ValidationSettings>
                                                                                <InvalidStyle BackColor="LightPink" />
                                                                            </dx:ASPxTextBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -10px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblApellidoPaterno" Text="Apellido Paterno: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxTextBox ID="txtApellidoPaterno" runat="server" Width="250px" Theme="Office2010Black" MaxLength="250">
                                                                                 <ValidationSettings EnableCustomValidation="True" ValidationGroup="VGPersona"
                                                                                    ErrorDisplayModE="ImageWithText" ErrorTextPosition="Right" SetFocusOnError="True">
                                                                                    <RequiredField ErrorText="El campo es requerido." IsRequired="True" />
                                                                                </ValidationSettings>
                                                                                <InvalidStyle BackColor="LightPink" />
                                                                            </dx:ASPxTextBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -10px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblApellidoMaterno" Text="Apellido Materno: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxTextBox ID="txtApellidoMaterno" runat="server" Width="250px" Theme="Office2010Black" MaxLength="250">
                                                                            </dx:ASPxTextBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -18px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblTipoPersona" Text="Tipo de Persona: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxComboBox ID="cbxTipoPersona" runat="server" ValueType="System.String" NullText="Seleccione una opci&#243;n">
                                                                                 <ValidationSettings EnableCustomValidation="True" ValidationGroup="VGPersona"
                                                                                    ErrorDisplayModE="ImageWithText" ErrorTextPosition="Right" SetFocusOnError="True">
                                                                                    <RequiredField ErrorText="El campo es requerido." IsRequired="True" />
                                                                                </ValidationSettings>
                                                                            </dx:ASPxComboBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -13px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblTipoContacto" Text="Tipo de Contacto: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxComboBox ID="cbxTipoContacto" runat="server" ValueType="System.String" NullText="Seleccione una opci&#243;n">
                                                                                 <ValidationSettings EnableCustomValidation="True" ValidationGroup="VGPersona"
                                                                                    ErrorDisplayModE="ImageWithText" ErrorTextPosition="Right" SetFocusOnError="True">
                                                                                    <RequiredField ErrorText="El campo es requerido." IsRequired="True" />
                                                                                </ValidationSettings>
                                                                            </dx:ASPxComboBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -68px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblEstatus" Text="Estatus: " Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxComboBox ID="cbxEstatus" runat="server" ValueType="System.String" NullText="Seleccione una opci&#243;n">
                                                                                <Items>
                                                                                    <dx:ListEditItem Text="Inactivo" Value="0" />
                                                                                    <dx:ListEditItem Text="Activo" Value="1" />
                                                                                </Items>
                                                                            </dx:ASPxComboBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblTelefonoMovil" Text="Telefono Movil: " Height="17px" Width="100px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxTextBox ID="txtTelefonoMovil" runat="server" Width="250px" Theme="Office2010Black" MaxLength="10">
                                                                                <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                                                    <RegularExpression ErrorText="Teléfono invalido." ValidationExpression="^[0-9]+$" />
                                                                                    <RequiredField IsRequired="false" />
                                                                                </ValidationSettings>
                                                                                <InvalidStyle BackColor="LightPink" />
                                                                            </dx:ASPxTextBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -78px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="Email" Text="Email: " Height="17px" Width="120px" Font-Bold="true">
                                                                            </dx:ASPxLabel>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 25px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxTextBox ID="txtEmail" runat="server" Width="250px" Theme="Office2010Black" MaxLength="100">
                                                                                <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                                                    <RegularExpression ErrorText="Correo invalido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                                    <RequiredField IsRequired="false" />
                                                                                </ValidationSettings>
                                                                                <InvalidStyle BackColor="LightPink" />

                                                                            </dx:ASPxTextBox>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <div class="col-sm-12">
                                                                            <div style="margin-left: -20px; margin-right: auto; vertical-align: middle;">
                                                                                <
                                                                                <div style="float: left">
                                                                                    <dx:ASPxListBox ID="lbxLista" ClientInstanceName="lbxLista" SelectionMode="CheckColumn" Width="200" Height="210"
                                                                                        runat="server" ValueField="IdListaDifusion" ValueType="System.String" TextField="Descripcion" Caption="Seleccione la(s) lista(s):">
                                                                                        <Border BorderStyle="None" />
                                                                                        <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                                                                                        <CaptionSettings Position="Top" />
                                                                                    </dx:ASPxListBox>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: -10px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblRecibelllamada" Text="Recibe Llamadas:" Height="17px" Width="120px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxCheckBox ID="chkxRecibeLlamada" runat="server" CheckState="Unchecked"></dx:ASPxCheckBox>
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 38px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblRecibeSMS" Text="Recibe SMS:" Height="17px" Width="75px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxCheckBox ID="chkbxRecibeSMS" runat="server" CheckState="Unchecked"></dx:ASPxCheckBox>
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 38px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblRecibeMail" Text="Recibe Email:" Height="17px" Width="85px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxCheckBox ID="chkbxRecibeMail" runat="server" CheckState="Unchecked"></dx:ASPxCheckBox>
                                                                    </td>
                                                                    <td>
                                                                        <div style="margin-left: 38px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxLabel runat="server" ID="lblRecibePublicidad" Text="Recibe Publicidad:" Height="17px" Width="115px" Font-Bold="true"></dx:ASPxLabel>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxCheckBox ID="chkbxRecibePublicidad" runat="server" CheckState="Unchecked"></dx:ASPxCheckBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <div style="margin-left: 300px; margin-right: auto; vertical-align: middle;">
                                                                            <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0" OnClick="btnCancelar_Click">
                                                                                <ClientSideEvents Click="function(s, e) { ASPxClientEdit.ClearEditorsInContainerById('pnlPersonaCreacionEdicion') }" />
                                                                            </dx:ASPxButton>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxButton ID="btnGuardarPersona" runat="server" Text="Guardar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0" OnClick="btnGuardarPersona_Click" ValidationGroup="VGPersona">
                                                                        </dx:ASPxButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

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

</asp:Content>

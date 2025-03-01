﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmCombustibleSemanal.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Catalogos.frmCombustibleSemanal" %>
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
            if (filtro == 0 || filtro == 4 || filtro == 5) {
                $(".txtBusqueda").attr('disabled', '-1');
                $(".txtBusqueda").val('');
            }
            if (filtro == 1 || filtro == 2 || filtro == 3)
                $(".txtBusqueda").removeAttr('disabled');
        }
        function OnSaveClickDetail(s, e) {
            gvDetalle.UpdateEdit();
        }
        function OnSaveClick(s, e) {
            gvCombustibleSemanal.UpdateEdit();
        }
    </script>
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span class="FTitulo">&nbsp;&nbsp;Combustible Semanal</span>
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
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtTextoBusqueda" runat="server" Width="180px" CssClass="txtBusqueda" placeholder="Ingrese la información a buscar"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddlTipoBusqueda" runat="server" CssClass="combo" EnableTheming="True">
                                            <asp:ListItem Text="[Sin Filtro]" Value="0" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="Año" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Mes" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Aeropuerto" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Solo Activos" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Solo Inactivos" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-sm-4">
                                        <dx:ASPxButton CssClass="FBotton" ID="btnBusqueda" Text="Buscar" Theme="Office2010Black" runat="server" OnClick="btnBuscar_Click"></dx:ASPxButton>
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
                            &nbsp;<dx:ASPxButton CssClass="FBotton" ID="btnExcel" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12" style="margin-left: -15px; width: 103%;">
                            <asp:UpdatePanel runat="server" UpdateMode="Always" ID="UpdCombustible" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <div class="col-sm-12">
                                        <dx:ASPxGridView CssClass="FGrid" ID="gvCombustibleSemanal" runat="server" AutoGenerateColumns="False" 
                                            ClientInstanceName="gvCombustibleSemanal" EnableTheming="True" KeyFieldName="IdCombustibleSem"
                                            OnCellEditorInitialize="gvCombustibleSemanal_CellEditorInitialize" OnRowDeleting="gvCombustibleSemanal_RowDeleting"
                                            OnRowInserting="gvCombustibleSemanal_RowInserting" OnRowUpdating="gvCombustibleSemanal_RowUpdating" Styles-Header-HorizontalAlign="Center"
                                            OnStartRowEditing="gvCombustibleSemanal_StartRowEditing" OnRowValidating="gvCombustibleSemanal_RowValidating" OnCommandButtonInitialize="gvCombustibleSemanal_CommandButtonInitialize"
                                             OnDetailRowExpandedChanged="gvCombustibleSemanal_DetailRowExpandedChanged" OnCancelRowEditing ="gvCombustibleSemanal_CancelRowEditing"
                                            Theme="Office2010Black" Width="100%" StylesPopup-EditForm-ModalBackground-Opacity="90">
                                            <ClientSideEvents EndCallback="function (s, e) {
                                        if (s.cpShowPopup)
                                        {
                                            delete s.cpShowPopup;
                                            lbl.SetText(s.cpText);
                                            popup.Show();
                                        }
                                    }" />
                                            <StylesPopup>
                                                <EditForm>
                                                    <ModalBackground Opacity="90">
                                                    </ModalBackground>
                                                </EditForm>
                                            </StylesPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Año" FieldName="Anio" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <PropertiesTextEdit MaxLength="4">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                            <RegularExpression ValidationExpression="[0-9][0-9][0-9][0-9]" ErrorText="Error en la información ingresada."></RegularExpression>
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <EditFormSettings Visible="True" VisibleIndex="1" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Mes" FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <EditFormSettings Visible="False" VisibleIndex="2" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Mes" FieldName="IdMes" VisibleIndex="2" Visible="False">
                                                    <EditFormSettings Visible="True" Caption="Mes"></EditFormSettings>
                                                    <PropertiesComboBox TextField="Nombre" ValueField="IdMes" ValueType="System.Int32" NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="Aeropuerto" FieldName="AeropuertoIATA" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <EditFormSettings Visible="False" VisibleIndex="3" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Aeropuerto" FieldName="IdAeropuerto" VisibleIndex="4" Visible="False">
                                                    <EditFormSettings Visible="True" VisibleIndex="4" />
                                                    <PropertiesComboBox TextField="AeropuertoICAO" ValueField="IdAeropuerto" ValueType="System.Int32" NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n cargada." ErrorTextPosition="Bottom">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataCheckColumn Caption="¿Activo?" FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="7">
                                                    <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                    </PropertiesCheckEdit>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="8">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </dx:GridViewCommandColumn>
                                            </Columns>
                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView CssClass="FGrid" ID="gvDetalle" runat="server" KeyFieldName="IdCombustibleSemDet" Theme="Office2010Black" Width="100%" AutoGenerateColumns="False"
                                                        ClientInstanceName="gvDetalle" EnableTheming="True"
                                                        StylesPopup-EditForm-ModalBackground-Opacity="90" OnRowValidating="gvDetalle_RowValidating" OnCommandButtonInitialize="gvDetalle_CommandButtonInitialize"
                                                        OnCellEditorInitialize="gvDetalle_CellEditorInitialize" OnRowDeleting="gvDetalle_RowDeleting" Styles-Header-HorizontalAlign="Center"
                                                        OnRowUpdating="gvDetalle_RowUpdating" OnRowInserting="gvDetalle_RowInserting" OnStartRowEditing="gvDetalle_StartRowEditing" Paddings-PaddingBottom="0px" Paddings-PaddingLeft="0px" Paddings-PaddingRight="0px" Paddings-PaddingTop="0px">
                                                        <SettingsText PopupEditFormCaption ="Formulario de Creación" />
                                                        <ClientSideEvents EndCallback="function (s, e) {
                                                        if (s.cpShowPopup)
                                                        {
                                                            delete s.cpShowPopup;
                                                            lbl.SetText(s.cpText);
                                                            popup.Show();
                                                        }
                                                    }" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="Semana" Caption="Semana" VisibleIndex="1">
                                                                <PropertiesTextEdit MaxLength="50">
                                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                                        <RegularExpression ValidationExpression="^[0-6]$" ErrorText="El campo permite sólo números enteros y hasta 6 semanas."></RegularExpression>
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings Visible="True" VisibleIndex="1" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="CostoXLitro" Caption="Costo x Litro" VisibleIndex="2">
                                                                <PropertiesTextEdit MaxLength="50">
                                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                                        <RegularExpression ValidationExpression="\d+(\.)?\d*" ErrorText="El campo permite sólo números decimales o enteros."></RegularExpression>
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings Visible="True" VisibleIndex="2" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="GalonMXN" Caption="Galón en $" VisibleIndex="3">
                                                                <PropertiesTextEdit MaxLength="50">
                                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                                        <RegularExpression ValidationExpression="\d+(\.)?\d*" ErrorText="El campo permite sólo números decimales o enteros."></RegularExpression>
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings Visible="False" VisibleIndex="3" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="GalonUSD" Caption="Galón en USD" VisibleIndex="4">
                                                                <PropertiesTextEdit MaxLength="50">
                                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                                        <RegularExpression ValidationExpression="\d+(\.)?\d*" ErrorText="El campo permite sólo números decimales o enteros."></RegularExpression>
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings Visible="False" VisibleIndex="4" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="TipoCambio" Caption="Tipo de Cambio" VisibleIndex="4">
                                                                <PropertiesTextEdit MaxLength="50">
                                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                                        <RegularExpression ValidationExpression="\d+(\.)?\d*" ErrorText="El campo permite sólo números decimales o enteros."></RegularExpression>
                                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings Visible="False" VisibleIndex="4" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataCheckColumn Caption="¿Activo?" FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                                </PropertiesCheckEdit>
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones"  ShowDeleteButton="True" ShowNewButtonInHeader="True" ShowEditButton="True"  ShowInCustomizationForm="True" VisibleIndex="6">
                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            </dx:GridViewCommandColumn>
                                                        </Columns>
                                                        <SettingsBehavior ConfirmDelete="True" />
                                                        <StylesPager  Pager-CssClass="FNumPag"></StylesPager>
                                                        <SettingsPager Position="TopAndBottom">
                                                            <PageSizeItemSettings Items="1, 10, 20, 50, 100">
                                                            </PageSizeItemSettings>
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                                        <Settings ShowGroupPanel="false" />
                                                        <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" SearchPanelEditorNullText="Ingrese la informacion a buscar" />
                                                        <SettingsPopup>
                                                            <EditForm HorizontalAlign="Center" VerticalAlign="Above" Modal="true" CloseOnEscape="True" Width="400px" />
                                                        </SettingsPopup>
                                                        <SettingsSearchPanel Visible="true" />
                                                        <SettingsCommandButton>
                                                            <NewButton ButtonType="Button" Styles-Style-CssClass="FBotton">
                                                                <Image ToolTip="New">
                                                                </Image>
                                                            </NewButton>
                                                            <UpdateButton Text="Guardar"></UpdateButton>
                                                            <CancelButton></CancelButton>
                                                            <EditButton Styles-Style-CssClass="FBotton">
                                                                <Image Height="20px" ToolTip="Modificar" Width="20px">
                                                                </Image>
                                                            </EditButton>
                                                            <DeleteButton Styles-Style-CssClass="FBotton">
                                                                <Image Height="20px" ToolTip="Eliminar" Width="20px">
                                                                </Image>
                                                            </DeleteButton>
                                                        </SettingsCommandButton>
                                                         <Templates>
                                                <EditForm>
                                                    <dx:ASPxPanel runat="server" DefaultButton="Update">
                                                        <PanelCollection>
                                                            <dx:PanelContent>
                                                                <dx:ASPxGridViewTemplateReplacement ID="EditFormEditors" ReplacementType="EditFormEditors" runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                                <div class="row">
                                                                    <table>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxButton runat="server" CssClass="UpdatePersonal" ID="Update" Theme="Office2010Black" UseSubmitBehavior="true" AutoPostBack="false" Text="Guardar" style="padding:2px; margin-right:2px; margin-left: 12px; font-size:12px;">
                                                                                    <ClientSideEvents Click="function (s, e) { OnSaveClickDetail(s, e); }" />
                                                                                </dx:ASPxButton>
                                                                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                                            </td>
                                                                        </tr>
                                                                         <tr>
                                                                            <td colspan="2">
                                                                                &nbsp;
                                                                            </td>
                                                                          </tr>
                                                                    </table>
                                                                </div>
                                                                </ContentTemplate>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxPanel>
                                                </EditForm>
                                            </Templates>
                                                    </dx:ASPxGridView>
                                                </DetailRow>
                                                <EditForm>
                                                    <dx:ASPxPanel runat="server" DefaultButton="Update">
                                                        <PanelCollection>
                                                            <dx:PanelContent>
                                                                <dx:ASPxGridViewTemplateReplacement ID="EditFormEditors" ReplacementType="EditFormEditors" runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                                <div class="row">
                                                                    <table>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxButton runat="server" CssClass="UpdatePersonal" ID="Update" Theme="Office2010Black" UseSubmitBehavior="true" AutoPostBack="false" Text="Guardar" style="padding:2px; margin-right:2px; margin-left: 12px; font-size:12px;">
                                                                                    <ClientSideEvents Click="function (s, e) { OnSaveClick(s, e); }" />
                                                                                </dx:ASPxButton>
                                                                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                                            </td>
                                                                        </tr>
                                                                         <tr>
                                                                            <td colspan="2">
                                                                                &nbsp;
                                                                            </td>
                                                                          </tr>
                                                                    </table>
                                                                </div>
                                                                </ContentTemplate>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxPanel>
                                                </EditForm>
                                            </Templates>
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <StylesPager  Pager-CssClass="FNumPag"></StylesPager>
                                            <SettingsPager Position="TopAndBottom">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                            <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true" />
                                            <Settings ShowGroupPanel="True" />
                                            <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />
                                            <SettingsPopup>
                                                <EditForm HorizontalAlign="Center" VerticalAlign="Above" Modal="true" CloseOnEscape="True" Width="400px" />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="true" />
                                    <%--        <Columns>
                                                <dx:GridViewDataComboBoxColumn FieldName="IdMes" ShowInCustomizationForm="True" Caption="Mes" Visible="False" VisibleIndex="3">
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="AeropuertoICAO" ShowInCustomizationForm="True" Caption="Aeropuerto" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="IdAeropuerto" ShowInCustomizationForm="True" Caption="Aeropuerto" Visible="False" VisibleIndex="5">
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>--%>

                                            <SettingsCommandButton>
                                                <NewButton ButtonType="Link">
                                                    <Image ToolTip="New">
                                                    </Image>
                                                </NewButton>
                                                <UpdateButton Text="Guardar"></UpdateButton>
                                                <CancelButton></CancelButton>
                                                <EditButton Styles-Style-CssClass="FBotton">
                                                    <Image Height="20px" ToolTip="Modificar" Width="20px">
                                                    </Image>
                                                </EditButton>
                                                <DeleteButton Styles-Style-CssClass="FBotton">
                                                    <Image Height="20px" ToolTip="Eliminar" Width="20px">
                                                    </Image>
                                                </DeleteButton>
                                            </SettingsCommandButton>
                                            </dx:ASPxGridView>
                                        <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvCombustibleSemanal">
                                        </dx:ASPxGridViewExporter>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo2" EventName="Click" />
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
                            &nbsp;<dx:ASPxButton CssClass="FBotton" ID="ASPxButton2" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
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

</asp:Content>



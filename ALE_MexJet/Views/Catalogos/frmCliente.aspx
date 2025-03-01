﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="frmCliente.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Catalogos.frmCliente" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="~/../../../JS/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        function pageLoad(sender, args){
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
        function OnSaveClick(s, e) {
            gvCliente.UpdateEdit();
        }
    </script>
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span class="FTitulo">&nbsp;&nbsp;Clientes</span>
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
                                        <asp:TextBox ID="txtTextoBusqueda" CssClass="txtBusqueda" placeholder ="Ingrese la información a buscar" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <!-- <img src="../../img/iconos/flecha.png" /> -->
                                        <asp:DropDownList runat="server" CssClass="combo" ID="ddlTipoBusqueda">
                                            <asp:ListItem Text="[Sin Filtro]" Value="0" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="Código Cliente" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Nombre/Razón Social" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Tipo Cliente" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Solo activos" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Solo inactivos" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <dx:ASPxButton CssClass="FBotton" ID="btnBusqueda" Text="Buscar" runat="server" Theme="Office2010Black" OnClick="btnBuscar_Click"></dx:ASPxButton>
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
                            <asp:UpdatePanel runat="server" UpdateMode="Always" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <div class="col-sm-12">
                                        <dx:ASPxGridView CssClass="FGrid" ID="gvCliente" runat="server" AutoGenerateColumns="False" 
                                            ClientInstanceName="gvCliente" EnableTheming="True" KeyFieldName="IdCliente"
                                            OnCellEditorInitialize="gvClientes_CellEditorInitialize" OnRowDeleting="gvCliente_RowDeleting"
                                            OnRowInserting="gvClientes_RowInserting" OnRowUpdating="gvCliente_RowUpdating"
                                            OnStartRowEditing="gvCliente_StartRowEditing" OnRowValidating="gvClientes_RowValidating"
                                            OnCustomButtonCallback="gvCliente_CustomButtonCallback" Styles-Header-HorizontalAlign ="Center" OnCommandButtonInitialize="gvCliente_CommandButtonInitialize"
                                            Theme="Office2010Black" Width="100%" StylesPopup-EditForm-ModalBackground-Opacity="90" OnCancelRowEditing="gvCliente_CancelRowEditing">
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
                                                    <PropertiesTextEdit MaxLength="5">
                                                        <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>

                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" Caption="Nombre/Raz&#243;n Social" VisibleIndex="1">
                                                    <PropertiesTextEdit MaxLength="200">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>

                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>

                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Tipo Cliente" FieldName="TipoClienteDescripcion" VisibleIndex="2">
                                                    <PropertiesComboBox>
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" ErrorText="Error en la informaci&#243;n ingresada.">
                                                               <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                    <EditFormSettings Visible="False" VisibleIndex="2" />
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="TipoCliente" VisibleIndex="3" Visible="False">
                                                    <EditFormSettings Visible="True" Caption="Tipo Cliente"></EditFormSettings>
                                                    <PropertiesComboBox NullText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" ErrorText="Error en la informaci&#243;n ingresada.">
                                                               <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Estatus" FieldName="Status" VisibleIndex="4">
                                                    <PropertiesComboBox TextField="CategoryName" ValueField="Status" ValueType="System.Int32" NullText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom">
                                                               <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        </ValidationSettings>
                                                        <Items>
                                                            <%--<dx:ListEditItem Text="Seleccione un estatus" Value="-1" Selected="true" />--%>
                                                            <dx:ListEditItem Text="Inactivo" Value="0" />
                                                            <dx:ListEditItem Text="Activo" Value="1" />
                                                        </Items>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones" ShowDeleteButton="True" ShowEditButton="True" ShowNewButton="false"
                                                    ShowInCustomizationForm="True" VisibleIndex="6">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <CustomButtons>
                                                        <dx:GridViewCommandColumnCustomButton Styles-Style-CssClass="FBotton" Text="Contactos" Image-ToolTip="Contactos y Preferencias" />
                                                    </CustomButtons>
                                                </dx:GridViewCommandColumn>
                                            </Columns>
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <StylesPager  Pager-CssClass="FNumPag"></StylesPager>
                                            <SettingsPager Position="TopAndBottom">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                            <Settings ShowGroupPanel="True" />
                                            <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />
                                            <SettingsPopup>
                                                <EditForm HorizontalAlign="Center" VerticalAlign="Above" Modal="true" CloseOnEscape="True" Width="400px" />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsCommandButton>
                                                <UpdateButton Text="Guardar">
                                                </UpdateButton>
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
                                        </dx:ASPxGridView>
                                        <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvCliente">
                                        </dx:ASPxGridViewExporter>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo2" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnBusqueda" EventName="Click" />
                                    <asp:PostBackTrigger ControlID="btnExcel" />
                                    <asp:PostBackTrigger ControlID="btnExportar" />
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
                            &nbsp;<dx:ASPxButton CssClass="FBotton" ID="btnExportar" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
                </div><br />
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
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

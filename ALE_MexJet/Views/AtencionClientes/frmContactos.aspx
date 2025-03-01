﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="frmContactos.aspx.cs" Inherits="ALE_MexJet.Views.Catalogos.frmContactos" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="~/../../../JS/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        function OnSaveClick(s, e) {
            gvContactos.UpdateEdit();
        }
    </script>
    <dx:ASPxPanel ID="pnlContainer" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Contactos y Preferencias</span>
                    </div>
                </div>
                <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                <div class="well-g">
                    <div class="row">
                        <div class="col-md-12" style="margin-left: -15px; width: 103%;">
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <div class="col-sm-12">
                                        <dx:ASPxLabel runat="server" Font-Size="Larger" Text="Información del Cliente" Theme="Office2010Black" Font-Bold="true"></dx:ASPxLabel>
                                        <br />
                                        <br />
                                        <dx:ASPxLabel runat="server" ID="lblCliente" Font-Size="Larger" Text="Nombre"></dx:ASPxLabel>
                                        <br />
                                        <br />
                                        <dx:ASPxLabel runat="server" Font-Size="Larger" Text="Preferencias"></dx:ASPxLabel>
                                        <dx:ASPxMemo runat="server" ID="txtObservacion" Width="100%" Height="50px"></dx:ASPxMemo>
                                        <br />
                                        <br />
                                        <dx:ASPxLabel runat="server" Font-Size="Larger" Text="Notas"></dx:ASPxLabel>
                                        <dx:ASPxMemo runat="server" ID="txtNota" Width="100%" Height="50px"></dx:ASPxMemo>
                                        <br />
                                        <br />
                                        <dx:ASPxLabel runat="server" Font-Size="Larger" Text="Otros"></dx:ASPxLabel>
                                        <dx:ASPxMemo runat="server" ID="txtOtros" Width="100%" Height="50px"></dx:ASPxMemo>
                                        <br />
                                        <div class="col-sm-6">
                                        </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnGuardarComentarios" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <br />

                        </div>
                        <div class="row">
                            <div class="col-sm-6" style="text-align: right;">
                                <dx:ASPxButton runat="server" ID="btnGuardarComentarios" Text="Guardar" Theme="Office2010Black" OnClick="btnGuardarComentarios_Click"></dx:ASPxButton>
                            </div>
                        </div>
                        <br />
                        <div class="col-sm-12">
                            <dx:ASPxLabel ID="lblSubContactos" runat="server" Font-Size="Larger" Text="Contactos del Cliente" Font-Bold="true" Theme="Office2010Black"></dx:ASPxLabel>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-6">
                                <dx:ASPxButton ID="btnNuevo" runat="server" Text="Nuevo" Theme="Office2010Black" OnClick="btnNuevo_Click"></dx:ASPxButton>
                            </div>
                            <div class="col-sm-6" style="text-align: right;">

                                <dx:ASPxLabel runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                                &nbsp;<dx:ASPxButton ID="btnExportar" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton>
                            </div>
                            <br />
                            <br />
                        </div>
                        <br />
                        <div class="col-sm-12">
                            <asp:UpdatePanel runat="server" UpdateMode="Always" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <dx:ASPxGridView ID="gvContactos" runat="server" AutoGenerateColumns="false"
                                        Font-Size="Small" ClientInstanceName="gvContactos" EnableTheming="true"
                                        StylesPopup-EditForm-ModalBackground-Opacity="90"
                                        KeyFieldName="IdContacto"
                                        OnCellEditorInitialize="gvContactos_CellEditorInitialize"
                                        OnRowDeleting="gvContactos_RowDeleting"
                                        OnRowInserting="gvContactos_RowInserting"
                                        OnRowUpdating="gvContactos_RowUpdating"
                                        OnStartRowEditing="gvContactos_StartRowEditing"
                                        OnRowValidating="gvContactos_RowValidating"
                                        Styles-Header-HorizontalAlign="Center"
                                        Theme="Office2010Black" Width="100%">
                                        <ClientSideEvents EndCallback=" function (s,e)
                                                                                {
                                                                                    if ( s.cpShowPopup )
                                                                                    {
                                                                                        delete s.cpShowPopup;
                                                                                        lbl.SetText(s.cpText);
                                                                                        popup.Show();
                                                                                    }
                                                                                }" />
                                        <Columns>
                                            <dx:GridViewDataComboBoxColumn Caption="Título" FieldName="IdTitulo" VisibleIndex="0" Visible="False" PropertiesComboBox-NullText="Seleccione una opción">
                                                <EditFormSettings Visible="True"></EditFormSettings>
                                                <PropertiesComboBox>
                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                    </ValidationSettings>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="Título" FieldName="TituloDescripcion" VisibleIndex="1" PropertiesComboBox-NullText="Seleccione una opción">
                                                <EditFormSettings Visible="False"></EditFormSettings>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Nombre" ShowInCustomizationForm="true" VisibleIndex="2">
                                                <PropertiesTextEdit MaxLength="50">
                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        <RegularExpression ValidationExpression="^[a-zA-Z_áéíóúñÁÉÍÓÚ\s]*$" ErrorText="El campo contene información inválida."></RegularExpression>
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Email" FieldName="CorreoElectronico" ShowInCustomizationForm="true" VisibleIndex="3">
                                                <PropertiesTextEdit>
                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                        <RegularExpression ErrorText="El campo solo permite correos electrónicos en minúsculas." ValidationExpression="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$"></RegularExpression>
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Tel. Oficina" FieldName="TelOficina" ShowInCustomizationForm="true" VisibleIndex="4">
                                                <PropertiesTextEdit MaxLength="20" DisplayFormatInEditMode="True">
                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <RegularExpression ErrorText="El campo contiene información inválida." ValidationExpression="^([0-9extEXT\(\)\/\+ \-]*)$" />
                                                        <RegularExpression />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            
                                            <dx:GridViewDataTextColumn Caption="Tel. Móvil" FieldName="TelMovil" ShowInCustomizationForm="true" VisibleIndex="5">
                                                <PropertiesTextEdit MaxLength="20" DisplayFormatInEditMode="True">
                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <RegularExpression ErrorText="El campo contiene información inválida." ValidationExpression="^([0-9extEXT\(\)\/\+ \-]*)$" />
                                                        <RegularExpression />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Otro Tel." FieldName="OtroTel" ShowInCustomizationForm="true" VisibleIndex="6">
                                                <PropertiesTextEdit MaxLength="20" DisplayFormatInEditMode="True">
                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <RegularExpression ErrorText="El campo contiene información inválida." ValidationExpression="^([0-9extEXT\(\)\/\+ \-]*)$" />
                                                        <RegularExpression />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            
                                            <dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones" ShowDeleteButton="true" ShowEditButton="true" ShowNewButton="false" ShowInCustomizationForm="true" VisibleIndex="7"></dx:GridViewCommandColumn>
                                        </Columns>
                                        <SettingsBehavior ConfirmDelete="true" />
                                        <SettingsPager>
                                            <PageSizeItemSettings Items="1,10,20,50,100">
                                            </PageSizeItemSettings>
                                        </SettingsPager>
                                        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                        <Settings ShowGroupPanel="true" />
                                        <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />
                                        <SettingsPopup>
                                            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="Middle" Width="400px" Modal="true" />
                                            <CustomizationWindow HorizontalAlign="WindowCenter" VerticalAlign="Middle" />
                                        </SettingsPopup>
                                        <SettingsSearchPanel Visible="true" />
                                        <SettingsCommandButton>
                                            <NewButton>
                                                <Image Height="20px" ToolTip="Nuevo" Width="20px"></Image>
                                            </NewButton>
                                            <UpdateButton Text="Guardar"></UpdateButton>
                                            <CancelButton Text="Cancelar"></CancelButton>
                                            <EditButton>
                                                <Image Height="20px" ToolTip="Modificar" Width="20px"></Image>
                                            </EditButton>
                                            <DeleteButton>
                                                <Image Height="20px" ToolTip="Eliminar" Width="20px"></Image>
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
                                        </Templates>
                                    </dx:ASPxGridView>

                                    <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvContactos">
                                    </dx:ASPxGridViewExporter>
                                </ContentTemplate>
                                <Triggers>


                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo2" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
                                    <asp:PostBackTrigger ControlID="btnExportar" />
                                    <asp:PostBackTrigger ControlID="ASPxButton2" />

                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <br />
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-6">
                        <dx:ASPxButton ID="btnNuevo2" runat="server" Text="Nuevo" Theme="Office2010Black" OnClick="btnNuevo_Click"></dx:ASPxButton>
                    </div>
                    <div class="col-sm-6" style="text-align: right;">
                        <dx:ASPxLabel runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                        &nbsp;<dx:ASPxButton ID="ASPxButton2" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6" style="text-align: right;">
                        <dx:ASPxButton ID="btnRegresar" runat="server" Text="Regresar" Theme="Office2010Black" OnClick="btnRegresar_Click"></dx:ASPxButton>
                    </div>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" CloseAction="CloseButton" CloseOnEscape="true" Modal="True" Theme="Office2010Black"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" HeaderText="Aviso" AllowDragging="true" ShowCloseButton="true" Width="300">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
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
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>

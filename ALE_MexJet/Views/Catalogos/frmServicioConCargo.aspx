﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmServicioConCargo.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Catalogos.frmServicioConCargo" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
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
             gvServicioConCargo.UpdateEdit();
         }
    </script>
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" style="border-radius:21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span class="FTitulo">&nbsp;&nbsp;Servicios con Cargo</span>
                    </div>
                </div>
                <div class="well-g">
                <div class="row">
                    <div class="col-md-12">
                        <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                            <fieldset class="Personal">
                                  <legend>
                                    <span style="font-family:arial; text-align:center;">Búsqueda General</span>
                                </legend>
                                <div class="col-sm-12">
                                    <div class="col-lg-4">
                                      <asp:TextBox ID="txtTextoBusqueda" CssClass="txtBusqueda" placeholder ="Ingrese la información a buscar" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                           <asp:DropDownList runat="server" CssClass="combo" ID="ddlTipoBusqueda">
                                                        <asp:ListItem Text="[Sin Filtro]" Value="0" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="Servicio con Cargo" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Solo activo" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Solo inactivo" Value="3"></asp:ListItem>
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
                    <div class="col-md-6"><dx:ASPxButton CssClass="FBotton" ID="btnNuevo" runat="server" Text="Nuevo" Theme="Office2010Black" OnClick="btnNuevo_Click"></dx:ASPxButton></div>
                    <div class="col-md-6" style="text-align:right;"><dx:ASPxLabel CssClass="FExport" runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>&nbsp;<dx:ASPxButton CssClass="FBotton" ID="btnExcel" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton></div>
                </div>
                <br />

                <div class="row">
                <div class="col-md-12" style="margin-left:-15px;width:103%;">
                    <asp:UpdatePanel runat="server" UpdateMode="Always" OnUnload="Unnamed_Unload">
                        <ContentTemplate>
                                <div class="col-sm-12">
                                    <dx:ASPxGridView CssClass="FGrid" ID="gvServicioConCargo" runat="server" AutoGenerateColumns="False" 
                                        ClientInstanceName="gvServicioConCargo" EnableTheming="True" KeyFieldName="IdServicioConCargo"
                                        OnCellEditorInitialize="gvServicioConCargo_CellEditorInitialize" OnRowDeleting="gvServicioConCargo_RowDeleting"
                                        OnRowInserting="gvServicioConCargo_RowInserting" OnRowUpdating="gvServicioConCargo_RowUpdating" OnCommandButtonInitialize="gvServicioConCargo_CommandButtonInitialize"
                                        OnStartRowEditing="gvServicioConCargo_StartRowEditing" OnRowValidating="gvServicioConCargo_RowValidating" Styles-Header-HorizontalAlign ="Center"
                                        Theme="Office2010Black" Width="100%" OnCancelRowEditing="gvServicioConCargo_CancelRowEditing" StylesPopup-EditForm-ModalBackground-Opacity="90">
                                        <ClientSideEvents EndCallback="function (s, e) {
                                        if (s.cpShowPopup)
                                        {
                                            delete s.cpShowPopup;
                                            lbl.SetText(s.cpText);
                                            popup.Show();
                                        }
                                    }" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Servicio con Cargo" FieldName="ServicioConCargoDescripcion" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit MaxLength="200">
                                                    <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                                <EditFormSettings Caption="Servicio con cargo"></EditFormSettings>
                                            </dx:GridViewDataTextColumn>
                                            
                                            
                                            <dx:GridViewDataTextColumn Caption="Articulo SAP" FieldName="ArticuloDescripcion" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <EditFormSettings Visible ="False"></EditFormSettings>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="CveArticulo" Caption="Articulo SAP" VisibleIndex="2" visible ="false">
                                                <PropertiesComboBox MaxLength="100">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                    </ValidationSettings>
                                                </PropertiesComboBox>
                                                <EditFormSettings Visible="True" VisibleIndex="3"></EditFormSettings>
                                            </dx:GridViewDataComboBoxColumn>

                                            <%--<dx:GridViewDataTextColumn Caption="Cuenta" FieldName="CuentaDescripcion" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <EditFormSettings Visible ="False"></EditFormSettings>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="cveCuenta" Caption="Cuenta" VisibleIndex="4" visible ="false">
                                                <PropertiesComboBox MaxLength="50">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                    </ValidationSettings>
                                                </PropertiesComboBox>
                                                <EditFormSettings Visible="True" VisibleIndex="3"></EditFormSettings>
                                            </dx:GridViewDataComboBoxColumn>--%>

                                             <dx:GridViewDataTextColumn Caption="Servicio CC" FieldName="CodUnidad1Desc" ShowInCustomizationForm="True" VisibleIndex="4">
                                                <EditFormSettings Visible ="False"></EditFormSettings>
                                            </dx:GridViewDataTextColumn>
                                            
                                            <dx:GridViewDataComboBoxColumn FieldName="CveCodigoUnidad1" Caption="Servicio CC" VisibleIndex="4" visible ="false">
                                                <PropertiesComboBox MaxLength="50">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                        <RequiredField IsRequired="True" ErrorText="El campo es requerido"></RequiredField>
                                                    </ValidationSettings>
                                                </PropertiesComboBox>
                                                <EditFormSettings Visible="True" VisibleIndex="5"></EditFormSettings>
                                            </dx:GridViewDataComboBoxColumn>

                                            <dx:GridViewDataTextColumn FieldName="Importe" Caption="Importe" VisibleIndex="6"  PropertiesTextEdit-DisplayFormatString="N2"></dx:GridViewDataTextColumn >

                                            <dx:GridViewDataCheckColumn Caption="Cobro por Pasajero" FieldName="PorPasajero" ShowInCustomizationForm="True" VisibleIndex="7">
                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Byte" ValueUnchecked="0">
                                                </PropertiesCheckEdit>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataCheckColumn Caption="Cobro por Pierna" FieldName="PorPierna" ShowInCustomizationForm="True" VisibleIndex="8">
                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                </PropertiesCheckEdit>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataCheckColumn Caption="¿Activo?" FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="9">
                                                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                </PropertiesCheckEdit>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="10">
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
                                        <Settings ShowGroupPanel="True" />
                                        <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />
                                        <SettingsPopup>
                                            <EditForm HorizontalAlign="Center" VerticalAlign="Above" Modal="true" CloseOnEscape="True" Width="400px" />
                                        </SettingsPopup>
                                        <SettingsSearchPanel Visible="true" />
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
                                    <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvServicioConCargo">
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
                    <div class="col-sm-6"><dx:ASPxButton CssClass="FBotton" ID="btnNuevo2" runat="server" Text="Nuevo" Theme="Office2010Black" OnClick="btnNuevo_Click"></dx:ASPxButton></div>
                    <div class="col-sm-6" style="text-align:right;"><dx:ASPxLabel CssClass="FExport" runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>&nbsp;<dx:ASPxButton CssClass="FBotton" ID="ASPxButton2" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExportar_Click"></dx:ASPxButton></div>
                </div>
                <br />  
                    </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>

    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above" HeaderText="Aviso" AllowDragging="true" ShowCloseButton ="true"  Width ="300">
        <ClientSideEvents PopUp="function(s, e) { tbLogin.Focus(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" >
                <dx:ASPxPanel ID="ASPxPanel3" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" ShowLoadingImage="true"  ImageUrl="~/img/iconos/Information2.ico" ></dx:ASPxImage>
                                        <dx:ASPxTextBox ID ="ASPxTextBox1" ReadOnly ="true" Border-BorderStyle ="None"  Height ="1px" runat="server" Width="1px" ClientInstanceName="tbLogin"></dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="lbl" Text="ASPxLabel" ></dx:ASPxLabel>
                                    </td>
                                </tr>
                                   
                                <tr >
                                    <td>
                                         <dx:ASPxButton ID="ASPxButton1" runat="server" Text="OK" Width="80px" AutoPostBack="false" style="float: left; margin-right: 8px" TabIndex ="0">
                                             <ClientSideEvents Click="function(s, e) {popup.Hide(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                            <div >
                                
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


</asp:Content>

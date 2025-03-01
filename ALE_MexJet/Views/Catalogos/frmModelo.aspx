﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmModelo.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Catalogos.frmModelo" %>
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
            if (filtro == 0 || filtro == 2 || filtro == 3) {
                $(".txtBusqueda").attr('disabled', '-1');
                $(".txtBusqueda").val('');
            }
            else
                $(".txtBusqueda").removeAttr('disabled');
        }
        function OnSaveClick(s, e) {
            gvModelo.UpdateEdit();
        }
    </script>
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span class="FTitulo">&nbsp;&nbsp;Modelo </span>
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
                                                        <asp:ListItem Text="Modelo" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Solo Activos" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Solo Inactivos" Value="3"></asp:ListItem>
                                                  </asp:DropDownList>
                                            </div>
                                         <div class="col-lg-4">
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
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table" style="margin-left: -15px; width: 100%;>
                                    <tr>
    	                                <td>
                                            <asp:UpdatePanel runat="server" UpdateMode="Always" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <div class="col-sm-12">
                                        <dx:ASPxGridView CssClass="FGrid" ID="gvModelo" runat="server" AutoGenerateColumns="False" 
                                            ClientInstanceName="gvModelo" EnableTheming="True" KeyFieldName="IdModelo"
                                            OnCellEditorInitialize="gvModelo_CellEditorInitialize" OnRowDeleting="gvModelo_RowDeleting"
                                            OnRowInserting="gvModelo_RowInserting" OnRowUpdating="gvModelo_RowUpdating" OnCommandButtonInitialize="gvModelo_CommandButtonInitialize"
                                            OnStartRowEditing="gvModelo_StartRowEditing" OnRowValidating="gvModelo_RowValidating" Styles-Header-HorizontalAlign ="Center"
                                            Theme="Office2010Black" Width="100%" StylesPopup-EditForm-ModalBackground-Opacity="90" OnCancelRowEditing="gvModelo_CancelRowEditing">
                                            <ClientSideEvents EndCallback="function (s, e) {
                                        if (s.cpShowPopup)
                                        {
                                            delete s.cpShowPopup;
                                            lbl.SetText(s.cpText);
                                            popup.Show();
                                        }
                                    }" />
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
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="DescripcionModelo" Caption="Modelo" VisibleIndex="0">
                                                    <PropertiesTextEdit MaxLength="200">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn FieldName="Status" Caption="&#191;Activo?" VisibleIndex="14">
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" Caption="Acciones" VisibleIndex="15">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="DescripcionMarca" Caption="Marca" VisibleIndex="1">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="IdMarca" Caption="Marca" Visible="False" VisibleIndex="2">
                                                    <EditFormSettings Visible="True"></EditFormSettings>                                                    
                                                    <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="GrupoModelo" Caption="Grupo de Modelo" VisibleIndex="3">
                                                    <EditFormSettings Visible="False"></EditFormSettings>                                                    
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="IdGrupoModelo" Caption="Grupo de Modelo" Visible="False" VisibleIndex="4">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="TipoModeloDescripcion" Caption="Tipo de Ala" VisibleIndex="5">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="IdTipo" Caption="Tipo de Ala" Visible="False" VisibleIndex="6">
                                                    <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="Velocidad" Caption="Velocidad" VisibleIndex="7">
                                                    <PropertiesTextEdit MaxLength="8" >
                                                     <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                       <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>
                                                       <RegularExpression ValidationExpression="(-?[0-9]+(\.[0-9]+)?)" ErrorText="El campo contiene información inválida."></RegularExpression>
                                                       </ValidationSettings>
                                                </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="GrupoEspacioDescripcion" Caption="Grupo de Tama&#241;o" VisibleIndex="8">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="IdGrupoTamaño" Caption="Grupo de tama&#241;o" Visible="False" VisibleIndex="9">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="IdHorasAño" Caption="Horas por A&#241;o" VisibleIndex="10">
                                                    <PropertiesTextEdit MaxLength="200">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>

                                                        <RegularExpression ValidationExpression="[0-9]*" ErrorText="El campo contiene información inválida."></RegularExpression>
                                                       
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn FieldName="PesoMaximo" Caption="Peso Máximo" VisibleIndex="11">
                                                    <PropertiesTextEdit MaxLength="200">
                                                    <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                        <ErrorFrameStyle BackColor="Red"></ErrorFrameStyle>

                                                        <RegularExpression ValidationExpression="(-?[0-9]+(\.[0-9]+)?)" ErrorText="El campo contiene información inválida."></RegularExpression>
                                                       
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Descripcion" Caption="Designador" VisibleIndex="12">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="IdDesignador" Caption="Designador" Visible="False" VisibleIndex="13">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
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
                                        <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvModelo">
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
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
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


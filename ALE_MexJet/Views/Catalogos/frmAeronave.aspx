﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmAeronave.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.Catalogos.frmAeronave" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="~/../../../JS/jquery/jquery-1.8.3.js"></script>
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
         
         var lastCountry = null;
         function OnCountryChanged(cmbCountry) {
             debugger;
             document.getElementById("<%=HiddenField1.ClientID%>").value = cmbCountry.GetValue().toString();
             if (gvAeronave.GetEditor("IdModelo").InCallback())
                 lastCountry = cmbCountry.GetValue().toString();
             else
                 gvAeronave.GetEditor("IdModelo").PerformCallback(cmbCountry.GetValue().toString());
         }
         function OnEndCallback(s, e) {   
             if (lastCountry) {
                 gvAeronave.GetEditor("IdModelo").PerformCallback(lastCountry);
                 lastCountry = null;
             }
         }

         var lastFlota = null;
         function OnFlotaChanged(cmbFlota) {  
             document.getElementById("<%=HiddenField2.ClientID%>").value = cmbFlota.GetValue().toString();
             if (gvAeronave.GetEditor("MatriculaInfo").InCallback())
                 lastCountry = cmbFlota.GetValue().toString();
             else
                 gvAeronave.GetEditor("MatriculaInfo").PerformCallback(cmbFlota.GetValue().toString());
         }

        function OnSaveClick(s, e) {
            gvAeronave.UpdateEdit();
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">                        
                        <span class="FTitulo">&nbsp;&nbsp;Aeronave</span>
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
                                        <asp:DropDownList runat="server" CssClass="combo" ID="ddlTipoBusqueda">
                                                        <asp:ListItem Text="[Sin Filtro]" Value="0" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="Serie" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Matrícula" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Solo Activos" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Solo Inactivos" Value="4"></asp:ListItem>
                                               </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <dx:ASPxButton CssClass="FBotton" ID="btnBusqueda" Text="Buscar" Theme="Office2010Black" runat="server" OnClick="btnBuscar_Click"></dx:ASPxButton>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:HiddenField ID="HiddenField2" runat="server" />
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
                                        <dx:ASPxGridView CssClass="FGrid" ID="gvAeronave" runat="server" AutoGenerateColumns="False" 
                                            ClientInstanceName="gvAeronave" EnableTheming="True" KeyFieldName="IdAeroave"
                                            OnCellEditorInitialize="gvAeronave_CellEditorInitialize" OnRowDeleting="gvAeronave_RowDeleting"
                                            OnRowInserting="gvAeronave_RowInserting" OnRowUpdating="gvAeronave_RowUpdating" Styles-Header-HorizontalAlign ="Center"
                                            OnStartRowEditing="gvAeronave_StartRowEditing" OnRowValidating="gvAeronave_RowValidating" OnCommandButtonInitialize="gvAeronave_CommandButtonInitialize"
                                            Theme="Office2010Black" Width="100%" OnCancelRowEditing="gvAeronave_CancelRowEditing">
                                            <ClientSideEvents EndCallback="function (s, e) {
                                            if (s.cpShowPopup)
                                            {
                                                delete s.cpShowPopup;
                                                lbl.SetText(s.cpText);
                                                popup.Show();
                                            }
                                        }" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Matrícula" FieldName="Matricula" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Serie" FieldName="Serie" ShowInCustomizationForm="True" VisibleIndex="2">
                                                     <PropertiesTextEdit MaxLength="50">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <%--manda--%>
                                                <dx:GridViewDataComboBoxColumn Caption="Marca" FieldName="IdMarca" ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n" ValueField="CountryName"
                                                         EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" />
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                 <%--manda--%>

                                                <dx:GridViewDataTextColumn Caption="Marca" FieldName="DescripcionMarca" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Flota" FieldName="DescripcionFlota" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>


                                                <dx:GridViewDataComboBoxColumn Caption="Flota" FieldName="IdFlota" ShowInCustomizationForm="True" VisibleIndex="6" Visible="false">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <PropertiesComboBox NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n"   ValueField="FlotaName"
                                                         EnableSynchronization="False"  IncrementalFilteringMode="StartsWith"> 
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnFlotaChanged(s); }" />                                                  
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>

                                                <%--obedece--%>
                                                <dx:GridViewDataComboBoxColumn Caption="Modelo" FieldName="IdModelo" ShowInCustomizationForm="True" VisibleIndex="7" Visible="false">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                     <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n" 
                                                         EnableSynchronization="False"  IncrementalFilteringMode="StartsWith">
                                                         <ClientSideEvents EndCallback="OnEndCallback"/> 
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <%--obedece--%>

                                                <dx:GridViewDataTextColumn Caption="Modelo" FieldName="DescripcionModelo" ShowInCustomizationForm="True" VisibleIndex="8">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Año de Fabricación" FieldName="AñoFabricacion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                    <EditFormSettings Visible="True" ></EditFormSettings>
                                                    <PropertiesTextEdit MaxLength ="4">
                                                        <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                             <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ValidationExpression="[0-9][0-9][0-9][0-9]"></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Capacidad de Pasajeros" FieldName="CapacidadPasajeros" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                    <PropertiesTextEdit MaxLength="2">
                                                        <ValidationSettings ErrorDisplayMode="Text" CausesValidation="True" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                             <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida." ValidationExpression="[0-9]*"></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Base" FieldName="IdAeropuertoBase" ShowInCustomizationForm="True" VisibleIndex="10" Visible="false">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <PropertiesComboBox NullText="Seleccione una opción"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Matrícula SAP" FieldName="MatriculaInfo" ShowInCustomizationForm="True" VisibleIndex="0" Visible="true">
                                                    <EditFormSettings Visible="True" VisibleIndex="11"></EditFormSettings>
                                                   <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="Matrícula SAP" FieldName="MatriculaInfo" ShowInCustomizationForm="True" VisibleIndex="0" Visible="false">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Base SAP" FieldName="IdBaseInfo" ShowInCustomizationForm="True" VisibleIndex="13" Visible="false">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                   <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="Base SAP" FieldName="BaseInfo" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Unidad de Negocio SAP" FieldName="IdUnidadNegocioInfo" ShowInCustomizationForm="True" VisibleIndex="15" Visible="false">
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                    <PropertiesComboBox  NullText="Seleccione una opci&#243;n" NullDisplayText="Seleccione una opci&#243;n">
                                                        <ValidationSettings ErrorDisplayMode="Text" ErrorText="Error en la informaci&#243;n ingresada." ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" ErrorText="El campo es requerido."></RequiredField>
                                                            <RegularExpression ErrorText="El campo contiene informaci&#243;n inv&#225;lida."></RegularExpression>
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Tipo" FieldName="IdTipo" ShowInCustomizationForm="True" VisibleIndex="16" Visible="false">
                                                    <EditFormSettings Visible="false"></EditFormSettings>                                                  
                                                </dx:GridViewDataComboBoxColumn>

                                                <dx:GridViewDataTextColumn Caption="Unidad de Negocio SAP" FieldName="UnidadNegocioInfo" ShowInCustomizationForm="True" VisibleIndex="17" Visible="False">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="FechaInicio" Caption="Fecha de Alta en la Flota" Visible="False" VisibleIndex="18">
                                                    <PropertiesDateEdit DisplayFormatString="" NullText="Seleccione fecha">
                                                        <DropDownButton>
                                                            <Image IconID="scheduling_calendar_16x16"></Image>
                                                        </DropDownButton>
                                                    </PropertiesDateEdit>
                                                    <EditFormSettings Visible="True">
                                                    </EditFormSettings>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="FechaFin" Caption="Fecha de Baja en la Flota" Visible="False" VisibleIndex="23">
                                                    <PropertiesDateEdit DisplayFormatString="" NullText="Seleccione fecha">
                                                        <DropDownButton>
                                                            <Image IconID="scheduling_calendar_16x16"></Image>
                                                        </DropDownButton>
                                                    </PropertiesDateEdit>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dx:GridViewDataDateColumn>

                                                <dx:GridViewDataTextColumn FieldName="TipoModeloDescripcion" Caption="Tipo" Visible="true" VisibleIndex="19">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataCheckColumn Caption="¿Reporte SENEAM?" FieldName="ReporteSENEAM" ShowInCustomizationForm="True" VisibleIndex="22">
                                                    <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                    </PropertiesCheckEdit>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="¿Activo?" FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="24">
                                                    <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                    </PropertiesCheckEdit>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewCommandColumn ButtonType="Button" Caption="Acciones" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="25">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />                                                   

                                                </dx:GridViewCommandColumn>
                                            </Columns>
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <StylesPager  Pager-CssClass="FNumPag"></StylesPager>
                                            <SettingsPager Position="TopAndBottom">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100">                                                    
                                                </PageSizeItemSettings>                                                
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
                                            <Settings ShowGroupPanel="True" />
                                            <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />
                                            <SettingsPopup>
                                                <EditForm HorizontalAlign="Center" VerticalAlign="WindowCenter" Width="900px" />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsCommandButton>
                                                <NewButton ButtonType="Link" >
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
                                        <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvAeronave">
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
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>

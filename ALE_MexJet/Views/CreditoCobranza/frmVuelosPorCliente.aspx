﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmVuelosPorCliente.aspx.cs" Inherits="ALE_MexJet.Views.CreditoCobranza.frmVuelosPorCliente" UICulture="es" Culture="es-MX"  %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Src="~/ControlesUsuario/ucClienteContrato.ascx" TagPrefix="uc2" TagName="ucClienteContrato" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v18.1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="~/../../../JS/jquery/jquery-1.8.3.js"></script>
     
    <script type="text/javascript">                      
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 25px;">&nbsp;&nbsp;Reporte Vuelos por Cliente</span>
                    </div>
                </div>
                <div class="well-g">
                    <div class="row">
                        <div class="col-md-12">

                            <fieldset class="Personal">
                                 <legend>
                                       <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Búsqueda General</span>
                                </legend>
                                                                
                                    <uc1:ucModalMensaje ID="mpeMensaje" runat="server"/>                                                                        
                                
                                <div class="col-sm-12">
                                    <div class="col-lg-4" style="text-align:left">
                                        <uc2:ucClienteContrato ID="mpeComboClienteContrato" runat="server"  />
                                    </div>
                                    <div class="col-lg-4" style="text-align:right;">

                                        <table id="miTabla">
                                         <tr>   
                                            <td>
                                                <dx:ASPxLabel ID="lblFechaInicial" runat="server" Text="Fecha Inicial:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>                                     
                                            <td>
                                                <dx:ASPxDateEdit ID="dFechaIni" ClientInstanceName="dFechaIni" NullText="Fecha Inicial" runat="server" ToolTip="Fecha Inicial" Theme="Office2010Black">
                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="Text">
                                                        <RequiredField  IsRequired="true"  ErrorText="Debe seleccionar una fecha."/>
                                                    </ValidationSettings>
                                                    </dx:ASPxDateEdit>                                                
                                            </td>
                                        </tr>
                                            <tr><td colspan="2" style="height:15px"></td></tr>
                                        <tr> 
                                            <td>
                                                <dx:ASPxLabel ID="lblFechaFinal" runat="server" Text="Fecha Final:" Theme="Office2010Black"></dx:ASPxLabel>
                                            </td>                                         
                                            <td>
                                                    <dx:ASPxDateEdit ID="dFechaFin" ClientInstanceName="dFechaFin" runat="server" Theme="Office2010Black" ToolTip="Fecha Final" NullText="Fecha Final">
                                                    <DateRangeSettings StartDateEditID="dFechaIni"></DateRangeSettings>
                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="Text">
                                                        <RequiredField  IsRequired="true"  ErrorText="Debe seleccionar una fecha."/>
                                                    </ValidationSettings>
                                                    </dx:ASPxDateEdit>
                                            </td>                                                                                  
                                        </tr>                                                                                                                            
                                    </table> 
                                    </div>                               
                                    <div class="col-lg-4">
                                        <dx:ASPxButton ID="btnBusqueda" Text="Buscar" Theme="Office2010Black" runat="server" OnClick="btnBusqueda_Click" ></dx:ASPxButton>
                                    </div>
                                </div>                                                                                                                    
                                <br />                                                                   
                            </fieldset>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <dx:ASPxButton ID="btnNuevo" runat="server" Text="Nuevo" Theme="Office2010Black" Visible="false" ></dx:ASPxButton>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <dx:ASPxLabel runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                            &nbsp;<dx:ASPxButton ID="btnExcel" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExcel_Click" ></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12" style="margin-left: -15px; width: 103%;">
                            <asp:UpdatePanel runat="server" UpdateMode="Always" OnUnload="Unnamed_Unload">
                                <ContentTemplate>
                                    <div class="col-sm-12">
                                        <dx:ASPxGridView ID="gvVueloCliente" runat="server" AutoGenerateColumns="False" 
                                            ClientInstanceName="gvVueloCliente" EnableTheming="True" KeyFieldName="IdAeroave"                                            
                                            Styles-Header-HorizontalAlign ="Center" Theme="Office2010Black" Width="100%" >
                                            <ClientSideEvents EndCallback="function (s, e) {
                                            if (s.cpShowPopup)
                                            {
                                                delete s.cpShowPopup;
                                                lbl.SetText(s.cpText);
                                                popup.Show();
                                            }
                                        }" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Remisión" FieldName="Remisionado" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="2" Width="220">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Matrícula" FieldName="Matricula" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ruta" FieldName="Ruta" ShowInCustomizationForm="True" VisibleIndex="4" Width="200">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Horas Propias" FieldName="HorasPropiasCalzo" ShowInCustomizationForm="True" VisibleIndex="5">                                                    
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Importe Propios" FieldName="ImportePropios" ShowInCustomizationForm="True" VisibleIndex="6">
                                                    <PropertiesTextEdit DisplayFormatString="{0:C}"></PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Horas Otros" FieldName="HorasOtros" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Importe Otros" FieldName="ImporteOtros" ShowInCustomizationForm="True" VisibleIndex="8">
                                                    <PropertiesTextEdit DisplayFormatString="{0:C}"></PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Con Cargo" FieldName="ConCargo" ShowInCustomizationForm="True" VisibleIndex="9">
                                                    <PropertiesTextEdit DisplayFormatString="{0:C}"></PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="IVA" FieldName="IVA" ShowInCustomizationForm="True" VisibleIndex="10">
                                                    <PropertiesTextEdit DisplayFormatString="{0:C}"></PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Total" FieldName="Total" ShowInCustomizationForm="True" VisibleIndex="11">
                                                    <PropertiesTextEdit DisplayFormatString="{0:C}"></PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Horas Terceros" FieldName="TercerosHoras" ShowInCustomizationForm="True" VisibleIndex="12">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Importe Terceros" FieldName="ImporteTerceros" ShowInCustomizationForm="True" VisibleIndex="13">
                                                    <PropertiesTextEdit DisplayFormatString="{0:C}"></PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Manto" FieldName="Manto" ShowInCustomizationForm="True" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                           
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsPager Position="TopAndBottom" Visible="true">
                                                <PageSizeItemSettings Items="1, 10, 20, 50, 100" Visible="true">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
                                            <SettingsText ConfirmDelete="¿Está seguro que desea eliminar el registro?" />
                                            <SettingsPopup>
                                                <EditForm HorizontalAlign="Center" VerticalAlign="WindowCenter" Width="900px" />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsCommandButton>
                                                <NewButton ButtonType="Link">
                                                    <Image ToolTip="New">
                                                    </Image>
                                                </NewButton>
                                                <UpdateButton Text="Guardar"></UpdateButton>
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
                                             <Templates>

                                             </Templates>
                                        </dx:ASPxGridView>
                                        <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="gvVueloCliente">
                                        </dx:ASPxGridViewExporter>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    
                                    <asp:PostBackTrigger ControlID="btnExcel" />
                                    <asp:PostBackTrigger ControlID="btnExcel2" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6">
                            <dx:ASPxButton ID="btnNuevo2" runat="server" Text="Nuevo" Theme="Office2010Black" Visible="false" ></dx:ASPxButton>
                        </div>
                        <div class="col-sm-6" style="text-align: right;">
                            <dx:ASPxLabel runat="server" Theme="Office2010Black" Text="Exportar a:"></dx:ASPxLabel>
                            &nbsp;<dx:ASPxButton ID="btnExcel2" runat="server" Text="Excel" Theme="Office2010Black" OnClick="btnExcel_Click" ></dx:ASPxButton>
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


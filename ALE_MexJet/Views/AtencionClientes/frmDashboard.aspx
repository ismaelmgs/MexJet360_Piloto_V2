﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmDashboard.aspx.cs" Inherits="ALE_MexJet.Views.AtencionClientes.frmDashboard" UICulture="es" Culture="es-MX"  %>
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
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 25px;">&nbsp;&nbsp;DASHBOARD  CXC</span>
                    </div>
                </div>
                <div class="well-g">
                    <div class="row">
                        <div class="col-md-12">

                            <fieldset class="Personal">
                                 <legend>
                                       <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                </legend>
                                
                                <uc1:ucModalMensaje ID="mpeMensaje" runat="server"/>                               
                                
                                <dx:ASPxRoundPanel ID="PanelAvisos" ClientInstanceName="PanelAvisos" runat="server" LoadContentViaCallback="true" 
                                   HeaderText="AVISOS" collapsed="false" ShowCollapseButton="true" AllowCollapsingByHeaderClick="true" Width="80%" HeaderStyle-HorizontalAlign="Left">
                                   <PanelCollection>
                                       
                                       <dx:PanelContent ID="PanelContent1" runat="server">                                          
                                           <div id="divAvisos" runat="server">

                                           </div>                                           
                                       </dx:PanelContent>
                                   </PanelCollection>
                               </dx:ASPxRoundPanel>
                                
                                <br />
                               
                                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" ClientInstanceName="ASPxRoundPanel1" runat="server" LoadContentViaCallback="true" 
                                   HeaderText="CLIENTES" collapsed="false" ShowCollapseButton="true" AllowCollapsingByHeaderClick="true" Width="80%" HeaderStyle-HorizontalAlign="Left">
                                   <PanelCollection>
                                       <dx:PanelContent ID="PanelContent2" runat="server">
                                           <div id="divClientes" runat="server">

                                           </div>
                                       </dx:PanelContent>
                                   </PanelCollection>
                               </dx:ASPxRoundPanel> 

                               <br />

                               <dx:ASPxRoundPanel ID="ASPxRoundPanel2" ClientInstanceName="ASPxRoundPanel1" runat="server" LoadContentViaCallback="true" 
                                   HeaderText="VUELOS" collapsed="false" ShowCollapseButton="true" AllowCollapsingByHeaderClick="true" Width="80%" HeaderStyle-HorizontalAlign="Left">
                                   <PanelCollection>
                                       <dx:PanelContent ID="PanelContent3" runat="server">
                                          <div id="divVuelos" runat="server">

                                           </div>
                                       </dx:PanelContent>
                                   </PanelCollection>
                               </dx:ASPxRoundPanel> 
                                                                                                                                                   
                                <br />                                                                   
                            </fieldset>
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

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmSolicitudVuelo.aspx.cs" Inherits="ALE_MexJet.Views.AtencionClientes.frmSolicitudVuelo" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css" media="screen">
        / Accordion / fieldset {
            border: 1px solid #757474;
        }

        .accordionContent {
            border: 1px solid #757474;
            border-top: none;
            padding: 5px;
            padding-top: 10px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .accordionHeader {
            border: 1px solid #472777;
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top: 5px;
            cursor: pointer;
            text-align: left;
            background-color: #757474;
            color: #FFFFFF;
            text-decoration: underline;
        }

            .accordionHeader a {
                text-decoration: underline;
            }

                .accordionHeader a:hover {
                    text-decoration: underline;
                }

        .accordionHeaderSelected {
            border: 1px solid #472777;
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top: 5px;
            cursor: pointer;
            text-align: left;
            background-color: #565656;
            color: #FFFFFF;
            text-decoration: underline;
        }

            .accordionHeaderSelected a {
                text-decoration: underline;
            }

                .accordionHeaderSelected a:hover {
                    text-decoration: underline;
                }
    </style>

    <dx:ASPxPanel ID="pnlContainer" runat="server" Width="100%" BackColor="White" style="border-radius:21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Solicitudes de Vuelo</span>
                    </div>
                </div>
                <div class="well-g">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Datos del Contrato
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-3">
                                <dx:ASPxLabel runat="server" ID="lblCliente" Text="Cliente:"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-3">
                                <dx:ASPxLabel runat="server" ID="lblContrato" Text="Contrato:"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-3">
                                <dx:ASPxLabel runat="server" ID="lblTipoContrato" Text="Tipo de Contrato:"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-3">
                                <dx:ASPxLabel runat="server" ID="lblTipoEquipo" Text="Tipo de Equipo:"></dx:ASPxLabel>
                            </div>
                        </div>

                       
                    </div>
                    <div class="">
                         <asp:UpdatePanel ID="upaAccordion" runat="server">
                            <ContentTemplate>
                                <cc1:Accordion ID="AcPrincipal" runat="Server" HeaderCssClass="accordionHeader"
                                    HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent"
                                    AutoSize="None" FadeTransitions="true" TransitionDuration="150" FramesPerSecond="40"
                                    RequireOpenedPane="false" SuppressHeaderPostbacks="true" Width="100%" Height="995px"
                                    >
                                    <Panes>
                                        <cc1:AccordionPane ID="sDatosSolicitud" runat="server" HeaderCssClass="accordionHeader" ContentCssClass="accordionContent">
                                            <Header>
                                                <asp:Label ID="lblBusquedaClientes" runat="server" Text="Datos generales de la solicitud"></asp:Label>
                                            </Header>
                                            <Content>
                                            </Content>
                                        </cc1:AccordionPane>
                                        <cc1:AccordionPane ID="aSeguimientoSolicitudes" runat="server" HeaderCssClass="accordionHeader" ContentCssClass="accordionContent">
                                            <Header>
                                                <asp:Label ID="lblSeguimiento" runat="server" Text="Seguimiento a solicitudes"></asp:Label>
                                            </Header>
                                            <Content>
                                            </Content>
                                        </cc1:AccordionPane>

                                    </Panes>
                                </cc1:Accordion>
                                <asp:Panel runat="server" ID="pnlPrueba" Visible="false">
                                    <asp:TextBox runat="server" ID="txt"></asp:TextBox>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
</asp:Content>

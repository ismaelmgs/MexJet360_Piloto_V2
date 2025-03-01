﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmCasos.aspx.cs" Inherits="ALE_MexJet.Views.AtencionClientes.frmCasos" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" style="border-radius:21px;">
        <PanelCollection>
            <dx:PanelContent>

                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Alta de Casos</span>
                    </div>
                </div>
                <div class="well-g">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Datos del Contrato
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-2">
                                <dx:ASPxLabel runat="server" ID="lblCliente" Text="Cliente:"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-2">
                                <dx:ASPxLabel runat="server" ID="lblContrato" Text="Contrato:"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-3">
                                <dx:ASPxLabel runat="server" ID="lblTipoContrato" Text="Tipo de Contrato:"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-3">
                                <dx:ASPxLabel runat="server" ID="lblTipoEquipo" Text="Tipo de Equipo:"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-2">
                                <dx:ASPxLabel runat="server" ID="lblRuta" Text="Ruta:"></dx:ASPxLabel>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="form-group col-lg-12" style="padding-left: 0px;">
                            <div class="col-lg-2">
                                <dx:ASPxLabel runat="server" ID="lblCaso" Text="Tipo de Caso:" Theme="Office2010Black"></dx:ASPxLabel>
                            </div>
                            <div class="col-lg-6">
                                <dx:ASPxComboBox runat="server" ID="ddlTipoCaso" Theme="Office2010Black" OnSelectedIndexChanged="ddlTipoCaso_SelectedIndexChanged"  AutoPostBack="True">
                                    <Items>
                                        <dx:ListEditItem Text="valor1" Value="valor1" />
                                        <dx:ListEditItem Text="valor2" Value="valor2" />
                                        <dx:ListEditItem Text="valor3" Value="valor3" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </div>
                        </div>
                    </div>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
</asp:Content>


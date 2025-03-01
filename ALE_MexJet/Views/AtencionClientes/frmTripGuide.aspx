﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmTripGuide.aspx.cs" Inherits="ALE_MexJet.Views.AtencionClientes.frmTripGuide" %>

<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Styles/Controls.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        function Selrdbtn(id) {

            var rdBtn = document.getElementById(id);

            var List = document.getElementsByTagName("input");
            for (i = 0; i < List.length; i++) {
                if (List[i].type == "radio" && List[i].id != rdBtn.id) {
                    List[i].checked = false;
                }
            }
        }


        function OcultaError() {
            ppMensaje.Hide();
        }

        function VerTripGuideEs() {
            document.getElementById('TripGuidEn').style.display = "none";
            document.getElementById('TripGuidEs').style.display = "block";

            hdBanderaTripGuideHtml.Set('hidden_value', '1');

        }

        function VerTripGuideEn() {
            document.getElementById('TripGuidEn').style.display = "block";
            document.getElementById('TripGuidEs').style.display = "none";

            hdBanderaTripGuideHtml.Set('hidden_value', '2');
        }

        function TablaIdiomaTripGuide() {

            ppEnviarMailTripGuide.Hide();

            var valor = hdBanderaTripGuideHtml.Get("hidden_value");

            if (valor == "1") {

                var ValorHtml = document.getElementById('TripGuidEs').innerHTML;

                if (hdTablaTripGuideHtml != null) {
                    hdTablaTripGuideHtml.Set("ValorHtml", ValorHtml);
                }

            }
            else {

                var ValorHtml = document.getElementById('TripGuidEn').innerHTML;

                if (hdTablaTripGuideHtml != null) {
                    hdTablaTripGuideHtml.Set("ValorHtml", ValorHtml);
                }
            }

        }

        function MostrarPanelCorreo() {
            ppEnviarMailTripGuide.Show();
            return true;
        }

        function MostrarPanelGuardarTripGuide() {
            ppGuardarTripGuide.Show();
            return true;
        }

    </script>
    <style type="text/css">
        .tableBorder {
            border-bottom: 2px solid #cccccc;
        }

        .mainHeader {
            font-weight: bold;
            font-size: 16px;
        }

        .header {
            font-weight: bold;
            font-size: 11px;
        }
    </style>
    <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
    <dx:ASPxPanel ID="pnlPrincipal" Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <asp:UpdatePanel ID="upaPrincipal" runat="server" OnUnload="upaTripGuide_Unload">
                    <ContentTemplate>
                        <dx:ASPxHiddenField ID="hdTablaTripGuideHtml" runat="server" ClientInstanceName="hdTablaTripGuideHtml"></dx:ASPxHiddenField>
                        <dx:ASPxHiddenField ID="hdBanderaTripGuideHtml" runat="server" ClientInstanceName="hdBanderaTripGuideHtml"></dx:ASPxHiddenField>
                        <div class="row header1">
                            <div class="col-md-12">
                                <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Trip Guide</span>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <br />
                            <div class="panel-heading" style="/* permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#45484d+0,565656+100 */
                                                background: rgb(69,72,77); /* old browsers */
                                                /* ie9 svg, needs conditional override of 'filter' to 'none' */
                                                background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzQ1NDg0ZCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiM1NjU2NTYiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+); background: -moz-linear-gradient(top,  rgba(69,72,77,1) 0%, rgba(86,86,86,1) 100%); /* ff3.6+ */
                                                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(69,72,77,1)), color-stop(100%,rgba(86,86,86,1))); /* chrome,safari4+ */
                                                background: -webkit-linear-gradient(top,  rgba(69,72,77,1) 0%,rgba(86,86,86,1) 100%); /* chrome10+,safari5.1+ */
                                                background: -o-linear-gradient(top,  rgba(69,72,77,1) 0%,rgba(86,86,86,1) 100%); /* opera 11.10+ */
                                                background: -ms-linear-gradient(top,  rgba(69,72,77,1) 0%,rgba(86,86,86,1) 100%); /* ie10+ */
                                                background: linear-gradient(to bottom,  rgba(69,72,77,1) 0%,rgba(86,86,86,1) 100%); /* w3c */
                                                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#45484d', endColorstr='#565656',GradientType=0 ); /* ie6-8 */">
                                Datos del Contrato
                            </div>
                            <div class="panel-body">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 5%"></td>
                                        <td style="width: 15%">
                                            <dx:ASPxLabel runat="server" ID="lblSolicitud" Text="No. Solicitud: "></dx:ASPxLabel>
                                            <dx:ASPxLabel runat="server" ID="lblSolicitud2" Text="" Font-Bold="true"></dx:ASPxLabel>
                                        </td>
                                        <td style="width: 15%">
                                            <dx:ASPxLabel runat="server" ID="lblContrato" Text="No. Contrato: " Visible="false"></dx:ASPxLabel>
                                            <dx:ASPxLabel runat="server" ID="lblContrato2" Text="" Font-Bold="true" Visible="false"></dx:ASPxLabel>
                                        </td>
                                        <td style="width: 25%">
                                            <dx:ASPxLabel runat="server" ID="lblTrip" Text="No. Trip: "></dx:ASPxLabel>
                                            <dx:ASPxLabel runat="server" ID="lblTrip2" Text="" Font-Bold="true"></dx:ASPxLabel>
                                        </td>
                                        <td style="width: 25%">
                                            <dx:ASPxLabel runat="server" ID="lblContacto" Text="Contacto: " Visible="false"></dx:ASPxLabel>
                                            <dx:ASPxLabel runat="server" ID="lblContacto2" Text="" Font-Bold="true" Visible="false"></dx:ASPxLabel>
                                        </td>
                                        <td style="width: 5%"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <fieldset class="Personal1">
                                    <legend>
                                        <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Seleccione Pierna</span>
                                    </legend>
                                    <%--Grip de los Trips--%>
                                    <asp:Panel ID="Panel1" runat="server" align="center">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <asp:GridView ID="gvPiernas" runat="server" AutoGenerateColumns="false" ShowFooter="true" CssClass="table"
                                                    Style="border-top: 1px solid #484848; border-left: 1px solid #484848; border-right: 1px solid #484848; border-bottom: 1px solid #484848;" Width="800px">
                                                    <HeaderStyle CssClass="celda2" HorizontalAlign="Center" />
                                                    <RowStyle CssClass="celda6" Height="10px" />
                                                    <FooterStyle CssClass="celda3" />
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:RadioButton ID='rbSeleccione' runat="server" OnClick="javascript:Selrdbtn(this.id)" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="ID Pierna" DataField="legid" ItemStyle-HorizontalAlign="Center">
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderText="Origen" DataField="depicao_id" ItemStyle-HorizontalAlign="Center">
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderText="Destino" DataField="arricao_id" ItemStyle-HorizontalAlign="Center">
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderText="Fecha Salida" DataField="locdep" ItemStyle-HorizontalAlign="Center">
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderText="Fecha Llegada" DataField="locarr" ItemStyle-HorizontalAlign="Center">
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                    <br />
                                    <div class="form-group">
                                        <div class="col-sm-12 text-left">
                                            <dx:ASPxButton runat="server" Theme="Office2010Black" ID="btnGenerarTrip" Text="Generar TripGuide" OnClick="btnGenerarTripGuide_Click"></dx:ASPxButton>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <br />
                        <div style="text-align: center; width: 80%">
                            <table style="margin: 0px 250px; width: 80%">
                                <tr>
                                    <td>
                                        <dx:ASPxPanel ID="pnlTripGuide" runat="server" Width="100%" Visible="false" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                            <PanelCollection>
                                                <dx:PanelContent>
                                                    <%--Seleccionar Idioma--%>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 100%; text-align: center">Seleccione idioma:
                                                                
                                                                <a title="Ver en Español" onclick="return VerTripGuideEs();">
                                                                    <img src="../../img/iconos/es.gif"></img></a>
                                                                <a title="Ver en Inglés" onclick="return VerTripGuideEn();">
                                                                    <img src="../../img/iconos/en.gif"></img></a>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <%--TRIPGUIDE INGLES --%>
                                                    <div id="TripGuidEn" style="display: none">
                                                        <table id="TablaPrincipalEn" style="width: 100%;">
                                                            <tbody>
                                                                <%--Tabla Encabezado--%>
                                                                <tr style="height: 51px; width: 100%">
                                                                    <td>
                                                                        <table id="TablaEncabezadoEn" style="width: 100%; border-bottom-width: 3px; border-bottom-color: #cccccc; border-bottom-style: solid;">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="vertical-align: middle; text-align: left;">
                                                                                        <%--dx:ASPxImage ID="imgLogoAleEn" runat="server" ImageUrl="../../img/iconos/MailMexJetHeadEn.png" ShowLoadingImage="True" Width="950px" Height="126px"></dx:ASPxImage>--%>
                                                                                        <img id="imgLogoAleEn" src="../../img/iconos/MailMexJetHeadEn.png" width="950" height="126" />
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla Datos Generales Contacto--%>
                                                                <tr style="width: 100%;">
                                                                    <td>
                                                                        <table style="width: 100%; text-align: left; border-spacing: 5px 5px; border-collapse: separate;">
                                                                            <tr>
                                                                                <td>
                                                                                    <table style="border-spacing: 0px 3px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblSolicitante1En" runat="server" Text="Dear Mr./Ms " Font-Bold="true" Font-Size="19px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblSolicitante2En" runat="server" Text="[First name, Last name]" Font-Bold="true" Font-Size="19px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <label style="font: bold 16px arial; color: #003366">Aerol&iacute;neas Ejecutivas &#174;</label>
                                                                                                <label style="font: 16px arial; color: #000000;">has the pleasure of confirming your upcoming flight with us.</label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblTipo1En" runat="server" Text="Aircraft: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblTipo2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblPuntoyComa1En" runat="server" Text=". " ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblregistro1En" runat="server" Text="Membership: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblregistro2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblPuntoyComa2En" runat="server" Text=". " Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblDistancia1En" runat="server" Text="It will fly: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblDistancia2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblOverEn" runat="server" Text=" over " ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblTiempoVueloEn" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblHoursEn" runat="server" Text=" hours." ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="vertical-align: text-top;">
                                                                                    <table style="border: 1px solid;">
                                                                                        <tr>
                                                                                            <td style="text-align: center; width: 33.33%; padding: 5px;">
                                                                                                <dx:ASPxLabel ID="lblFechaActualEn" runat="server" Text="Date: 04-04-2016." Font-Bold="true" Font-Size="13px" ForeColor="Black" Font-Names="Arial">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla Datos Generales Vuelo--%>
                                                                <tr style="width: 100%">
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="width: 10px">
                                                                                    <%--Tabla Horario Vuelo--%>
                                                                                    <table style="text-align: left; border-spacing: 5px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFechaSalida1En" runat="server" Text="Departure: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFechaSalida2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblOrigen1En" runat="server" Text="From: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblOrigen2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFBOSalida1En" runat="server" Text="FBO: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFBOSalida2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right">
                                                                                                <label style="font-size: 6px"></label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFechallegada1En" runat="server" Text="Arrival:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFechallegada2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblDestino1En" runat="server" Text="To:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblDestino2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFBOLlegada1En" runat="server" Text="FBO: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFBOLlegada2En" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right">
                                                                                                <dx:ASPxLabel Style="font-size: 12px; font-style: italic;" ID="lblTituloTiempoLocal1En" runat="server" Text="All times are showed as "></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel Style="font-size: 12px; font-style: italic;" Font-Bold="true" Font-Underline="true" ID="lblTituloTiempoLocal2En" runat="server" Text="Local Times."></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <br />
                                                                                    <%--Tabla Pasajeros--%>
                                                                                    <table style="text-align: left; border-spacing: 5px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblPassanger1En" runat="server" Text="Passengers (" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblNoPassangerEn" runat="server" Text="20" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblPassanger2En" runat="server" Text=" ):" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table style="text-align: left; vertical-align: top; border-spacing: 35px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <div runat="server" id="tblListaPasajerosEn">
                                                                                                </div>
                                                                                                <%-- <dx:ASPxLabel ID="lblListaPasajerosEn" runat="server" Text=""></dx:ASPxLabel>--%>
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table style="text-align: left; vertical-align: top; border-spacing: 5px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblObservaciones1En" runat="server" Text="Observations:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblObservaciones2En" runat="server" Text="" Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="vertical-align: middle; width: 49%; text-align: left">
                                                                                    <%--Imagen Tipo de Avión--%>
                                                                                    <dx:ASPxImage ID="imgAeronaveEn" runat="server" ImageUrl="../../img/iconos/challenger605.jpg" ShowLoadingImage="true" Width="500px" Height="300px"></dx:ASPxImage>

                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla Datos Generales Tripulacion--%>
                                                                <tr style="width: 100%">
                                                                    <td>
                                                                        <table style="width: 100%; text-align: left; vertical-align: top; border-spacing: 5px 5px; border-collapse: separate; border-bottom: 3px solid #cccccc;">
                                                                            <tr>
                                                                                <td>
                                                                                    <table style="width: 100%;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table style="width: 100%">
                                                                                                    <tbody>
                                                                                                        <tr style="vertical-align: top; text-align: left">
                                                                                                            <td>
                                                                                                                <br />
                                                                                                                <dx:ASPxLabel ID="lblEquipoEn" runat="server" Text="Your crew will be:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <br />
                                                                                                                <br />
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table style="width: 100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="vertical-align: top">
                                                                                                                <dx:ASPxLabel ID="lblCapitan1En" runat="server" Text="Captain:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCopiloto1En" runat="server" Text="Second-in-command:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCapitan2En" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCopiloto2En" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCapitanTelNum1En" runat="server" Text="Cell phone:" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <dx:ASPxLabel ID="lblCapitanTelNum2En" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td style="vertical-align: top">

                                                                                                                <dx:ASPxLabel ID="lblCopiloto1NumEn" runat="server" Text="Cell phone:" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <dx:ASPxLabel ID="lblCopiloto2NumEn" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <br />
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table style="width: 100%;">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="width: 50%; vertical-align: top">
                                                                                                                <dx:ASPxLabel ID="lblComisariato1En" runat="server" Text="Your catering is:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <br />
                                                                                                                <dx:ASPxLabel ID="lblComisariato2En" runat="server" Text="" Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td style="width: 50%">
                                                                                                                <dx:ASPxLabel ID="lblTransportacion1En" runat="server" Text="Ground transportation:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <br />
                                                                                                                <dx:ASPxLabel ID="lblTransportacion2En" runat="server" Text="" Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <br />
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>

                                                                                </td>
                                                                                <td style="vertical-align: top; text-align: left; width: 49%">
                                                                                    <!-- Map -->
                                                                                    <%--<iframe id="ifrmMapaEn" runat="server" scrolling="no" style="border: 0px; width: 400px; height: 210px;"></iframe>--%>
                                                                                    <dx:ASPxImage ID="imgMapaEn" runat="server" ShowLoadingImage="true" Width="400px" Height="210px"></dx:ASPxImage>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <table style="vertical-align: top; text-align: left; border-spacing: 5px 0px; border-collapse: separate;">
                                                                            <tr>
                                                                                <td style="font-size: 8px;">
                                                                                    <br />
                                                                                    If you would like to get in contact with us, please call:<br />
                                                                                    <br />
                                                                                    Toluca: +52 722 279 1625; ac.tlc@aerolineasejecutivas.com<br />
                                                                                    <br />
                                                                                    Monterrey: +52 818 288 7900; ac.adn@aerolineasejecutivas.com<br />
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla lugares de interes--%>
                                                                <tr style="width: 100%">
                                                                    <td style="width: 100%; text-align: left; height: 100%">
                                                                        <table id="TablaTripAdvisor" runat="server" style="font-size: 7px; vertical-align: top; width: 100%; height: 70%; border-spacing: 5px 5px; border-collapse: separate;">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="vertical-align: top; width: 33.33%">
                                                                                        <dx:ASPxImage ID="imgOpenWeatherEn" runat="server" ShowLoadingImage="true" ImageUrl="../../img/iconos/icon_openWeather.png" Height="40%"></dx:ASPxImage>
                                                                                    </td>
                                                                                    <td style="vertical-align: top; width: 33.33%">
                                                                                        <%--<dx:ASPxImage ID="imgRestauranteEn" runat="server" ShowLoadingImage="true" ImageUrl="../../img/iconos/icon_restaurante.png" Height="45%"></dx:ASPxImage>--%>
                                                                                    </td>
                                                                                    <td style="vertical-align: top; width: 33.33%">
                                                                                        <%--<dx:ASPxImage ID="imgActividadesEn" runat="server" ShowLoadingImage="true" ImageUrl="../../img/iconos/icon_actividades.png" Height="45%"></dx:ASPxImage>--%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="font-size: 7px; vertical-align: top;">
                                                                                        <div runat="server" id="tblClimaDestinoEn">
                                                                                        </div>
                                                                                    </td>
                                                                                    <td style="font-size: 7px; vertical-align: top;">
                                                                                        <%--<div runat="server" id="tblRestaurantesDestinoEn">
                                                                                        </div>--%>
                                                                                    </td>
                                                                                    <td style="font-size: 7px; vertical-align: top;">
                                                                                        <%--<div runat="server" id="tblActividadesDestinoEn">
                                                                                        </div>--%>
                                                                                    </td>

                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <%--Pie de pagina--%>
                                                        <table style="width: 100%; height: 100%">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <table style="margin: 0px 0px;">
                                                                            <tr>
                                                                                <td style="text-align: left; width: 85px">
                                                                                    <br />
                                                                                    <img src="../../img/iconos/poweredBy.jpg" height="13" width="85" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>

                                                            </tbody>
                                                        </table>
                                                        <table style="width: 100%;">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="text-align: left; font-size: 6px;">Aerol&iacute;neas Ejecutivas S.A de C.V is not responsible for an outside content from other websites or TripAdvisor LLC recommendations.</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <img src="../../img/iconos/PiePagina.jpg" width="950" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <%--TRIPGUIDE ESPAÑOL --%>
                                                    <div id="TripGuidEs">
                                                        <table id="TablaPrincipalEs" style="width: 100%;">
                                                            <tbody>
                                                                <%--Tabla Encabezado--%>
                                                                <tr style="height: 51px; width: 100%">
                                                                    <td>
                                                                        <table id="TablaEncabezadoEs" style="width: 100%; border-bottom-width: 3px; border-bottom-color: #cccccc; border-bottom-style: solid;">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="vertical-align: middle; text-align: left;">
                                                                                        <%--<dx:ASPxImage ID="imgLogoAleEs" runat="server" ImageUrl="../../img/iconos/MailMexJetHeadEs.png" ShowLoadingImage="True" Width="950px" Height="126px">
                                                                                        </dx:ASPxImage>--%>
                                                                                        <img id="imgLogoAleEs" src="../../img/iconos/MailMexJetHeadEs.png" width="950" height="126" />
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla Datos Generales Contacto--%>
                                                                <tr style="width: 100%;">
                                                                    <td>
                                                                        <table style="width: 100%; text-align: left; border-spacing: 5px 5px; border-collapse: separate;">
                                                                            <tr>
                                                                                <td>
                                                                                    <table style="border-spacing: 0px 3px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblSolicitante1Es" runat="server" Text="Estimado(a) " Font-Bold="true" Font-Size="19px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblSolicitante2Es" runat="server" Text="[Apellido, Nombre]" Font-Bold="true" Font-Size="19px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <label style="font: bold 16px arial; color: #003366">Aerol&iacute;neas Ejecutivas &#174;</label>
                                                                                                <label style="font: 16px arial; color: #000000;">tiene el gusto de confirmarle su pr&oacute;ximo vuelo.</label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblTipo1Es" runat="server" Text="Aeronave: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblTipo2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblPuntoyComa1Es" runat="server" Text=". " ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblregistro1Es" runat="server" Text="Membres&iacute;a: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblregistro2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblPuntoyComa2Es" runat="server" Text=". " Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblDistancia1Es" runat="server" Text="Recorrer&aacute;: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblDistancia2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblOverEs" runat="server" Text=" durante " ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblTiempoVueloEs" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblHoursEs" runat="server" Text=" horas." ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="vertical-align: text-top;">
                                                                                    <table style="border: 1px solid;">
                                                                                        <tr>
                                                                                            <td style="text-align: center; width: 33.33%; padding: 5px;">
                                                                                                <dx:ASPxLabel ID="lblFechaActualEs" runat="server" Text="Fecha: 04-04-2016." Font-Bold="true" Font-Size="13px" ForeColor="Black" Font-Names="Arial">
                                                                                                </dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla Datos Generales Vuelo--%>
                                                                <tr style="width: 100%">
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <%--Tabla Horario Vuelo--%>
                                                                                    <table style="text-align: left; border-spacing: 5px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFechaSalida1Es" runat="server" Text="Salida: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFechaSalida2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblOrigen1Es" runat="server" Text="Origen: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblOrigen2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFBOSalida1Es" runat="server" Text="FBO: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFBOSalida2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right">
                                                                                                <label style="font-size: 6px"></label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFechallegada1Es" runat="server" Text="Llegada: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFechallegada2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblDestino1Es" runat="server" Text="Destino: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblDestino2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblFBOLlegada1Es" runat="server" Text="FBO: " Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblFBOLlegada2Es" runat="server" Text="" ForeColor="#000000" Font-Size="16px" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right">
                                                                                                <dx:ASPxLabel Style="font-size: 12px; font-style: italic;" ID="lblTituloTiempoLocal1Es" runat="server" Text="Toda fecha y hora se muestran en "></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel Style="font-size: 12px; font-style: italic;" Font-Bold="true" Font-Underline="true" ID="lblTituloTiempoLocal2Es" runat="server" Text="Horario Local."></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <br />
                                                                                    <%--Tabla Pasajeros--%>
                                                                                    <table style="text-align: left; border-spacing: 5px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblPassanger1Es" runat="server" Text="Pasajeros (" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblNoPassangerEs" runat="server" Text="20" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                <dx:ASPxLabel ID="lblPassanger2Es" runat="server" Text=" ):" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table style="text-align: left; vertical-align: top; border-spacing: 35px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <div runat="server" id="tblListaPasajerosEs">
                                                                                                </div>
                                                                                                <%-- <dx:ASPxLabel ID="lblListaPasajerosEs" runat="server" Text=""></dx:ASPxLabel>--%>
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table style="text-align: left; vertical-align: top; border-spacing: 5px 5px; border-collapse: separate;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblObservaciones1Es" runat="server" Text="Observaciones:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblObservaciones2Es" runat="server" Text="" Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <%--Imagen Tipo de Avión--%>
                                                                                <td style="vertical-align: middle; width: 49%; text-align: left">
                                                                                    <%--Imagen Tipo de Avión--%><dx:ASPxImage ID="imgAeronaveEs" runat="server" ImageUrl="../../img/iconos/challenger605.jpg" ShowLoadingImage="true" Width="500px" Height="300px"></dx:ASPxImage>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla Datos Generales Tripulacion--%>
                                                                <tr style="width: 100%">
                                                                    <td>
                                                                        <table style="width: 100%; text-align: left; vertical-align: top; border-spacing: 5px 5px; border-collapse: separate; border-bottom: 3px solid #cccccc;">
                                                                            <tr>
                                                                                <td>
                                                                                    <table style="width: 100%;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table style="width: 100%">
                                                                                                    <tbody>
                                                                                                        <tr style="vertical-align: top; text-align: left">
                                                                                                            <td>
                                                                                                                <br />
                                                                                                                <dx:ASPxLabel ID="lblEquipoEs" runat="server" Text="Su tripulaci&oacute;n ser&aacute;:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <br />
                                                                                                                <br />
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table style="width: 100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="vertical-align: top">
                                                                                                                <dx:ASPxLabel ID="lblCapitan1Es" runat="server" Text="Capit&aacute;n:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCopiloto1Es" runat="server" Text="Copiloto:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCapitan2Es" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCopiloto2Es" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <dx:ASPxLabel ID="lblCapitanTelNum1Es" runat="server" Text="Celular:" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <dx:ASPxLabel ID="lblCapitanTelNum2Es" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td style="vertical-align: top">

                                                                                                                <dx:ASPxLabel ID="lblCopiloto1NumEs" runat="server" Text="Celular:" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <dx:ASPxLabel ID="lblCopiloto2NumEs" runat="server" Text="" Font-Size="14px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <br />
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table style="width: 100%;">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="width: 50%; vertical-align: top">
                                                                                                                <dx:ASPxLabel ID="lblComisariato1Es" runat="server" Text="Su comisariato es:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <br />
                                                                                                                <dx:ASPxLabel ID="lblComisariato2Es" runat="server" Text="" Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                            <td style="width: 50%">
                                                                                                                <dx:ASPxLabel ID="lblTransportacion1Es" runat="server" Text="Transportaci&oacute;n terrestre:" Font-Bold="true" Font-Size="16px" ForeColor="#003366" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                                <br />
                                                                                                                <dx:ASPxLabel ID="lblTransportacion2Es" runat="server" Text="" Font-Size="16px" ForeColor="#000000" Font-Names="Arial"></dx:ASPxLabel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <br />
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>

                                                                                </td>
                                                                                <td style="vertical-align: top; text-align: left; width: 49%">
                                                                                    <!-- Map -->
                                                                                    <%--<iframe id="ifrmMapaEs" runat="server" scrolling="no" style="border: 0px; width: 400px; height: 210px;"></iframe>--%>
                                                                                    <dx:ASPxImage ID="imgMapaEs" runat="server" ShowLoadingImage="true" Width="400px" Height="210px"></dx:ASPxImage>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <table style="vertical-align: top; text-align: left; border-spacing: 5px 0px; border-collapse: separate;">
                                                                            <tr>
                                                                                <td style="font-size: 8px;">
                                                                                    <br />
                                                                                    Si desea comunicarse con nosotros, favor de marcar a:<br />
                                                                                    <br />
                                                                                    Toluca: +52 722 279 1625; ac.tlc@aerolineasejecutivas.com<br />
                                                                                    <br />
                                                                                    Monterrey: +52 818 288 7900; ac.adn@aerolineasejecutivas.com<br />
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <%--Tabla lugares de interes--%>
                                                                <tr style="width: 100%">
                                                                    <td style="width: 100%; text-align: left; height: 100%">
                                                                        <table id="Table1" runat="server" style="font-size: 7px; vertical-align: top; width: 100%; height: 70%; border-spacing: 5px 5px; border-collapse: separate;">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="vertical-align: top; width: 33.33%">
                                                                                        <dx:ASPxImage ID="imgOpenWeatherEs" runat="server" ShowLoadingImage="true" ImageUrl="../../img/iconos/icon_openWeather.png" Height="40%"></dx:ASPxImage>
                                                                                    </td>
                                                                                    <td style="vertical-align: top; width: 33.33%">
                                                                                        <%--<dx:ASPxImage ID="imgRestauranteEs" runat="server" ShowLoadingImage="true" ImageUrl="../../img/iconos/icon_restaurante.png" Height="45%"></dx:ASPxImage>--%>
                                                                                    </td>
                                                                                    <td style="vertical-align: top; width: 33.33%">
                                                                                        <%--<dx:ASPxImage ID="imgActividadesEs" runat="server" ShowLoadingImage="true" ImageUrl="../../img/iconos/icon_actividades.png" Height="45%"></dx:ASPxImage>--%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="font-size: 7px; vertical-align: top;">
                                                                                        <div runat="server" id="tblClimaDestinoEs">
                                                                                        </div>
                                                                                    </td>
                                                                                    <td style="font-size: 7px; vertical-align: top;">
                                                                                        <%--<div runat="server" id="tblRestaurantesDestinoEs">
                                                                                        </div>--%>
                                                                                    </td>
                                                                                    <td style="font-size: 7px; vertical-align: top;">
                                                                                        <%--<div runat="server" id="tblActividadesDestinoEs">
                                                                                        </div>--%>
                                                                                    </td>

                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <%--Pie de pagina--%>
                                                        <table style="width: 100%; height: 100%">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <table style="margin: 0px 0px;">
                                                                            <tr>
                                                                                <td style="text-align: left; width: 85px">
                                                                                    <br />
                                                                                    <img src="../../img/iconos/poweredBy.jpg" height="13" width="85" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>

                                                            </tbody>
                                                        </table>
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td style="text-align: left; width: 100px; font-size: 6px;">Aerol&iacute;neas Ejecutivas, S.A. de C.V. no se responsabiliza por el contenido en sitios web externos o las recomendaciones de TripAdvisor LLC.</td>
                                                            </tr>
                                                        </table>
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <img src="../../img/iconos/PiePagina.jpg" width="950" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                            <Border BorderStyle="Solid" BorderWidth="1px"></Border>
                                        </dx:ASPxPanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 text-left">
                                <dx:ASPxButton runat="server" ID="btnRegresar" Text="Regresar" Theme="Office2010Black" OnClick="btnRegresar_Click"></dx:ASPxButton>
                                <dx:ASPxButton runat="server" ID="Enviar" Text="Enviar" Theme="Office2010Black" Enabled="false" OnClick="Enviar_Click">
                                    <ClientSideEvents Click="MostrarPanelCorreo" />
                                </dx:ASPxButton>
                                <dx:ASPxButton runat="server" ID="Guardar" Text="Guardar" Theme="Office2010Black" OnClick="Guardar_Click" Enabled="false">
                                    <ClientSideEvents Click="MostrarPanelGuardarTripGuide" />
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <dx:ASPxPopupControl ID="ppEnviarMailTripGuide" runat="server" ClientInstanceName="ppEnviarMailTripGuide" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="Enviar Correo" AllowDragging="True" Theme="Office2010Black" Width="600px" Height="150px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlModal" runat="server" DefaultButton="btnEnviarMail">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel runat="server" ID="lblPara" Text="Para: " Height="30px" Width="30px"></dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtPara" runat="server" Width="100%" Theme="Office2010Black" EnableClientSideAPI="True" ClientInstanceName="txtPara">
                                            <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                <RegularExpression ErrorText="Correo invalido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            </ValidationSettings>
                                            <InvalidStyle BackColor="LightPink" />
                                        </dx:ASPxTextBox>
                                        <br />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel ID="lblConCopia" runat="server" Theme="Office2010Black" Text="CC:" Height="30px" Width="30px">
                                            </dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtConCopia" runat="server" Width="100%" Theme="Office2010Black" EnableClientSideAPI="True" ClientInstanceName="txtConCopia">
                                            <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                <RegularExpression ErrorText="Correo invalido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            </ValidationSettings>
                                            <InvalidStyle BackColor="LightPink" />
                                        </dx:ASPxTextBox>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-left: 6px; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel ID="lblConCopiaOculta" runat="server" Theme="Office2010Black" Text="CCO:" Height="30px" Width="30px">
                                            </dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtConCopiaOculta" runat="server" Width="100%" Theme="Office2010Black" EnableClientSideAPI="True" ClientInstanceName="txtConCopiaOculta">
                                            <ValidationSettings SetFocusOnError="True" Display="Dynamic">
                                                <RegularExpression ErrorText="Correo invalido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            </ValidationSettings>
                                            <InvalidStyle BackColor="LightPink" />
                                        </dx:ASPxTextBox>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-left: auto; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel ID="lblObservaciones" runat="server" Theme="Office2010Black" Text="Observaciones:"></dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td style="width: 100%">
                                        <dx:ASPxMemo ID="memoObservaciones" runat="server" Text="" NullText="Agregue una observacón." Width="100%" Height="100px" Theme="Office2010Black" MaxLength="1000">
                                        </dx:ASPxMemo>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: center; width: 100%">
                                <table style="margin: 0px 85px; width: 100%">
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0" ClientSideEvents-Click="function(s, e) 
                                                                 {
                                                                    ppEnviarMailTripGuide.Hide(); 
                                                                 }">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnEnviarMail" runat="server" Text="Guardar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0"
                                                OnClick="btnEnviarMail_Click">
                                                <ClientSideEvents Click="TablaIdiomaTripGuide" />

                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="ppGuardarTripGuide" runat="server" ClientInstanceName="ppGuardarTripGuide" Modal="true"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="Guardar TripGuide" AllowDragging="true" Theme="Office2010Black" Width="600px" Height="150px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlModalGuardarTripGuide" runat="server" DefaultButton="btnGuardarTripGuide">
                    <PanelCollection>
                        <dx:PanelContent>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <div style="margin-left: auto; margin-right: auto; vertical-align: middle;">
                                            <dx:ASPxLabel ID="lblObservacionesGuardar" runat="server" Theme="Office2010Black" Text="Observaciones:"></dx:ASPxLabel>
                                        </div>
                                    </td>
                                    <td style="width: 100%">
                                        <dx:ASPxMemo ID="memoObservacionesGuardar" runat="server" Text="" NullText="Agregue una observacón." Width="100%" Height="100px" Theme="Office2010Black" MaxLength="1000">
                                        </dx:ASPxMemo>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: center; width: 100%">
                                <table style="margin: 0px 85px; width: 100%">
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="lblCancelarGuardar" runat="server" Text="Cancelar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0" ClientSideEvents-Click="function(s, e) 
                                                                 {
                                                                    ppGuardarTripGuide.Hide(); 
                                                                 }">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnGuardarTripGuide" runat="server" Text="Guardar" Theme="Office2010Black" Width="80px" AutoPostBack="false" Style="float: left; margin-right: 8px" TabIndex="0"
                                                OnClick="btnGuardarTripGuide_Click">
                                                <ClientSideEvents Click="TablaIdiomaTripGuide" />

                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="ppConfirmacionCorreo" runat="server" ClientInstanceName="ppConfirmacionCorreo" CloseAction="CloseButton" CloseOnEscape="true" Modal="True" Theme="Office2010Black"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" HeaderText="Confirmación" AllowDragging="true" ShowCloseButton="true" Width="400">
        <ClientSideEvents />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlModalCorreo" runat="server" DefaultButton="btnContinuar">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxImage ID="ASPxImage2" runat="server" ShowLoadingImage="true" ImageUrl="~/img/iconos/Information2.ico"></dx:ASPxImage>
                                        <dx:ASPxTextBox ID="tbLogin" ReadOnly="true" Border-BorderStyle="None" Height="1px" runat="server" Width="1px" ClientInstanceName="tbLogin"></dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lbl" runat="server" ClientInstanceName="lbl" Text="ASPxLabel" Wrap="True"></dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnContinuar" runat="server" Text="Continuar en TripGuide..." Theme="Office2010Black" Width="80px" AutoPostBack="false"
                                            Style="float: left; margin-right: 8px" TabIndex="0">
                                            <ClientSideEvents Click="function(s, e) 
                                                                 {
                                                                    ppConfirmacionCorreo.Hide(); 
                                                                 }" />
                                        </dx:ASPxButton>
                                    </td>

                                    <td>
                                        <dx:ASPxButton ID="btnAnterior" runat="server" Text="Regresar a Solicitudes..." Theme="Office2010Black" Width="80px" AutoPostBack="true"
                                            Style="float: left; margin-right: 8px" TabIndex="0" OnClick="btnAnterior_Click">
                                        </dx:ASPxButton>
                                    </td>

                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

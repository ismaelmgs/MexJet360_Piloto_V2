﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ALE_MexJet.Views.Default" %>


<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function SetPCVisible(value) {
            var popupControl = GetPopupControl();
            if (value)
                popupControl.Show();
            else
                popupControl.Hide();
        }
        function GetPopupControl() {

            return ASPxPopupClientControl;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxPopupControl ClientInstanceName="ASPxPopupClientControl" Width="700px" Height="300px"
        MaxWidth="1000px" MaxHeight="1000px" MinHeight="150px" MinWidth="150px" ID="pcMain" AllowDragging="true" AllowResize="false"
        ShowFooter="false" PopupElementID="imgButton" HeaderText=""
        runat="server" EnableViewState="false" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below" EnableHierarchyRecreation="True">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset class="Personal1">
                                <legend>
                                    <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                </legend>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table width="100%">
                                            <tr>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdDescClaveCleinte" Text="Clave del Cliente:"></dx:ASPxLabel>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdClaveCliente"></dx:ASPxLabel>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdDescClaveContrato" Text="Clave del Contrato:"></dx:ASPxLabel>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdClaveContrato"></dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdDescTipoContrato" Text="Tipo de Contrato:"></dx:ASPxLabel>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdTipoContrato"></dx:ASPxLabel>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdDescGrupoModelo" Text="Grupo Modelo:"></dx:ASPxLabel>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dx:ASPxLabel runat="server" ID="lblppdGrupoModelo"></dx:ASPxLabel>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="row">
                        <dx:ASPxPageControl ID="ASPxPageControl1" Theme="Office2010Black" runat="server" Width="100%" Height="100%"
                            TabAlign="Justify" ActiveTabIndex="0" EnableTabScrolling="true">
                            <TabStyle Paddings-PaddingLeft="50px" Paddings-PaddingRight="50px" />
                            <ContentStyle>
                                <Paddings PaddingLeft="40px" />
                            </ContentStyle>
                            <TabPages>
                                <dx:TabPage Text="Generales" Enabled="true">
                                    <ContentCollection>
                                        <dx:ContentControl>
                                            <dx:ASPxPanel Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescFechaInicio" Text="Fecha de Inicio:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdFechaInicio"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescHorasContratadas" Text="Horas Contratadas:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdHorasContratadas"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescHorasAño" Text="Horas por año:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdHorasAño"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescBases" Text="Bases:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;" width="25%">
                                                                    <dx:ASPxComboBox runat="server" ID="cboBases">
                                                                        <Columns>
                                                                            <dx:ListBoxColumn FieldName="ContactName" Width="130px" />
                                                                            <dx:ListBoxColumn FieldName="CompanyName" Width="100%" />
                                                                            <dx:ListBoxColumn FieldName="Country" Width="70px" />
                                                                        </Columns>
                                                                    </dx:ASPxComboBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Importes" Enabled="true">
                                    <ContentCollection>
                                        <dx:ContentControl>
                                            <dx:ASPxPanel Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescEspacioVacio"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescNacional" Text="Nacional"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescCInt" Text="Internacional"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescCostoDirectro" Text="Costo Directo:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCDN"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCDI"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescTiempoEspera" Text="Tiempo de Espera:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdTEN"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdTEI"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescPernoctas" Text="Pernocta:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdPernoctasN"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdPernoctasI"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Cobros" Enabled="true">
                                    <ContentCollection>
                                        <dx:ContentControl>
                                            <dx:ASPxPanel Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescCobroCombustible" Text="Cobra Combustible:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCobroCombustible"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;"></td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescCobroFerrys" Text="Cobra Ferrys:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCobroFerrys"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescCobroTipoTiempo" Text="Tiempo a Conrar:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCobroTipoTiempo"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCobroTipoTiempoMinutos"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescCobroSCC" Text="Cobra Servicios con Cargo:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCobroSCC"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescCobroGiras" Text="Giras:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdCobroGiras"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescTiempoEsperaLibre" Text="Tiempo Espera Libre:"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdTiempoEsperaLibre"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dx:ASPxLabel runat="server" ID="lblppdDescIntercambio" Text="Intercambios:"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxComboBox runat="server" ID="cboDescIntercambio" Theme ="Office2010Black">
                                                                    <Columns>
                                                                        <dx:ListBoxColumn FieldName="ContactName" Width="130px" />
                                                                        <dx:ListBoxColumn FieldName="CompanyName" Width="100%" />
                                                                        <dx:ListBoxColumn FieldName="Country" Width="70px" />
                                                                    </Columns>
                                                                    </dx:ASPxComboBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                    </div>
                </asp:Panel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ClientSideEvents CloseUp="function(s, e) { SetImageState(false); }" PopUp="function(s, e) { SetImageState(true); }" />
    </dx:ASPxPopupControl>

    <div style="float: left; width: 56%; margin-right: 2%">
        <span runat="server" enableviewstate="False" id="lblCursor" style="cursor: pointer;">
            <dx:ASPxButton ID="imgButton" runat="server" AutoPostBack="false"></dx:ASPxButton>
        </span>
    </div>

            <!-- Ventana modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="">Abrir modal</button>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3>Título</h3>
                    </div>
                    <div class="modal-body">

                        <div class="bs-example" data-example-id="simple-responsive-table">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->

                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Ventana modal -->
    </div>
    <br />
    <!-- wizard -->
    <div class='container'>
        <section id="wizard">
            <div class="page-header">
                <h1>Wizard 1</h1>
            </div>

            <div id="rootwizard">
                <div class="navbar">
                    <div class="navbar-inner">
                        <div class="container">
                            <ul>
                                <li><a href="#tab1" data-toggle="tab">First</a></li>
                                <li><a href="#tab2" data-toggle="tab">Second</a></li>
                                <li><a href="#tab3" data-toggle="tab">Third</a></li>
                                <li><a href="#tab4" data-toggle="tab">Forth</a></li>
                                <li><a href="#tab5" data-toggle="tab">Fifth</a></li>
                                <li><a href="#tab6" data-toggle="tab">Sixth</a></li>
                                <li><a href="#tab7" data-toggle="tab">Seventh</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane" id="tab1">
                        1
                    </div>
                    <div class="tab-pane" id="tab2">
                        2
                    </div>
                    <div class="tab-pane" id="tab3">
                        3
                    </div>
                    <div class="tab-pane" id="tab4">
                        4
                    </div>
                    <div class="tab-pane" id="tab5">
                        5
                    </div>
                    <div class="tab-pane" id="tab6">
                        6
                    </div>
                    <div class="tab-pane" id="tab7">
                        7
                    </div>
                    <ul class="pager wizard">
                        <li class="previous first" style="display: none;"><a href="#">First</a></li>
                        <li class="previous"><a href="#">Previous</a></li>
                        <li class="next last" style="display: none;"><a href="#">Last</a></li>
                        <li class="next"><a href="#">Next</a></li>
                    </ul>
                </div>
            </div>
            <!-- wizard -->
                <!-- wizard2 -->
    <div class='container'>

        <section id="wizard">
            <div class="page-header">
                <h1>Wizard 2</h1>
            </div>

            <div id="rootwizard">
                <div class="navbar">
                    <div class="navbar-inner">
                        <div class="container">
                            <ul>
                                <li><a href="#tab1a" data-toggle="tab">a</a></li>
                                <li><a href="#tab2a" data-toggle="tab">b</a></li>
                                <li><a href="#tab3a" data-toggle="tab">c</a></li>
                                <li><a href="#tab4a" data-toggle="tab">d</a></li>
                                <li><a href="#tab5a" data-toggle="tab">e</a></li>
                                <li><a href="#tab6a" data-toggle="tab">f</a></li>
                                <li><a href="#tab7a" data-toggle="tab">g</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane" id="tab1a">
                        a
                    </div>
                    <div class="tab-pane" id="tab2a">
                       b
                    </div>
                    <div class="tab-pane" id="tab3a">
                        c
                    </div>
                    <div class="tab-pane" id="tab4a">
                        d
                    </div>
                    <div class="tab-pane" id="tab5a">
                        e
                    </div>
                    <div class="tab-pane" id="tab6a">
                        f
                    </div>
                    <div class="tab-pane" id="tab7a">
                        g
                    </div>
                    <ul class="pager wizard">
                        <li class="previous first" style="display: none;"><a href="#">First</a></li>
                        <li class="previous"><a href="#">Previous</a></li>
                        <li class="next last" style="display: none;"><a href="#">Last</a></li>
                        <li class="next"><a href="#">Next</a></li>
                    </ul>
                </div>
            </div>
            <!-- wizard2 -->
            <!-- tabs -->
            <br />
            <br />
            <br />
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Home</a></li>
                    <li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">Profile</a></li>
                    <li role="presentation" class="dropdown">
                        <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
                            <li><a href="#dropdown1" tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">@fat</a></li>
                            <li><a href="#dropdown2" tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a></li>
                        </ul>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="dropdown1" aria-labelledby="dropdown1-tab">
                        <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="dropdown2" aria-labelledby="dropdown2-tab">
                        <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
                    </div>
                </div>
            </div>
            <br />
            <!-- tabs -->
            <div>
                <!-- body has the class "cbp-spmenu-push" -->
                <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                    <h3>Menu</h3>
                    <a href="#">Celery seakale</a>
                    <a href="#">Dulse daikon</a>
                    <a href="#">Zucchini garlic</a>
                    <a href="#">Catsear azuki bean</a>
                    <a href="#">Dandelion bunya</a>
                    <a href="#">Rutabaga</a>
                </nav>
                <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
                    <h3>Menu</h3>
                    <a href="#">Celery seakale</a>
                    <a href="#">Dulse daikon</a>
                    <a href="#">Zucchini garlic</a>
                    <a href="#">Catsear azuki bean</a>
                    <a href="#">Dandelion bunya</a>
                    <a href="#">Rutabaga</a>
                </nav>
                <div class="container">
                    <div class="main">
                        <section>
                            <h2>Slide Menus</h2>
                            <!-- Class "cbp-spmenu-open" gets applied to menu -->
                            <button id="showLeft">Show/Hide Left Slide Menu</button>
                            <button id="showRight">Show/Hide Right Slide Menu</button>
                        </section>
                    </div>
                </div>
            </div>
            <!-- inicio tabla responsiva -->
                                    <div class="bs-example" data-example-id="simple-responsive-table">
                            <div class="table-responsive">
                                <table class="table" style="border-top: 1px solid #484848; border-left: 1px solid #484848;border-right: 1px solid #484848; border-bottom: 1px solid #484848;">
                                    <thead>
                                        <tr>
                                            <td colspan="7" class="celda3">Texto 1</td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" class="celda5">Texto 2</td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" class="celda4">Texto 3</td>
                                        </tr>
                                        <tr>
                                            <td class="celda2">#</td>
                                            <td class="celda2">Table heading</td>
                                            <td class="celda2">Table heading</td>
                                            <td class="celda2">Table heading</td>
                                            <td class="celda2">Table heading</td>
                                            <td class="celda2">Table heading</td>
                                            <td class="celda2">Table heading</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="celda6">1</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                        </tr>
                                        <tr>
                                            <td class="celda6">2</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                        </tr>
                                        <tr>
                                            <td class="celda6">3</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                            <td class="celda6">Table cell</td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" class="celda3" >#</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
            <!-- fin tabla responsiva -->
</asp:Content>

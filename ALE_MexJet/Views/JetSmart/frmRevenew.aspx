﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmRevenew.aspx.cs" UICulture="es" Culture="es-MX" Inherits="ALE_MexJet.Views.JetSmart.frmRevenew" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Styles/Controls.css" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=flecha_abre1]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../../img/iconos/flecha_cierra.png");
        });
        $("[src*=flecha_cierra]").live("click", function () {
            $(this).attr("src", "../../img/iconos/flecha_abre1.png");
            $(this).closest("tr").next().remove();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxPanel ID="pnlPrincipal" runat="server" Width="100%" BackColor="White" Style="border-radius: 14px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Revenew Manager</span>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" OnUnload="UpdatePanel1_Unload">
                    <ContentTemplate>
                        <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                        <br />
                        <dx:ASPxPageControl ID="ASPxPageControl1" Theme="Office2010Black" runat="server" Width="100%" Height="350px"
                            TabAlign="Justify" ActiveTabIndex="0" EnableTabScrolling="true">
                            <TabStyle Paddings-PaddingLeft="50px" Paddings-PaddingRight="50px" />
                            <ContentStyle>
                                <Paddings PaddingLeft="40px" />
                            </ContentStyle>
                            <TabPages>
                                <dx:TabPage Text="Tarifas Clientes" Enabled="true">
                                    <ContentCollection>
                                        <dx:ContentControl ID="ContentControl1" runat="server">
                                            <dx:ASPxPanel ID="pnlDatosGenerales" Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <fieldset class="Personal1" id="field1" runat="server">
                                                                    <legend>
                                                                        <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;"></span>
                                                                    </legend>
                                                                    <div id="myDiv" class="col-sm-12">
                                                                        
                                                                        <asp:GridView ID="gvTiposCliente" runat="server" AutoGenerateColumns="false" CssClass="table" Width="100%" HeaderStyle-HorizontalAlign="Center"
                                                                            Style="border-top: 1px solid #484848; border-left: 1px solid #484848; border-right: 1px solid #484848; border-bottom: 1px solid #484848;"
                                                                            ShowFooter="true" OnRowDataBound="gvTiposCliente_RowDataBound" DataKeyNames="IdTipoCliente">
                                                                            <HeaderStyle CssClass="celda2" HorizontalAlign="Center" />
                                                                            <RowStyle CssClass="celda6" Height="16px" />
                                                                            <FooterStyle CssClass="celda3" />
                                                                            <Columns>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <img alt = "" style="cursor: pointer" src="../../img/iconos/flecha_abre1.png" />
                                                                                        <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                                                                            <div id="div<%# Eval("IdTipoCliente") %>"   >
                                                                                                        
                                                                                                <asp:GridView ID="gvDetalle" runat="server" AutoGenerateColumns="false" CssClass="table" Width="100%" HeaderStyle-HorizontalAlign="Center"
                                                                                                    Style="border-top: 1px solid #484848; border-left: 1px solid #484848; border-right: 1px solid #484848; border-bottom: 1px solid #484848;"
                                                                                                    EmptyDataText="No se encontraron resultados para mostrar" OnRowDataBound="gvDetalle_RowDataBound" OnRowCommand="gvDetalle_RowCommand"
                                                                                                    OnRowDeleting="gvDetalle_RowDeleting" OnRowEditing="gvDetalle_RowEditing">
                                                                                                    <HeaderStyle CssClass="celda2" HorizontalAlign="Center" />
                                                                                                    <RowStyle CssClass="celda6" Height="16px" />
                                                                                                    <FooterStyle CssClass="celda3" />
                                                                                                    <Columns>
                                                                                                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                                                                                                        <asp:BoundField HeaderText="% Descuento" DataField="Porcentaje" />
                                                                                                        <asp:BoundField HeaderText="Desc. Acumulado" DataField="DescAcumulado" />
                                                                                                        <asp:TemplateField HeaderText="Acciones">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:ImageButton ID="imbEditDesc" runat="server" ImageUrl="~/img/iconos/edit.png" Width="24" Height="24" ToolTip="Edita el registro."
                                                                                                                    CommandArgument='<%# Eval("IdDescuento") %>' CommandName="Edit" />

                                                                                                                <asp:ImageButton ID="imbDeleteDesc" runat="server" ImageUrl="~/img/iconos/delete.png" Width="24" Height="24" 
                                                                                                                    OnClientClick="return confirm('¿Realmente esta seguro de eliminar la fila?');" 
                                                                                                                    ToolTip="Elimina el registro." CommandArgument='<%# Eval("IdDescuento") %>' CommandName="Delete"/>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                    </Columns>
                                                                                                </asp:GridView>
                                                                                                        
                                                                                            </div>
                                                                                        </asp:Panel>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField HeaderText="Tipo de Cliente" DataField="Descripcion" />
                                                                                <asp:BoundField HeaderText="Descuento Total" DataField="DescuentoTotal" />
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <dx:ASPxButton ID="btnAgregarDesc" runat="server" Text="Agregar Desc."
                                                                                            OnClick="btnAgregarDesc_Click" Theme="Office2010Black">
                                                                                        </dx:ASPxButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>

                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                        <br />
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>

                                <%--<dx:TabPage Text="Parametros" Enabled="true">
                                    <ContentCollection>
                                        <dx:ContentControl ID="ContentControl2" runat="server">
                                            <dx:ASPxPanel ID="ASPxPanel1" Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <fieldset class="Personal1" id="Fieldset1" runat="server">
                                                                    <legend>
                                                                        <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Nombre/Razón Social Cliente</span>
                                                                    </legend>
                                                                    <div id="myDiv" class="col-sm-12">
                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>

                                <dx:TabPage Text="Encuesta" Enabled="true">
                                    <ContentCollection>
                                        <dx:ContentControl ID="ContentControl3" runat="server">
                                            <dx:ASPxPanel ID="ASPxPanel2" Theme="Office2010Black" runat="server" Width="100%" BackColor="White">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <fieldset class="Personal1" id="Fieldset2" runat="server">
                                                                    <legend>
                                                                        <span style="font-family: Helvetica, Arial,sans-serif; text-align: center;">Nombre/Razón Social Cliente</span>
                                                                    </legend>
                                                                    <div id="myDiv" class="col-sm-12">
                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>--%>

                            </TabPages>
                        </dx:ASPxPageControl>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>


    <%--MODAL PARA AGREGAR DESCUENTOS A UN TIPO DE CLIENTE--%>
    <dx:ASPxPopupControl ID="ppDescuentos" runat="server" ClientInstanceName="ppDescuentos" CloseAction="CloseButton" CloseOnEscape="true" Modal="True" Theme="Office2010Black"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" HeaderText="Descuentos" AllowDragging="true" ShowCloseButton="true" Width="350">
        <ClientSideEvents />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel3" runat="server" DefaultButton="btnGuardarSC">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div class="row">
                            <table style="width:100%">
                                 <tr>
                                    <td style="width:100%">
                                        <dx:ASPxLabel ID="lblTipoClienteDesc" runat="server" Text="Tipo de Cliente: " Theme="Office2010Black"></dx:ASPxLabel>
                                        <dx:ASPxLabel ID="lblTipoClienteResp" runat="server" Font-Bold="true" Font-Size="Large" Theme="Office2010Black"></dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                            </div>
                            <br />
                            <table style="width:100%">
                                <tr>
                                    <td style="width:40%">
                                        <dx:ASPxLabel ID="lblDescDescuento" runat="server" ClientInstanceName="lblDescDescuento" Text="Descripción:"></dx:ASPxLabel>
                                    </td>
                                    <td style="width:60%">
                                        <dx:ASPxTextBox ID="txtDescDescuento" runat="server" Theme="Office2010Black" NullText="Seleccione una opción"
                                            ClientInstanceName="txtDescDescuento">
                                            <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" ValidationGroup="VGDescuento">
                                                <RequiredField ErrorText="El campo es requerido." IsRequired="true" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">
                                        <dx:ASPxLabel ID="lblPorcDescuento" runat="server" ClientInstanceName="lblPorcDescuento" Text="% Descuento:"></dx:ASPxLabel>
                                    </td>
                                    <td style="width:60%">
                                        <dx:ASPxTextBox ID="txtPorDescuento" runat="server" Theme="Office2010Black" NullText="Seleccione una opción"
                                            ClientInstanceName="txtPorDescuento">
                                            <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" ValidationGroup="VGDescuento">
                                                <RequiredField ErrorText="El campo es requerido." IsRequired="true" />
                                                <RegularExpression ValidationExpression="(-?[0-9]+(\.[0-9]+)?)" ErrorText="Error en la información ingresada." />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">
                                        <dx:ASPxLabel ID="lblAcumulado" runat="server" ClientInstanceName="lblAcumulado" Text="¿Acumulado?:"></dx:ASPxLabel>
                                    </td>
                                    <td style="width:60%">
                                        <dx:ASPxCheckBox ID="chkDescuento" runat="server" Theme="Office2010Black"
                                            ClientInstanceName="chkDescuento">
                                        </dx:ASPxCheckBox>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height:5px">
                                    </td>
                                </tr>
                                </table>
                                <table style="width:100%">
                                <tr>
                                    <td style="text-align:right; width:40%">
                                        <asp:Button ID="btnGuardarDesc" runat="server" Text="Agregar" Width="80px" OnClick="btnGuardarDesc_Click"
                                            OnClientClick="ppDescuentos.Hide();" />
                                    </td>
                                    <td style="width:10%"></td>
                                    <td style="text-align:left; width:40%">
                                        <asp:Button ID="btnCancelarDesc" runat="server" Text="Cancelar" Width="80px"
                                            OnClientClick="ppDescuentos.Hide();" AutoPostBack="false"></asp:Button>
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

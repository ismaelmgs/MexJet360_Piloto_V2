﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ALE_Main.Master" AutoEventWireup="true" CodeBehind="frmEncuesta.aspx.cs" Inherits="ALE_MexJet.Views.JetSmart.frmEncuesta" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/ControlesUsuario/ucModalMensaje.ascx" TagPrefix="uc1" TagName="ucModalMensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" BackColor="White" Style="border-radius: 21px;">
        <PanelCollection>
            <dx:PanelContent>
                <div class="row header1">
                    <div class="col-md-12">
                        <span style="color: #ffffff; font-family: Helvetica, Arial,sans-serif; font-size: 20px;">&nbsp;&nbsp;Encuesta de Servicios de Vuelo</span>
                    </div>
                </div>
                <uc1:ucModalMensaje ID="mpeMensaje" runat="server" />
                <div>
                    <dx:ASPxButton ID="btnLista" runat="server" Text="Generar" OnClick="btnLista_Click"></dx:ASPxButton>
                </div>
                <div class="well-g">
                    <div class="row">
                        <div class="col-md-12">
                            <dx:ASPxTreeList ID="tlPreguntas" runat="server" AutoGenerateColumns="False" DataSourceID="SQLEncuesta" 
                                EnableTheming="True" KeyFieldName="IdEncuentas" ParentFieldName="IdPadre" Theme="Office2010Black" Width="100%"
                                OnNodeInserting="tlPreguntas_NodeInserting" 
                                OnNodeUpdating="tlPreguntas_NodeUpdating" 
                                OnNodeDeleting="tlPreguntas_NodeDeleting">
                                <Columns>
                                    <dx:TreeListTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:TreeListTextColumn>
                                    <dx:TreeListCommandColumn ButtonType="Button" ShowInCustomizationForm="True" Caption="Acciones" VisibleIndex="1">
                                        <NewButton Visible="True"></NewButton>
                                        <EditButton Visible="True" />
                                        <DeleteButton Visible="True" />
                                    </dx:TreeListCommandColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedNode="True" AutoExpandAllNodes="True" />
                                <SettingsEditing AllowNodeDragDrop="True" />
                                <SettingsPopupEditForm Modal="true" />
                                <Settings ShowFooter="true" />
                            </dx:ASPxTreeList>
                            
                            <asp:SqlDataSource ID="SQLEncuesta" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SqlDefault %>" 
                                DeleteCommand="DELETE FROM [Principales].[tbp_MXJ_Encuesta] WHERE [IdEncuentas] = @IdEncuentas" 
                                InsertCommand="INSERT INTO [Principales].[tbp_MXJ_Encuesta] ([IdPadre], [Descripcion], [FechaCreacion], [UsuarioCreacion]) 
                                                VALUES (@IdPadre, @Descripcion, @FechaCreacion, @UsuarioCreacion)" 
                                SelectCommand="SELECT [IdEncuentas], [IdPadre], [Descripcion], [FechaCreacion], [UsuarioCreacion] 
                                                FROM [Principales].[tbp_MXJ_Encuesta]" 
                                UpdateCommand="UPDATE [Principales].[tbp_MXJ_Encuesta] SET [IdPadre] = @IdPadre, [Descripcion] = @Descripcion, 
                                                [FechaModificacion] = GETDATE(), [UsuarioCreacion] = @UsuarioCreacion WHERE [IdEncuentas] = @IdEncuentas">
                                <DeleteParameters>
                                    <asp:Parameter Name="IdEncuentas" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="IdPadre" Type="Int32" />
                                    <asp:Parameter Name="Descripcion" Type="String" />
                                    <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                                    <asp:Parameter Name="UsuarioCreacion" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="IdPadre" Type="Int32" />
                                    <asp:Parameter Name="Descripcion" Type="String" />
                                    <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                                    <asp:Parameter Name="UsuarioCreacion" Type="String" />
                                    <asp:Parameter Name="IdEncuentas" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="hdUsuario" runat="server" Value="" />
                <asp:HiddenField ID="hdIP" runat="server" Value="" />
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
</asp:Content>

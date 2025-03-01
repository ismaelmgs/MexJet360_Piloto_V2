﻿using ALE_MexJet.DomainModel;
using ALE_MexJet.Interfaces;
using ALE_MexJet.Objetos;
using ALE_MexJet.Presenter;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NucleoBase.Core;
using DevExpress.Web.Bootstrap;
using DevExpress.Web.Data;

namespace ALE_MexJet.Views.Operaciones
{
    public partial class frmReporteVuelos : System.Web.UI.Page, IViewReporteVuelos
    {
        #region EVENTOS
        protected void Page_Init(object sender, EventArgs e)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            oPresenter = new ReporteVuelos_Presenter(this, new DBReporteVuelos());
            gvVuelos.SettingsPager.Position = PagerPosition.TopAndBottom;
            gvVuelos.SettingsPager.ShowDisabledButtons = true;
            gvVuelos.SettingsPager.ShowNumericButtons = true;
            gvVuelos.SettingsPager.ShowSeparators = true;
            gvVuelos.SettingsPager.Summary.Visible = true;
            gvVuelos.SettingsPager.PageSizeItemSettings.Visible = true;
            gvVuelos.SettingsPager.PageSizeItemSettings.Position = PagerPageSizePosition.Right;
            gvVuelos.SettingsText.SearchPanelEditorNullText = "Ingresa la información a buscar:";

            if (!IsPostBack)
            {
                date1.Text = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
                date2.Text = DateTime.Now.ToString("dd/MM/yyyy");

                sFecha = date1.Text;
                sFecha2 = date2.Text;
                sTripNum = string.IsNullOrEmpty(sTripNum) ? "" : txtTrip.Text;
            }

            if (eSearchObj != null)
                eSearchObj(sender, e);
        }


        protected void gvVuelos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

        }

        protected void gvVuelos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            object value = (sender as DevExpress.Web.ASPxGridView).GetRowValues(e.VisibleIndex, "Status");
            e.Enabled = value.S().I() > 0;
        }

        protected void gvVuelos_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCustomButtonEventArgs e)
        {
            object value = (sender as DevExpress.Web.ASPxGridView).GetRowValues(e.VisibleIndex, "Status");
            e.Enabled = value.S().I() > 0;
        }

        //protected void UpdatePanel1_Unload(object sender, EventArgs e)
        //{
        //    MethodInfo methodInfo = typeof(ScriptManager).GetMethods(BindingFlags.NonPublic | BindingFlags.Instance).Where(i => i.Name.Equals("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel")).First();
        //    methodInfo.Invoke(ScriptManager.GetCurrent(Page),
        //        new object[] { sender as UpdatePanel });
        //}
        #endregion

        #region MÉTODOS
        public void LoadVuelos(DataTable dt)
        {
            try
            {
                dtVuelos = null;
                dtVuelos = dt;

                if (dt != null && dt.Rows.Count > 0)
                {
                    gvVuelos.DataSource = dt;
                    gvVuelos.DataBind();
                    pnlVuelos.Visible = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }




        #endregion

        #region VARIABLES Y PROPIEDADES
        ReporteVuelos_Presenter oPresenter;
        public event EventHandler eNewObj;
        public event EventHandler eObjSelected;
        public event EventHandler eSaveObj;
        public event EventHandler eDeleteObj;
        public event EventHandler eSearchObj;
        public string sFecha
        {
            get { return (string)ViewState["VSsFecha"]; }
            set { ViewState["VSsFecha"] = value; }
        }
        public string sFecha2
        {
            get { return (string)ViewState["VSsFecha2"]; }
            set { ViewState["VSsFecha2"] = value; }
        }
        public string sTripNum
        {
            get { return (string)ViewState["VSTripNum"]; }
            set { ViewState["VSTripNum"] = value; }
        }
        public int iRes
        {
            get { return (int)ViewState["VSRes"]; }
            set { ViewState["VSRes"] = value; }
        }
        public DataTable dtVuelos
        {
            get { return (DataTable)ViewState["VSdtVuelos"]; }
            set { ViewState["VSdtVuelos"] = value; }
        }
        #endregion

        protected void btnConsultaVuelos_Click(object sender, EventArgs e)
        {
            try
            {
                sFecha = string.Empty;
                sFecha2 = string.Empty;
                sTripNum = string.Empty;
                sFecha = date1.Text;
                sFecha2 = date2.Text;
                sTripNum = txtTrip.Text == "" ? sTripNum = "0" : txtTrip.Text;

                if (eSearchObj != null)
                    eSearchObj(sender, e);

                pnlVuelos.Visible = true;
                UpdatePanel1.Update();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            try
            {
                List<Vuelo> oLsVuelos = new List<Vuelo>();
                iRes = 0;
                string[] fieldValues = { "vuelo", "claveContrato", "Matricula", "Origen", "Destino", "PaisOrigen", "PaisDestino", "FechaHoraOrigen", "FechaHoraDestino", "legid" };
                List<Object> olst = gvVuelos.GetSelectedFieldValues(fieldValues);

                if (olst.Count > 0)
                {
                    for (int i = 0; i < olst.Count; i++)
                    {
                        Vuelo oV = new Vuelo();
                        object obj = olst[i];
                        object[] row = (object[])obj;

                        oV.ITripNum = row[0].S().I();
                        oV.SCveContrato = row[1].ToString();
                        oV.SMatricula = row[2].ToString();
                        oV.SOrigen = row[3].S();
                        oV.SDestino = row[4].S();
                        oV.SPaisOrigen = row[5].S();
                        oV.SPaisDestino = row[6].S();
                        oV.DtOrigenVuelo = row[7].S().Dt();
                        oV.DtDestinoVuelo = row[8].S().Dt();
                        oV.ILegID = row[9].I();
                        oV.SUsuario = ((UserIdentity)Session["UserIdentity"]).sUsuario;
                        oLsVuelos.Add(oV);
                        ListaVuelos = oLsVuelos;
                    }
                    if (ListaVuelos.Count > 0)
                    {
                        if (eNewObj != null)
                            eNewObj(sender, e);

                        MostrarMensaje("Los vuelos se enviaron correctamente", "Aviso");
                    }
                }
                else
                    MostrarMensaje("Debe seleccionar al menos un vuelo", "Aviso");

                if (olst.Count != 0)
                    gvVuelos.Selection.UnselectAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public List<Vuelo> ListaVuelos
        {
            set { ViewState["VSListaVuelos"] = value; }
            get { return (List<Vuelo>)ViewState["VSListaVuelos"]; }
        }

        protected void cbCheck_Load(object sender, EventArgs e)
        {
            ASPxCheckBox cb = (ASPxCheckBox)sender;

            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)cb.NamingContainer;
            cb.ClientInstanceName = string.Format("cbCheck{0}", container.VisibleIndex);
            cb.Checked = gvVuelos.Selection.IsRowSelected(container.VisibleIndex);

            cb.ClientSideEvents.CheckedChanged = string.Format("function (s, e) {{ gvVuelos.SelectRowOnPage({0}, s.GetChecked()); updateSelectedKeys(s.GetChecked()); }}", container.VisibleIndex);
        }

        protected void cbPageSelectAll_Load(object sender, EventArgs e)
        {
            //ASPxCheckBox cb = (ASPxCheckBox)sender;
            //ASPxGridView grid = (cb.NamingContainer as GridViewHeaderTemplateContainer).Grid;

            //bool cbChecked = true;
            //int start = grid.VisibleStartIndex;
            //int end = grid.VisibleStartIndex + grid.SettingsPager.PageSize;
            //end = (end > grid.VisibleRowCount ? grid.VisibleRowCount : end);

            //for (int i = start; i < end; i++)
            //{
            //    DataRowView dr = (DataRowView)(grid.GetRow(i));
            //    if (!grid.Selection.IsRowSelected(i))
            //    {
            //        if (dr["IsRegistered"] == DBNull.Value || !(bool)dr["IsRegistered"])
            //        {
            //            cbChecked = false;
            //            break;
            //        }
            //    }
            //}
            //cb.Checked = cbChecked;
        }

        public void MostrarMensaje(string sMensaje, string sCaption)
        {
            //mpeMensaje.ShowMessage(sMensaje, sCaption);
            lbl.Text = sMensaje;
            ppAlert.ShowOnPageLoad = true;
        }

        private const string _selectableRowsKey = "cp_SelectableRows";
        private const string _selectedRowsCountKey = "cp_SelectedRowsCount";

        protected void gvVuelos_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            int start = grid.VisibleStartIndex;
            int end = grid.VisibleStartIndex + grid.SettingsPager.PageSize;
            int selectNumbers = 0;

            end = (end > grid.VisibleRowCount ? grid.VisibleRowCount : end);

            for (int i = start; i < end; i++)
                if (grid.Selection.IsRowSelected(i))
                    selectNumbers++;

            e.Properties[_selectedRowsCountKey] = selectNumbers;
        }

        protected void gvVuelos_PageIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int pageIndex = gvVuelos.PageIndex;
                gvVuelos.PageIndex = pageIndex;
                gvVuelos.DataSource = dtVuelos;
                gvVuelos.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
    }
}
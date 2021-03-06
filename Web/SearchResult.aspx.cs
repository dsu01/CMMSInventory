﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using NIH.CMMS.Inventory.Web;
using NIH.CMMS.Inventory.BOL.People;
using NIH.CMMS.Inventory.BPL.Facility;
using NIH.CMMS.Inventory.BOL.Facility;
using NIH.CMMS.Inventory.BOL.Common;
using AjaxControlToolkit;

public partial class SearchResult : System.Web.UI.Page
{
    protected LoginUser loginUsr;
    #region ViewState
    public string SortDirection
    {
        get
        {
            if (ViewState["SortDirection"] == null)
                ViewState["SortDirection"] = "ASC";

            return (string)ViewState["SortDirection"];
        }
        set { ViewState["SortDirection"] = value; }
    }

    public string SortExpression
    {
        get
        {
            if (ViewState["SortExpression"] == null)
                ViewState["SortExpression"] = "ID";

            return (string)ViewState["SortExpression"];
        }
        set { ViewState["SortExpression"] = value; }
    }

    public DataTable DTSearchDetail
    {
        get
        {
            return (DataTable)ViewState["DTSearchDetail"];
        }
        set { ViewState["DTSearchDetail"] = value; }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        loginUsr = Utils.CheckSession(this);

        RunReport();
    }


    protected void btnExportToExcel_OnClick(object sender, EventArgs e)
    {
        gvFacilitys.AllowPaging = false;
        gvFacilitys.Columns[7].Visible = false;
        gvFacilitys.Columns[8].Visible = false;
        //  GetOrder(DTSearchDetail);
        Utils.ExportToExcel("InventoryReport", gvFacilitys, "InventoryReport", null);
    }

    protected void btnExportToPDF_OnClick(object sender, EventArgs e)
    {
        gvFacilitys.AllowPaging = false;
        gvFacilitys.Columns[7].Visible = false;
        gvFacilitys.Columns[8].Visible = false;
        Utils.ExportToPDF("InventoryReport", gvFacilitys, "InventoryReport", null);
    }

    private void RunReport()
    {
        if (SearchCriteria.Instance != null)
        {
            SearchCriteria crit = SearchCriteria.Instance;
            lblExiCrit.Text = "";
            if (!string.IsNullOrEmpty(crit.facnum))
                lblExiCrit.Text += "&nbsp; <b>Facility#</b>: " + crit.facnum;
            else if (!string.IsNullOrEmpty(crit.wrnum))
                lblExiCrit.Text += "&nbsp; <b> Work Request#</b>: " + crit.wrnum;
            else
            {
                switch (crit.flagAssigned)
                {
                    case 2:
                        lblExiCrit.Text += " Assigned Facilities";
                        break;
                    case 3:
                        lblExiCrit.Text += " Assinged and Un-Assigned Facilities";
                        break;
                    default:
                        lblExiCrit.Text += " Un-Assigned Facilities";
                        break;
                }
                //if (!string.IsNullOrEmpty(crit.typeId))
                //    lblExiCrit.Text += "&nbsp;, Type: " + crit.typeId;
                if (!string.IsNullOrEmpty(crit.systemDescs))
                {

                    lblExiCrit.Text += "&nbsp; <b>Selction:</b> " + crit.systemDescs;
                }
                else
                    lblExiCrit.Text += "&nbsp; <b>Selection:</b> All ";
                //if (!string.IsNullOrEmpty(crit.componentIds))
                //     lblExiCrit.Text += "&nbsp;, Components: " + crit.componentIds;

                //if (!string.IsNullOrEmpty(crit.systemIds))
                //     lblExiCrit.Text += "&nbsp;, Systems: " + crit.systemIds;
                if (!string.IsNullOrEmpty(crit.buildingDescs))
                {

                    lblExiCrit.Text += "&nbsp; <b>Buildings</b>: " + crit.buildingDescs;
                }
                else
                    lblExiCrit.Text += "&nbsp; <b>Buildings</b>: All ";


            }

            DataSet ds = facility_logic.GetFacilitySearchResult(crit);

            lbModifySearch.Visible = true;
            pnlResults.Visible = true;
            trExportandPrintButtons.Visible = true;
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                DTSearchDetail = dt;
                GetOrder(dt);

            }
            else
            {
                //show no result msg
                lblValidationError.Visible = true;
                lblValidationError.Text = "No result found.";
                pnlResults.Visible = false;
                trExportandPrintButtons.Visible = false;
                lblTotalNumberOfResult.Text = "";
            }

        }
    }
    private void GetOrder(DataTable dt)
    {
        DataView dv = new DataView();
        dv = dt.DefaultView;
        dv.Sort = SortExpression + " " + SortDirection;

        gvFacilitys.DataSource = dv;
        gvFacilitys.DataBind();


        //gvSearchQueryResults.HeaderRow.Cells[3].Text += "<br/>range: ";

        lblTotalNumberOfResult.Text = "Total # of Facilities: " + dv.Count.ToString();
    }

    #region protected void gvSearchQueryResults_OnSorting(object sender, GridViewSortEventArgs e)
    protected void gvFacilitys_OnSorting(object sender, GridViewSortEventArgs e)
    {
        if (SortExpression.Equals(e.SortExpression)) SortDirection = (SortDirection.Equals("DESC") ? "ASC" : "DESC");
        else SortDirection = "ASC";
        SortExpression = e.SortExpression;

        GetOrder(DTSearchDetail);
    }
    #endregion

    protected void gvFacilitys_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        gvFacilitys.PageIndex = e.NewPageIndex;

        GetOrder(DTSearchDetail);

    }
    protected void gvFacilitys_onRowCreated(object sender, GridViewRowEventArgs e)
    {
        GridView currentGrid = (GridView)sender;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Programmatically reference the PopupControlExtender
            PopupControlExtender pce = e.Row.FindControl("PopupControlExtender1") as PopupControlExtender;

            GridView gv = (GridView)sender;
            // Set the BehaviorID
            string behaviorID = string.Concat("pce", gv.ID + e.Row.RowIndex);
            pce.BehaviorID = behaviorID;

            // Programmatically reference the Image control
            Image i = (Image)e.Row.Cells[1].FindControl("Image1");

            string strFacNum = ((GridView)sender).DataKeys[e.Row.RowIndex].Value.ToString();
            List<EquipmentDet> eqList = facility_logic.GetEquipmentsList(strFacNum);
            if (eqList != null)
            {
                // Add the clie nt-side attributes (onmouseover & onmouseout)
                string OnMouseOverScript = string.Format("$find('{0}').showPopup();", behaviorID);
                string OnMouseOutScript = string.Format("$find('{0}').hidePopup();", behaviorID);

                i.Attributes.Add("onmouseover", OnMouseOverScript);

            }
            else
            { i.Visible = false; }

        }
    }
    protected void gvFacilitys_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Display the e-mail address in italics.
            Label lbFacGroup = (Label)e.Row.FindControl("lblHidFacilityGrp");
            Label lbFacSystemID = (Label)e.Row.FindControl("lblHidFacilityID");

            HyperLink hlFacNum = (HyperLink)e.Row.FindControl("hlFacNum");

            if (lbFacGroup != null && hlFacNum != null && lbFacSystemID != null)
            {
                //
                if (lbFacGroup.Text.ToLower().StartsWith("electrical"))
                {
                    if (lbFacGroup.Text.ToLower().Contains("system"))
                        hlFacNum.NavigateUrl = "~/Equipment/systemElectrical.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
                    else
                        hlFacNum.NavigateUrl = "~/Equipment/equipElectrical.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
                }
                else
                {
                    if (lbFacGroup.Text.ToLower().Contains("system"))
                        hlFacNum.NavigateUrl = "~/Equipment/systemMechanical.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
                    else
                        hlFacNum.NavigateUrl = "~/Equipment/equipMechanical.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
                }
            }

            //NIHRole = "msSuper" and "msAdmin" can upate facility (can see save current page info button)
            //NIHRole only "msAdmin" can assign number, change status, 
            //no, only status for facility now. status for every equipment, inactive use different color 
            Control actionHeader = gvFacilitys.FindControl("colAction");
            if (actionHeader != null)
                if (loginUsr.Role.ToLower() == "msadmin" || loginUsr.Role.ToLower() == "mssuper")
                { actionHeader.Visible = true; }
                else
                { actionHeader.Visible = false; }


            HyperLink hlAction = (HyperLink)e.Row.FindControl("hlAction");
            if (hlAction != null)
                if (loginUsr.Role.ToLower() == "msadmin" || loginUsr.Role.ToLower() == "mssuper")
                { hlAction.Visible = true; }
                else
                { hlAction.Visible = false; }
        }
    }

    protected void lbModifySearch_OnClick(object sender, EventArgs e)
    {
        SearchCriteria.KeepAlive = true;

        Response.Redirect("~/Default.aspx?");

    }

    //webservice for popup
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string GetDynamicContent(string contextKey)
    {
        StringBuilder sTemp = new StringBuilder();
        List<EquipmentDet> eqList = facility_logic.GetEquipmentsList(contextKey);

        if (eqList != null)
        {
            sTemp.Append("<table class='popupTableView'>");

            sTemp.Append("<tr><td></td><td><b>Equipments List:</b><br /><br /></td></tr>");
            foreach (EquipmentDet det in eqList)
            {
                sTemp.Append("<tr><td width='20%' class='leftLabel' align='right'><b>Equipment ID:</b></td><td align='left' class='text7'><a href='Equipment/systemElectrical.aspx?equipID=" + det.Key + "'>" + det.EquipID + "</a></td></tr>");
                sTemp.Append("<tr><td class='leftLabel' align='right'><b>Location:</b></td><td align='left' class='text7'>" + det.EquipLocation + "</td></tr>");
                sTemp.Append("<tr><td class='leftLabel' align='right'><b>Type or Use:</b></td><td align='left' class='text7'>" + det.TypeOrUse + "</td></tr>");
                sTemp.Append("<tr><td class='leftLabel' align='right'><b>Manufacturer:</b></td><td align='left' class='text7'>" + det.Manufacturer + "</td></tr>");
                sTemp.Append("<tr><td class='leftLabel' align='right'><b>Model:</b></td><td align='left' class='text7'>" + det.ModelNo + "</td></tr>");
                sTemp.Append("<tr><td class='leftLabel' align='right'><b>SerialNo:</b></td><td align='left' class='text7'>" + det.SerialNo + "</td></tr>");
                sTemp.Append("<tr><td class='leftLabel' align='right'><b>InstallDate:</b></td><td align='left' class='text7'>" +
                    det.InstalledDate.ToShortDateString() +
                    "</td></tr>");

                sTemp.Append("<tr><td colspan='2'><hr /></td></tr>");
            }

            sTemp.Append("<tr><td colspan='2'>&nbsp;</td></tr>");
            sTemp.Append("</table>");
        }
        else
            sTemp.Append("<i>No action</i>");


        return sTemp.ToString();
    }
}
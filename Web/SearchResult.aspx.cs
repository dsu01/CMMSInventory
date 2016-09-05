using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIH.CMMS.Inventory.BPL.LookUp;
using NIH.CMMS.Inventory.Web;
using NIH.CMMS.Inventory.BOL.People;
using NIH.CMMS.Inventory.BPL.Facility;
using NIH.CMMS.Inventory.BOL.Common;

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
        GetOrder(DTSearchDetail);
        Utils.ExportToExcel("InventoryReport", gvFacilitys);
    }

    protected void btnExportToPDF_OnClick(object sender, EventArgs e)
    {
        gvFacilitys.AllowPaging = false;
        GetOrder(DTSearchDetail);
        Utils.ExportToPDF("InventoryReport", gvFacilitys, "Inventory Report");
    }

    private void RunReport()
    {
        if (SearchCriteria.Instance != null)
        {
            SearchCriteria crit = SearchCriteria.Instance;
            lblExiCrit.Text = "";
            switch (crit.flagAssigned)
            {
                case 2:
                    lblExiCrit.Text += " Assigned Facilities ";
                    break;
                case 3:
                    lblExiCrit.Text += " Assinged and Un-Assigned Facilities ";
                    break;
                default:
                    lblExiCrit.Text += " Un-Assigned Facilities ";
                    break;
            }
            if (!string.IsNullOrEmpty(crit.buildingIds))
                 lblExiCrit.Text += "&nbsp;, Buildings: " + crit.buildingIds;
            if (!string.IsNullOrEmpty(crit.componentIds))
                 lblExiCrit.Text += "&nbsp;, Components: " + crit.componentIds;
            if (!string.IsNullOrEmpty(crit.systemIds))
                 lblExiCrit.Text += "&nbsp;, Systems: " + crit.systemIds;
            if (!string.IsNullOrEmpty(crit.typeIds))
                 lblExiCrit.Text += "&nbsp;, Types: " + crit.typeIds;
                         
                 
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
                if (lbFacGroup.Text.StartsWith("Electrical"))
                {

                    hlFacNum.NavigateUrl = "~/Equipment/equipElectrical.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
                }
                else
                {

                    hlFacNum.NavigateUrl = "~/Equipment/equipMechanicalNew.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
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

        Response.Redirect("~/Default3.aspx?");
           
    }
}
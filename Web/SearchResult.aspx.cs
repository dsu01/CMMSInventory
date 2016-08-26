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

public partial class SearchResult : System.Web.UI.Page
{
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
                ViewState["SortExpression"] = "NPRDist";

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
        Utils.ExportToPDF("InventoryReport", gvFacilitys);
    }

    private void RunReport()
    {
        if (SearchCriteria.Instance != null)
        {
            SearchCriteria crit = SearchCriteria.Instance;
            DataSet ds = facility_logic.RptGetCustomReport(crit, this);

            if (!String.IsNullOrEmpty(Request.QueryString["Source"]))
            {
                lbModifySearch.CommandArgument = "Standard";
                lbModifySearch.Text = "<< Go Back";
            }
            else
            {
                lbModifySearch.CommandArgument = "Custom";
                lbModifySearch.Text = "Modify Search >>";
            }

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
                lblTotalNumberOfSearches.Text = "";
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

        lblTotalNumberOfResult.Text = "Total # of Searches: " + dv.Count.ToString();
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

    protected void lbModifySearch_OnClick(object sender, EventArgs e)
    {
        SearchCriteria.KeepAlive = true;

        Response.Redirect("~/Default3.aspx?");
           
    }
}
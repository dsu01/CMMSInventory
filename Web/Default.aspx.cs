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

public partial class _Default : System.Web.UI.Page 
{
    protected LoginUser loginUsr;
    protected void Page_Load(object sender, EventArgs e)
    {
        loginUsr = Utils.CheckSession(this);
        //todo: on list page, show equipment total# for each facility
        if (!Page.IsPostBack)
        {
            if (HttpContext.Current.Session[ApplicationConstants.SESSION_USEROBJLOGINDET] == null)
            { Response.Redirect("~/Login.aspx"); }

            DataSet dtSystem = GeneralLookUp.GetSystemList();
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();
            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

            //clear session value
            Session["ParentFacilityNum"] = string.Empty;
            Session["ParentFacilitySysID"] = string.Empty;
            Session["PageNumber"] = string.Empty;
            Session["CurrentFiveEquipments"] = null;

            //criteria
            if (Session["DefSeaAssigned"] != null)
                radioSelect.SelectedValue = Session["DefSeaAssigned"].ToString();
            if (Session["DefSeaType"] != null)
            { 
                if (Session["DefSeaType"].ToString() != "")
                    drplstGroup.SelectedValue = Session["DefSeaType"].ToString();
            }
            if (Session["DefSeaBuilding"] != null)
            {
                if (Session["DefSeaBuilding"].ToString() != "")
                    drplstBuilding.SelectedValue = Session["DefSeaBuilding"].ToString();
            }
            if (Session["DefSeaSystem"] != null)
            {
                if (Session["DefSeaSystem"].ToString() != "")
                    drplstSystem.SelectedValue = Session["DefSeaSystem"].ToString();
            }
            if (Session["DefSeaWRNum"] != null)
            {
                if (Session["DefSeaWRNum"].ToString() != "")
                    txtWRNum.Text = Session["DefSeaWRNum"].ToString();
            }
            if (Session["DefSeaFacNum"] != null)
            {
                if (Session["DefSeaFacNum"].ToString() != "")
                    txtFacilityNum.Text = Session["DefSeaFacNum"].ToString();
            }
           
           
          
        }

    }


    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
       
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Display the e-mail address in italics.
            Label lbFacGroup = (Label)e.Item.FindControl("lblHidFacilityGrp");
            Label lbFacSystemID = (Label)e.Item.FindControl("lblHidFacilityID");
            //EmailAddressLabel.Font.Italic = true;

            //System.Data.DataRowView rowView = e.Item.DataItem as System.Data.DataRowView;
            //string currentEmailAddress = rowView["EmailAddress"].ToString();
            //if (currentEmailAddress == "orlando0@adventure-works.com")
            //{
            //    EmailAddressLabel.Font.Bold = true;
            //}

            HyperLink hlFacNum = (HyperLink)e.Item.FindControl("hlFacNum");

            if (lbFacGroup !=null && hlFacNum != null && lbFacSystemID != null)
            {
                if (lbFacGroup.Text.StartsWith("Electrical"))
                {
                  
                    hlFacNum.NavigateUrl = "~/Equipment/equipElectrical.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
                }
                else
                {
              
                    hlFacNum.NavigateUrl = "~/Equipment/equipMechanical.aspx?ParentFacilitySysID=" + lbFacSystemID.Text;
                }
            }

            //NIHRole = "msSuper" and "msAdmin" can upate facility (can see save current page info button)
            //NIHRole only "msAdmin" can assign number, change status, 
            //no, only status for facility now. status for every equipment, inactive use different color 
            Control actionHeader = ListView1.FindControl("colAction");
            if (actionHeader != null)
                if (loginUsr.Role.ToLower() == "msadmin" || loginUsr.Role.ToLower() == "mssuper")
                { actionHeader.Visible = true; }
                else
                { actionHeader.Visible = false; }
           
                
            HyperLink hlAction = (HyperLink)e.Item.FindControl("hlAction");
            if (hlAction != null)
                if (loginUsr.Role.ToLower() == "msadmin" || loginUsr.Role.ToLower() == "mssuper")
                { hlAction.Visible = true; }
                else
                { hlAction.Visible = false; }         
          
            
        }
    }


    protected void CurrentRowTextBox_OnTextChanged(object sender, EventArgs e)
    {
        TextBox t = (TextBox)sender;
        DataPager pager =
            (DataPager)ListView1.FindControl("DataPager");
        pager.SetPageProperties(Convert.ToInt32(t.Text) - 1,
             pager.PageSize, true);
    }
    protected void ListView1_OnSorting(object sender, ListViewSortEventArgs e)
    {
        if (String.IsNullOrEmpty(e.SortExpression)) { return; }
        string direction = "";
        if (ViewState["SortDirection"] != null)
            direction = ViewState["SortDirection"].ToString();

        if (direction == "ASC")
            direction = "DESC";
        else
            direction = "ASC";

        ViewState["SortDirection"] = direction;

        string[] sortColumns = e.SortExpression.Split(',');
        string sortExpression = sortColumns[0] + " " + direction;
        for (int i = 1; i < sortColumns.Length; i++)
            sortExpression += ", " + sortColumns[i] + " " + direction;
        e.SortExpression = sortExpression;


    }

    #region protected void btnExportToExcel_OnClick(object sender, EventArgs e)

    protected void btnExportToExcel_OnClick(object sender, EventArgs e)
    {
       //     Utils.ExportToExcel("Inventory Result", gvEquips);
    }

    #endregion

    #region protected void btnExportToPDF_OnClick(object sender, EventArgs e)

    protected void btnExportToPDF_OnClick(object sender, EventArgs e)
    {
        //string strTitle = " Active Trouble Calls Due In: " + drpDueHours.SelectedItem.Text;
        //if (drpWOGroup.SelectedIndex != 0)
        //{ strTitle += " For Group: " + drpWOGroup.SelectedItem.Text; }

        //Utils.ExportToPDF("Inventory Search " + DateTime.Now.ToShortDateString(), gvEquips, "Facility Search " + DateTime.Now.ToShortDateString());
        
        //Utils.ExportToPDFlv("Search Result", ListView1);
    }

    #endregion

    protected void btnSearch_Click(object sender, EventArgs e)
    { 
        //save search criteria to session
        //type, system, wr#, building, fac#, assigned?
        if (drplstGroup.SelectedValue != "")
        {
            Session["DefSeaType"] = drplstGroup.SelectedValue;
        }
        else
        {
            Session["DefSeaType"] = string.Empty;
        }
        if (drplstBuilding.SelectedValue != "")
        {
            Session["DefSeaBuilding"] = drplstBuilding.SelectedValue;
        }
        else
        {   Session["DefSeaBuilding"] = string.Empty;}
        if (drplstSystem.SelectedValue != "")
        {
            Session["DefSeaSystem"] = drplstSystem.SelectedValue;
        }
        else {Session["DefSeaSystem"] = string.Empty;}
        if (!string.IsNullOrEmpty(txtWRNum.Text.Trim()))
        {
            Session["DefSeaWRNum"] = txtWRNum.Text.Trim();
        }
        else { Session["DefSeaWRNum"] = string.Empty; }
        if (!string.IsNullOrEmpty(txtFacilityNum.Text.Trim()))
        {
            Session["DefSeaFacNum"] = txtFacilityNum.Text.Trim();
        }
        else { Session["DefSeaFacNum"] = string.Empty; }
        Session["DefSeaAssigned"] = radioSelect.SelectedValue;
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        radioSelect.SelectedValue = "1";
        Session["DefSeaAssigned"] = "1";
        drplstGroup.SelectedValue = string.Empty;
        Session["DefSeaType"] = string.Empty;
        drplstBuilding.SelectedValue = string.Empty;
        Session["DefSeaBuilding"] = string.Empty;
        drplstSystem.SelectedValue = string.Empty;
        Session["DefSeaSystem"] = string.Empty;
        txtWRNum.Text = string.Empty;
        Session["DefSeaWRNum"] = string.Empty;
        txtFacilityNum.Text = string.Empty;
        Session["DefSeaFacNum"] = string.Empty; 
    }
}

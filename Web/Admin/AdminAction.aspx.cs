using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIH.CMMS.Inventory.BPL.LookUp;
using System.Data;
using NIH.CMMS.Inventory.BOL.Facility;
using NIH.CMMS.Inventory.BPL.Facility;
using NIH.CMMS.Inventory.BOL.Common;
using NIH.CMMS.Inventory.Web;
using NIH.CMMS.Inventory.BOL.People;

public partial class Admin_AdminAction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoginUser loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_USEROBJLOGINDET];
            if (loginUsr == null)
            { Response.Redirect("~/Login.aspx"); }
            else if (loginUsr.Role.ToLower() != "msadmin" && loginUsr.Role.ToLower() != "mssuper")
            { Response.Redirect("~/Default.aspx"); }

            hidFacSystemID.Value = "-1";
            DataSet dtSystem = GeneralLookUp.GetSystemList();
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();
            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();
            DataSet dtStatus = GeneralLookUp.GetStatusList();
            drplstStatus.DataSource = dtStatus;
            drplstStatus.DataBind();

            if (Request.QueryString["FacId"] != null && !string.IsNullOrEmpty(Request.QueryString["FacId"].ToString()))
            {
                //load detail
                int facID = 0;   
                bool result = Int32.TryParse(Request.QueryString["FacId"].ToString(), out facID);
                if (result)
                {
                    FacilityDet details = facility_logic.GetFacilityDetails(Convert.ToInt32(Request.QueryString["FacId"]));
                    if (details != null)
                    {
                        #region "Load general facility detail"
                        lbFacNum.Text = details.FacNum;
                        hidFacSystemID.Value = Request.QueryString["FacId"];
                        drplstSystem.SelectedValue = details.FacSystem;
                        drplstBuilding.SelectedValue = details.FacBuilding;
                        txtFunction.Text = details.FacFunction;
                        txtFloor.Text = details.FacFloor;
                        txtLocation.Text = details.FacLocation;
                        txtFacilityID.Text = details.FacID;
                        txtFacNum.Text = details.FacNum;
                        txtWRNum.Text = details.WRNumber;
                        ckAAALAC.Checked = (details.YsnAaalac == 1) ? true : false;
                        ckBSL.Checked = (details.YsnBsl == 1) ? true : false;
                        ckTJC.Checked = (details.YsnTJC == 1) ? true : false;
                        txtComments.Text = details.Comment;
                        drplstStatus.SelectedValue = details.Status;
                        #endregion

                    }
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }


               
            }

        }

    }

     protected void btnFinish_Click(object sender, EventArgs e)
    {
        ValidationResult vr = SaveFacilityDetails();
        if (vr.Success)
        {
            Utils.ShowPopUpMsg("Information is saved.", this.Page);
        }
        else
            Utils.ShowPopUpMsg("Information cannot be saved." + vr.Reason, this.Page);      
        
    }

    protected void btnBackToList_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["SearchReportSearchCriteria"] != null)
        {
            Response.Redirect("/SearchResult.aspx");
        }

    }

    private ValidationResult SaveFacilityDetails()
     {
         FacilityDet details = new FacilityDet();
         details.Key = Convert.ToInt32(hidFacSystemID.Value);
         //show not happen when page > 0
         details.FacSystem = drplstSystem.SelectedValue;
         details.FacFunction = txtFunction.Text.Trim();
         details.FacBuilding = drplstBuilding.SelectedValue;
         details.FacFloor = txtFloor.Text.Trim();
         details.FacLocation = txtLocation.Text.Trim();
         details.WRNumber = txtWRNum.Text.Trim();
         details.YsnAaalac = ckAAALAC.Checked ? 1 : 0;
         details.YsnBsl = ckBSL.Checked ? 1 : 0;
         details.YsnTJC = ckTJC.Checked ? 1 : 0;
         details.Status = drplstStatus.SelectedValue;
         details.FacID = txtFacilityID.Text.Trim();
         details.Comment = txtComments.Text.Trim();
         details.FacNum = txtFacNum.Text.Trim();
         LoginUser loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_USEROBJLOGINDET];
         if (loginUsr != null)
             details.UserName = loginUsr.LaborName;


         return facility_logic.UpdateFacilityAdmin(details);
         
     }
}

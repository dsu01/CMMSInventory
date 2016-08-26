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

public partial class Default3 : System.Web.UI.Page
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

            #region Load checkbox list values
            //Type or Use: call the .GeneralLookUp.GetEletricalTypeOrUse();
            DataSet dtSystem = GeneralLookUp.GetSystemList();
            //get the first 64 system, then use see More ... to get the rest 60-120
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();

            DataSet dtComponent = GeneralLookUp.GetMechanicalSystemList();
            ckbxlstComponent.DataSource = dtComponent;
            ckbxlstComponent.DataBind();
            
            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

            //Type Electrical and Mechanical
            //Facility Assigned
            #endregion

            #region Show Previous Search Values
            if (!SearchCriteria.KeepAlive) SearchCriteria.Instance = null;
            else SearchCustomCriteria.KeepAlive = false;

            if (SearchCustomCriteria.Instance != null)
            {
                SearchCustomCriteria crit = SearchCustomCriteria.Instance;

                if (pnlDistrict.Visible && crit.distcode != "")
                {
                    drplstDistricts.SelectedValue = crit.distcode;
                    GetListByDistrict(crit.distcode);
                }
                drplstOffice.SelectedIndex = drplstOffice.Items.IndexOf(drplstOffice.Items.FindByValue(crit.intOfficeId.ToString()));
                ddlOfficers.SelectedValue = crit.officerIds;
                ddlStatus.SelectedValue = crit.statusIds;
            }
            else
            {
                rdlAbortedFL.SelectedIndex = rdlAbortedFL.Items.IndexOf(rdlAbortedFL.Items.FindByValue("-1"));
                rdlDamagedFL.SelectedIndex = rdlDamagedFL.Items.IndexOf(rdlDamagedFL.Items.FindByValue("-1"));
                rdlSeizedFL.SelectedIndex = rdlSeizedFL.Items.IndexOf(rdlSeizedFL.Items.FindByValue("-1"));
                rblRestained.SelectedIndex = rblRestained.Items.IndexOf(rblRestained.Items.FindByValue("-1"));

                rblJudgeContacted.SelectedIndex = rblJudgeContacted.Items.IndexOf(rblJudgeContacted.Items.FindByValue("-1"));
                rblRestained.SelectedIndex = rblRestained.Items.IndexOf(rblRestained.Items.FindByValue("-1"));
                rblIncident.SelectedIndex = rblIncident.Items.IndexOf(rblIncident.Items.FindByValue("-1"));
                rblAttachments.SelectedIndex = rblAttachments.Items.IndexOf(rblAttachments.Items.FindByValue("-1"));
                rblVideotaped.SelectedIndex = rblVideotaped.Items.IndexOf(rblVideotaped.Items.FindByValue("-1"));
                rblThirdParties.SelectedIndex = rblThirdParties.Items.IndexOf(rblThirdParties.Items.FindByValue("-1"));
                rblPersonCooperative.SelectedIndex = rblPersonCooperative.Items.IndexOf(rblPersonCooperative.Items.FindByValue("-1"));
                rblOtherAgencies.SelectedIndex = rblOtherAgencies.Items.IndexOf(rblOtherAgencies.Items.FindByValue("-1"));
                // rblCircumstance.SelectedIndex = rblCircumstance.Items.IndexOf(rblCircumstance.Items.FindByValue(""));
                rdlTeamMemberFL.SelectedIndex = rdlTeamMemberFL.Items.IndexOf(rdlTeamMemberFL.Items.FindByValue("-1"));

            }

            #endregion
        }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SearchCriteria crit = SearchCriteria.NewInstance;

            if (pnlDistrict.Visible) crit.distcode = drplstDistricts.SelectedValue;
            else crit.distcode = currentUser.DistrictCode;
            crit.intOfficeId = Convert.ToInt32(drplstOffice.SelectedValue);
            crit.officerIds = ddlOfficers.SelectedValue;
            crit.statusIds = ddlStatus.SelectedValue;

            Response.Redirect("SearchResult.aspx");
        }
           
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        rblTrainedCPR.SelectedValue = "-1";
        rblTrainedFirstAid.SelectedValue = "-1";
        SearchCriteria.Instance = null;
    }


    
}
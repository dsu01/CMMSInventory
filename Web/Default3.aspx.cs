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
using NIH.CMMS.Inventory.BOL.Common;

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

            DataSet dtType = GeneralLookUp.GetTypeList();
            ckbxlstType.DataSource = dtType;
            ckbxlstType.DataBind();

            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

          
            #endregion

            #region Show Previous Search Values
            if (!SearchCriteria.KeepAlive) SearchCriteria.Instance = null;
            else SearchCriteria.KeepAlive = false;

            if (SearchCriteria.Instance != null)
            {
                SearchCriteria crit = SearchCriteria.Instance;
                if (crit.buildingIds != null)
                    Utils.CheckCheckboxListFromListString(drplstBuilding, crit.buildingIds);
                if (crit.systemIds != null)
                    Utils.CheckCheckboxListFromListString(drplstSystem, crit.systemIds);
                if (crit.componentIds != null)
                    Utils.CheckCheckboxListFromListString(ckbxlstComponent, crit.componentIds);
                if (crit.typeIds != null)
                    Utils.CheckCheckboxListFromListString(ckbxlstType, crit.typeIds);
                radioSelect.SelectedValue = crit.flagAssigned.ToString();
            }          

            #endregion
        }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SearchCriteria crit = SearchCriteria.NewInstance;

            crit.buildingIds = Utils.GetListStringFromCheckboxList(drplstBuilding);
            crit.typeIds = Utils.GetListStringFromCheckboxList(ckbxlstType);
            crit.componentIds = Utils.GetListStringFromCheckboxList(ckbxlstComponent);
            crit.systemIds = Utils.GetListStringFromCheckboxList(drplstSystem);
            crit.flagAssigned = Convert.ToInt32(radioSelect.SelectedValue);
            Response.Redirect("SearchResult.aspx");
        }
           
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Utils.UnCheckTypeCollection(drplstBuilding);
        Utils.UnCheckTypeCollection(drplstBuilding);
        Utils.UnCheckTypeCollection(drplstBuilding);
        Utils.UnCheckTypeCollection(drplstBuilding);
        radioSelect.SelectedValue = "1"; //default unassigned
        SearchCriteria.Instance = null;
    }

    protected void btnSearchByFacNum_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtFacilityNum.Text.Trim()))
        {
            Response.Redirect("equipMechanicalNew.aspx?facnum=" + txtFacilityNum.Text.Trim());
        }
    }
    protected void btnSearchByWRNum_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtWRNum.Text.Trim()))
        {
            Response.Redirect("equipMechanicalNew.aspx?wrnum=" + txtWRNum.Text.Trim());
        }
    }
}
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
            DataSet dtType = GeneralLookUp.GetTypeList();
            rblstType.DataSource = dtType;
            rblstType.DataBind();        
                  
            DataSet dtBuilding = GeneralLookUp.GetSearchBuildingList(); 
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();
            ListItem item = new ListItem();
            item.Text = "All";
            item.Value = "-1";            
            drplstBuilding.Items.Add(item);
            lbSelectedBuildingValue.Text = "None";
            #endregion

            #region Show Previous Search Values
            if (!SearchCriteria.KeepAlive) SearchCriteria.Instance = null;
            else SearchCriteria.KeepAlive = false;

            if (SearchCriteria.Instance != null)
            {
                SearchCriteria crit = SearchCriteria.Instance;
                if (!string.IsNullOrEmpty(crit.facnum))
                    txtFacilityNum.Text = crit.facnum;
                else if (!string.IsNullOrEmpty(crit.wrnum))
                    txtWRNum.Text = crit.wrnum;
                else
                {
                     if (crit.buildingIds != null)
                        Utils.CheckCheckboxListFromListString(drplstBuilding, crit.buildingIds);
                    if (crit.systemIds != null)
                    Utils.CheckCheckboxListFromListString(drplstSystem, crit.systemIds);
                     if (crit.componentIds != null)
                    //Utils.CheckCheckboxListFromListString(ckbxlstComponent, crit.componentIds);
                    if (!string.IsNullOrEmpty(crit.typeId))
                    rblstType.SelectedValue = crit.typeId;
                    radioSelect.SelectedValue = crit.flagAssigned.ToString();
                }
            }          

            #endregion
        }

    }

    protected void drplstSystem_SelectedIndexChanged(object sender, EventArgs e)
    {       
        for (int i = 0; i < drplstSystem.Items.Count; i++)
        {
            if (drplstSystem.Items[i].Selected)
            {
                //if select anything below displayed/brandished, then show additional factors
                if (drplstSystem.Items[i].Value == "-1")
                {
                    //uncheck all other checkboxes
                    break;
                }
                else
                {

                }
            }
        }

    }

    protected void rblstType_SelectedIndexChanged(object sender, EventArgs e)
    {        
        if (!string.IsNullOrEmpty(rblstType.SelectedValue))
        {
            pnlSelection.Visible = true;
            //filter the other two checkboxes list depends on this value
            //if Systemgroup contains System, then it is system,
            //only system can be qualified as parent
            //otherwise if Equipment
            DataSet resList = GeneralLookUp.GetListByType(rblstType.SelectedValue);
            if (resList != null)
            {
                drplstSystem.DataSource = resList;
                drplstSystem.DataBind();
                ListItem item = new ListItem();
                item.Text = "All";
                item.Value = "-1";
                drplstSystem.Items.Add(item);
                lbSelectedSystemValue.Text = "None";
                //if (rblstType.SelectedValue.ToLower().Contains("system"))
                //{
                //    //DataSet dtSystem = GeneralLookUp.GetSystemList(rblstType.SelectedValue);
                //    ////get the first 64 system, then use see More ... to get the rest 60-120
                //    drplstSystem.DataSource = resList;
                //    drplstSystem.DataBind();
                //    ListItem item = new ListItem();
                //    item.Text = "All";
                //    item.Value = "-1";
                //    drplstBuilding.Items.Add(item);
                //    lbSelectedSystemValue.Text = "None";
                //}
                ////DataView two
                //else
                //{
                //    //DataSet dtComponent = GeneralLookUp.GetEquipmentList();
                //    ckbxlstComponent.DataSource = resList;
                //    ckbxlstComponent.DataBind();
                //    ListItem item = new ListItem();
                //    item.Text = "All";
                //    item.Value = "-1";
                //    drplstBuilding.Items.Add(item);
                //    lbSelectedEquipmentValue.Text = "None";
                //}
            }        
        } 
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SearchCriteria crit = SearchCriteria.NewInstance;

            crit.buildingIds = Utils.GetCatCollectionString(Utils.GetSubTypeCollection(drplstBuilding));
            if (!string.IsNullOrEmpty(rblstType.SelectedValue))
                crit.typeId = rblstType.SelectedValue;
            //crit.componentIds = Utils.GetListStringFromCheckboxList(ckbxlstComponent);
            crit.systemIds = Utils.GetListStringFromCheckboxList(drplstSystem);
            crit.flagAssigned = Convert.ToInt32(radioSelect.SelectedValue);
            crit.facnum = string.Empty;
            crit.wrnum = string.Empty;
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
            SearchCriteria crit = SearchCriteria.NewInstance;

            if (!string.IsNullOrEmpty(txtFacilityNum.Text))
                crit.facnum = txtFacilityNum.Text.Trim();          
            Response.Redirect("SearchResult.aspx");
           // Response.Redirect("equipMechanicalNew.aspx?facnum=" + txtFacilityNum.Text.Trim());
        }
    }
    protected void btnSearchByWRNum_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtWRNum.Text.Trim()))
        {
            SearchCriteria crit = SearchCriteria.NewInstance;

            if (!string.IsNullOrEmpty(txtWRNum.Text))
                crit.wrnum = txtWRNum.Text.Trim();
            Response.Redirect("SearchResult.aspx");
            // Response.Redirect("equipMechanicalNew.aspx?facnum=" + txtFacilityNum.Text.Trim());
        }
    }

    protected void cklstSystemSelectedIndexChangd(object sender, EventArgs e)
    {
        lbSelectedSystemValue.Text = string.Empty;
        //implement logic for user selection
        for (int i = 0; i < drplstSystem.Items.Count; i++)
        {

            if (drplstSystem.Items[i].Selected)
            {
                if (drplstSystem.Items[i].Text.ToLower() == "all")
                {
                    //check all 
                    CheckAll(drplstSystem);
                    lbSelectedSystemValue.Text = "All";
                    return;
                }
                else
                    lbSelectedSystemValue.Text += drplstSystem.Items[i].Text + "; ";
            }
        }

        //remove the ;
        if (lbSelectedSystemValue.Text.Length > 1)
            lbSelectedSystemValue.Text = lbSelectedSystemValue.Text.Substring(0, lbSelectedSystemValue.Text.Length - 2);
    }

    protected void cklstBuildingSelectedIndexChangd(object sender, EventArgs e)
    {
        lbSelectedBuildingValue.Text = string.Empty;
        //implement logic for user selection
        for (int i = 0; i < drplstBuilding.Items.Count; i++)
        {
            if (drplstBuilding.Items[i].Selected)
            {
                if (drplstBuilding.Items[i].Text.ToLower() == "all")
                {
                    //check all 
                    CheckAll(drplstBuilding);
                    lbSelectedBuildingValue.Text = "All";
                    return;
                }
                else             
                    lbSelectedBuildingValue.Text += drplstBuilding.Items[i].Text + "; ";
            }
        }
        //remove the ;
        if (lbSelectedBuildingValue.Text.Length > 1)
            lbSelectedBuildingValue.Text = lbSelectedBuildingValue.Text.Substring(0, lbSelectedBuildingValue.Text.Length - 2);
    }

    private void CheckAll(CheckBoxList lst)
    {
        for (int i = 0; i < lst.Items.Count; i++)
        {
            lst.Items[i].Selected = true;
        }       
    }

}
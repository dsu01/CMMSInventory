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
            //DataSet dtType = GeneralLookUp.GetTypeList();
            //rblstType.DataSource = dtType;
            //rblstType.DataBind();        

            DataSet dtBuilding = GeneralLookUp.GetSearchBuildingList();
            lbBuilding.DataSource = dtBuilding;
            lbBuilding.DataBind();
           
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
                    if (crit.selBuildings != null)
                    {
                        //show current selection
                        // lbSelectedBuildingValue.Text = crit.buildingDescs; 
                        // Utils.CheckCheckboxListFromListString(drplstBuilding, crit.buildingIds);
                        lbExtBuilding.DataSource = crit.selBuildings;
                        lbExtBuilding.DataBind();
                    }
               
                   if (!string.IsNullOrEmpty(crit.typeId))
                   {
                       rblstType.SelectedValue = crit.typeId;
                       ShowSelection(crit.typeId); 
                       if (crit.selSystems != null)
                       {
                            // lbSelectedSystemValue.Text = crit.systemDescs;
                            // Utils.CheckCheckboxListFromListString(drplstSystem, crit.systemIds);
                            lbExtSystems.DataSource = crit.selSystems;
                            lbExtSystems.DataBind();
                        }
                   }
                    
                    radioSelect.SelectedValue = crit.flagAssigned.ToString();
                }          
            }          

            #endregion
        }

    }


    protected void rblstType_SelectedIndexChanged(object sender, EventArgs e)
    {        
        if (!string.IsNullOrEmpty(rblstType.SelectedValue))
        {

            ShowSelection(rblstType.SelectedValue);        
        } 
    }

    private void ShowSelection(string val)
    { 
           
            //filter the other two checkboxes list depends on this value
            //if Systemgroup contains System, then it is system,
            //only system can be qualified as parent
            //otherwise if Equipment
        if (!string.IsNullOrEmpty(val))
        {
            DataSet resList = GeneralLookUp.GetListByType(val);
          
            if (resList != null)
            {
                lbSystems.DataSource = resList;
                lbSystems.DataBind();
                 
            }
        }
            
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SearchCriteria crit = SearchCriteria.NewInstance;
            crit.selBuildings = Utils.GetSelItemCollection(lbExtBuilding);
            crit.buildingDescs = Utils.GetStringDescFromListBox(lbExtBuilding);       
            if (!string.IsNullOrEmpty(rblstType.SelectedValue))
                crit.typeId = rblstType.SelectedValue;
                       
            crit.selSystems = Utils.GetSelItemCollection(lbExtSystems);
            crit.systemDescs = Utils.GetStringDescFromListBox(lbExtSystems);            
            crit.flagAssigned = Convert.ToInt32(radioSelect.SelectedValue);
            crit.facnum = string.Empty;
            crit.wrnum = string.Empty;
            HttpContext.Current.Session["SearchReportSearchCriteria"] = crit;
            Response.Redirect("SearchResult.aspx");
        }
           
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        lbExtSystems.Items.Clear();
        lbExtBuilding.Items.Clear();
        rblstType.SelectedIndex = -1;
        radioSelect.SelectedValue = "3"; //default unassigned
        SearchCriteria.Instance = null;
    }

    protected void btnSearchByFacNum_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtFacilityNum.Text.Trim()))
        {
            SearchCriteria crit = SearchCriteria.NewInstance;

            if (!string.IsNullOrEmpty(txtFacilityNum.Text))
                crit.facnum = txtFacilityNum.Text.Trim();
            HttpContext.Current.Session["SearchReportSearchCriteria"] = crit;
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
            HttpContext.Current.Session["SearchReportSearchCriteria"] = crit;
            Response.Redirect("SearchResult.aspx");
            // Response.Redirect("equipMechanicalNew.aspx?facnum=" + txtFacilityNum.Text.Trim());
        }
    }

    //protected void cklstSystemSelectedIndexChangd(object sender, EventArgs e)
    //{
    //    lbSelectedSystemValue.Text = string.Empty;
    //    //implement logic for user selection
    //    for (int i = 0; i < drplstSystem.Items.Count; i++)
    //    {

    //        if (drplstSystem.Items[i].Selected)
    //        {
    //            if (drplstSystem.Items[i].Text.ToLower() == "all")
    //            {
    //                //check all 
    //                CheckAll(drplstSystem);
    //                lbSelectedSystemValue.Text = "All";
    //                return;
    //            }
    //            else
    //                lbSelectedSystemValue.Text += drplstSystem.Items[i].Text + "; ";
    //        }
    //    }

    //    //remove the ;
    //    if (lbSelectedSystemValue.Text.Length > 1)
    //        lbSelectedSystemValue.Text = lbSelectedSystemValue.Text.Substring(0, lbSelectedSystemValue.Text.Length - 2);
    //}

  
    protected void btnSelectSystem_Click(object sender, EventArgs e)
    {

        //get the selected functions from left listbox and add it into rightside box       
        foreach (ListItem item in lbSystems.Items)
        {
            if (item.Selected)
            {
                item.Selected = false;
                if (!lbExtSystems.Items.Contains(item))
                {
                    lbExtSystems.Items.Add(item);
                }
            }
        }
    }

    protected void btnRemoveSystem_Click(object sender, EventArgs e)
    {
        List<ListItem> selitems = new List<ListItem>();
        foreach (ListItem item in lbExtSystems.Items)
        {
            //if items are not removed, add into arraylist and bind it later
            if (!item.Selected)
            {
                selitems.Add(item);
            }
        }
        lbExtSystems.Items.Clear();
        lbExtSystems.Items.AddRange(selitems.ToArray());
    }

    protected void btnAddAllSystem_Click(object sender, EventArgs e)
    {
        //get the selected functions from left listbox and add it into rightside box       
        foreach (ListItem item in lbSystems.Items)
        {
            //if (!drplstSelectedStudents.Items.Contains(item))
            if (lbExtSystems.Items.FindByValue(item.Value) == null)
            {
                lbExtSystems.Items.Add(item);
            }
        }

        //Todo:add means change status to approved. if user is on wait list, status changed
    }
    protected void btnRemoveAllBuilding_Click(object sender, EventArgs e)
    {
        lbExtBuilding.Items.Clear();
   
    }
    protected void btnAddAllBuilding_Click(object sender, EventArgs e)
    {
        //get the selected functions from left listbox and add it into rightside box       
        foreach (ListItem item in lbBuilding.Items)
        {
            //if (!drplstSelectedStudents.Items.Contains(item))
            if (lbExtBuilding.Items.FindByValue(item.Value) == null)
            {
                lbExtBuilding.Items.Add(item);
            }
        }

        //Todo:add means change status to approved. if user is on wait list, status changed
    }
    protected void btnRemoveAllSystem_Click(object sender, EventArgs e)
    {
        lbExtSystems.Items.Clear();

    }
    /// <summary>
    protected void btnSelectBuilding_Click(object sender, EventArgs e)
    {

        //get the selected functions from left listbox and add it into rightside box       
        foreach (ListItem item in lbBuilding.Items)
        {
            if (item.Selected)
            {
                item.Selected = false;
                if (!lbExtBuilding.Items.Contains(item))
                {
                    lbExtBuilding.Items.Add(item);
                }
            }
        }
    }

    protected void btnRemoveBuilding_Click(object sender, EventArgs e)
    {
        List<ListItem> selitems = new List<ListItem>();
        foreach (ListItem item in lbExtBuilding.Items)
        {
            //if items are not removed, add into arraylist and bind it later
            if (!item.Selected)
            {
                selitems.Add(item);
            }
        }
        lbExtBuilding.Items.Clear();
        lbExtBuilding.Items.AddRange(selitems.ToArray());
    }
    private void CheckAll(CheckBoxList lst)
    {
        for (int i = 0; i < lst.Items.Count; i++)
        {
            lst.Items[i].Selected = true;
        }
    }

}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIH.CMMS.Inventory.BPL.LookUp;
using NIH.CMMS.Inventory.BOL.Common;
using NIH.CMMS.Inventory.Web;
using NIH.CMMS.Inventory.BOL.Facility;
using NIH.CMMS.Inventory.BOL.People;
using NIH.CMMS.Inventory.BPL.Common;
using NIH.CMMS.Inventory.BPL.Facility;
using NIH.CMMS.Inventory.Web.Extensions;

public partial class Equipment_equipElectrical : System.Web.UI.Page
{
    protected LoginUser loginUsr;

    public int ParentFacilitySysID
    {
        get
        {
            return !string.IsNullOrEmpty(Request.QueryString["ParentFacilitySysID"])
                ? Convert.ToInt32(Request.QueryString["ParentFacilitySysID"])
                : -1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        loginUsr = Utils.CheckSession(this);

        ctrlAddAttachment.IsEquipmentOrFacility = true;
        ctrlAddAttachment.AttachmentSaved += CtrlAddAttachment_AttachmentSaved;

        if (!Page.IsPostBack)
        {
            if (loginUsr.Role.ToLower() != "msadmin" && loginUsr.Role.ToLower() != "mssuper")
            { btnFinish.Visible = false; }

            hidFacSystemID.Value = "-1";
            DataSet dtSystem = GeneralLookUp.GetEletricalSystemList();
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();
            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

            if (ParentFacilitySysID >= 0)
            {
                //New eletrical equipment
                btnFinish.Text = "Update Equipment";
                trAttachment.Visible = true;
                drplstBuilding.Enabled = false;
                LoadDetails();
            }
            else
            {
                //New eletrical equipment
                btnFinish.Text = "Add New Equipment";
                trAttachment.Visible = false;
                drplstBuilding.Enabled = true;
            }

        }

    }

    private void LoadDetails()
    {
        FacilityDet details = facility_logic.GetElectrialEquipDetails(ParentFacilitySysID);
        if (details != null)
        {
            #region "Load general facility detail"
            hidFacSystemID.Value = ParentFacilitySysID.ToString();
            drplstSystem.SelectedValue = details.FacSystem;
            drplstBuilding.SelectedValue = details.FacBuilding;
            txtFunction.Text = details.FacFunction;
            txtFloor.Text = details.FacFloor;
            txtLocation.Text = details.FacLocation;
            txtFacilityID.Text = details.FacID;
            txtFacilityNum.Text = details.FacNum;
            //if is active then Green
            if (details.FacNum.StartsWith("T"))
            { txtFacilityNum.BackColor = System.Drawing.Color.Aquamarine; }
            txtWRNum.Text = details.WRNumber;
            ckAAALAC.Checked = (details.YsnAaalac == 1) ? true : false;
            ckBSL.Checked = (details.YsnBsl == 1) ? true : false;
            ckTJC.Checked = (details.YsnTJC == 1) ? true : false;
            txtComments.Text = details.Comment;

            //disable the save button if not in active status
            //disable the save button if not in active status
            if (details.Status.ToLower() != "active")
            {
                contentPanel.Enabled = false;
                btnFinish.Visible = false;
            }
            #endregion

            #region "load detail info"
            txtElectricalOther.Text = details.ElectricalOther;

         
            txtModelNum.Text = details.ModelNo;
            txtSerialNum.Text = details.SerialNo;
            txtSize.Text = details.Size;

            if (details.InstalledDate != DateTime.MinValue)
                txtInstalledDate.Text = details.InstalledDate.ToShortDateString();

            txtInventoryBy.Text = details.InventoryBy;
            if (details.InventoryDate != DateTime.MinValue)
                txtInventoryDate.Text = details.InventoryDate.ToShortDateString();


            txtTypeOrUse.Text = details.TypeOrUse;
            txtManufacturer.Text = details.Manufacturer;
            txtVolts.Text = details.Volts;
            txtAMP.Text = details.AMP;
            txtKVA.Text = details.KVA;
            txtVoltsPrimary.Text = details.VoltsPrimary;
            txtVoltsSecondary.Text = details.VoltsSecondary;
            txtPH.Text = details.PH;
            txtW.Text = details.W;
            txtCKTSNum.Text = details.CktsNum;
            txtCKTSUsed.Text = details.CktsUsed;

            txtBSLClass.Text = details.BslClassification;

            if (details.TJCValue > 0)
            { txtTJC.Text = details.TJCValue.ToString(); }
            txtPMSchedule.Text = details.PMSchedule;

            if (!string.IsNullOrEmpty(details.LastUpdatedBy))
                lbLastUpdatedBy.Text = "Last updated by: " + details.LastUpdatedBy + " on " + details.LastUpdatedDate.ToShortDateString();
            #endregion

            LoadAttachments();
        }
    }

    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(drplstBuilding.SelectedValue) || string.IsNullOrEmpty(drplstSystem.SelectedValue) || string.IsNullOrEmpty(txtFacilityID.Text.Trim()) || string.IsNullOrEmpty(txtLocation.Text.Trim()))
        {
            Utils.ShowPopUpMsg("Facility ID, System, Building and Location are required.", this);
        }
        else
        {
            //call spn_inv_AddElectricalEquipment_NewSite
            ValidationResult vr = SaveFacilityDetails();
            if (vr.Success)
            {
               
                Utils.ShowPopUpMsg("Equipment is saved.", this.Page);
                //can add attachment now
                trAttachment.Visible = true;
            }
            else
                Utils.ShowPopUpMsg("Equipment cannot be saved." + vr.Reason, this.Page);
            //after save, show your temp fac# is saved, u can print now, print.css needs line
            //show active or inactive
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        if (ParentFacilitySysID >= 0)
        {
            LoadDetails();
        }
        else
        {
            ClearData();
        }
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        ClearData();


    }


    private void ClearData()
    {
        hidFacSystemID.Value = "-1";
        txtFacilityNum.Text = string.Empty;
        drplstSystem.SelectedIndex = -1;
        txtFunction.Text = string.Empty;
        drplstBuilding.SelectedIndex = -1;
        txtFloor.Text = string.Empty;
        txtLocation.Text = string.Empty;
        txtWRNum.Text = string.Empty;
        ckAAALAC.Checked = false;
        ckBSL.Checked = false;
        ckTJC.Checked = false;
        txtComments.Text = string.Empty;
        txtFacilityID.Text = string.Empty;

        txtInventoryBy.Text = string.Empty;
        txtInventoryDate.Text = string.Empty;
        txtModelNum.Text = string.Empty;
        txtSize.Text = string.Empty;
        txtSerialNum.Text = string.Empty;
        txtInstalledDate.Text = string.Empty;
        txtElectricalOther.Text = string.Empty;

        txtTypeOrUse.Text = string.Empty;
        txtManufacturer.Text = string.Empty;
        txtVolts.Text = string.Empty;
        txtAMP.Text = string.Empty;
        txtKVA.Text = string.Empty;
        txtVoltsPrimary.Text = string.Empty;
        txtVoltsSecondary.Text = string.Empty;
        txtPH.Text = string.Empty;
        txtW.Text = string.Empty;
        txtCKTSNum.Text = string.Empty;
        txtCKTSUsed.Text = string.Empty;

        txtPMSchedule.Text = string.Empty;
        txtTJC.Text = string.Empty;
        txtBSLClass.Text = string.Empty;
        trAttachment.Visible = false;
    }

    private ValidationResult SaveFacilityDetails()
    {

        FacilityDet details = new FacilityDet();
        details.Key = ParentFacilitySysID;
        details.FacNum = txtFacilityNum.Text;
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
        details.Comment = txtComments.Text.Trim();
        details.FacID = txtFacilityID.Text.Trim();

        details.UserName = loginUsr.LaborName;
        details.ElectricalOther = txtElectricalOther.Text.Trim();
        details.TypeOrUse = txtTypeOrUse.Text.Trim();
        details.Manufacturer = txtManufacturer.Text.Trim();
        details.Volts = txtVolts.Text.Trim();
        details.AMP = txtAMP.Text.Trim();
        details.KVA = txtKVA.Text.Trim();
        details.VoltsPrimary = txtVoltsPrimary.Text.Trim();
        details.VoltsSecondary = txtVoltsSecondary.Text.Trim();
        details.PH = txtPH.Text.Trim();
        details.W = txtW.Text.Trim();
        details.CktsNum = txtCKTSNum.Text.Trim();
        details.CktsUsed = txtCKTSUsed.Text.Trim();

        details.ModelNo = txtModelNum.Text.Trim();

        details.SerialNo = txtSerialNum.Text.Trim();
        details.Size = txtSize.Text.Trim();

        if (!string.IsNullOrEmpty(txtInstalledDate.Text.Trim()))
            details.InstalledDate = Convert.ToDateTime(txtInstalledDate.Text.Trim());
        if (!string.IsNullOrEmpty(txtInventoryDate.Text.Trim()))
            details.InventoryDate = Convert.ToDateTime(txtInventoryDate.Text.Trim());

        details.ElectricalOther = txtElectricalOther.Text.Trim();
        details.InventoryBy = txtInventoryBy.Text.Trim();

        details.BslClassification = txtBSLClass.Text.Trim();
        if (!string.IsNullOrEmpty(txtTJC.Text.Trim()))
            details.TJCValue = Convert.ToInt32(txtTJC.Text.Trim());
        details.PMSchedule = txtPMSchedule.Text.Trim();

        ValidationResult vr = facility_logic.AddUpdateElectricalEquipment(details);
        txtFacilityNum.Text = details.FacNum;
      
        return vr;
    }

    #region Attachment Details

    private void LoadAttachments()
    {
        var list = AttachmentLogic.GetAttachments(ParentFacilitySysID, true);

        gvExtAttachment.DataSource = list;
        gvExtAttachment.DataBind();
    }

    protected void gvExtAttachment_onRowCommand(object sender, GridViewCommandEventArgs e)
    {
        var id = Convert.ToInt32((string)e.CommandArgument);
        if (id <= 0)    // should never happen
            return;

        var attachment = AttachmentLogic.GetAttachment(id, true);
        if (attachment == null)
        {
            Utils.ShowPopUpMsg("Cannot load attachment", this.Page);
            return;
        }

        var deleted = false;
        if (e.CommandName == "Open")
        {
            this.DisplayAttachmentContent(attachment);
        }
        else // if command == delete
        {
            var result = AttachmentLogic.DeleteAttachment(id, true);

            if (result.Success)
            {
                deleted = true;
                Utils.ShowPopUpMsg("Attachment deleted", this.Page);
            }
            else
            {
                Utils.ShowPopUpMsg("Attachment delete error", this.Page);
            }
        }

        if (deleted)
            LoadAttachments();
    }

    private void CtrlAddAttachment_AttachmentSaved(bool result)
    {
        if (result)  // added
        {
            // reload attachment
            LoadAttachments();
        }
        else
    {
            mpeAttachment.Show();
        }
    }

    #endregion
}

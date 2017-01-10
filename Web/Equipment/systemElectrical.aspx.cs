using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIH.CMMS.Inventory.BOL.Facility;
using NIH.CMMS.Inventory.BOL.Common;
using NIH.CMMS.Inventory.Web;
using NIH.CMMS.Inventory.BPL.Facility;
using NIH.CMMS.Inventory.BOL.People;
using System.Data;
using NIH.CMMS.Inventory.BPL.LookUp;
using NIH.CMMS.Inventory.BPL.Common;
using NIH.CMMS.Inventory.Web.Extensions;

public partial class Equipment_systemElectrical : System.Web.UI.Page
{
    protected LoginUser loginUsr;

    public int ElectricalFacilitySysID
    {
        get
        {
            return !string.IsNullOrEmpty(hidFacilitySysid.Value)
                ? Convert.ToInt32(hidFacilitySysid.Value)
                : -1;
        }
    }

    public int ElectricalEquipmentSysID
    {
        get
        {
            return !string.IsNullOrEmpty(hidEquipmentSysID.Value)
                ? Convert.ToInt32(hidEquipmentSysID.Value)
                : -1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        loginUsr = Utils.CheckSession(this);

        ctrlAddFacilityAttachment.ParentSysID = ElectricalFacilitySysID.ToString();
        ctrlAddFacilityAttachment.AttachmentSaved += CtrlAddFacilityAttachment_AttachmentSaved;

        ctrlAddEquipmentAttachment.ParentSysID = ElectricalEquipmentSysID.ToString();
        ctrlAddEquipmentAttachment.AttachmentSaved += CtrlAddEquipmentAttachment_AttachmentSaved;

        if (!Page.IsPostBack)
        {
            //Todo: verify logic
            //if (loginUsr.Role.ToLower() == "msadmin" || loginUsr.Role.ToLower() == "mssuper")
            //{ btnFinish.Visible = true; }
            //else { btnFinish.Visible = false; }

            int facID = 0;
            string facNum = string.Empty;
            string wrNum = string.Empty;
            int equipID = 0;

            DataSet dtSystem = GeneralLookUp.GetEletricalSystemList();
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();

            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

            //load existing facility info if facility id is there
            if (Request.QueryString["ParentFacilitySysID"] != null && !string.IsNullOrEmpty(Request.QueryString["ParentFacilitySysID"].ToString()))
            {
                bool result = Int32.TryParse(Request.QueryString["ParentFacilitySysID"].ToString(), out facID);
                if (result)
                {
                    Session["ParentFacilitySysID"] = Request.QueryString["ParentFacilitySysID"].ToString();
                    hidFacilitySysid.Value = facID.ToString();
                    LoadFacilityInfoByID(facID);
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
                btnSaveFacility.Text = "Update Facility Information";

            }
            else
            {
                Session["ParentFacilitySysID"] = null;
            }

            if (Request.QueryString["facnum"] != null && !string.IsNullOrEmpty(Request.QueryString["facnum"].ToString()))
            {
                facNum = Request.QueryString["facnum"].ToString();
                txtFacilityNum.Text = Request.QueryString["facnum"].ToString();
                LoadFacilityInfoByFacNum(facNum);
            }
            else
            {
                Session["ParentFacilityNum"] = null;
            }

            if (Request.QueryString["wrnum"] != null && !string.IsNullOrEmpty(Request.QueryString["wrnum"].ToString()))
            {
                wrNum = Request.QueryString["wrnum"].ToString();
                LoadFacilityInfoByWRNum(wrNum);
            }
            else if (Request.QueryString["equipID"] != null && !string.IsNullOrEmpty(Request.QueryString["equipID"].ToString()))
            {

                bool result = Int32.TryParse(Request.QueryString["equipID"].ToString(), out equipID);
                if (result)
                {
                    TabContainer1.ActiveTabIndex = 1;
                    LoadEquipmentDetail(equipID, true);
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }


                btnSaveFacility.Text = "Update Facility Information";
            }
            //if no facility info, then bottom nothing
            if (string.IsNullOrEmpty(txtFacilityNum.Text.Trim()))
            {
                btnSaveFacility.Text = "Add New Facility";
                hidFacilitySysid.Value = "-1";
                trFacilityAttachment.Visible = false;
                DetailInfoPanel.Visible = false;
            }
            else
                DetailInfoPanel.Visible = true;

            LoadFacilityAttachments();
        }
    }
    protected void btnSaveFacility_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtFacilityNum.Text))
        {
            //if first time, after saving the tab should be 1
            TabContainer1.ActiveTabIndex = 1;
        }
        else
            TabContainer1.ActiveTabIndex = 0;
        int facID = SaveFacilityDetails(true);
        if (facID > 0)
        {
            lbUpdateFacilityMsg.Text = "Information Saved.";
            drplstBuilding.Enabled = false; // cannot change building info again
            //show component panel if not there yet
            if (!DetailInfoPanel.Visible)
                DetailInfoPanel.Visible = true;
            btnSaveFacility.Text = "Update Facility";
        }
        else
            lbUpdateFacilityMsg.Text = "Information Cannot Be Saved.";

    }
    protected void btnCancelFacility_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SearchResult.aspx");
    }

    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SearchResult.aspx");
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {

        ValidationResult vr = SaveEquipmentDetails();
        if (vr.Success)
        {
            ClearEquipmentDetails();
            gv_Components.DataBind();
            Utils.ShowPopUpMsg("Component Saved!", this.Page);
        }
        else
            Utils.ShowPopUpMsg(vr.Reason, this.Page);

    }


    protected void btnAddComponent_Click(object sender, EventArgs e)
    {
        txtEquipmentID.Text = string.Empty;
        //clear all existing info
        ClearEquipmentDetails();
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        TabContainer1.ActiveTabIndex = 1;
        //if already previous component info exist, delete them
        if (ElectricalEquipmentSysID > 0 && txtEquipmentID.Text != "")
        {
            ClearEquipmentDetails();
        }
            

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Response.Redirect("~/Default.aspx");
    }

    private void LoadFacilityInfoByFacNum(string facNum)
    {
        if (!string.IsNullOrEmpty(facNum))
        {
            FacilityDet detail = facility_logic.GetFacilityDetailsByFacNum(facNum);
            LoadFacilityDetail(detail);
        }
    }

    private void LoadFacilityInfoByWRNum(string wrNum)
    {
        if (!string.IsNullOrEmpty(wrNum))
        {
            FacilityDet detail = facility_logic.GetFacilityDetailsByWRNum(wrNum);
            LoadFacilityDetail(detail);
        }
    }

    private void LoadFacilityInfoByID(int facID)
    {
        if (facID > 0)
        {
            FacilityDet detail = facility_logic.GetFacilityDetails(facID);
            LoadFacilityDetail(detail);
        }

    }

    private void LoadFacilityDetail(FacilityDet existingFac)
    {
        //When load five quipments on this page:
        //if session facnum is not null, then get faclity detail (include equipments if exist any)

        //Facility# is set by tom, at first it is = factemp 

        if (existingFac != null)
        {
            drplstBuilding.Enabled = false;

            #region "Load facility detail"
            drplstSystem.SelectedValue = existingFac.FacSystem;

            drplstBuilding.SelectedValue = existingFac.FacBuilding;
            txtFunction.Text = existingFac.FacFunction;
            txtFloor.Text = existingFac.FacFloor;
            txtLocation.Text = existingFac.FacLocation;
            txtFacilityID.Text = existingFac.FacID;
            txtFacilityNum.Text = existingFac.FacNum;
            hidFacilitySysid.Value = existingFac.Key.ToString();
            Session["ParentFacilityNum"] = existingFac.FacNum;
            if (existingFac.FacNum.StartsWith("T"))
            { txtFacilityNum.BackColor = System.Drawing.Color.Aquamarine; }

            txtWRNum.Text = existingFac.WRNumber;
            ckAAALAC.Checked = (existingFac.YsnAaalac == 1) ? true : false;
            ckBSL.Checked = (existingFac.YsnBsl == 1) ? true : false;
            ckTJC.Checked = (existingFac.YsnTJC == 1) ? true : false;
            txtComments.Text = existingFac.Comment;


            txtInventoryBy.Text = existingFac.InventoryBy;
            if (existingFac.InventoryDate != DateTime.MinValue)
                txtInventoryDate.Text = existingFac.InventoryDate.ToShortDateString();

            //disable the save button if not in active status
            if (existingFac.Status.ToLower() != "active")
            {

                //disable all buttons
                btnFinish.Visible = false;
            }

            //if (existingFac.FacEquipments != null)
            //{

            //    EquipmentDet details = existingFac.FacEquipments[0];
            //    if (details != null)
            //    {
            //        LoadEquipmentDetail(details);

            //    }
            //}
            //else
            //{
            //    #region "Load from facility table only"
            //    //txtEquipmentID1.Text = details.EquipID;
            //    //location is not in facility
            //    txtLocation.Text = existingFac.EquipLocation;
            //    txtTypeUse.Text = existingFac.TypeOrUse;
            //    txtManufacturer.Text = existingFac.Manufacturer;
            //    txtModelNum.Text = existingFac.ModelNo;
            //    txtSerialNum.Text = existingFac.SerialNo;
            //    txtSize.Text = existingFac.Size;

            //    if (existingFac.InstalledDate != DateTime.MinValue)
            //        txtInstalledDate.Text = existingFac.InstalledDate.ToShortDateString();
            //    if (existingFac.MotorInstalledDate != DateTime.MinValue)
            //        txtMotorInstalledDate.Text = existingFac.MotorInstalledDate.ToShortDateString();

            //    txtCapacity.Text = existingFac.Capacity;
            //    txtCapacityHT.Text = existingFac.CapacityHeadTest;
            //    txtFuel.Text = existingFac.FuelRefrigeration;
            //    txtMotorManu.Text = existingFac.MotorManufacturer;
            //    txtHP.Text = existingFac.HP;
            //    txtMotorType.Text = existingFac.MotorType;

            //    txtMotorSerialNum.Text = existingFac.MotorSerialNo;

            //    txtMotorModel.Text = existingFac.MotorModel;
            //    txtFrame.Text = existingFac.Frame;
            //    txtRPM.Text = existingFac.RPM;
            //    txtVoltage.Text = existingFac.Voltage;
            //    txtAmperes.Text = existingFac.Amperes;
            //    txtPhaseCycle.Text = existingFac.PhaseCycle;
            //    txtBSLClass.Text = existingFac.BslClassification;

            //    if (existingFac.TJCValue > 0)
            //    { txtTJC.Text = existingFac.TJCValue.ToString(); }
            //    txtPMSchedule.Text = existingFac.PMSchedule;
            //    #endregion
            //}
            #endregion
        }
        else
        {
            DetailInfoPanel.Visible = false;
        }




    }

    private void LoadEquipmentDetail(int id, bool loadFacInfo)
    {
        EquipmentDet details = facility_logic.GetInvEquipmentDetails(id);

        if (ElectricalFacilitySysID < 0 && !string.IsNullOrEmpty(details.ParentFacilityNum))
        {         
            txtFacilityNum.Text = details.ParentFacilityNum.ToString();
            LoadFacilityInfoByFacNum(details.ParentFacilityNum);
        }

        #region "Load the first equipment"
        hidEquipmentSysID.Value = details.Key.ToString();
        txtEquipmentID.Text = details.EquipID;
        //location is not in facility
        txtComLocation.Text = details.EquipLocation;
        txtTypeUse.Text = details.TypeOrUse;
        txtManufacturer.Text = details.Manufacturer;
        txtModelNum.Text = details.ModelNo;
        txtSerialNum.Text = details.SerialNo;
        txtSize.Text = details.Size;

        if (details.InstalledDate != DateTime.MinValue)
            txtInstalledDate.Text = details.InstalledDate.ToShortDateString();

        txtElectricalOther.Text = details.ElectricalOther;

        txtInventoryBy.Text = details.InventoryBy;
        if (details.InventoryDate != DateTime.MinValue)
            txtInventoryDate.Text = details.InventoryDate.ToShortDateString();

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

        //if (loadFacInfo)
        //    LoadFacilityInfoByFacNum(details.ParentFacilityNum);
        #endregion

        LoadEquipmentAttachments(ElectricalEquipmentSysID);
    }
    private ValidationResult SaveEquipmentDetails()
    {
        if (!string.IsNullOrEmpty(txtFacilityNum.Text.ToString()))
        {
            EquipmentDet details = new EquipmentDet();
            //if (id > 0)
            //    details = facility_logic.GetInvEquipmentDetails(id);

            details.ParentFacilityNum = txtFacilityNum.Text.ToString();
            //   details.EquipSequenceNum = PageNumber * 5 + seqNo;
            if (loginUsr != null)
                details.UserName = loginUsr.LaborName;
            else
            { loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_USEROBJLOGINDET]; }
            if (!string.IsNullOrEmpty(txtEquipmentID.Text.Trim()))
            {
                //??? how to update existing equipment? use hiddenID fields for those 
                //allow delete equipment, auto shift forward?
                //column header delete image

                #region save Equipment One"
                details.Key = Convert.ToInt32(hidEquipmentSysID.Value);
                details.EquipID = txtEquipmentID.Text.Trim();
                //location is not in facility
                details.EquipLocation = txtComLocation.Text.Trim();
                details.TypeOrUse = txtTypeUse.Text.Trim();
                details.Manufacturer = txtManufacturer.Text.Trim();
                details.ModelNo = txtModelNum.Text.Trim();
                details.SerialNo = txtSerialNum.Text.Trim();
                details.Size = txtSize.Text.Trim();
                if (!string.IsNullOrEmpty(txtInstalledDate.Text.Trim()))
                    details.InstalledDate = Convert.ToDateTime(txtInstalledDate.Text.Trim());

                details.Volts = txtVolts.Text.Trim();
                details.AMP = txtAMP.Text.Trim();
                details.KVA = txtKVA.Text.Trim();

                details.VoltsPrimary = txtVoltsPrimary.Text.Trim();
                details.VoltsSecondary = txtVoltsSecondary.Text.Trim();
                details.PH = txtPH.Text.Trim();
                details.W = txtW.Text.Trim();
                details.CktsNum = txtCKTSNum.Text.Trim();
                details.CktsUsed = txtCKTSUsed.Text.Trim();



                if (!string.IsNullOrEmpty(txtInventoryDate.Text.Trim()))
                    details.InventoryDate = Convert.ToDateTime(txtInventoryDate.Text.Trim());

                details.ElectricalOther = txtElectricalOther.Text.Trim();
                details.InventoryBy = txtInventoryBy.Text.Trim();

                details.BslClassification = txtBSLClass.Text.Trim();
                if (!string.IsNullOrEmpty(txtTJC.Text.Trim()))
                    details.TJCValue = Convert.ToInt32(txtTJC.Text.Trim());
                details.PMSchedule = txtPMSchedule.Text.Trim();


                return facility_logic.AddUpdateElectricalComponent(details);

                #endregion
            }
            else
                return new ValidationResult(false, "No equipment saved.");

        }
        else
            return new ValidationResult(false, "No equipment saved.");

    }

    private int SaveFacilityDetails(bool hasFullInfo)
    {
        FacilityDet details = new FacilityDet();
        if (Session["ParentFacilitySysID"] != null)
        {
            details.Key = Convert.ToInt32(Session["ParentFacilitySysID"].ToString());

        }
        if (Session["ParentFacilityNum"] != null)
        {
            details.FacNum = Session["ParentFacilityNum"].ToString();

        }

        //if @Building is null or @System is null or @FacilityLocation is null or @FacilityID is null
        if (string.IsNullOrEmpty(drplstBuilding.SelectedValue) || string.IsNullOrEmpty(drplstSystem.SelectedValue) || string.IsNullOrEmpty(txtFacilityID.Text.Trim()) || string.IsNullOrEmpty(txtLocation.Text.Trim()))
        {
            Utils.ShowPopUpMsg("Facility ID, System, Building and Location are required.", this);
            details.Key = -1;
        }
        else
        {
            if (!string.IsNullOrEmpty(txtFacilityNum.Text))
                details.FacNum = txtFacilityNum.Text;
            details.FacSystem = drplstSystem.SelectedValue;
            details.FacFunction = txtFunction.Text.Trim();
            details.FacBuilding = drplstBuilding.SelectedValue;
            details.FacFloor = txtFloor.Text.Trim();
            details.FacLocation = txtLocation.Text.Trim();
            details.FacID = txtFacilityID.Text.Trim();
            details.WRNumber = txtWRNum.Text.Trim();
            details.YsnAaalac = ckAAALAC.Checked ? 1 : 0;
            details.YsnBsl = ckBSL.Checked ? 1 : 0;
            details.YsnTJC = ckTJC.Checked ? 1 : 0;
            details.Comment = txtComments.Text.Trim();
            if (loginUsr == null)
                loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_USEROBJLOGINDET];
            else
                details.UserName = loginUsr.LaborName;
            if (!string.IsNullOrEmpty(txtInventoryDate.Text.Trim()))
                details.InventoryDate = Convert.ToDateTime(txtInventoryDate.Text.Trim());


            details.InventoryBy = txtInventoryBy.Text.Trim();

            ValidationResult vr = new ValidationResult(true, string.Empty);
            if (details.Key > 0)
                vr = facility_logic.UpdateElectricalMechanicalSystem(details);
            else
                vr = facility_logic.AddElectricalMechanicalSystem(details, true);
            if (details.Key > 0 && vr.Success)
            {
                Session["ParentFacilityNum"] = details.FacNum;
                txtFacilityNum.Text = details.FacNum;
                Session["ParentFacilitySysID"] = details.Key.ToString();
                txtFacilityID.Text = details.Key.ToString();
                trFacilityAttachment.Visible = true;
            }
            else
            {
                Utils.ShowPopUpMsg("Error Occurred. Cannot save facility. " + vr.Reason, this.Page);
                return -1;
            }
            //if (hasFullInfo)
            //    {
            //        #region save new and save a one facility
            //        details.EquipID = string.Empty;
            //        details.TypeOrUse = txtTypeUse.Text.Trim();
            //        details.Manufacturer = txtManufacturer.Text.Trim();
            //        details.ModelNo = txtModelNum.Text.Trim();
            //        details.SerialNo = txtSerialNum.Text.Trim();
            //        details.Size = txtSize.Text.Trim();
            //        if (!string.IsNullOrEmpty(txtInstalledDate.Text.Trim()))
            //            details.InstalledDate = Convert.ToDateTime(txtInstalledDate.Text.Trim());
            //        details.Capacity = txtCapacity.Text.Trim();
            //        details.CapacityHeadTest = txtCapacityHT.Text.Trim();
            //        details.FuelRefrigeration = txtFuel.Text.Trim();
            //        details.MotorManufacturer = txtMotorManu.Text.Trim();
            //        details.HP = txtHP.Text.Trim();
            //        details.MotorType = txtMotorType.Text.Trim();

            //        details.MotorSerialNo = txtMotorSerialNum.Text.Trim();
            //        if (!string.IsNullOrEmpty(txtMotorInstalledDate.Text.Trim()))
            //            details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate.Text.Trim());
            //        details.MotorModel = txtMotorModel.Text.Trim();
            //        details.Frame = txtFrame.Text.Trim();
            //        details.RPM = txtRPM.Text.Trim();
            //        details.Voltage = txtVoltage.Text.Trim();
            //        details.Amperes = txtAmperes.Text.Trim();
            //        details.PhaseCycle = txtPhaseCycle.Text.Trim();
            //        details.BslClassification = txtBSLClass.Text.Trim();
            //        if (!string.IsNullOrEmpty(txtTJC.Text.Trim()))
            //            details.TJCValue = Convert.ToInt32(txtTJC.Text.Trim());
            //        details.PMSchedule = txtPMSchedule.Text.Trim();

            //        vr = facility_logic.UpdateFacility(details, true);
            //        #endregion
            //    }
            //    else
            //    {
            //        #region save as parent
            //        details.EquipID = "-1";
            //        vr = facility_logic.UpdateFacility(details, false);
            //        #endregion
            //    }

            //    if (details.Key > 0 && vr.Success)
            //    {
            //        Session["ParentFacilityNum"] = details.FacNum;
            //        Session["ParentFacilitySysID"] = details.Key.ToString();
            //    }
            //    else { Utils.ShowPopUpMsg("Error Occurred. Cannot save facility. " + vr.Reason, this.Page); }
            //}

        }


        return details.Key;
    }

    private void ClearEquipmentDetails()
    {
        //switch (seqNo)
        //{
        //    case 1:
        #region delete Equipment One"
        hidEquipmentSysID.Value = "-1";
        txtEquipmentID.Text = string.Empty;
        txtComLocation.Text = string.Empty;
        txtTypeUse.Text = string.Empty;
        txtManufacturer.Text = string.Empty;
        txtModelNum.Text = string.Empty;
        txtSerialNum.Text = string.Empty;
        txtSize.Text = string.Empty;
        txtInstalledDate.Text = string.Empty;
        //txtCapacity.Text = string.Empty;
        //txtCapacityHT.Text = string.Empty;
        //txtFuel.Text = string.Empty;
        //txtMotorManu.Text = string.Empty;
        //txtHP.Text = string.Empty;
        //txtMotorType.Text = string.Empty;
        //txtMotorSerialNum.Text = string.Empty;
        //txtMotorInstalledDate.Text = string.Empty;
        //txtMotorModel.Text = string.Empty;
        //txtFrame.Text = string.Empty;
        //txtRPM.Text = string.Empty;
        //txtVoltage.Text = string.Empty;
        //txtAmperes.Text = string.Empty;
        //txtPhaseCycle.Text = string.Empty;
        txtElectricalOther.Text = string.Empty;
        txtVolts.Text = string.Empty;
        txtAMP.Text = string.Empty;
        txtKVA.Text = string.Empty;
        txtVoltsPrimary.Text = string.Empty;
        txtVoltsSecondary.Text = string.Empty;
        txtPH.Text = string.Empty;
        txtW.Text = string.Empty;
        txtCKTSNum.Text = string.Empty;
        txtCKTSUsed.Text = string.Empty;

        txtBSLClass.Text = string.Empty;
        txtTJC.Text = string.Empty;
        txtPMSchedule.Text = string.Empty;
        #endregion

        // clear attachments
        trAttachment.Visible = false;
    }

    protected void gv_Components_OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //System.Web.UI.HtmlControls.HtmlImage imgIsInfoWebUser = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("imgIsInfoWebUser");


            //if (DataBinder.Eval(e.Row.DataItem, "InfoWebPersonEmployeeID") != null && DataBinder.Eval(e.Row.DataItem, "InfoWebPersonEmployeeID").ToString() != "")
            //    imgIsInfoWebUser.Visible = true;

            //else
            //    imgIsInfoWebUser.Visible = false;
        }
    }
    protected void gv_Components_onRowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Deleting")
        {
            int Id = Convert.ToInt32(e.CommandArgument.ToString());
            ValidationResult vr = facility_logic.DeactivateInvEquipment(Id, loginUsr.LaborName);

            if (vr.Success)
            {
                //repopulate the list
                gv_Components.DataBind();

            }
        }
        else if (e.CommandName == "Editing")
        {
            int Id = Convert.ToInt32(e.CommandArgument.ToString());
            //switch tab to component detail and show component info
            TabContainer1.ActiveTabIndex = 1;

            LoadEquipmentDetail(Id, false);

        }
    }

    #region Equipment Attachment Details

    private void LoadEquipmentAttachments(int equipmentSysId)
    {
        var list = equipmentSysId > 0 ? AttachmentLogic.GetAttachments(equipmentSysId, true) : null;
        gvExtAttachment.DataSource = list;
        gvExtAttachment.DataBind();

        trAttachment.Visible = true;
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
            LoadEquipmentAttachments(ElectricalEquipmentSysID);
    }

    private void CtrlAddEquipmentAttachment_AttachmentSaved(bool result)
    {
        if (result)  // added
        {
            // reload attachment
            LoadEquipmentAttachments(ElectricalEquipmentSysID);
        }
        else
        {
            mpeAttachment.Show();
        }
    }

    #endregion

    #region Facility Attachment Details

    private void LoadFacilityAttachments()
    {
        var list = AttachmentLogic.GetAttachments(ElectricalFacilitySysID, false);

        gvExtFacilityAttachment.DataSource = list;
        gvExtFacilityAttachment.DataBind();
    }

    protected void gvExtFacilityAttachment_onRowCommand(object sender, GridViewCommandEventArgs e)
    {
        var id = Convert.ToInt32((string)e.CommandArgument);
        if (id <= 0)    // should never happen
            return;

        var attachment = AttachmentLogic.GetAttachment(id, false);
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
            var result = AttachmentLogic.DeleteAttachment(id, false);

            if (result.Success)
            {
                deleted = true;
                Utils.ShowPopUpMsg("Facility Attachment deleted", this.Page);
            }
            else
            {
                Utils.ShowPopUpMsg("Facility Attachment delete error", this.Page);
            }
        }

        if (deleted)
            LoadFacilityAttachments();
    }

    private void CtrlAddFacilityAttachment_AttachmentSaved(bool result)
    {
        if (result)  // added
        {
            // reload attachment
            LoadFacilityAttachments();
        }
        else
        {
            mpeFacilityAttachment.Show();
        }
    }

    #endregion


    //#region " Attachment/Photos Section -- event handling "
    //public bool SaveData(int incidentId)
    //{
    //    bool savres = false;

    //    // Get the name of the file to upload.      
    //    String fileName = Server.HtmlEncode(fuFacFileUpload.FileName);

    //    // Get the extension of the uploaded file.
    //    string extension = System.IO.Path.GetExtension(fileName).ToLower();

    //    String fileTitle = txtFacAttTitle.Text.Trim();

    //    //since filename is readonly, so retrieve it from hidden value
    //    //or use fu1.Attributes["FileName"] = ful.FullName;
    //    if (txtHidFacAttID.Text != "-1" && fileName == "")
    //    { fileName = txtHidFacAttFileName.Text; }

    //    //both file name and Title are reqried
    //    if (fileName != "" & fileTitle != "")
    //    {
    //        #region "Create Attachement Oject and Save."

    //        // Specify the path on the server to save the uploaded file to.
    //        Attachment attDetail = new Attachment();
    //        if (txtHidFacAttID.Text != "-1")
    //        {
    //            //if it is an update, need to delete old one and insert new one
    //            //attDetail = facility_logic.GetAttachment(Convert.ToInt32(txtHidFacAttID.Text));
    //        }
    //        else { attDetail = new Attachment(); }
    //        if (attDetail != null)
    //        {
    //            //common things to update
    //            attDetail.CreatedBy = loginUsr.LaborName;
    //            attDetail.InvFacID = txtFacilityID.Text.Trim();
    //            attDetail.Title = fileTitle;
    //            attDetail.UpdatedBy = Page.User.Identity.Name;

    //            if (txtHidFacAttID.Text != "-1" && fuFacFileUpload.FileName == string.Empty)
    //            {
    //                //if only update the Title, no need to save file          

    //            }
    //            else
    //            {
    //                //if it is new attachment or Update to a new attachment
    //                Stream fs = fuFacFileUpload.PostedFile.InputStream;
    //                BinaryReader br = new BinaryReader(fs);
    //                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

    //                attDetail.FileData = bytes;
    //                attDetail.FileName = fileName;

    //                #region "Save File"
    //                //if (!Utils.IsAllowedExtension(extension))
    //                //{
    //                //    lblValidationError.Visible = true;
    //                //    lblValidationError.Text = "Attachments acceptable file types are .DOC(X), .WPD, .XLS(X), .PDF, .JPG, .GIF, .VSD and .PPT(X). Please check your file extension.";
    //                //    return false;
    //                //}
    //                //else if (fuFacFileUpload.PostedFile.ContentLength > 10485760)
    //                //{
    //                //    lblValidationError.Visible = true;
    //                //    lblValidationError.Text = "Attachments cannot be greater than 10MB. Please upload another attachment and try again.";
    //                //    return false;
    //                //}
    //                //else
    //                //{
    //                //if (txtHidFacAttID.Text != "-1")
    //                //{
    //                //    //if it is an update to Title and File, need to delete old one and insert new one
    //                //    //System.IO.File.Delete(savePath + attDetail.FileLocation);
    //                //}
    //                //try
    //                //{
    //                //    fuEleFileUpload.SaveAs(savePath);
    //                //}
    //                //catch // if upload file failed.
    //                //{
    //                //    //Utils.ShowPopUpMsg("Error Occurred!", this);
    //                //    lblValidationError.Visible = true;
    //                //    lblValidationError.Text = "Error Occurred!";
    //                //    //if file deleted and it is an update, need to delete that database record also
    //                //    if (txtHidAttID.Text != "-1")
    //                //    { IncAttachmentLogic.DeleteAttachment(attDetail); }
    //                //    return false;

    //                //}
    //                //}

    //                #endregion
    //            }

    //            // Call the SaveAs method to save the uploaded file to the specified path. 
    //            //if the file fize is greater than 10MB throw an error.
    //            ValidationResult res = facility_logic.UpdateFacAttachment(attDetail);
    //            if (res.Success)
    //            {//show successs msg
    //                // Utils.ShowPopUpMsg("Attachment saved!", this);
    //                lblFacValidationError.Visible = true;
    //                savres = true;
    //                lblFacValidationError.Text = "Attachment saved.";
    //            }
    //            else
    //            {
    //                //Utils.ShowPopUpMsg("Error Occurred!", this);
    //                lblFacValidationError.Visible = true;
    //                lblFacValidationError.Text = "Error Occurred.";
    //            }
    //        }
    //        else
    //        {
    //            //attDetail is null
    //            lblFacValidationError.Visible = true;
    //            lblFacValidationError.Text = "Error Occurred.";
    //        }
    //        #endregion
    //    }
    //    else if (fileName != "" && fileTitle == "")
    //    {
    //        lblFacValidationError.Visible = true;
    //        lblFacValidationError.Text = "Please enter attachment title.";
    //    }
    //    else if (fileName == "" && fileTitle != "")
    //    {     //if no file name or title
    //        lblFacValidationError.Visible = true;
    //        lblFacValidationError.Text = "Please upload a file.";
    //    }

    //    return savres;
    //}
    ///// <summary>
    ///// Handles the onRowCommand event of the gvExtAttachment control.
    ///// </summary>
    ///// <param name="sender">The source of the event.</param>
    ///// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewCommandEventArgs"/> instance containing the event data.</param>
    //protected void gvExtFacAttachment_onRowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    //IncidentAttachments incAtt = IncAttachmentLogic.GetAttachment(Convert.ToInt32(e.CommandArgument.ToString()));

    //    //if (incAtt != null)
    //    //{
    //    //    if (e.CommandName == "Editing")
    //    //    {
    //    //        #region "show existing attachment information"
    //    //        txtHidAttID.Text = incAtt.Key.ToString();
    //    //        rlElePoliceRpt.SelectedValue = incAtt.ReportFiled.ToString();
    //    //        // drplstEleAttaCatagory.SelectedValue = incAtt.FileType;
    //    //        //fuEleFileUpload.FileName is readonly;
    //    //        txtEleAttTitle.Text = incAtt.Title;
    //    //        txtHidAttFileName.Visible = true;
    //    //        lbHidExistFile.Visible = true;
    //    //        txtHidAttFileName.Text = incAtt.OriginalFileName;
    //    //        #endregion
    //    //    }
    //    //    else // if command == delete
    //    //    {
    //    //        #region "Delete attachment using attachment object"
    //    //        String result = IncAttachmentLogic.DeleteAttachment(incAtt);

    //    //        if (result == ApplicationConstants.NO_ERROR_USP_EXECUTION)
    //    //        {
    //    //            //Physically delete the file
    //    //            //File.Delete(PATH + incAtt.FileLocation);
    //    //            //repopulate the existing initiator list
    //    //            ShowExtAttachment();
    //    //            //clean up the values if there is any
    //    //            //drplstEleAttaCatagory.SelectedIndex = 0;
    //    //            ClearFields();

    //    //        }
    //    //        else
    //    //        {
    //    //            //handle error
    //    //            WebUtils.ShowPopUpMsg("Cannot delete attachment.", this.Page);
    //    //        }
    //    //        #endregion
    //    //    }
    //    //}
    //    //else
    //    //{
    //    //    //handle error
    //    //    WebUtils.ShowPopUpMsg("Error. No attachment found.", this.Page);
    //    //}

    //    //if (ModalExtender != null) ModalExtender.Show();
    //}

    ///// <summary>
    ///// Handles the Click event of the btnAddAnother control, add another attachment
    ///// </summary>
    ///// <param name="sender">The source of the event.</param>
    ///// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    //public void btnAddAnother_Click(object sender, EventArgs e)
    //{
    //    //// Get the name of the file to upload.
    //    //String fileName = fuEleFileUpload.FileName;
    //    //String fileTitle = txtEleAttTitle.Text.Trim();

    //    ////since filename is readonly, so retrieve it from hidden value
    //    ////or use fu1.Attributes["FileName"] = ful.FullName;
    //    //if (txtHidAttID.Text != "-1" && fileName == "")
    //    //{ fileName = txtHidAttFileName.Text; }

    //    //if (fileName != "" & fileTitle != "")
    //    //{
    //    //    SaveData(this.INCID);
    //    //    ShowExtAttachment();
    //    //    ClearFields();
    //    //}
    //    //else
    //    //{
    //    //    lbAddAttachmentError.Visible = true;
    //    //    lbAddAttachmentError.Text = "Please select an Attachment before attempting to add another.";
    //    //}

    //    //if (ModalExtender != null) ModalExtender.Show();
    //}


    //#endregion
}
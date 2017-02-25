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
using NIH.CMMS.Inventory.BPL.Common;
using NIH.CMMS.Inventory.BPL.LookUp;
using NIH.CMMS.Inventory.Web.Extensions;

public partial class Equipment_equipMechanical : System.Web.UI.Page
{
    protected LoginUser loginUsr;

    public int MechanicalEquipmentSysID
    {      
        get
        {
            return !string.IsNullOrEmpty(hidFacSystemID.Value)
                ? Convert.ToInt32(hidFacSystemID.Value)
                : -1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        loginUsr = Utils.CheckSession(this);
 
        // initialize attachment control
        ctrlAddAttachment.ParentSysID = !string.IsNullOrEmpty(hidFacSystemID.Value) ? hidFacSystemID.Value : "-1";
        ctrlAddAttachment.AttachmentSaved += CtrlAddAttachment_AttachmentSaved;

        if (!Page.IsPostBack)
        {            
            DataSet dtSystem = GeneralLookUp.GetSystemList("Mechanical Equipment"); //spn_Inv_GetSystemList_newsite
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();
            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

            if (Request.QueryString["ParentFacilitySysID"] != null && !string.IsNullOrEmpty(Request.QueryString["ParentFacilitySysID"].ToString()))
            {
                int facID;
                bool result = Int32.TryParse(Request.QueryString["ParentFacilitySysID"].ToString(), out facID);
                if (result)
                {
                    hidFacSystemID.Value = facID.ToString();                  
                    btnSaveFacility.Text = "Save Equipment";
                    LoadFacilityInfo();
                    trAttachment.Visible = true;
                    drplstBuilding.Enabled = false;
                    txtFacilityNum.Enabled = false;
                    btnAddNew.Visible = true;
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }              

            }
            else
            {
                trAttachment.Visible = false;
                drplstBuilding.Enabled = true;
                txtFacilityNum.Enabled = true;
                btnSaveFacility.Text = "Add Equipment";
                btnAddNew.Visible = false;

            }

            if (HttpContext.Current.Session["SearchReportSearchCriteria"] != null && SearchCriteria.Instance != null)
            {
                btnBackToList.Visible = true;
            }
            else
                btnBackToList.Visible = false;
            
        }
    }

    protected void btnSaveFacility_Click(object sender, EventArgs e)
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
 

    private void LoadFacilityInfo()
    {
        if (MechanicalEquipmentSysID < 0) return;

        var details = facility_logic.GetFacilityDetails(MechanicalEquipmentSysID);
        LoadFacilityDetail(details);

        LoadAttachments();
    }

    private void LoadFacilityDetail(FacilityDet existingFac)
    {

        if (existingFac != null)
        {
            #region "Load facility detail"
            drplstSystem.SelectedValue = existingFac.FacSystem;
            drplstBuilding.SelectedValue = existingFac.FacBuilding;
            txtFunction.Text = existingFac.FacFunction;
            txtFloor.Text = existingFac.FacFloor;
            txtLocation.Text = existingFac.FacLocation;
            txtFacilityID.Text = existingFac.FacID;
            txtFacilityNum.Text = existingFac.FacNum;
          //  Session["ParentFacilityNum"] = existingFac.FacNum;
            if (existingFac.FacNum.StartsWith("T"))
            { txtFacilityNum.BackColor = System.Drawing.Color.Aquamarine; }

            txtWRNum.Text = existingFac.WRNumber;
            ckAAALAC.Checked = (existingFac.YsnAaalac == 1) ? true : false;
            ckBSL.Checked = (existingFac.YsnBsl == 1) ? true : false;
            ckTJC.Checked = (existingFac.YsnTJC == 1) ? true : false;
            txtComments.Text = existingFac.Comment;

            //disable the save button if not in active status
            if (existingFac.Status.ToLower() != "active")
            {
                //disable all buttons
                btnSaveFacility.Visible = false;
            }

            #region "Load from facility table only"
            //txtEquipmentID1.Text = details.EquipID;
            //location is not in facility
            //txtComLocation.Text = existingFac.EquipLocation;
            //txtTypeUse.Text = existingFac.TypeOrUse;
            txtManufacturer.Text = existingFac.Manufacturer;
            txtModelNum.Text = existingFac.ModelNo;
            txtSerialNum.Text = existingFac.SerialNo;
            txtSize.Text = existingFac.Size;

            if (existingFac.InstalledDate != DateTime.MinValue)
                txtInstalledDate.Text = existingFac.InstalledDate.ToShortDateString();
            if (existingFac.MotorInstalledDate != DateTime.MinValue)
                txtMotorInstalledDate.Text = existingFac.MotorInstalledDate.ToShortDateString();

            txtCapacity.Text = existingFac.Capacity;
            txtCapacityHT.Text = existingFac.CapacityHeadTest;
            txtFuel.Text = existingFac.FuelRefrigeration;
            txtMotorManu.Text = existingFac.MotorManufacturer;
            txtHP.Text = existingFac.HP;
            txtMotorType.Text = existingFac.MotorType;

            txtMotorSerialNum.Text = existingFac.MotorSerialNo;

            txtMotorModel.Text = existingFac.MotorModel;
            txtFrame.Text = existingFac.Frame;
            txtRPM.Text = existingFac.RPM;
            txtVoltage.Text = existingFac.Voltage;
            txtAmperes.Text = existingFac.Amperes;
            txtPhaseCycle.Text = existingFac.PhaseCycle;
            txtBSLClass.Text = existingFac.BslClassification;

            txtInventoryBy.Text = existingFac.InventoryBy;
            if (existingFac.InventoryDate != DateTime.MinValue)
                txtInventoryDate.Text = existingFac.InventoryDate.ToShortDateString();


            if (existingFac.TJCValue > 0)
            { txtTJC.Text = existingFac.TJCValue.ToString(); }
            txtPMSchedule.Text = existingFac.PMSchedule;
            #endregion

            #endregion
        }


    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        if (MechanicalEquipmentSysID >= 0)
        {
            LoadFacilityInfo();
        }
        else
        {
            ClearData();
        }
    }

    private ValidationResult SaveFacilityDetails()
    {
        FacilityDet details = new FacilityDet();
        details.Key = MechanicalEquipmentSysID;
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
            // details.TypeOrUse = txtTypeUse.Text.Trim();
            details.Manufacturer = txtManufacturer.Text.Trim();
            details.ModelNo = txtModelNum.Text.Trim();
            details.SerialNo = txtSerialNum.Text.Trim();
            details.Size = txtSize.Text.Trim();
            if (!string.IsNullOrEmpty(txtInstalledDate.Text.Trim()))
                details.InstalledDate = Convert.ToDateTime(txtInstalledDate.Text.Trim());
            details.Capacity = txtCapacity.Text.Trim();
            details.CapacityHeadTest = txtCapacityHT.Text.Trim();
            details.FuelRefrigeration = txtFuel.Text.Trim();
            details.MotorManufacturer = txtMotorManu.Text.Trim();
            details.HP = txtHP.Text.Trim();
            details.MotorType = txtMotorType.Text.Trim();

            details.MotorSerialNo = txtMotorSerialNum.Text.Trim();
            if (!string.IsNullOrEmpty(txtMotorInstalledDate.Text.Trim()))
                details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate.Text.Trim());
            details.MotorModel = txtMotorModel.Text.Trim();
            details.Frame = txtFrame.Text.Trim();
            details.RPM = txtRPM.Text.Trim();
            details.Voltage = txtVoltage.Text.Trim();
            details.Amperes = txtAmperes.Text.Trim();
            details.PhaseCycle = txtPhaseCycle.Text.Trim();
            details.BslClassification = txtBSLClass.Text.Trim();
            if (!string.IsNullOrEmpty(txtTJC.Text.Trim()))
                details.TJCValue = Convert.ToInt32(txtTJC.Text.Trim());
            details.PMSchedule = txtPMSchedule.Text.Trim();
        if (!string.IsNullOrEmpty(txtInventoryDate.Text.Trim()))
            details.InventoryDate = Convert.ToDateTime(txtInventoryDate.Text.Trim());

       
        details.InventoryBy = txtInventoryBy.Text.Trim();

        //ValidationResult vr = facility_logic.UpdateFacility(details, false);

        ValidationResult vr = facility_logic.AddUpdateMechanicalEquipment(details);
        
            if (details.Key > 0 && vr.Success)
            {               
                txtFacilityNum.Text = details.FacNum;
                hidFacSystemID.Value = details.Key.ToString();
                btnAddNew.Visible = true;

            }
            return vr;


       
    }
    protected void btnBackToList_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["SearchReportSearchCriteria"] != null)
        {
            Response.Redirect("/SearchResult.aspx");
        }

    }
    private void ClearData()
    {
        hidFacSystemID.Value = "-1";
        txtFacilityNum.Text = string.Empty;
        drplstSystem.SelectedIndex = -1;
        txtFunction.Text = string.Empty;
        drplstBuilding.SelectedIndex = -1;
        drplstBuilding.Enabled = true;
        txtFloor.Text = string.Empty;
        txtLocation.Text = string.Empty;
        txtWRNum.Text = string.Empty;
        ckAAALAC.Checked = false;
        ckBSL.Checked = false;
        ckTJC.Checked = false;
        txtComments.Text = string.Empty;
        txtFacilityID.Text = string.Empty;

        txtModelNum.Text = string.Empty;
        txtSize.Text = string.Empty;
        txtSerialNum.Text = string.Empty;
        txtInstalledDate.Text = string.Empty;

        //txtTypeOrUse.Text = string.Empty;
        txtCapacity.Text = string.Empty;
        txtCapacityHT.Text = string.Empty;
        txtFuel.Text = string.Empty;
        txtMotorManu.Text = string.Empty;
        txtHP.Text = string.Empty;
        txtMotorType.Text = string.Empty;

        txtMotorSerialNum.Text = string.Empty;
        txtMotorInstalledDate.Text = string.Empty;
        txtMotorModel.Text = string.Empty;
        txtFrame.Text = string.Empty;
        txtRPM.Text = string.Empty;
        txtVoltage.Text = string.Empty;
        txtAmperes.Text = string.Empty;
        txtPhaseCycle.Text = string.Empty;
        txtBSLClass.Text = string.Empty;
        txtTJC.Text = string.Empty;
        txtPMSchedule.Text = string.Empty;
        txtInventoryBy.Text = string.Empty;
        txtInventoryDate.Text = string.Empty;
        trAttachment.Visible = false;
        txtManufacturer.Text = string.Empty;
        btnSaveFacility.Text = "Add Equipment";

        btnAddNew.Visible = false;
    }

    #region Attachment Details

    private void LoadAttachments()
    {
        var list = AttachmentLogic.GetAttachments(MechanicalEquipmentSysID, false);

        gvExtAttachment.DataSource = list;
        gvExtAttachment.DataBind();
    }

    protected void gvExtAttachment_onRowCommand(object sender, GridViewCommandEventArgs e)
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
  

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        ClearData();


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

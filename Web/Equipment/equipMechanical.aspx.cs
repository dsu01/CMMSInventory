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

public partial class Equipment_equipMechanical : System.Web.UI.Page
{
    protected LoginUser loginUsr;
    protected void Page_Load(object sender, EventArgs e)
    {
        loginUsr = Utils.CheckSession(this);
        if (!Page.IsPostBack)
        {
            int facID = 0;

            DataSet dtSystem = GeneralLookUp.GetMechanicalSystemList();
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
                    btnSaveFacility.Text = "Update Facility";
                    LoadFacilityInfoByID(facID);
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

            }

        }
    }

    protected void btnSaveFacility_Click(object sender, EventArgs e)
    {

        int facID = SaveFacilityDetails(false);
        if (facID > 0)
        {
            //show system generated fac num
        }


    }
    protected void btnCancelFacility_Click(object sender, EventArgs e)
    {
        // Response.Redirect("~/Default.aspx");
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
            Session["ParentFacilityNum"] = existingFac.FacNum;
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
                //btnFinish.Visible = false;
            }

            #region "Load from facility table only"
            //txtEquipmentID1.Text = details.EquipID;
            //location is not in facility
            txtLocation.Text = existingFac.EquipLocation;
            txtTypeUse.Text = existingFac.TypeOrUse;
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

            if (existingFac.TJCValue > 0)
            { txtTJC.Text = existingFac.TJCValue.ToString(); }
            txtPMSchedule.Text = existingFac.PMSchedule;
            #endregion

            #endregion
        }


    }

    private int SaveFacilityDetails(bool hasFullInfo)
    {
        FacilityDet details = new FacilityDet();
        if (!string.IsNullOrEmpty(Session["ParentFacilitySysID"].ToString()))
        {
            details.Key = Convert.ToInt32(Session["ParentFacilitySysID"].ToString());

        }
        if (!string.IsNullOrEmpty(Session["ParentFacilityNum"].ToString()))
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
            ValidationResult vr = facility_logic.UpdateFacility(details, false);
            if (details.Key > 0 && vr.Success)
            {
                Session["ParentFacilityNum"] = details.FacNum;
                txtFacilityNum.Text = details.FacNum;
                Session["ParentFacilitySysID"] = details.Key.ToString();
                txtFacilityID.Text = details.Key.ToString();
            }
            else { Utils.ShowPopUpMsg("Error Occurred. Cannot save facility. " + vr.Reason, this.Page); }

            #region save new and save a one facility
            details.EquipID = string.Empty;//that way is saving to facility table
            details.TypeOrUse = txtTypeUse.Text.Trim();
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

            vr = facility_logic.UpdateFacility(details, true);
            #endregion


        }


        return details.Key;
    }

}
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

public partial class Equipment_equipMechanicalNew : System.Web.UI.Page
{
    protected LoginUser loginUsr;
    protected void Page_Load(object sender, EventArgs e)
    {
        loginUsr = Utils.CheckSession(this);
        if (!Page.IsPostBack)
        {
            //Todo: verify logic
            if (loginUsr.Role.ToLower() == "msadmin" || loginUsr.Role.ToLower() == "mssuper")
            { btnFinish.Visible = true; }
            else { btnFinish.Visible = false; }

            DataSet dtSystem = GeneralLookUp.GetMechanicalSystemList();
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();
            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

            //load existing facility info if facility id is there
            if (Request.QueryString["ParentFacilitySysID"] != null && !string.IsNullOrEmpty(Request.QueryString["ParentFacilitySysID"].ToString()))
            {
                int facID = 0;
                bool result = Int32.TryParse(Request.QueryString["ParentFacilitySysID"].ToString(), out facID);
                if (result)
                {
                    Session["ParentFacilitySysID"] = Request.QueryString["ParentFacilitySysID"].ToString();
                    LoadFacilityInfo(facID);
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

            }           

        }
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
       
        ValidationResult vr = SaveEquipmentDetails();
        Utils.ShowPopUpMsg(vr.Reason, this.Page);
                  
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
       // Response.Redirect("~/Default.aspx");
    }

    private void LoadFacilityInfo(int facID)
    {
        //When load five quipments on this page:
        //if session facnum is not null, then get faclity detail (include equipments if exist any)

        //Facility# is set by tom, at first it is = factemp 
        if (facID > 0)
        {
            FacilityDet existingFac = facility_logic.GetFacilityDetails(facID);
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
                    //contentPanel.Enabled = false;
                    //btnFinish.Visible = false;
                }
                #endregion
            }

            if (existingFac != null && existingFac.FacEquipments == null)
            {
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
            }
            else
            {
                           
                EquipmentDet details = existingFac.FacEquipments[0];
                if (details != null)
                {
                    #region "Load the first equipment"
                    hidEquipmentSysID.Value = details.Key.ToString();
                    txtEquipmentID.Text = details.EquipID;
                    //location is not in facility
                    txtLocation.Text = details.EquipLocation;
                    txtTypeUse.Text = details.TypeOrUse;
                    txtManufacturer.Text = details.Manufacturer;
                    txtModelNum.Text = details.ModelNo;
                    txtSerialNum.Text = details.SerialNo;
                    txtSize.Text = details.Size;

                    if (details.InstalledDate != DateTime.MinValue)
                        txtInstalledDate.Text = details.InstalledDate.ToShortDateString();
                    if (details.MotorInstalledDate != DateTime.MinValue)
                        txtMotorInstalledDate.Text = details.MotorInstalledDate.ToShortDateString();

                    txtCapacity.Text = details.Capacity;
                    txtCapacityHT.Text = details.CapacityHeadTest;
                    txtFuel.Text = details.FuelRefrigeration;
                    txtMotorManu.Text = details.MotorManufacturer;
                    txtHP.Text = details.HP;
                    txtMotorType.Text = details.MotorType;

                    txtMotorSerialNum.Text = details.MotorSerialNo;

                    txtMotorModel.Text = details.MotorModel;
                    txtFrame.Text = details.Frame;
                    txtRPM.Text = details.RPM;
                    txtVoltage.Text = details.Voltage;
                    txtAmperes.Text = details.Amperes;
                    txtPhaseCycle.Text = details.PhaseCycle;
                    txtBSLClass.Text = details.BslClassification;

                    if (details.TJCValue > 0)
                    { txtTJC.Text = details.TJCValue.ToString(); }
                    txtPMSchedule.Text = details.PMSchedule;
                    #endregion
                }
               
            }
        }


    }

    private void LoadEquipmentDetail(int id)
    {
        EquipmentDet details = facility_logic.GetInvEquipmentDetails(id);
        #region "Load the first equipment"
        hidEquipmentSysID.Value = details.Key.ToString();
        txtEquipmentID.Text = details.EquipID;
        //location is not in facility
        txtLocation.Text = details.EquipLocation;
        txtTypeUse.Text = details.TypeOrUse;
        txtManufacturer.Text = details.Manufacturer;
        txtModelNum.Text = details.ModelNo;
        txtSerialNum.Text = details.SerialNo;
        txtSize.Text = details.Size;

        if (details.InstalledDate != DateTime.MinValue)
            txtInstalledDate.Text = details.InstalledDate.ToShortDateString();
        if (details.MotorInstalledDate != DateTime.MinValue)
            txtMotorInstalledDate.Text = details.MotorInstalledDate.ToShortDateString();

        txtCapacity.Text = details.Capacity;
        txtCapacityHT.Text = details.CapacityHeadTest;
        txtFuel.Text = details.FuelRefrigeration;
        txtMotorManu.Text = details.MotorManufacturer;
        txtHP.Text = details.HP;
        txtMotorType.Text = details.MotorType;

        txtMotorSerialNum.Text = details.MotorSerialNo;

        txtMotorModel.Text = details.MotorModel;
        txtFrame.Text = details.Frame;
        txtRPM.Text = details.RPM;
        txtVoltage.Text = details.Voltage;
        txtAmperes.Text = details.Amperes;
        txtPhaseCycle.Text = details.PhaseCycle;
        txtBSLClass.Text = details.BslClassification;

        if (details.TJCValue > 0)
        { txtTJC.Text = details.TJCValue.ToString(); }
        txtPMSchedule.Text = details.PMSchedule;
        #endregion


    }
    private ValidationResult SaveEquipmentDetails()
    {
        if (!string.IsNullOrEmpty(Session["ParentFacilityNum"].ToString()))
        {
            EquipmentDet details = new EquipmentDet();
            //if (id > 0)
            //    details = facility_logic.GetInvEquipmentDetails(id);
           
            details.ParentFacilityNum = Session["ParentFacilityNum"].ToString();
         //   details.EquipSequenceNum = PageNumber * 5 + seqNo;
            LoginUser loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_USEROBJLOGINDET];
            if (loginUsr != null)
                details.UserName = loginUsr.LaborName;

            if (!string.IsNullOrEmpty(txtEquipmentID.Text.Trim()))
            {
                //??? how to update existing equipment? use hiddenID fields for those 
                //allow delete equipment, auto shift forward?
                //column header delete image

                #region save Equipment One"
                details.Key = Convert.ToInt32(hidEquipmentSysID.Value);
                details.EquipID = txtEquipmentID.Text.Trim();
                //location is not in facility
                details.EquipLocation = txtLocation.Text.Trim();
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
                return facility_logic.UpdateEquipment(details);

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
                LoginUser loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_USEROBJLOGINDET];
                if (loginUsr != null)
                    details.UserName = loginUsr.LaborName;
                ValidationResult vr = null;
                if (hasFullInfo)
                {
                    #region save new and save a one facility
                    details.EquipID = string.Empty;
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
                else
                {
                    #region save as parent
                    details.EquipID = "-1";
                    vr = facility_logic.UpdateFacility(details, false);
                    #endregion
                }

                if (details.Key > 0 && vr.Success)
                {
                    Session["ParentFacilityNum"] = details.FacNum;
                    Session["ParentFacilitySysID"] = details.Key.ToString();
                }
                else { Utils.ShowPopUpMsg("Error Occurred. Cannot save facility. " + vr.Reason, this.Page); }
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
        txtLocation.Text = string.Empty;
        txtTypeUse.Text = string.Empty;
        txtManufacturer.Text = string.Empty;
        txtModelNum.Text = string.Empty;
        txtSerialNum.Text = string.Empty;
        txtSize.Text = string.Empty;
        txtInstalledDate.Text = string.Empty;
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
        #endregion
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
}
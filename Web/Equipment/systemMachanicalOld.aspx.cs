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

public partial class Equipment_systemMachanicalOld : System.Web.UI.Page
{
    protected LoginUser loginUsr;
    //if session, don't need to following? if no viewstate, what else can use
    public List<EquipmentDet> FacEquipmentList
    {
        get
        {
            return (List<EquipmentDet>)Session["FacEquipmentList"];
        }
        set { Session["FacEquipmentList"] = value; }
    }
    public int PageNumber
    {
        get
        {
            return (int)Session["PageNumber"];
        }
        set { Session["PageNumber"] = value; }
    }
    public string ParentFacilityNum
    {
        get
        {
            return Session["ParentFacilityNum"].ToString();
        }
        set { Session["ParentFacilityNum"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        txtEquipmentID2.Attributes.Add("onKeyUp", "checkEquipmentID1TextBox(this)");
        txtEquipmentID3.Attributes.Add("onKeyUp", "checkEquipmentID2TextBox(this)");
        txtEquipmentID4.Attributes.Add("onKeyUp", "checkEquipmentID3TextBox(this)");
        txtEquipmentID5.Attributes.Add("onKeyUp", "checkEquipmentID4TextBox(this)");

        loginUsr = Utils.CheckSession(this);
        if (!Page.IsPostBack)
        {

            //if (loginUsr.Role.ToLower() != "msadmin" && loginUsr.Role.ToLower() != "mssuper")
            //{ btnFinish.Visible = false; }

            if (loginUsr.Role.ToLower() == "msadmin" || loginUsr.Role.ToLower() == "mssuper")
            { btnFinish.Visible = true; }
            else { btnFinish.Visible = false; }

            Session["FacEquipmentList"] = null;
            Session["PageNumber"] = 0;//the first page is 0
            Session["ParentFacilityNum"] = string.Empty;
            DataSet dtSystem = GeneralLookUp.GetMechanicalSystemList();
            drplstSystem.DataSource = dtSystem;
            drplstSystem.DataBind();
            DataSet dtBuilding = GeneralLookUp.GetBuildingList();
            drplstBuilding.DataSource = dtBuilding;
            drplstBuilding.DataBind();

            lbComponent1.Text = "Component 1";
            lbComponent2.Text = "Component 2";
            lbComponent3.Text = "Component 3";
            lbComponent4.Text = "Component 4";
            lbComponent5.Text = "Component 5";

            if (Request.QueryString["ParentFacilitySysID"] != null && !string.IsNullOrEmpty(Request.QueryString["ParentFacilitySysID"].ToString()))
            {
                int facID = 0;
                bool result = Int32.TryParse(Request.QueryString["ParentFacilitySysID"].ToString(), out facID);
                if (result)
                {
                    Session["ParentFacilitySysID"] = Request.QueryString["ParentFacilitySysID"].ToString();
                    LoadCurrentPage();
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

            }
            else { Session["ParentFacilitySysID"] = string.Empty; }
        }

        else
        {
            if (PageNumber == 0)
            { btnPreviousFive.Enabled = false; }
            else if (PageNumber == 4)
            { btnNextFive.Enabled = false; }
        }
    }

    protected void btnFinish_Click(object sender, EventArgs e)
    {

        //before saving, varify the equipment id fields are enter in sequence
        if (CheckEquipmentsInSequence())
        {
            ValidationResult vr = SaveCurrentPage();
            Utils.ShowPopUpMsg(vr.Reason, this.Page);
        }
        else
        { Utils.ShowPopUpMsg("Please enter previous Equipment ID for previous equipments.", this.Page); }

        //show active or inactive

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void btnPreviousFive_Click(object sender, EventArgs e)
    {
        DeleteFiveEquipmentDetails();
        PageNumber = PageNumber - 1;
        LeaveCurrentPage();
        if (PageNumber == 0)
        {
            btnPreviousFive.Enabled = false;
            generalInfoPanel.Enabled = true;
            commentsPanel.Enabled = true;
        }
        else
        {
            generalInfoPanel.Enabled = false;
            commentsPanel.Enabled = false;
        }
    }



    protected void btnNextFive_Click(object sender, EventArgs e)
    {
        DeleteFiveEquipmentDetails();
        PageNumber = PageNumber + 1;
        LeaveCurrentPage();
        btnPreviousFive.Enabled = true;
        if (PageNumber == 4)
        { btnNextFive.Enabled = false; }

        generalInfoPanel.Enabled = false;
        commentsPanel.Enabled = false;

    }

    private void LoadCurrentPage()
    {
        //When load five quipments on this page:
        //if session facnum is not null, then get faclity detail (include equipments if exist any)

        //Facility# is set by tom, at first it is = factemp 
        if (Session["ParentFacilitySysID"].ToString() != string.Empty)
        {
            FacilityDet existingFac = facility_logic.GetFacilityDetails(Convert.ToInt32(Session["ParentFacilitySysID"].ToString()));
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
                    contentPanel.Enabled = false;
                    btnFinish.Visible = false;
                }
                #endregion
            }

            if (existingFac != null && existingFac.FacEquipments == null)
            {
                #region "Load from facility table only"
                //txtEquipmentID1.Text = details.EquipID;
                //location is not in facility
                txtLocation1.Text = existingFac.EquipLocation;
                txtTypeUse1.Text = existingFac.TypeOrUse;
                txtManufacturer1.Text = existingFac.Manufacturer;
                txtModelNum1.Text = existingFac.ModelNo;
                txtSerialNum1.Text = existingFac.SerialNo;
                txtSize1.Text = existingFac.Size;

                if (existingFac.InstalledDate != DateTime.MinValue)
                    txtInstalledDate1.Text = existingFac.InstalledDate.ToShortDateString();
                if (existingFac.MotorInstalledDate != DateTime.MinValue)
                    txtMotorInstalledDate1.Text = existingFac.MotorInstalledDate.ToShortDateString();

                txtCapacity1.Text = existingFac.Capacity;
                txtCapacityHT1.Text = existingFac.CapacityHeadTest;
                txtFuel1.Text = existingFac.FuelRefrigeration;
                txtMotorManu1.Text = existingFac.MotorManufacturer;
                txtHP1.Text = existingFac.HP;
                txtMotorType1.Text = existingFac.MotorType;

                txtMotorSerialNum1.Text = existingFac.MotorSerialNo;

                txtMotorModel1.Text = existingFac.MotorModel;
                txtFrame1.Text = existingFac.Frame;
                txtRPM1.Text = existingFac.RPM;
                txtVoltage1.Text = existingFac.Voltage;
                txtAmperes1.Text = existingFac.Amperes;
                txtPhaseCycle1.Text = existingFac.PhaseCycle;
                txtBSLClass1.Text = existingFac.BslClassification;

                if (existingFac.TJCValue > 0)
                { txtTJC1.Text = existingFac.TJCValue.ToString(); }
                txtPMSchedule1.Text = existingFac.PMSchedule;
                #endregion
            }
            else
            {
                int loadMax = existingFac.FacEquipments.Count;
                if (loadMax >= 5)
                {
                    loadMax = 5;
                    Session["FacEquipmentList"] = existingFac.FacEquipments;
                    btnNextFive.Enabled = true;
                }
                //load max 5 equipments detail
                for (int i = 0; i < loadMax; i++)
                {
                    EquipmentDet details = existingFac.FacEquipments[i];
                    if (details != null && i == 0)
                    {
                        #region "Load the first equipment"
                        hidEquipmentSysID1.Value = details.Key.ToString();
                        txtEquipmentID1.Text = details.EquipID;
                        //location is not in facility
                        txtLocation1.Text = details.EquipLocation;
                        txtTypeUse1.Text = details.TypeOrUse;
                        txtManufacturer1.Text = details.Manufacturer;
                        txtModelNum1.Text = details.ModelNo;
                        txtSerialNum1.Text = details.SerialNo;
                        txtSize1.Text = details.Size;

                        if (details.InstalledDate != DateTime.MinValue)
                            txtInstalledDate1.Text = details.InstalledDate.ToShortDateString();
                        if (details.MotorInstalledDate != DateTime.MinValue)
                            txtMotorInstalledDate1.Text = details.MotorInstalledDate.ToShortDateString();

                        txtCapacity1.Text = details.Capacity;
                        txtCapacityHT1.Text = details.CapacityHeadTest;
                        txtFuel1.Text = details.FuelRefrigeration;
                        txtMotorManu1.Text = details.MotorManufacturer;
                        txtHP1.Text = details.HP;
                        txtMotorType1.Text = details.MotorType;

                        txtMotorSerialNum1.Text = details.MotorSerialNo;

                        txtMotorModel1.Text = details.MotorModel;
                        txtFrame1.Text = details.Frame;
                        txtRPM1.Text = details.RPM;
                        txtVoltage1.Text = details.Voltage;
                        txtAmperes1.Text = details.Amperes;
                        txtPhaseCycle1.Text = details.PhaseCycle;
                        txtBSLClass1.Text = details.BslClassification;

                        if (details.TJCValue > 0)
                        { txtTJC1.Text = details.TJCValue.ToString(); }
                        txtPMSchedule1.Text = details.PMSchedule;
                        #endregion
                    }
                    else if (details != null && i == 1)
                    {
                        #region "Load the first equipment"
                        hidEquipmentSysID2.Value = details.Key.ToString();
                        txtEquipmentID2.Text = details.EquipID;
                        //location is not in facility
                        txtLocation2.Text = details.EquipLocation;
                        txtTypeUse2.Text = details.TypeOrUse;
                        txtManufacturer2.Text = details.Manufacturer;
                        txtModelNum2.Text = details.ModelNo;
                        txtSerialNum2.Text = details.SerialNo;
                        txtSize2.Text = details.Size;

                        if (details.InstalledDate != DateTime.MinValue)
                            txtInstalledDate2.Text = details.InstalledDate.ToShortDateString();
                        if (details.MotorInstalledDate != DateTime.MinValue)
                            txtMotorInstalledDate2.Text = details.MotorInstalledDate.ToShortDateString();

                        txtCapacity2.Text = details.Capacity;
                        txtCapacityHT2.Text = details.CapacityHeadTest;
                        txtFuel2.Text = details.FuelRefrigeration;
                        txtMotorManu2.Text = details.MotorManufacturer;
                        txtHP2.Text = details.HP;
                        txtMotorType2.Text = details.MotorType;

                        txtMotorSerialNum2.Text = details.MotorSerialNo;

                        txtMotorModel2.Text = details.MotorModel;
                        txtFrame2.Text = details.Frame;
                        txtRPM2.Text = details.RPM;
                        txtVoltage2.Text = details.Voltage;
                        txtAmperes2.Text = details.Amperes;
                        txtPhaseCycle2.Text = details.PhaseCycle;
                        txtBSLClass2.Text = details.BslClassification;

                        if (details.TJCValue > 0)
                        { txtTJC2.Text = details.TJCValue.ToString(); }
                        txtPMSchedule2.Text = details.PMSchedule;
                        #endregion
                    }
                    else if (details != null && i == 2)
                    {
                        #region "Load the three equipment"
                        hidEquipmentSysID3.Value = details.Key.ToString();
                        txtEquipmentID3.Text = details.EquipID;
                        //location is not in facility
                        txtLocation3.Text = details.EquipLocation;
                        txtTypeUse3.Text = details.TypeOrUse;
                        txtManufacturer3.Text = details.Manufacturer;
                        txtModelNum3.Text = details.ModelNo;
                        txtSerialNum3.Text = details.SerialNo;
                        txtSize3.Text = details.Size;

                        if (details.InstalledDate != DateTime.MinValue)
                            txtInstalledDate3.Text = details.InstalledDate.ToShortDateString();
                        if (details.MotorInstalledDate != DateTime.MinValue)
                            txtMotorInstalledDate3.Text = details.MotorInstalledDate.ToShortDateString();

                        txtCapacity3.Text = details.Capacity;
                        txtCapacityHT3.Text = details.CapacityHeadTest;
                        txtFuel3.Text = details.FuelRefrigeration;
                        txtMotorManu3.Text = details.MotorManufacturer;
                        txtHP3.Text = details.HP;
                        txtMotorType3.Text = details.MotorType;

                        txtMotorSerialNum3.Text = details.MotorSerialNo;

                        txtMotorModel3.Text = details.MotorModel;
                        txtFrame3.Text = details.Frame;
                        txtRPM3.Text = details.RPM;
                        txtVoltage3.Text = details.Voltage;
                        txtAmperes3.Text = details.Amperes;
                        txtPhaseCycle3.Text = details.PhaseCycle;
                        txtBSLClass3.Text = details.BslClassification;

                        if (details.TJCValue > 0)
                        { txtTJC3.Text = details.TJCValue.ToString(); }
                        txtPMSchedule3.Text = details.PMSchedule;
                        #endregion
                    }
                    else if (details != null && i == 3)
                    {
                        #region "Load the four equipment"
                        hidEquipmentSysID4.Value = details.Key.ToString();
                        txtEquipmentID4.Text = details.EquipID;
                        //location is not in facility
                        txtLocation4.Text = details.EquipLocation;
                        txtTypeUse4.Text = details.TypeOrUse;
                        txtManufacturer4.Text = details.Manufacturer;
                        txtModelNum4.Text = details.ModelNo;
                        txtSerialNum4.Text = details.SerialNo;
                        txtSize4.Text = details.Size;

                        if (details.InstalledDate != DateTime.MinValue)
                            txtInstalledDate4.Text = details.InstalledDate.ToShortDateString();
                        if (details.MotorInstalledDate != DateTime.MinValue)
                            txtMotorInstalledDate4.Text = details.MotorInstalledDate.ToShortDateString();

                        txtCapacity4.Text = details.Capacity;
                        txtCapacityHT4.Text = details.CapacityHeadTest;
                        txtFuel4.Text = details.FuelRefrigeration;
                        txtMotorManu4.Text = details.MotorManufacturer;
                        txtHP4.Text = details.HP;
                        txtMotorType4.Text = details.MotorType;

                        txtMotorSerialNum4.Text = details.MotorSerialNo;

                        txtMotorModel4.Text = details.MotorModel;
                        txtFrame4.Text = details.Frame;
                        txtRPM4.Text = details.RPM;
                        txtVoltage4.Text = details.Voltage;
                        txtAmperes4.Text = details.Amperes;
                        txtPhaseCycle4.Text = details.PhaseCycle;
                        txtBSLClass4.Text = details.BslClassification;

                        if (details.TJCValue > 0)
                        { txtTJC4.Text = details.TJCValue.ToString(); }
                        txtPMSchedule4.Text = details.PMSchedule;
                        #endregion
                    }
                    else if (details != null && i == 4)
                    {
                        #region "Load the fifth equipment"
                        hidEquipmentSysID5.Value = details.Key.ToString();
                        txtEquipmentID5.Text = details.EquipID;
                        //location is not in facility
                        txtLocation5.Text = details.EquipLocation;
                        txtTypeUse5.Text = details.TypeOrUse;
                        txtManufacturer5.Text = details.Manufacturer;
                        txtModelNum5.Text = details.ModelNo;
                        txtSerialNum5.Text = details.SerialNo;
                        txtSize5.Text = details.Size;

                        if (details.InstalledDate != DateTime.MinValue)
                            txtInstalledDate5.Text = details.InstalledDate.ToShortDateString();
                        if (details.MotorInstalledDate != DateTime.MinValue)
                            txtMotorInstalledDate5.Text = details.MotorInstalledDate.ToShortDateString();

                        txtCapacity5.Text = details.Capacity;
                        txtCapacityHT5.Text = details.CapacityHeadTest;
                        txtFuel5.Text = details.FuelRefrigeration;
                        txtMotorManu5.Text = details.MotorManufacturer;
                        txtHP5.Text = details.HP;
                        txtMotorType5.Text = details.MotorType;

                        txtMotorSerialNum5.Text = details.MotorSerialNo;

                        txtMotorModel5.Text = details.MotorModel;
                        txtFrame5.Text = details.Frame;
                        txtRPM5.Text = details.RPM;
                        txtVoltage5.Text = details.Voltage;
                        txtAmperes5.Text = details.Amperes;
                        txtPhaseCycle5.Text = details.PhaseCycle;
                        txtBSLClass5.Text = details.BslClassification;

                        if (details.TJCValue > 0)
                        { txtTJC5.Text = details.TJCValue.ToString(); }
                        txtPMSchedule5.Text = details.PMSchedule;
                        #endregion
                    }
                }
            }
        }


    }


    //When save five quipments on this page:
    //1. if session facnum is null, then save new
    //  a. if equipmentid is null, save into facility table 
    //  b. else save into facility first, then get the session parent facilityNum, then save several equipments.
    //2. if Querystring facnum is not null, then get fac detail including equipment if any
    //  a. if originally no child, but equipment id is provided, then change to parent-child, remove info in parent
    //         table and add into equipment table
    //  b. if not, still update info only to facility table   

    private ValidationResult SaveCurrentPage()
    {
        bool saveChild = false;

        if (string.IsNullOrEmpty(Session["ParentFacilitySysID"].ToString()))
        {
            #region "save new"
            string parentFacilityNum = string.Empty;
            int parentFacilityID = -1;

            //add javascript to enforce equipmentID2 need previous equipmentid                         
            if (string.IsNullOrEmpty(txtEquipmentID1.Text.Trim()))
            {
                #region "a. save into facility table"
                parentFacilityID = SaveFacilityDetails(true);
                #endregion
            }
            else
            {
                saveChild = true;
                #region " b. if only one record and equipmentid is not null, save into facility as Parent"
                parentFacilityID = SaveFacilityDetails(false);
                #endregion
            }

            if (parentFacilityID > 0)
            {
                txtFacilityNum.Text = Session["ParentFacilityNum"].ToString();
                if (saveChild)
                    return SaveFiveEquipment();
                else
                    return new ValidationResult(true, "Facility is saved.");
            }
            else
            { return new ValidationResult(false, "Facility cannot be saved."); }
            #endregion
        }
        else
        {
            #region "Update existing"

            //bool hasChild = string.IsNullOrEmpty(Request.QueryString["EquipSequenceNum"].ToString()) ? false : true;
            //if has no child, then check whether other txtequipmentIDs have value
            FacilityDet existingFac = facility_logic.GetFacilityDetails(Convert.ToInt32(Session["ParentFacilitySysID"].ToString()));
            if (existingFac != null)
            {
                if (existingFac.FacEquipments == null && string.IsNullOrEmpty(txtEquipmentID1.Text.Trim()))
                {
                    #region "still save in facility table like before"
                    if (SaveFacilityDetails(true) > 0)
                        return new ValidationResult(true, "Facility is saved.");
                    else
                        return new ValidationResult(false, "Facility cannot be saved.");
                    #endregion
                }
                else if (existingFac.FacEquipments == null && !string.IsNullOrEmpty(txtEquipmentID1.Text.Trim()))
                {
                    //if things change, then save into parent detail, (Whether need to delete in Fac table???)
                    if (SaveFacilityDetails(false) > 0)
                    {
                        return SaveFiveEquipment();
                    }
                    else
                        return new ValidationResult(false, "Facility cannot be saved.");
                }
                else if (existingFac.FacEquipments != null && existingFac.FacEquipments.Count == 1)
                {
                    if (string.IsNullOrEmpty(txtEquipmentID1.Text.Trim()))
                    {
                        #region "still save in facility table like before"
                        if (SaveFacilityDetails(true) > 0)
                            return new ValidationResult(true, "Facility is saved.");
                        else
                            return new ValidationResult(false, "Facility cannot be saved.");
                        #endregion
                    }
                    else
                    {
                        //if things change, then save into parent detail, (Whether need to delete in Fac table???)
                        //if provided info
                        if (SaveFacilityDetails(false) > 0)
                        {
                            return SaveFiveEquipment();
                        }
                        else
                            return new ValidationResult(false, "Facility cannot be saved.");
                    }
                }
                else
                {
                    //if parent and all children
                    if (PageNumber > 0)
                    {
                        //save equipments only
                        return SaveFiveEquipment();
                    }
                    else
                    {
                        if (SaveFacilityDetails(false) > 0)
                        {
                            return SaveFiveEquipment();
                        }
                        else
                            return new ValidationResult(false, "Facility cannot be saved.");
                    }
                }
            }
            else
            {
                //error load facility
                return new ValidationResult(false, "Facility cannot be load.");
            }

            #endregion
        }
    }

    private ValidationResult SaveFiveEquipment()
    {
        int TotalSavedEquipment = 0;
        string msg = string.Empty;
        bool success = true;
        //seq 1-5
        if (!string.IsNullOrEmpty(txtEquipmentID1.Text.Trim()))
        {
            ValidationResult vr1 = SaveEquipmentDetails(1);
            if (vr1.Success)
            {
                TotalSavedEquipment += 1;
                msg += " The " + lbComponent1.Text + " equipment record is saved.";

            }
            else
            {
                msg += " The " + lbComponent1.Text + " equipment record cannot be saved." + vr1.Reason;
                success = false;
            }

        }

        if (!string.IsNullOrEmpty(txtEquipmentID2.Text.Trim()))
        {
            ValidationResult vr2 = SaveEquipmentDetails(2);
            if (vr2.Success)
            {
                TotalSavedEquipment += 1;
                msg += " The " + lbComponent2.Text + " equipment record is saved.";

            }
            else
            {
                msg += " The " + lbComponent2.Text + " equipment record cannot be saved.";
                success = false;
            }
        }
        if (!string.IsNullOrEmpty(txtEquipmentID3.Text.Trim()))
        {
            ValidationResult vr3 = SaveEquipmentDetails(3);
            if (vr3.Success)
            {
                TotalSavedEquipment += 1;
                msg += " The " + lbComponent3.Text + " equipment record is saved.";

            }
            else
            {
                msg += " The " + lbComponent3.Text + " equipment record cannot be saved.";
                success = false;
            }
        }
        if (!string.IsNullOrEmpty(txtEquipmentID4.Text.Trim()))
        {
            ValidationResult vr4 = SaveEquipmentDetails(4);
            if (vr4.Success)
            {
                TotalSavedEquipment += 1;
                msg += " The " + lbComponent4.Text + " equipment record is saved.";

            }
            else
            {
                msg += " The " + lbComponent4.Text + " equipment record cannot be saved.";
                success = false;
            }
        }
        if (!string.IsNullOrEmpty(txtEquipmentID5.Text.Trim()))
        {
            ValidationResult vr5 = SaveEquipmentDetails(5);
            if (vr5.Success)
            {
                TotalSavedEquipment += 1;
                msg += " The " + lbComponent5.Text + " equipment record is saved.";

            }
            else
            {
                msg += " The " + lbComponent5.Text + " equipment record cannot be saved.";
                success = false;
            }
        }

        if (success)
        {
            if (TotalSavedEquipment == 5 && PageNumber != 5)
            {
                btnNextFive.Enabled = true;
            }
            else
            {
                btnNextFive.Enabled = false;
            }

            //update session list
            FacilityDet existingFac = facility_logic.GetFacilityDetails(Convert.ToInt32(Session["ParentFacilitySysID"].ToString()));
            Session["FacEquipmentList"] = existingFac.FacEquipments;
        }

        return new ValidationResult(success, msg);

    }

    //save at least one equipment record
    private ValidationResult SaveEquipmentDetails(int seqNo)
    {
        if (!string.IsNullOrEmpty(Session["ParentFacilityNum"].ToString()))
        {
            if ((PageNumber * 5 + seqNo) > 25)
            {
                return new ValidationResult(false, "Too many equipments.");
            }
            EquipmentDet details = new EquipmentDet();
            details.ParentFacilityNum = Session["ParentFacilityNum"].ToString();
            details.EquipSequenceNum = PageNumber * 5 + seqNo;
            LoginUser loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_USEROBJLOGINDET];
            if (loginUsr != null)
                details.UserName = loginUsr.LaborName;

            if (seqNo == 1 && !string.IsNullOrEmpty(txtEquipmentID1.Text.Trim()))
            {
                //??? how to update existing equipment? use hiddenID fields for those 
                //allow delete equipment, auto shift forward?
                //column header delete image

                #region save Equipment One"
                details.Key = Convert.ToInt32(hidEquipmentSysID1.Value);
                details.EquipID = txtEquipmentID1.Text.Trim();
                //location is not in facility
                details.EquipLocation = txtLocation1.Text.Trim();
                details.TypeOrUse = txtTypeUse1.Text.Trim();
                details.Manufacturer = txtManufacturer1.Text.Trim();
                details.ModelNo = txtModelNum1.Text.Trim();
                details.SerialNo = txtSerialNum1.Text.Trim();
                details.Size = txtSize1.Text.Trim();
                if (!string.IsNullOrEmpty(txtInstalledDate1.Text.Trim()))
                    details.InstalledDate = Convert.ToDateTime(txtInstalledDate1.Text.Trim());
                details.Capacity = txtCapacity1.Text.Trim();
                details.CapacityHeadTest = txtCapacityHT1.Text.Trim();
                details.FuelRefrigeration = txtFuel1.Text.Trim();
                details.MotorManufacturer = txtMotorManu1.Text.Trim();
                details.HP = txtHP1.Text.Trim();
                details.MotorType = txtMotorType1.Text.Trim();

                details.MotorSerialNo = txtMotorSerialNum1.Text.Trim();
                if (!string.IsNullOrEmpty(txtMotorInstalledDate1.Text.Trim()))
                    details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate1.Text.Trim());
                details.MotorModel = txtMotorModel1.Text.Trim();
                details.Frame = txtFrame1.Text.Trim();
                details.RPM = txtRPM1.Text.Trim();
                details.Voltage = txtVoltage1.Text.Trim();
                details.Amperes = txtAmperes1.Text.Trim();
                details.PhaseCycle = txtPhaseCycle1.Text.Trim();
                details.BslClassification = txtBSLClass1.Text.Trim();
                if (!string.IsNullOrEmpty(txtTJC1.Text.Trim()))
                    details.TJCValue = Convert.ToInt32(txtTJC1.Text.Trim());
                details.PMSchedule = txtPMSchedule1.Text.Trim();
                return facility_logic.UpdateEquipment(details);

                #endregion
            }
            else if (seqNo == 2 && !string.IsNullOrEmpty(txtEquipmentID2.Text.Trim()))
            {
                #region save Equipment Two"
                details.Key = Convert.ToInt32(hidEquipmentSysID2.Value);
                details.EquipID = txtEquipmentID2.Text.Trim();
                //location is not in facility
                details.EquipLocation = txtLocation2.Text.Trim();
                details.TypeOrUse = txtTypeUse2.Text.Trim();
                details.Manufacturer = txtManufacturer2.Text.Trim();
                details.ModelNo = txtModelNum2.Text.Trim();
                details.SerialNo = txtSerialNum2.Text.Trim();
                details.Size = txtSize2.Text.Trim();
                if (!string.IsNullOrEmpty(txtInstalledDate2.Text.Trim()))
                    details.InstalledDate = Convert.ToDateTime(txtInstalledDate2.Text.Trim());
                details.Capacity = txtCapacity2.Text.Trim();
                details.CapacityHeadTest = txtCapacityHT2.Text.Trim();
                details.FuelRefrigeration = txtFuel2.Text.Trim();
                details.MotorManufacturer = txtMotorManu2.Text.Trim();
                details.HP = txtHP2.Text.Trim();
                details.MotorType = txtMotorType2.Text.Trim();

                details.MotorSerialNo = txtMotorSerialNum2.Text.Trim();
                if (!string.IsNullOrEmpty(txtMotorInstalledDate2.Text.Trim()))
                    details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate2.Text.Trim());
                details.MotorModel = txtMotorModel2.Text.Trim();
                details.Frame = txtFrame2.Text.Trim();
                details.RPM = txtRPM2.Text.Trim();
                details.Voltage = txtVoltage2.Text.Trim();
                details.Amperes = txtAmperes2.Text.Trim();
                details.PhaseCycle = txtPhaseCycle2.Text.Trim();
                details.BslClassification = txtBSLClass2.Text.Trim();
                if (!string.IsNullOrEmpty(txtTJC2.Text.Trim()))
                    details.TJCValue = Convert.ToInt32(txtTJC2.Text.Trim());
                details.PMSchedule = txtPMSchedule2.Text.Trim();
                return facility_logic.UpdateEquipment(details);
                #endregion
            }
            else if (seqNo == 3 && !string.IsNullOrEmpty(txtEquipmentID3.Text.Trim()))
            {
                #region save Equipment Three"
                details.Key = Convert.ToInt32(hidEquipmentSysID3.Value);
                details.EquipID = txtEquipmentID3.Text.Trim();
                //location is not in facility
                details.EquipLocation = txtLocation3.Text.Trim();
                details.TypeOrUse = txtTypeUse3.Text.Trim();
                details.Manufacturer = txtManufacturer3.Text.Trim();
                details.ModelNo = txtModelNum3.Text.Trim();
                details.SerialNo = txtSerialNum3.Text.Trim();
                details.Size = txtSize3.Text.Trim();
                if (!string.IsNullOrEmpty(txtInstalledDate3.Text.Trim()))
                    details.InstalledDate = Convert.ToDateTime(txtInstalledDate3.Text.Trim());
                details.Capacity = txtCapacity3.Text.Trim();
                details.CapacityHeadTest = txtCapacityHT3.Text.Trim();
                details.FuelRefrigeration = txtFuel3.Text.Trim();
                details.MotorManufacturer = txtMotorManu3.Text.Trim();
                details.HP = txtHP3.Text.Trim();
                details.MotorType = txtMotorType3.Text.Trim();

                details.MotorSerialNo = txtMotorSerialNum3.Text.Trim();
                if (!string.IsNullOrEmpty(txtMotorInstalledDate3.Text.Trim()))
                    details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate3.Text.Trim());
                details.MotorModel = txtMotorModel3.Text.Trim();
                details.Frame = txtFrame3.Text.Trim();
                details.RPM = txtRPM3.Text.Trim();
                details.Voltage = txtVoltage3.Text.Trim();
                details.Amperes = txtAmperes3.Text.Trim();
                details.PhaseCycle = txtPhaseCycle3.Text.Trim();
                details.BslClassification = txtBSLClass3.Text.Trim();
                if (!string.IsNullOrEmpty(txtTJC3.Text.Trim()))
                    details.TJCValue = Convert.ToInt32(txtTJC3.Text.Trim());
                details.PMSchedule = txtPMSchedule3.Text.Trim();
                #endregion
                return facility_logic.UpdateEquipment(details);
            }
            else if (seqNo == 4 && !string.IsNullOrEmpty(txtEquipmentID4.Text.Trim()))
            {
                #region save Equipment Four"
                details.Key = Convert.ToInt32(hidEquipmentSysID4.Value);
                details.EquipID = txtEquipmentID4.Text.Trim();
                //location is not in facility
                details.EquipLocation = txtLocation4.Text.Trim();
                details.TypeOrUse = txtTypeUse4.Text.Trim();
                details.Manufacturer = txtManufacturer4.Text.Trim();
                details.ModelNo = txtModelNum4.Text.Trim();
                details.SerialNo = txtSerialNum4.Text.Trim();
                details.Size = txtSize4.Text.Trim();
                if (!string.IsNullOrEmpty(txtInstalledDate4.Text.Trim()))
                    details.InstalledDate = Convert.ToDateTime(txtInstalledDate4.Text.Trim());
                details.Capacity = txtCapacity4.Text.Trim();
                details.CapacityHeadTest = txtCapacityHT4.Text.Trim();
                details.FuelRefrigeration = txtFuel4.Text.Trim();
                details.MotorManufacturer = txtMotorManu4.Text.Trim();
                details.HP = txtHP4.Text.Trim();
                details.MotorType = txtMotorType4.Text.Trim();

                details.MotorSerialNo = txtMotorSerialNum4.Text.Trim();
                if (!string.IsNullOrEmpty(txtMotorInstalledDate4.Text.Trim()))
                    details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate4.Text.Trim());
                details.MotorModel = txtMotorModel4.Text.Trim();
                details.Frame = txtFrame4.Text.Trim();
                details.RPM = txtRPM4.Text.Trim();
                details.Voltage = txtVoltage4.Text.Trim();
                details.Amperes = txtAmperes4.Text.Trim();
                details.PhaseCycle = txtPhaseCycle4.Text.Trim();
                details.BslClassification = txtBSLClass4.Text.Trim();
                if (!string.IsNullOrEmpty(txtTJC4.Text.Trim()))
                    details.TJCValue = Convert.ToInt32(txtTJC4.Text.Trim());
                details.PMSchedule = txtPMSchedule4.Text.Trim();
                #endregion
                return facility_logic.UpdateEquipment(details);
            }
            else
            {
                #region save Equipment Five"
                details.Key = Convert.ToInt32(hidEquipmentSysID5.Value);
                details.EquipID = txtEquipmentID5.Text.Trim();
                //location is not in facility
                details.EquipLocation = txtLocation5.Text.Trim();
                details.TypeOrUse = txtTypeUse5.Text.Trim();
                details.Manufacturer = txtManufacturer5.Text.Trim();
                details.ModelNo = txtModelNum5.Text.Trim();
                details.SerialNo = txtSerialNum5.Text.Trim();
                details.Size = txtSize5.Text.Trim();
                if (!string.IsNullOrEmpty(txtInstalledDate5.Text.Trim()))
                    details.InstalledDate = Convert.ToDateTime(txtInstalledDate5.Text.Trim());
                details.Capacity = txtCapacity5.Text.Trim();
                details.CapacityHeadTest = txtCapacityHT5.Text.Trim();
                details.FuelRefrigeration = txtFuel5.Text.Trim();
                details.MotorManufacturer = txtMotorManu5.Text.Trim();
                details.HP = txtHP5.Text.Trim();
                details.MotorType = txtMotorType5.Text.Trim();

                details.MotorSerialNo = txtMotorSerialNum5.Text.Trim();
                if (!string.IsNullOrEmpty(txtMotorInstalledDate5.Text.Trim()))
                    details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate5.Text.Trim());
                details.MotorModel = txtMotorModel5.Text.Trim();
                details.Frame = txtFrame5.Text.Trim();
                details.RPM = txtRPM5.Text.Trim();
                details.Voltage = txtVoltage5.Text.Trim();
                details.Amperes = txtAmperes5.Text.Trim();
                details.PhaseCycle = txtPhaseCycle5.Text.Trim();
                details.BslClassification = txtBSLClass5.Text.Trim();
                if (!string.IsNullOrEmpty(txtTJC5.Text.Trim()))
                    details.TJCValue = Convert.ToInt32(txtTJC5.Text.Trim());
                details.PMSchedule = txtPMSchedule5.Text.Trim();
                #endregion
                return facility_logic.UpdateEquipment(details);
            }

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
        //show not happen when page > 0
        if (PageNumber < 1)
        {
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
                    details.TypeOrUse = txtTypeUse1.Text.Trim();
                    details.Manufacturer = txtManufacturer1.Text.Trim();
                    details.ModelNo = txtModelNum1.Text.Trim();
                    details.SerialNo = txtSerialNum1.Text.Trim();
                    details.Size = txtSize1.Text.Trim();
                    if (!string.IsNullOrEmpty(txtInstalledDate1.Text.Trim()))
                        details.InstalledDate = Convert.ToDateTime(txtInstalledDate1.Text.Trim());
                    details.Capacity = txtCapacity1.Text.Trim();
                    details.CapacityHeadTest = txtCapacityHT1.Text.Trim();
                    details.FuelRefrigeration = txtFuel1.Text.Trim();
                    details.MotorManufacturer = txtMotorManu1.Text.Trim();
                    details.HP = txtHP1.Text.Trim();
                    details.MotorType = txtMotorType1.Text.Trim();

                    details.MotorSerialNo = txtMotorSerialNum1.Text.Trim();
                    if (!string.IsNullOrEmpty(txtMotorInstalledDate1.Text.Trim()))
                        details.MotorInstalledDate = Convert.ToDateTime(txtMotorInstalledDate1.Text.Trim());
                    details.MotorModel = txtMotorModel1.Text.Trim();
                    details.Frame = txtFrame1.Text.Trim();
                    details.RPM = txtRPM1.Text.Trim();
                    details.Voltage = txtVoltage1.Text.Trim();
                    details.Amperes = txtAmperes1.Text.Trim();
                    details.PhaseCycle = txtPhaseCycle1.Text.Trim();
                    details.BslClassification = txtBSLClass1.Text.Trim();
                    if (!string.IsNullOrEmpty(txtTJC1.Text.Trim()))
                        details.TJCValue = Convert.ToInt32(txtTJC1.Text.Trim());
                    details.PMSchedule = txtPMSchedule1.Text.Trim();

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


        }

        return details.Key;
    }

    private void DeleteFiveEquipmentDetails()
    {
        //switch (seqNo)
        //{
        //    case 1:
        #region delete Equipment One"
        hidEquipmentSysID1.Value = "-1";
        txtEquipmentID1.Text = string.Empty;
        txtLocation1.Text = string.Empty;
        txtTypeUse1.Text = string.Empty;
        txtManufacturer1.Text = string.Empty;
        txtModelNum1.Text = string.Empty;
        txtSerialNum1.Text = string.Empty;
        txtSize1.Text = string.Empty;
        txtInstalledDate1.Text = string.Empty;
        txtCapacity1.Text = string.Empty;
        txtCapacityHT1.Text = string.Empty;
        txtFuel1.Text = string.Empty;
        txtMotorManu1.Text = string.Empty;
        txtHP1.Text = string.Empty;
        txtMotorType1.Text = string.Empty;
        txtMotorSerialNum1.Text = string.Empty;
        txtMotorInstalledDate1.Text = string.Empty;
        txtMotorModel1.Text = string.Empty;
        txtFrame1.Text = string.Empty;
        txtRPM1.Text = string.Empty;
        txtVoltage1.Text = string.Empty;
        txtAmperes1.Text = string.Empty;
        txtPhaseCycle1.Text = string.Empty;
        txtBSLClass1.Text = string.Empty;
        txtTJC1.Text = string.Empty;
        txtPMSchedule1.Text = string.Empty;
        #endregion
        //    break;
        //case 2:
        #region delete Equipment Two"
        hidEquipmentSysID2.Value = "-1";
        txtEquipmentID2.Text = string.Empty;
        txtLocation2.Text = string.Empty;
        txtTypeUse2.Text = string.Empty;
        txtManufacturer2.Text = string.Empty;
        txtModelNum2.Text = string.Empty;
        txtSerialNum2.Text = string.Empty;
        txtSize2.Text = string.Empty;
        txtInstalledDate2.Text = string.Empty;
        txtCapacity2.Text = string.Empty;
        txtCapacityHT2.Text = string.Empty;
        txtFuel2.Text = string.Empty;
        txtMotorManu2.Text = string.Empty;
        txtHP2.Text = string.Empty;
        txtMotorType2.Text = string.Empty;
        txtMotorSerialNum2.Text = string.Empty;
        txtMotorInstalledDate2.Text = string.Empty;
        txtMotorModel2.Text = string.Empty;
        txtFrame2.Text = string.Empty;
        txtRPM2.Text = string.Empty;
        txtVoltage2.Text = string.Empty;
        txtAmperes2.Text = string.Empty;
        txtPhaseCycle2.Text = string.Empty;
        txtBSLClass2.Text = string.Empty;
        txtTJC2.Text = string.Empty;
        txtPMSchedule2.Text = string.Empty;
        #endregion


        #region delete Equipment Three"
        hidEquipmentSysID3.Value = "-1";
        txtEquipmentID3.Text = string.Empty;
        txtLocation3.Text = string.Empty;
        txtTypeUse3.Text = string.Empty;
        txtManufacturer3.Text = string.Empty;
        txtModelNum3.Text = string.Empty;
        txtSerialNum3.Text = string.Empty;
        txtSize3.Text = string.Empty;
        txtInstalledDate3.Text = string.Empty;
        txtCapacity3.Text = string.Empty;
        txtCapacityHT3.Text = string.Empty;
        txtFuel3.Text = string.Empty;
        txtMotorManu3.Text = string.Empty;
        txtHP3.Text = string.Empty;
        txtMotorType3.Text = string.Empty;
        txtMotorSerialNum3.Text = string.Empty;
        txtMotorInstalledDate3.Text = string.Empty;
        txtMotorModel3.Text = string.Empty;
        txtFrame3.Text = string.Empty;
        txtRPM3.Text = string.Empty;
        txtVoltage3.Text = string.Empty;
        txtAmperes3.Text = string.Empty;
        txtPhaseCycle3.Text = string.Empty;
        txtBSLClass3.Text = string.Empty;
        txtTJC3.Text = string.Empty;
        txtPMSchedule3.Text = string.Empty;
        #endregion

        #region delete Equipment Four"
        hidEquipmentSysID4.Value = "-1";
        txtEquipmentID4.Text = string.Empty;
        txtLocation4.Text = string.Empty;
        txtTypeUse4.Text = string.Empty;
        txtManufacturer4.Text = string.Empty;
        txtModelNum4.Text = string.Empty;
        txtSerialNum4.Text = string.Empty;
        txtSize4.Text = string.Empty;
        txtInstalledDate4.Text = string.Empty;
        txtCapacity4.Text = string.Empty;
        txtCapacityHT4.Text = string.Empty;
        txtFuel4.Text = string.Empty;
        txtMotorManu4.Text = string.Empty;
        txtHP4.Text = string.Empty;
        txtMotorType4.Text = string.Empty;
        txtMotorSerialNum4.Text = string.Empty;
        txtMotorInstalledDate4.Text = string.Empty;
        txtMotorModel4.Text = string.Empty;
        txtFrame4.Text = string.Empty;
        txtRPM4.Text = string.Empty;
        txtVoltage4.Text = string.Empty;
        txtAmperes4.Text = string.Empty;
        txtPhaseCycle4.Text = string.Empty;
        txtBSLClass4.Text = string.Empty;
        txtTJC4.Text = string.Empty;
        txtPMSchedule4.Text = string.Empty;
        #endregion

        #region delete Equipment Five"
        hidEquipmentSysID5.Value = "-1";
        txtEquipmentID5.Text = string.Empty;
        txtLocation5.Text = string.Empty;
        txtTypeUse5.Text = string.Empty;
        txtManufacturer5.Text = string.Empty;
        txtModelNum5.Text = string.Empty;
        txtSerialNum5.Text = string.Empty;
        txtSize5.Text = string.Empty;
        txtInstalledDate5.Text = string.Empty;
        txtCapacity5.Text = string.Empty;
        txtCapacityHT5.Text = string.Empty;
        txtFuel5.Text = string.Empty;
        txtMotorManu5.Text = string.Empty;
        txtHP5.Text = string.Empty;
        txtMotorType5.Text = string.Empty;
        txtMotorSerialNum5.Text = string.Empty;
        txtMotorInstalledDate5.Text = string.Empty;
        txtMotorModel5.Text = string.Empty;
        txtFrame5.Text = string.Empty;
        txtRPM5.Text = string.Empty;
        txtVoltage5.Text = string.Empty;
        txtAmperes5.Text = string.Empty;
        txtPhaseCycle5.Text = string.Empty;
        txtBSLClass5.Text = string.Empty;
        txtTJC5.Text = string.Empty;
        txtPMSchedule5.Text = string.Empty;
        #endregion

    }


    private void LoadCurrentFiveEquipments()
    {
        List<EquipmentDet> eqList = (List<EquipmentDet>)Session["FacEquipmentList"];


        int loadmin = 0;
        int loadMax = 5;
        if (PageNumber > 0)
        {
            loadmin = PageNumber * 5;
            loadMax = (PageNumber + 1) * 5;

            lbComponent1.Text = "Component " + (loadmin + 1).ToString();
            lbComponent2.Text = "Component " + (loadmin + 2).ToString();
            lbComponent3.Text = "Component " + (loadmin + 3).ToString();
            lbComponent4.Text = "Component " + (loadmin + 4).ToString();
            lbComponent5.Text = "Component " + (loadmin + 5).ToString();
        }
        else if (PageNumber == 0)
        {
            lbComponent1.Text = "Component 1";
            lbComponent2.Text = "Component 2";
            lbComponent3.Text = "Component 3";
            lbComponent4.Text = "Component 4";
            lbComponent5.Text = "Component 5";
        }


        btnNextFive.Enabled = (eqList.Count >= loadMax) ? true : false;

        //only load this page 5 equipments when items > loadmin
        if (eqList.Count > loadmin)
        {
            if (eqList.Count <= loadMax)
            {
                loadMax = eqList.Count;
            }
            #region "Load max 5 equipments on this screen"
            int count = 1;
            //load max 5 equipments detail
            for (int i = loadmin; i < loadMax; i++)
            {

                EquipmentDet details = eqList[i];
                if (details != null && count == 1)
                {
                    #region "Load the first equipment"
                    hidEquipmentSysID1.Value = details.Key.ToString();
                    txtEquipmentID1.Text = details.EquipID;
                    //location is not in facility
                    txtLocation1.Text = details.EquipLocation;
                    txtTypeUse1.Text = details.TypeOrUse;
                    txtManufacturer1.Text = details.Manufacturer;
                    txtModelNum1.Text = details.ModelNo;
                    txtSerialNum1.Text = details.SerialNo;
                    txtSize1.Text = details.Size;

                    if (details.InstalledDate != DateTime.MinValue)
                        txtInstalledDate1.Text = details.InstalledDate.ToShortDateString();
                    if (details.MotorInstalledDate != DateTime.MinValue)
                        txtMotorInstalledDate1.Text = details.MotorInstalledDate.ToShortDateString();

                    txtCapacity1.Text = details.Capacity;
                    txtCapacityHT1.Text = details.CapacityHeadTest;
                    txtFuel1.Text = details.FuelRefrigeration;
                    txtMotorManu1.Text = details.MotorManufacturer;
                    txtHP1.Text = details.HP;
                    txtMotorType1.Text = details.MotorType;

                    txtMotorSerialNum1.Text = details.MotorSerialNo;

                    txtMotorModel1.Text = details.MotorModel;
                    txtFrame1.Text = details.Frame;
                    txtRPM1.Text = details.RPM;
                    txtVoltage1.Text = details.Voltage;
                    txtAmperes1.Text = details.Amperes;
                    txtPhaseCycle1.Text = details.PhaseCycle;
                    txtBSLClass1.Text = details.BslClassification;

                    if (details.TJCValue > 0)
                    { txtTJC1.Text = details.TJCValue.ToString(); }
                    txtPMSchedule1.Text = details.PMSchedule;
                    #endregion
                }
                else if (details != null && count == 2)
                {
                    #region "Load the second equipment"
                    hidEquipmentSysID2.Value = details.Key.ToString();
                    txtEquipmentID2.Text = details.EquipID;
                    //location is not in facility
                    txtLocation2.Text = details.EquipLocation;
                    txtTypeUse2.Text = details.TypeOrUse;
                    txtManufacturer2.Text = details.Manufacturer;
                    txtModelNum2.Text = details.ModelNo;
                    txtSerialNum2.Text = details.SerialNo;
                    txtSize2.Text = details.Size;

                    if (details.InstalledDate != DateTime.MinValue)
                        txtInstalledDate2.Text = details.InstalledDate.ToShortDateString();
                    if (details.MotorInstalledDate != DateTime.MinValue)
                        txtMotorInstalledDate2.Text = details.MotorInstalledDate.ToShortDateString();

                    txtCapacity2.Text = details.Capacity;
                    txtCapacityHT2.Text = details.CapacityHeadTest;
                    txtFuel2.Text = details.FuelRefrigeration;
                    txtMotorManu2.Text = details.MotorManufacturer;
                    txtHP2.Text = details.HP;
                    txtMotorType2.Text = details.MotorType;

                    txtMotorSerialNum2.Text = details.MotorSerialNo;

                    txtMotorModel2.Text = details.MotorModel;
                    txtFrame2.Text = details.Frame;
                    txtRPM2.Text = details.RPM;
                    txtVoltage2.Text = details.Voltage;
                    txtAmperes2.Text = details.Amperes;
                    txtPhaseCycle2.Text = details.PhaseCycle;
                    txtBSLClass2.Text = details.BslClassification;

                    if (details.TJCValue > 0)
                    { txtTJC2.Text = details.TJCValue.ToString(); }
                    txtPMSchedule2.Text = details.PMSchedule;
                    #endregion
                }
                else if (details != null && count == 3)
                {
                    #region "Load the three equipment"
                    hidEquipmentSysID3.Value = details.Key.ToString();
                    txtEquipmentID3.Text = details.EquipID;
                    //location is not in facility
                    txtLocation3.Text = details.EquipLocation;
                    txtTypeUse3.Text = details.TypeOrUse;
                    txtManufacturer3.Text = details.Manufacturer;
                    txtModelNum3.Text = details.ModelNo;
                    txtSerialNum3.Text = details.SerialNo;
                    txtSize3.Text = details.Size;

                    if (details.InstalledDate != DateTime.MinValue)
                        txtInstalledDate3.Text = details.InstalledDate.ToShortDateString();
                    if (details.MotorInstalledDate != DateTime.MinValue)
                        txtMotorInstalledDate3.Text = details.MotorInstalledDate.ToShortDateString();

                    txtCapacity3.Text = details.Capacity;
                    txtCapacityHT3.Text = details.CapacityHeadTest;
                    txtFuel3.Text = details.FuelRefrigeration;
                    txtMotorManu3.Text = details.MotorManufacturer;
                    txtHP3.Text = details.HP;
                    txtMotorType3.Text = details.MotorType;

                    txtMotorSerialNum3.Text = details.MotorSerialNo;

                    txtMotorModel3.Text = details.MotorModel;
                    txtFrame3.Text = details.Frame;
                    txtRPM3.Text = details.RPM;
                    txtVoltage3.Text = details.Voltage;
                    txtAmperes3.Text = details.Amperes;
                    txtPhaseCycle3.Text = details.PhaseCycle;
                    txtBSLClass3.Text = details.BslClassification;

                    if (details.TJCValue > 0)
                    { txtTJC3.Text = details.TJCValue.ToString(); }
                    txtPMSchedule3.Text = details.PMSchedule;
                    #endregion
                }
                else if (details != null && count == 4)
                {
                    #region "Load the four equipment"
                    hidEquipmentSysID4.Value = details.Key.ToString();
                    txtEquipmentID4.Text = details.EquipID;
                    //location is not in facility
                    txtLocation4.Text = details.EquipLocation;
                    txtTypeUse4.Text = details.TypeOrUse;
                    txtManufacturer4.Text = details.Manufacturer;
                    txtModelNum4.Text = details.ModelNo;
                    txtSerialNum4.Text = details.SerialNo;
                    txtSize4.Text = details.Size;

                    if (details.InstalledDate != DateTime.MinValue)
                        txtInstalledDate4.Text = details.InstalledDate.ToShortDateString();
                    if (details.MotorInstalledDate != DateTime.MinValue)
                        txtMotorInstalledDate4.Text = details.MotorInstalledDate.ToShortDateString();

                    txtCapacity4.Text = details.Capacity;
                    txtCapacityHT4.Text = details.CapacityHeadTest;
                    txtFuel4.Text = details.FuelRefrigeration;
                    txtMotorManu4.Text = details.MotorManufacturer;
                    txtHP4.Text = details.HP;
                    txtMotorType4.Text = details.MotorType;

                    txtMotorSerialNum4.Text = details.MotorSerialNo;

                    txtMotorModel4.Text = details.MotorModel;
                    txtFrame4.Text = details.Frame;
                    txtRPM4.Text = details.RPM;
                    txtVoltage4.Text = details.Voltage;
                    txtAmperes4.Text = details.Amperes;
                    txtPhaseCycle4.Text = details.PhaseCycle;
                    txtBSLClass4.Text = details.BslClassification;

                    if (details.TJCValue > 0)
                    { txtTJC4.Text = details.TJCValue.ToString(); }
                    txtPMSchedule4.Text = details.PMSchedule;
                    #endregion
                }
                else if (details != null && count == 5)
                {
                    #region "Load the fifth equipment"
                    hidEquipmentSysID5.Value = details.Key.ToString();
                    txtEquipmentID5.Text = details.EquipID;
                    //location is not in facility
                    txtLocation5.Text = details.EquipLocation;
                    txtTypeUse5.Text = details.TypeOrUse;
                    txtManufacturer5.Text = details.Manufacturer;
                    txtModelNum5.Text = details.ModelNo;
                    txtSerialNum5.Text = details.SerialNo;
                    txtSize5.Text = details.Size;

                    if (details.InstalledDate != DateTime.MinValue)
                        txtInstalledDate5.Text = details.InstalledDate.ToShortDateString();
                    if (details.MotorInstalledDate != DateTime.MinValue)
                        txtMotorInstalledDate5.Text = details.MotorInstalledDate.ToShortDateString();

                    txtCapacity5.Text = details.Capacity;
                    txtCapacityHT5.Text = details.CapacityHeadTest;
                    txtFuel5.Text = details.FuelRefrigeration;
                    txtMotorManu5.Text = details.MotorManufacturer;
                    txtHP5.Text = details.HP;
                    txtMotorType5.Text = details.MotorType;

                    txtMotorSerialNum5.Text = details.MotorSerialNo;

                    txtMotorModel5.Text = details.MotorModel;
                    txtFrame5.Text = details.Frame;
                    txtRPM5.Text = details.RPM;
                    txtVoltage5.Text = details.Voltage;
                    txtAmperes5.Text = details.Amperes;
                    txtPhaseCycle5.Text = details.PhaseCycle;
                    txtBSLClass5.Text = details.BslClassification;

                    if (details.TJCValue > 0)
                    { txtTJC5.Text = details.TJCValue.ToString(); }
                    txtPMSchedule5.Text = details.PMSchedule;
                    #endregion
                }
                count = count + 1;
            }
            #endregion
        }
    }

    private void LeaveCurrentPage()
    {
        if (Session["FacEquipmentList"] != null)
        {
            //more than 5, then get the page nume and load equipments
            LoadCurrentFiveEquipments();
        }
        if (PageNumber != 0)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "GreyOutDiv", "disableDiv(hidDiv);", true);
        }


    }

    private bool CheckEquipmentsInSequence()
    {
        bool ret = true;
        if (txtEquipmentID2.Text.Trim() != string.Empty)
        {
            if (txtEquipmentID1.Text.Trim() == string.Empty)
                return false;
        }
        if (txtEquipmentID3.Text.Trim() != string.Empty)
        {
            if (txtEquipmentID1.Text.Trim() == string.Empty)
                return false;
            if (txtEquipmentID2.Text.Trim() == string.Empty)
                return false;
        }
        if (txtEquipmentID4.Text.Trim() != string.Empty)
        {
            if (txtEquipmentID1.Text.Trim() == string.Empty)
                return false;
            if (txtEquipmentID2.Text.Trim() == string.Empty)
                return false;
            if (txtEquipmentID3.Text.Trim() == string.Empty)
                return false;
        }
        if (txtEquipmentID5.Text.Trim() != string.Empty)
        {
            if (txtEquipmentID1.Text.Trim() == string.Empty)
                return false;
            if (txtEquipmentID2.Text.Trim() == string.Empty)
                return false;
            if (txtEquipmentID3.Text.Trim() == string.Empty)
                return false;
            if (txtEquipmentID4.Text.Trim() == string.Empty)
                return false;
        }

        return ret;
    }
}

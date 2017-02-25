using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIH.CMMS.Inventory.BOL.Facility;
using NIH.CMMS.Inventory.BPL.Facility;

public partial class PrintTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string facNum = string.Empty;

            facNum = "";

            FacilityDet existingFac = facility_logic.GetFacilityDetailsByFacNum(facNum);

            //if (existingFac != null)
            //{
            //    int numberOfPages = 1;
            //    if (existingFac.FacEquipments != null)
            //    {
            //        numberOfPages = existingFac.FacEquipments.Count/5;
            //    }

            //    //for i=1 i++ i<numberOfPages
            //    //{
            //    //    //generate table for every 5 components
            //    //}
            //    #region "show fac detail"
            //   //now need to generate table top part now
            //        if (existingFac.Status.ToLower() == "active")
            //        { lbFacNum.Text = "<b><font color='green'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }
            //        else
            //        { lbFacNum.Text = "<b><font color='red'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }


            //        lbFacSystem.Text = existingFac.FacSystem;
            //        lbFacBuilding.Text = existingFac.FacBuilding;
            //        lbFacFunction.Text = existingFac.FacFunction;
            //        lbFacFloor.Text = existingFac.FacFloor;
            //        lbFacLocation.Text = existingFac.FacLocation;
            //        lbFacFacilityID.Text = existingFac.FacID;

            //        lbWRNumber.Text = existingFac.WRNumber;
            //        ckAAALAC.Checked = (existingFac.YsnAaalac == 1) ? true : false;
            //        ckBSL.Checked = (existingFac.YsnBsl == 1) ? true : false;
            //        ckTJC.Checked = (existingFac.YsnTJC == 1) ? true : false;
            //        lbEletricalComments.Text = existingFac.Comment;

            //        if (existingFac.FacEquipments != null)
            //        {
            //            //generate table lower part with 5 component
            //            int max = 5;
            //            //int 
            //            if (existingFac.FacEquipments.Count <= 5)
            //                max = existingFac.FacEquipments.Count;
            //            else
            //            {
            //                divMechanicalPage2.Visible = true;

            //                if (existingFac.Status.ToLower() == "active")
            //                { lbFacNum2.Text = "<b><font color='green'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }
            //                else
            //                { lbFacNum2.Text = "<b><font color='red'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }

            //                lbFacSystem2.Text = existingFac.FacSystem;
            //                lbFacFacilityID2.Text = existingFac.FacID;
            //                lbFacFunction2.Text = existingFac.FacFunction;
            //                ckBSL2.Checked = (existingFac.YsnBsl == 1) ? true : false;
            //                ckAAALAC2.Checked = (existingFac.YsnAaalac == 1) ? true : false;
            //                ckTJC2.Checked = (existingFac.YsnTJC == 1) ? true : false;
            //                lbFacBuilding2.Text = existingFac.FacBuilding;
            //                lbFacFloor2.Text = existingFac.FacFloor;
            //                lbFacLocation2.Text = existingFac.FacLocation;
            //                lbWRNumber2.Text = existingFac.WRNumber;
            //                lbComments2.Text = existingFac.Comment;


            //                if (existingFac.FacEquipments.Count > 10)
            //                {
            //                    divMechanicalPage3.Visible = true;
            //                    if (existingFac.Status.ToLower() == "active")
            //                    { lbFacNum3.Text = "<b><font color='green'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }
            //                    else
            //                    { lbFacNum3.Text = "<b><font color='red'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }

            //                    lbFacSystem3.Text = existingFac.FacSystem;
            //                    lbFacFacilityID3.Text = existingFac.FacID;
            //                    lbFacFunction3.Text = existingFac.FacFunction;
            //                    ckBSL3.Checked = (existingFac.YsnBsl == 1) ? true : false;
            //                    ckAAALAC3.Checked = (existingFac.YsnAaalac == 1) ? true : false;
            //                    ckTJC3.Checked = (existingFac.YsnTJC == 1) ? true : false;
            //                    lbFacBuilding3.Text = existingFac.FacBuilding;
            //                    lbFacFloor3.Text = existingFac.FacFloor;
            //                    lbFacLocation3.Text = existingFac.FacLocation;
            //                    lbWRNumber3.Text = existingFac.WRNumber;
            //                    lbComments3.Text = existingFac.Comment;
            //                }
            //                if (existingFac.FacEquipments.Count > 15)
            //                {
            //                    divMechanicalPage4.Visible = true;
            //                    if (existingFac.Status.ToLower() == "active")
            //                    { lbFacNum4.Text = "<b><font color='green'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }
            //                    else
            //                    { lbFacNum4.Text = "<b><font color='red'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }

            //                    lbFacSystem4.Text = existingFac.FacSystem;
            //                    lbFacFacilityID4.Text = existingFac.FacID;
            //                    lbFacFunction4.Text = existingFac.FacFunction;
            //                    ckBSL4.Checked = (existingFac.YsnBsl == 1) ? true : false;
            //                    ckAAALAC4.Checked = (existingFac.YsnAaalac == 1) ? true : false;
            //                    ckTJC4.Checked = (existingFac.YsnTJC == 1) ? true : false;
            //                    lbFacBuilding4.Text = existingFac.FacBuilding;
            //                    lbFacFloor4.Text = existingFac.FacFloor;
            //                    lbFacLocation4.Text = existingFac.FacLocation;
            //                    lbWRNumber4.Text = existingFac.WRNumber;
            //                    lbComments4.Text = existingFac.Comment;

            //                }
            //                if (existingFac.FacEquipments.Count > 20)
            //                {
            //                    divMechanicalPage5.Visible = true;
            //                    if (existingFac.Status.ToLower() == "active")
            //                    { lbFacNum5.Text = "<b><font color='green'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }
            //                    else
            //                    { lbFacNum5.Text = "<b><font color='red'>" + existingFac.FacNum + "(" + existingFac.Status + ")</font></b>"; }

            //                    lbFacSystem5.Text = existingFac.FacSystem;
            //                    lbFacFacilityID5.Text = existingFac.FacID;
            //                    lbFacFunction5.Text = existingFac.FacFunction;
            //                    ckBSL5.Checked = (existingFac.YsnBsl == 1) ? true : false;
            //                    ckAAALAC5.Checked = (existingFac.YsnAaalac == 1) ? true : false;
            //                    ckTJC5.Checked = (existingFac.YsnTJC == 1) ? true : false;
            //                    lbFacBuilding5.Text = existingFac.FacBuilding;
            //                    lbFacFloor5.Text = existingFac.FacFloor;
            //                    lbFacLocation5.Text = existingFac.FacLocation;
            //                    lbWRNumber5.Text = existingFac.WRNumber;
            //                    lbComments5.Text = existingFac.Comment;

            //                }
            //            }
            //            for (int i = 0; i < existingFac.FacEquipments.Count; i++)
            //            {
            //                EquipmentDet details = existingFac.FacEquipments[i];
            //                if (details != null && i == 0)
            //                {
            //                    #region "Load the first equipment"
            //                    lbEquipmentID1.Text = details.EquipID;
            //                    lbLocation1.Text = details.EquipLocation;
            //                    lbTypeUse1.Text = details.TypeOrUse;
            //                    lbManufacturer1.Text = details.Manufacturer;
            //                    lbModelNum1.Text = details.ModelNo;
            //                    lbSerialNum1.Text = details.SerialNo;
            //                    lbSize1.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate1.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate1.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity1.Text = details.Capacity;
            //                    lbCapacityHT1.Text = details.CapacityHeadTest;
            //                    lbFuel1.Text = details.FuelRefrigeration;
            //                    lbMotorManu1.Text = details.MotorManufacturer;
            //                    lbHP1.Text = details.HP;
            //                    lbMotorType1.Text = details.MotorType;

            //                    lbMotorSerialNum1.Text = details.MotorSerialNo;

            //                    lbMotorModel1.Text = details.MotorModel;
            //                    lbFrame1.Text = details.Frame;
            //                    lbRPM1.Text = details.RPM;
            //                    lbVoltage1.Text = details.Voltage;
            //                    lbAmperes1.Text = details.Amperes;
            //                    lbPhaseCycle1.Text = details.PhaseCycle;
            //                    lbBSLClass1.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC1.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule1.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 1)
            //                {
            //                    #region "Load the second equipment"

            //                    lbEquipmentID2.Text = details.EquipID;
            //                    lbLocation2.Text = details.EquipLocation;
            //                    lbTypeUse2.Text = details.TypeOrUse;
            //                    lbManufacturer2.Text = details.Manufacturer;
            //                    lbModelNum2.Text = details.ModelNo;
            //                    lbSerialNum2.Text = details.SerialNo;
            //                    lbSize2.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate2.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate2.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity2.Text = details.Capacity;
            //                    lbCapacityHT2.Text = details.CapacityHeadTest;
            //                    lbFuel2.Text = details.FuelRefrigeration;
            //                    lbMotorManu2.Text = details.MotorManufacturer;
            //                    lbHP2.Text = details.HP;
            //                    lbMotorType2.Text = details.MotorType;

            //                    lbMotorSerialNum2.Text = details.MotorSerialNo;

            //                    lbMotorModel2.Text = details.MotorModel;
            //                    lbFrame2.Text = details.Frame;
            //                    lbRPM2.Text = details.RPM;
            //                    lbVoltage2.Text = details.Voltage;
            //                    lbAmperes2.Text = details.Amperes;
            //                    lbPhaseCycle2.Text = details.PhaseCycle;
            //                    lbBSLClass2.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC2.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule2.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 2)
            //                {
            //                    #region "Load the third equipment"


            //                    lbEquipmentID3.Text = details.EquipID;
            //                    lbLocation3.Text = details.EquipLocation;
            //                    lbTypeUse3.Text = details.TypeOrUse;
            //                    lbManufacturer3.Text = details.Manufacturer;
            //                    lbModelNum3.Text = details.ModelNo;
            //                    lbSerialNum3.Text = details.SerialNo;
            //                    lbSize3.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate3.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate3.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity3.Text = details.Capacity;
            //                    lbCapacityHT3.Text = details.CapacityHeadTest;
            //                    lbFuel3.Text = details.FuelRefrigeration;
            //                    lbMotorManu3.Text = details.MotorManufacturer;
            //                    lbHP3.Text = details.HP;
            //                    lbMotorType3.Text = details.MotorType;

            //                    lbMotorSerialNum3.Text = details.MotorSerialNo;

            //                    lbMotorModel3.Text = details.MotorModel;
            //                    lbFrame3.Text = details.Frame;
            //                    lbRPM3.Text = details.RPM;
            //                    lbVoltage3.Text = details.Voltage;
            //                    lbAmperes3.Text = details.Amperes;
            //                    lbPhaseCycle3.Text = details.PhaseCycle;
            //                    lbBSLClass3.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC3.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule3.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 3)
            //                {
            //                    #region "Load the forth equipment"

            //                    lbEquipmentID4.Text = details.EquipID;
            //                    lbLocation4.Text = details.EquipLocation;
            //                    lbTypeUse4.Text = details.TypeOrUse;
            //                    lbManufacturer4.Text = details.Manufacturer;
            //                    lbModelNum4.Text = details.ModelNo;
            //                    lbSerialNum4.Text = details.SerialNo;
            //                    lbSize4.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate4.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate4.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity4.Text = details.Capacity;
            //                    lbCapacityHT4.Text = details.CapacityHeadTest;
            //                    lbFuel4.Text = details.FuelRefrigeration;
            //                    lbMotorManu4.Text = details.MotorManufacturer;
            //                    lbHP4.Text = details.HP;
            //                    lbMotorType4.Text = details.MotorType;

            //                    lbMotorSerialNum4.Text = details.MotorSerialNo;

            //                    lbMotorModel4.Text = details.MotorModel;
            //                    lbFrame4.Text = details.Frame;
            //                    lbRPM4.Text = details.RPM;
            //                    lbVoltage4.Text = details.Voltage;
            //                    lbAmperes4.Text = details.Amperes;
            //                    lbPhaseCycle4.Text = details.PhaseCycle;
            //                    lbBSLClass4.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC4.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule4.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 4)
            //                {
            //                    #region "Load the fifth equipment"

            //                    lbEquipmentID5.Text = details.EquipID;
            //                    lbLocation5.Text = details.EquipLocation;
            //                    lbTypeUse5.Text = details.TypeOrUse;
            //                    lbManufacturer5.Text = details.Manufacturer;
            //                    lbModelNum5.Text = details.ModelNo;
            //                    lbSerialNum5.Text = details.SerialNo;
            //                    lbSize5.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate5.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate5.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity5.Text = details.Capacity;
            //                    lbCapacityHT5.Text = details.CapacityHeadTest;
            //                    lbFuel5.Text = details.FuelRefrigeration;
            //                    lbMotorManu5.Text = details.MotorManufacturer;
            //                    lbHP5.Text = details.HP;
            //                    lbMotorType5.Text = details.MotorType;

            //                    lbMotorSerialNum5.Text = details.MotorSerialNo;

            //                    lbMotorModel5.Text = details.MotorModel;
            //                    lbFrame5.Text = details.Frame;
            //                    lbRPM5.Text = details.RPM;
            //                    lbVoltage5.Text = details.Voltage;
            //                    lbAmperes5.Text = details.Amperes;
            //                    lbPhaseCycle5.Text = details.PhaseCycle;
            //                    lbBSLClass5.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC5.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule5.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 5)
            //                {
            //                    divMechanicalPage2.Visible = true;
            //                    #region "Load the fifth equipment"
            //                    lbEquipmentID6.Text = details.EquipID;
            //                    lbLocation6.Text = details.EquipLocation;
            //                    lbTypeUse6.Text = details.TypeOrUse;
            //                    lbManufacturer6.Text = details.Manufacturer;
            //                    lbModelNum6.Text = details.ModelNo;
            //                    lbSerialNum6.Text = details.SerialNo;
            //                    lbSize6.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate6.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate6.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity6.Text = details.Capacity;
            //                    lbCapacityHT6.Text = details.CapacityHeadTest;
            //                    lbFuel6.Text = details.FuelRefrigeration;
            //                    lbMotorManu6.Text = details.MotorManufacturer;
            //                    lbHP6.Text = details.HP;
            //                    lbMotorType6.Text = details.MotorType;

            //                    lbMotorSerialNum6.Text = details.MotorSerialNo;

            //                    lbMotorModel6.Text = details.MotorModel;
            //                    lbFrame6.Text = details.Frame;
            //                    lbRPM6.Text = details.RPM;
            //                    lbVoltage6.Text = details.Voltage;
            //                    lbAmperes6.Text = details.Amperes;
            //                    lbPhaseCycle6.Text = details.PhaseCycle;
            //                    lbBSLClass6.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC6.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule6.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 6)
            //                {
            //                    #region "Load the seven equipment"
            //                    lbEquipmentID7.Text = details.EquipID;
            //                    lbLocation7.Text = details.EquipLocation;
            //                    lbTypeUse7.Text = details.TypeOrUse;
            //                    lbManufacturer7.Text = details.Manufacturer;
            //                    lbModelNum7.Text = details.ModelNo;
            //                    lbSerialNum7.Text = details.SerialNo;
            //                    lbSize7.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate7.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate7.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity7.Text = details.Capacity;
            //                    lbCapacityHT7.Text = details.CapacityHeadTest;
            //                    lbFuel7.Text = details.FuelRefrigeration;
            //                    lbMotorManu7.Text = details.MotorManufacturer;
            //                    lbHP7.Text = details.HP;
            //                    lbMotorType7.Text = details.MotorType;

            //                    lbMotorSerialNum7.Text = details.MotorSerialNo;

            //                    lbMotorModel7.Text = details.MotorModel;
            //                    lbFrame7.Text = details.Frame;
            //                    lbRPM7.Text = details.RPM;
            //                    lbVoltage7.Text = details.Voltage;
            //                    lbAmperes7.Text = details.Amperes;
            //                    lbPhaseCycle7.Text = details.PhaseCycle;
            //                    lbBSLClass7.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC7.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule7.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 7)
            //                {
            //                    #region "Load the eigth equipment"
            //                    lbEquipmentID8.Text = details.EquipID;
            //                    lbLocation8.Text = details.EquipLocation;
            //                    lbTypeUse8.Text = details.TypeOrUse;
            //                    lbManufacturer8.Text = details.Manufacturer;
            //                    lbModelNum8.Text = details.ModelNo;
            //                    lbSerialNum8.Text = details.SerialNo;
            //                    lbSize8.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate8.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate8.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity8.Text = details.Capacity;
            //                    lbCapacityHT8.Text = details.CapacityHeadTest;
            //                    lbFuel8.Text = details.FuelRefrigeration;
            //                    lbMotorManu8.Text = details.MotorManufacturer;
            //                    lbHP8.Text = details.HP;
            //                    lbMotorType8.Text = details.MotorType;

            //                    lbMotorSerialNum8.Text = details.MotorSerialNo;

            //                    lbMotorModel8.Text = details.MotorModel;
            //                    lbFrame8.Text = details.Frame;
            //                    lbRPM8.Text = details.RPM;
            //                    lbVoltage8.Text = details.Voltage;
            //                    lbAmperes8.Text = details.Amperes;
            //                    lbPhaseCycle8.Text = details.PhaseCycle;
            //                    lbBSLClass8.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC8.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule8.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 8)
            //                {
            //                    #region "Load the ninth equipment"
            //                    lbEquipmentID9.Text = details.EquipID;
            //                    lbLocation9.Text = details.EquipLocation;
            //                    lbTypeUse9.Text = details.TypeOrUse;
            //                    lbManufacturer9.Text = details.Manufacturer;
            //                    lbModelNum9.Text = details.ModelNo;
            //                    lbSerialNum9.Text = details.SerialNo;
            //                    lbSize9.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate9.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate9.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity9.Text = details.Capacity;
            //                    lbCapacityHT9.Text = details.CapacityHeadTest;
            //                    lbFuel9.Text = details.FuelRefrigeration;
            //                    lbMotorManu9.Text = details.MotorManufacturer;
            //                    lbHP9.Text = details.HP;
            //                    lbMotorType9.Text = details.MotorType;

            //                    lbMotorSerialNum9.Text = details.MotorSerialNo;

            //                    lbMotorModel9.Text = details.MotorModel;
            //                    lbFrame9.Text = details.Frame;
            //                    lbRPM9.Text = details.RPM;
            //                    lbVoltage9.Text = details.Voltage;
            //                    lbAmperes9.Text = details.Amperes;
            //                    lbPhaseCycle9.Text = details.PhaseCycle;
            //                    lbBSLClass9.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC9.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule9.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 9)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID10.Text = details.EquipID;
            //                    lbLocation10.Text = details.EquipLocation;
            //                    lbTypeUse10.Text = details.TypeOrUse;
            //                    lbManufacturer10.Text = details.Manufacturer;
            //                    lbModelNum10.Text = details.ModelNo;
            //                    lbSerialNum10.Text = details.SerialNo;
            //                    lbSize10.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate10.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate10.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity10.Text = details.Capacity;
            //                    lbCapacityHT10.Text = details.CapacityHeadTest;
            //                    lbFuel10.Text = details.FuelRefrigeration;
            //                    lbMotorManu10.Text = details.MotorManufacturer;
            //                    lbHP10.Text = details.HP;
            //                    lbMotorType10.Text = details.MotorType;

            //                    lbMotorSerialNum10.Text = details.MotorSerialNo;

            //                    lbMotorModel10.Text = details.MotorModel;
            //                    lbFrame10.Text = details.Frame;
            //                    lbRPM10.Text = details.RPM;
            //                    lbVoltage10.Text = details.Voltage;
            //                    lbAmperes10.Text = details.Amperes;
            //                    lbPhaseCycle10.Text = details.PhaseCycle;
            //                    lbBSLClass10.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC10.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule10.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 10)
            //                {
            //                    divMechanicalPage3.Visible = true;
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID11.Text = details.EquipID;
            //                    lbLocation11.Text = details.EquipLocation;
            //                    lbTypeUse11.Text = details.TypeOrUse;
            //                    lbManufacturer11.Text = details.Manufacturer;
            //                    lbModelNum11.Text = details.ModelNo;
            //                    lbSerialNum11.Text = details.SerialNo;
            //                    lbSize11.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate11.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate11.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity11.Text = details.Capacity;
            //                    lbCapacityHT11.Text = details.CapacityHeadTest;
            //                    lbFuel11.Text = details.FuelRefrigeration;
            //                    lbMotorManu11.Text = details.MotorManufacturer;
            //                    lbHP11.Text = details.HP;
            //                    lbMotorType11.Text = details.MotorType;

            //                    lbMotorSerialNum11.Text = details.MotorSerialNo;

            //                    lbMotorModel11.Text = details.MotorModel;
            //                    lbFrame11.Text = details.Frame;
            //                    lbRPM11.Text = details.RPM;
            //                    lbVoltage11.Text = details.Voltage;
            //                    lbAmperes11.Text = details.Amperes;
            //                    lbPhaseCycle11.Text = details.PhaseCycle;
            //                    lbBSLClass11.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC11.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule11.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 11)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID12.Text = details.EquipID;
            //                    lbLocation12.Text = details.EquipLocation;
            //                    lbTypeUse12.Text = details.TypeOrUse;
            //                    lbManufacturer12.Text = details.Manufacturer;
            //                    lbModelNum12.Text = details.ModelNo;
            //                    lbSerialNum12.Text = details.SerialNo;
            //                    lbSize12.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate12.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate12.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity12.Text = details.Capacity;
            //                    lbCapacityHT12.Text = details.CapacityHeadTest;
            //                    lbFuel12.Text = details.FuelRefrigeration;
            //                    lbMotorManu12.Text = details.MotorManufacturer;
            //                    lbHP12.Text = details.HP;
            //                    lbMotorType12.Text = details.MotorType;

            //                    lbMotorSerialNum12.Text = details.MotorSerialNo;

            //                    lbMotorModel12.Text = details.MotorModel;
            //                    lbFrame12.Text = details.Frame;
            //                    lbRPM12.Text = details.RPM;
            //                    lbVoltage12.Text = details.Voltage;
            //                    lbAmperes12.Text = details.Amperes;
            //                    lbPhaseCycle12.Text = details.PhaseCycle;
            //                    lbBSLClass12.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC12.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule12.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 12)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID13.Text = details.EquipID;
            //                    lbLocation13.Text = details.EquipLocation;
            //                    lbTypeUse13.Text = details.TypeOrUse;
            //                    lbManufacturer13.Text = details.Manufacturer;
            //                    lbModelNum13.Text = details.ModelNo;
            //                    lbSerialNum13.Text = details.SerialNo;
            //                    lbSize13.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate13.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate13.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity13.Text = details.Capacity;
            //                    lbCapacityHT13.Text = details.CapacityHeadTest;
            //                    lbFuel13.Text = details.FuelRefrigeration;
            //                    lbMotorManu13.Text = details.MotorManufacturer;
            //                    lbHP13.Text = details.HP;
            //                    lbMotorType13.Text = details.MotorType;

            //                    lbMotorSerialNum13.Text = details.MotorSerialNo;

            //                    lbMotorModel13.Text = details.MotorModel;
            //                    lbFrame13.Text = details.Frame;
            //                    lbRPM13.Text = details.RPM;
            //                    lbVoltage13.Text = details.Voltage;
            //                    lbAmperes13.Text = details.Amperes;
            //                    lbPhaseCycle13.Text = details.PhaseCycle;
            //                    lbBSLClass13.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC13.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule13.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 13)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID14.Text = details.EquipID;
            //                    lbLocation14.Text = details.EquipLocation;
            //                    lbTypeUse14.Text = details.TypeOrUse;
            //                    lbManufacturer14.Text = details.Manufacturer;
            //                    lbModelNum14.Text = details.ModelNo;
            //                    lbSerialNum14.Text = details.SerialNo;
            //                    lbSize14.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate14.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate14.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity14.Text = details.Capacity;
            //                    lbCapacityHT14.Text = details.CapacityHeadTest;
            //                    lbFuel14.Text = details.FuelRefrigeration;
            //                    lbMotorManu14.Text = details.MotorManufacturer;
            //                    lbHP14.Text = details.HP;
            //                    lbMotorType14.Text = details.MotorType;

            //                    lbMotorSerialNum14.Text = details.MotorSerialNo;

            //                    lbMotorModel14.Text = details.MotorModel;
            //                    lbFrame14.Text = details.Frame;
            //                    lbRPM14.Text = details.RPM;
            //                    lbVoltage14.Text = details.Voltage;
            //                    lbAmperes14.Text = details.Amperes;
            //                    lbPhaseCycle14.Text = details.PhaseCycle;
            //                    lbBSLClass14.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC14.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule14.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 14)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID15.Text = details.EquipID;
            //                    lbLocation15.Text = details.EquipLocation;
            //                    lbTypeUse15.Text = details.TypeOrUse;
            //                    lbManufacturer15.Text = details.Manufacturer;
            //                    lbModelNum15.Text = details.ModelNo;
            //                    lbSerialNum15.Text = details.SerialNo;
            //                    lbSize15.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate15.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate15.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity15.Text = details.Capacity;
            //                    lbCapacityHT15.Text = details.CapacityHeadTest;
            //                    lbFuel15.Text = details.FuelRefrigeration;
            //                    lbMotorManu15.Text = details.MotorManufacturer;
            //                    lbHP15.Text = details.HP;
            //                    lbMotorType15.Text = details.MotorType;

            //                    lbMotorSerialNum15.Text = details.MotorSerialNo;

            //                    lbMotorModel15.Text = details.MotorModel;
            //                    lbFrame15.Text = details.Frame;
            //                    lbRPM15.Text = details.RPM;
            //                    lbVoltage15.Text = details.Voltage;
            //                    lbAmperes15.Text = details.Amperes;
            //                    lbPhaseCycle15.Text = details.PhaseCycle;
            //                    lbBSLClass15.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC15.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule15.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 15)
            //                {
            //                    divMechanicalPage4.Visible = true;
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID16.Text = details.EquipID;
            //                    lbLocation16.Text = details.EquipLocation;
            //                    lbTypeUse16.Text = details.TypeOrUse;
            //                    lbManufacturer16.Text = details.Manufacturer;
            //                    lbModelNum16.Text = details.ModelNo;
            //                    lbSerialNum16.Text = details.SerialNo;
            //                    lbSize16.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate16.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate16.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity16.Text = details.Capacity;
            //                    lbCapacityHT16.Text = details.CapacityHeadTest;
            //                    lbFuel16.Text = details.FuelRefrigeration;
            //                    lbMotorManu16.Text = details.MotorManufacturer;
            //                    lbHP16.Text = details.HP;
            //                    lbMotorType16.Text = details.MotorType;

            //                    lbMotorSerialNum16.Text = details.MotorSerialNo;

            //                    lbMotorModel16.Text = details.MotorModel;
            //                    lbFrame16.Text = details.Frame;
            //                    lbRPM16.Text = details.RPM;
            //                    lbVoltage16.Text = details.Voltage;
            //                    lbAmperes16.Text = details.Amperes;
            //                    lbPhaseCycle16.Text = details.PhaseCycle;
            //                    lbBSLClass16.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC16.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule16.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 16)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID17.Text = details.EquipID;
            //                    lbLocation17.Text = details.EquipLocation;
            //                    lbTypeUse17.Text = details.TypeOrUse;
            //                    lbManufacturer17.Text = details.Manufacturer;
            //                    lbModelNum17.Text = details.ModelNo;
            //                    lbSerialNum17.Text = details.SerialNo;
            //                    lbSize17.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate17.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate17.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity17.Text = details.Capacity;
            //                    lbCapacityHT17.Text = details.CapacityHeadTest;
            //                    lbFuel17.Text = details.FuelRefrigeration;
            //                    lbMotorManu17.Text = details.MotorManufacturer;
            //                    lbHP17.Text = details.HP;
            //                    lbMotorType17.Text = details.MotorType;

            //                    lbMotorSerialNum17.Text = details.MotorSerialNo;

            //                    lbMotorModel17.Text = details.MotorModel;
            //                    lbFrame17.Text = details.Frame;
            //                    lbRPM17.Text = details.RPM;
            //                    lbVoltage17.Text = details.Voltage;
            //                    lbAmperes17.Text = details.Amperes;
            //                    lbPhaseCycle17.Text = details.PhaseCycle;
            //                    lbBSLClass17.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC17.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule17.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 17)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID18.Text = details.EquipID;
            //                    lbLocation18.Text = details.EquipLocation;
            //                    lbTypeUse18.Text = details.TypeOrUse;
            //                    lbManufacturer18.Text = details.Manufacturer;
            //                    lbModelNum18.Text = details.ModelNo;
            //                    lbSerialNum18.Text = details.SerialNo;
            //                    lbSize18.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate18.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate18.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity18.Text = details.Capacity;
            //                    lbCapacityHT18.Text = details.CapacityHeadTest;
            //                    lbFuel18.Text = details.FuelRefrigeration;
            //                    lbMotorManu18.Text = details.MotorManufacturer;
            //                    lbHP18.Text = details.HP;
            //                    lbMotorType18.Text = details.MotorType;

            //                    lbMotorSerialNum18.Text = details.MotorSerialNo;

            //                    lbMotorModel18.Text = details.MotorModel;
            //                    lbFrame18.Text = details.Frame;
            //                    lbRPM18.Text = details.RPM;
            //                    lbVoltage18.Text = details.Voltage;
            //                    lbAmperes18.Text = details.Amperes;
            //                    lbPhaseCycle18.Text = details.PhaseCycle;
            //                    lbBSLClass18.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC18.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule18.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 18)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID19.Text = details.EquipID;
            //                    lbLocation19.Text = details.EquipLocation;
            //                    lbTypeUse19.Text = details.TypeOrUse;
            //                    lbManufacturer19.Text = details.Manufacturer;
            //                    lbModelNum19.Text = details.ModelNo;
            //                    lbSerialNum19.Text = details.SerialNo;
            //                    lbSize19.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate19.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate19.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity19.Text = details.Capacity;
            //                    lbCapacityHT19.Text = details.CapacityHeadTest;
            //                    lbFuel19.Text = details.FuelRefrigeration;
            //                    lbMotorManu19.Text = details.MotorManufacturer;
            //                    lbHP19.Text = details.HP;
            //                    lbMotorType19.Text = details.MotorType;

            //                    lbMotorSerialNum19.Text = details.MotorSerialNo;

            //                    lbMotorModel19.Text = details.MotorModel;
            //                    lbFrame19.Text = details.Frame;
            //                    lbRPM19.Text = details.RPM;
            //                    lbVoltage19.Text = details.Voltage;
            //                    lbAmperes19.Text = details.Amperes;
            //                    lbPhaseCycle19.Text = details.PhaseCycle;
            //                    lbBSLClass19.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC19.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule19.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 19)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID20.Text = details.EquipID;
            //                    lbLocation20.Text = details.EquipLocation;
            //                    lbTypeUse20.Text = details.TypeOrUse;
            //                    lbManufacturer20.Text = details.Manufacturer;
            //                    lbModelNum20.Text = details.ModelNo;
            //                    lbSerialNum20.Text = details.SerialNo;
            //                    lbSize20.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate20.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate20.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity20.Text = details.Capacity;
            //                    lbCapacityHT20.Text = details.CapacityHeadTest;
            //                    lbFuel20.Text = details.FuelRefrigeration;
            //                    lbMotorManu20.Text = details.MotorManufacturer;
            //                    lbHP20.Text = details.HP;
            //                    lbMotorType20.Text = details.MotorType;

            //                    lbMotorSerialNum20.Text = details.MotorSerialNo;

            //                    lbMotorModel20.Text = details.MotorModel;
            //                    lbFrame20.Text = details.Frame;
            //                    lbRPM20.Text = details.RPM;
            //                    lbVoltage20.Text = details.Voltage;
            //                    lbAmperes20.Text = details.Amperes;
            //                    lbPhaseCycle20.Text = details.PhaseCycle;
            //                    lbBSLClass20.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC20.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule20.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 20)
            //                {
            //                    divMechanicalPage5.Visible = true;
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID21.Text = details.EquipID;
            //                    lbLocation21.Text = details.EquipLocation;
            //                    lbTypeUse21.Text = details.TypeOrUse;
            //                    lbManufacturer21.Text = details.Manufacturer;
            //                    lbModelNum21.Text = details.ModelNo;
            //                    lbSerialNum21.Text = details.SerialNo;
            //                    lbSize21.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate21.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate21.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity21.Text = details.Capacity;
            //                    lbCapacityHT21.Text = details.CapacityHeadTest;
            //                    lbFuel21.Text = details.FuelRefrigeration;
            //                    lbMotorManu21.Text = details.MotorManufacturer;
            //                    lbHP21.Text = details.HP;
            //                    lbMotorType21.Text = details.MotorType;

            //                    lbMotorSerialNum21.Text = details.MotorSerialNo;

            //                    lbMotorModel21.Text = details.MotorModel;
            //                    lbFrame21.Text = details.Frame;
            //                    lbRPM21.Text = details.RPM;
            //                    lbVoltage21.Text = details.Voltage;
            //                    lbAmperes21.Text = details.Amperes;
            //                    lbPhaseCycle21.Text = details.PhaseCycle;
            //                    lbBSLClass21.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC21.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule21.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 21)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID22.Text = details.EquipID;
            //                    lbLocation22.Text = details.EquipLocation;
            //                    lbTypeUse22.Text = details.TypeOrUse;
            //                    lbManufacturer22.Text = details.Manufacturer;
            //                    lbModelNum22.Text = details.ModelNo;
            //                    lbSerialNum22.Text = details.SerialNo;
            //                    lbSize22.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate22.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate22.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity22.Text = details.Capacity;
            //                    lbCapacityHT22.Text = details.CapacityHeadTest;
            //                    lbFuel22.Text = details.FuelRefrigeration;
            //                    lbMotorManu22.Text = details.MotorManufacturer;
            //                    lbHP22.Text = details.HP;
            //                    lbMotorType22.Text = details.MotorType;

            //                    lbMotorSerialNum22.Text = details.MotorSerialNo;

            //                    lbMotorModel22.Text = details.MotorModel;
            //                    lbFrame22.Text = details.Frame;
            //                    lbRPM22.Text = details.RPM;
            //                    lbVoltage22.Text = details.Voltage;
            //                    lbAmperes22.Text = details.Amperes;
            //                    lbPhaseCycle22.Text = details.PhaseCycle;
            //                    lbBSLClass22.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC22.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule22.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 22)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID23.Text = details.EquipID;
            //                    lbLocation23.Text = details.EquipLocation;
            //                    lbTypeUse23.Text = details.TypeOrUse;
            //                    lbManufacturer23.Text = details.Manufacturer;
            //                    lbModelNum23.Text = details.ModelNo;
            //                    lbSerialNum23.Text = details.SerialNo;
            //                    lbSize23.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate23.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate23.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity23.Text = details.Capacity;
            //                    lbCapacityHT23.Text = details.CapacityHeadTest;
            //                    lbFuel23.Text = details.FuelRefrigeration;
            //                    lbMotorManu23.Text = details.MotorManufacturer;
            //                    lbHP23.Text = details.HP;
            //                    lbMotorType23.Text = details.MotorType;

            //                    lbMotorSerialNum23.Text = details.MotorSerialNo;

            //                    lbMotorModel23.Text = details.MotorModel;
            //                    lbFrame23.Text = details.Frame;
            //                    lbRPM23.Text = details.RPM;
            //                    lbVoltage23.Text = details.Voltage;
            //                    lbAmperes23.Text = details.Amperes;
            //                    lbPhaseCycle23.Text = details.PhaseCycle;
            //                    lbBSLClass23.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC23.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule23.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 23)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID24.Text = details.EquipID;
            //                    lbLocation24.Text = details.EquipLocation;
            //                    lbTypeUse24.Text = details.TypeOrUse;
            //                    lbManufacturer24.Text = details.Manufacturer;
            //                    lbModelNum24.Text = details.ModelNo;
            //                    lbSerialNum24.Text = details.SerialNo;
            //                    lbSize24.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate24.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate24.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity24.Text = details.Capacity;
            //                    lbCapacityHT24.Text = details.CapacityHeadTest;
            //                    lbFuel24.Text = details.FuelRefrigeration;
            //                    lbMotorManu24.Text = details.MotorManufacturer;
            //                    lbHP24.Text = details.HP;
            //                    lbMotorType24.Text = details.MotorType;

            //                    lbMotorSerialNum24.Text = details.MotorSerialNo;

            //                    lbMotorModel24.Text = details.MotorModel;
            //                    lbFrame24.Text = details.Frame;
            //                    lbRPM24.Text = details.RPM;
            //                    lbVoltage24.Text = details.Voltage;
            //                    lbAmperes24.Text = details.Amperes;
            //                    lbPhaseCycle24.Text = details.PhaseCycle;
            //                    lbBSLClass24.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC24.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule24.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //                else if (details != null && i == 24)
            //                {
            //                    #region "Load the tenth equipment"
            //                    lbEquipmentID25.Text = details.EquipID;
            //                    lbLocation25.Text = details.EquipLocation;
            //                    lbTypeUse25.Text = details.TypeOrUse;
            //                    lbManufacturer25.Text = details.Manufacturer;
            //                    lbModelNum25.Text = details.ModelNo;
            //                    lbSerialNum25.Text = details.SerialNo;
            //                    lbSize25.Text = details.Size;
            //                    if (details.InstalledDate != DateTime.MinValue)
            //                        lbInstalledDate25.Text = details.InstalledDate.ToShortDateString();
            //                    if (details.MotorInstalledDate != DateTime.MinValue)
            //                        lbMotorInstalledDate25.Text = details.MotorInstalledDate.ToShortDateString();

            //                    lbCapacity25.Text = details.Capacity;
            //                    lbCapacityHT25.Text = details.CapacityHeadTest;
            //                    lbFuel25.Text = details.FuelRefrigeration;
            //                    lbMotorManu25.Text = details.MotorManufacturer;
            //                    lbHP25.Text = details.HP;
            //                    lbMotorType25.Text = details.MotorType;

            //                    lbMotorSerialNum25.Text = details.MotorSerialNo;

            //                    lbMotorModel25.Text = details.MotorModel;
            //                    lbFrame25.Text = details.Frame;
            //                    lbRPM25.Text = details.RPM;
            //                    lbVoltage25.Text = details.Voltage;
            //                    lbAmperes25.Text = details.Amperes;
            //                    lbPhaseCycle25.Text = details.PhaseCycle;
            //                    lbBSLClass25.Text = details.BslClassification;

            //                    if (details.TJCValue > 0)
            //                    { lbTJC25.Text = details.TJCValue.ToString(); }
            //                    lbPMSchedule25.Text = details.PMSchedule;

            //                    #endregion
            //                }
            //            }
            //        }
            //        else
            //        {
            //            //if only 1 facility
            //            #region "Load from facility table only"
            //            //txtEquipmentID1.Text = details.EquipID;
            //            //location is not in facility
            //            lbLocation1.Text = existingFac.EquipLocation;
            //            lbTypeUse1.Text = existingFac.TypeOrUse;
            //            lbManufacturer1.Text = existingFac.Manufacturer;
            //            lbModelNum1.Text = existingFac.ModelNo;
            //            lbSerialNum1.Text = existingFac.SerialNo;
            //            lbSize1.Text = existingFac.Size;

            //            if (existingFac.InstalledDate != DateTime.MinValue)
            //                lbInstalledDate1.Text = existingFac.InstalledDate.ToShortDateString();
            //            if (existingFac.MotorInstalledDate != DateTime.MinValue)
            //                lbMotorInstalledDate1.Text = existingFac.MotorInstalledDate.ToShortDateString();

            //            lbCapacity1.Text = existingFac.Capacity;
            //            lbCapacityHT1.Text = existingFac.CapacityHeadTest;
            //            lbFuel1.Text = existingFac.FuelRefrigeration;
            //            lbMotorManu1.Text = existingFac.MotorManufacturer;
            //            lbHP1.Text = existingFac.HP;
            //            lbMotorType1.Text = existingFac.MotorType;

            //            lbMotorSerialNum1.Text = existingFac.MotorSerialNo;

            //            lbMotorModel1.Text = existingFac.MotorModel;
            //            lbFrame1.Text = existingFac.Frame;
            //            lbRPM1.Text = existingFac.RPM;
            //            lbVoltage1.Text = existingFac.Voltage;
            //            lbAmperes1.Text = existingFac.Amperes;
            //            lbPhaseCycle1.Text = existingFac.PhaseCycle;
            //            lbBSLClass1.Text = existingFac.BslClassification;

            //            if (existingFac.TJCValue > 0)
            //            { lbTJC1.Text = existingFac.TJCValue.ToString(); }
            //            lbPMSchedule1.Text = existingFac.PMSchedule;
            //            #endregion
            //        }

            //    }
            //    #endregion
            //}
            //else
            //{
            //    lbFacNum.Text = " No Record Found.";
            //}


        }

        // }
    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIH.CMMS.Inventory.BOL.Facility;
using NIH.CMMS.Inventory.BPL.Facility;

public partial class PrintEleEquipment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int equipID = 0;//T00039
            equipID = 39;
           
            //if (Request.QueryString["equipmentSysID"] != null && !string.IsNullOrEmpty(Request.QueryString["equipmentSysID"].ToString()))
            //{
            //    if (Int32.TryParse(Request.QueryString["equipmentSysID"].ToString(), out equipID))
            //    {
                    FacilityDet details = facility_logic.GetEleMechaEquipDetails(equipID);
                    if (details != null)
                    {
                        #region "Load general facility detail"   
                        if (details.Status.ToLower() == "active")
                        { lbFacNum.Text = "<b><font color='green'>" + details.FacNum + "(" + details.Status + ")</font></b>"; }
                        else
                        { lbFacNum.Text = "<b><font color='red'>" + details.FacNum + "(" + details.Status + ")</font></b>"; }


                        lbFacSystem.Text = details.FacSystem;
                        lbFacBuilding.Text = details.FacBuilding;
                        lbFacFunction.Text = details.FacFunction;
                        lbFacFloor.Text = details.FacFloor;
                        lbFacLocation.Text = details.FacLocation;
                        lbFacFacilityID.Text = details.FacID;

                        lbWRNumber.Text = details.WRNumber;
                        ckAAALAC.Checked = (details.YsnAaalac == 1) ? true : false;
                        ckBSL.Checked = (details.YsnBsl == 1) ? true : false;
                        ckTJC.Checked = (details.YsnTJC == 1) ? true : false;
                        lbEletricalComments.Text = details.Comment;

                        #endregion

                        #region "load detail info"
                        //lbEquipmentID.Text = details.EquipID;
                       // lbTypeOrUse.Text = details.TypeOrUse;
                        lbManufacturer.Text = details.Manufacturer;
                        lbVolts.Text = details.Volts;
                        lbAMP.Text = details.AMP;
                        lbKVA.Text = details.KVA;
                        lbVoltsPrimary.Text = details.VoltsPrimary;
                        lbVoltsSecondary.Text = details.VoltsSecondary;
                        lbPH.Text = details.PH;
                        lbW.Text = details.W;
                        lbNumCKTS.Text = details.CktsNum;
                        lbCKTSUsed.Text = details.CktsUsed;

                        
                        //txtElectricalOther.Text = details.ElectricalOther;

                        //txtModelNum.Text = details.ModelNo;
                        //txtSerialNum.Text = details.SerialNo;
                        //txtSize.Text = details.Size;

                        //if (details.InstalledDate != DateTime.MinValue)
                        //    txtInstalledDate.Text = details.InstalledDate.ToShortDateString();

                        //txtInventoryBy.Text = details.InventoryBy;
                        //if (details.InventoryDate != DateTime.MinValue)
                        //    txtInventoryDate.Text = details.InventoryDate.ToShortDateString();
                   
                        //txtBSLClass.Text = details.BslClassification;

                        //if (details.TJCValue > 0)
                        //{ txtTJC.Text = details.TJCValue.ToString(); }
                        //txtPMSchedule.Text = details.PMSchedule;

                        //if (!string.IsNullOrEmpty(details.LastUpdatedBy))
                        //    lbLastUpdatedBy.Text = "Last updated by: " + details.LastUpdatedBy + " on " + details.LastUpdatedDate.ToShortDateString();
                        #endregion

                        //show attachments
                    }

                  
            //    }              
            //    else
            //    {
            //        lbFacNum.Text = " No Record Found.";
            //    }

            //}
            //else
            //{
            //    lbFacNum.Text = " No Record Found.";
            //}

        }
    }
}
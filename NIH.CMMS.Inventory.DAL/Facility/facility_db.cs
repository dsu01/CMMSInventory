using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NIH.CMMS.Inventory.BOL.Facility;
using System.Data.SqlClient;
using NIH.CMMS.Inventory.DAL.Utility;
using System.Data;
using NIH.CMMS.Inventory.BOL.Common;

namespace NIH.CMMS.Inventory.DAL.Facility
{
    public static class facility_db
    {
        public static FacilityDet GetFacilityDetails(int facSystemID)
        {
            FacilityDet details = null;
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@ID", facSystemID));           
            DataSet ds = DBCommands.GetData("spn_Inv_GetFacilityDetail", sqlParams);
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                //populate wr fieds
                details = new FacilityDet();
                DataRow row = ds.Tables[0].Rows[0];
                details.Key = facSystemID;
                details.FacTempNum = row["Facility#Temp"].ToString(); 
                if (row["Facility#"].ToString() != "")
                { details.FacNum = row["Facility#"].ToString(); }
                if (row["FacilityFunction"].ToString() != "")
                { details.FacFunction = row["FacilityFunction"].ToString(); }
                if (row["Floor"].ToString() != "")
                { details.FacFloor = row["Floor"].ToString(); }
                if (row["FacilitySystem"].ToString() != "")
                { details.FacSystem = row["FacilitySystem"].ToString(); }
                if (row["FacilityID"].ToString() != "")
                { details.FacID = row["FacilityID"].ToString(); }
                if (row["Building"].ToString() != "")
                { details.FacBuilding = row["Building"].ToString(); }

                if (row["location"].ToString() != "")
                { details.FacLocation = row["location"].ToString(); }
                if (row["WorkRequest#"].ToString() != "")
                { details.WRNumber = row["WorkRequest#"].ToString(); }
                if (row["BSL"].ToString() != "")
                { details.YsnBsl = Convert.ToInt32(row["BSL"].ToString()); }
                if (row["AAALAC"].ToString() != "")
                { details.YsnAaalac = Convert.ToInt32(row["AAALAC"].ToString()); }
                if (row["TJC"].ToString() != "")
                { details.YsnTJC = Convert.ToInt32(row["TJC"].ToString()); }
                if (row["Comments"].ToString() != "")
                { details.Comment = row["Comments"].ToString(); }
                if (row["Status"].ToString() != "")
                { details.Status = row["Status"].ToString(); }

                if (row["TypeorUse"].ToString() != "")
                { details.TypeOrUse = row["TypeorUse"].ToString(); }
                if (row["Manufacturer"].ToString() != "")
                { details.Manufacturer = row["Manufacturer"].ToString(); }
                if (row["Model"].ToString() != "")
                { details.ModelNo = row["Model"].ToString(); }
                if (row["SerialNo"].ToString() != "")
                { details.SerialNo = row["SerialNo"].ToString(); }
                if (row["Size"].ToString() != "")
                { details.Size = row["Size"].ToString(); }
                if (row["InstallDate"].ToString() != "")
                { details.InstalledDate = Convert.ToDateTime(row["InstallDate"].ToString()); }
                if (row["Capacity"].ToString() != "")
                { details.Capacity = row["Capacity"].ToString(); }
                if (row["CapacityHeadTest"].ToString() != "")
                { details.CapacityHeadTest = row["CapacityHeadTest"].ToString(); }
                if (row["FuelRefrigeration"].ToString() != "")
                { details.FuelRefrigeration = row["FuelRefrigeration"].ToString(); }
                if (row["MotorManufacturer"].ToString() != "")
                { details.MotorManufacturer = row["MotorManufacturer"].ToString(); }
                if (row["HP"].ToString() != "")
                { details.HP = row["HP"].ToString(); }

                if (row["MotorType"].ToString() != "")
                { details.MotorType = row["MotorType"].ToString(); }
                if (row["MotorSerialNo"].ToString() != "")
                { details.MotorSerialNo = row["MotorSerialNo"].ToString(); }
                if (row["MotorInstallDate"].ToString() != "")
                { details.MotorInstalledDate = Convert.ToDateTime(row["MotorInstallDate"].ToString()); }
                if (row["MotorModel"].ToString() != "")
                { details.MotorModel = row["MotorModel"].ToString(); }
                if (row["Frame"].ToString() != "")
                { details.Frame = row["Frame"].ToString(); }
                if (row["RPM"].ToString() != "")
                { details.RPM = row["RPM"].ToString(); }
                if (row["Voltage"].ToString() != "")
                { details.Voltage = row["Voltage"].ToString(); }
                if (row["Amperes"].ToString() != "")
                { details.Amperes = row["Amperes"].ToString(); }
                if (row["PhaseCycle"].ToString() != "")
                { details.PhaseCycle = row["PhaseCycle"].ToString(); }
                if (row["BSLClassification"].ToString() != "")
                { details.BslClassification = row["BSLClassification"].ToString(); }
                if (row["PMSchedule"].ToString() != "")
                { details.PMSchedule = row["PMSchedule"].ToString(); }
                if (row["TJCValue"].ToString() != "")
                { details.TJCValue = Convert.ToInt16(row["TJCValue"].ToString()); }

                if (row["FacilityGroup"].ToString() != "")
                { details.FacilityGroup = row["FacilityGroup"].ToString(); }

                //if (row["VOLTS"].ToString() != "")
                //{ details.Volts = row["VOLTS"].ToString(); }
                //if (row["AMP"].ToString() != "")
                //{ details.AMP = row["AMP"].ToString(); }
                //if (row["KVA"].ToString() != "")
                //{ details.KVA = row["KVA"].ToString(); }
                //if (row["VOLTSprimary"].ToString() != "")
                //{ details.VoltsPrimary = row["VOLTSprimary"].ToString(); }
                //if (row["VOLTSSecondary"].ToString() != "")
                //{ details.VoltsSecondary = row["VOLTSSecondary"].ToString(); }
                //if (row["PH"].ToString() != "")
                //{ details.PH = row["PH"].ToString(); }
                //if (row["W"].ToString() != "")
                //{ details.W = row["W"].ToString(); }
                //if (row["NOofCKTS"].ToString() != "")
                //{ details.CktsNum = row["NOofCKTS"].ToString(); }
                //if (row["CKTSUsed"].ToString() != "")
                //{ details.CktsUsed = row["CKTSUsed"].ToString(); }
              
            }

            return details;
        }

        public static FacilityDet GetFacilityDetailsByFacNum(string facNum)
        {
            FacilityDet details = null;
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@FacNum", facNum));
            DataSet ds = DBCommands.GetData("spn_Inv_GetFacilityDetailsByFacNum", sqlParams);
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                //populate wr fieds
                details = new FacilityDet();
                DataRow row = ds.Tables[0].Rows[0];
                details.Key = Convert.ToInt32(row["ID"].ToString());
                details.FacTempNum = row["Facility#Temp"].ToString();
                details.FacNum = facNum;

                if (row["FacilityFunction"].ToString() != "")
                { details.FacFunction = row["FacilityFunction"].ToString(); }
                if (row["Floor"].ToString() != "")
                { details.FacFloor = row["Floor"].ToString(); }
                if (row["FacilitySystem"].ToString() != "")
                { details.FacSystem = row["FacilitySystem"].ToString(); }
                if (row["FacilityID"].ToString() != "")
                { details.FacID = row["FacilityID"].ToString(); }
                if (row["Building"].ToString() != "")
                { details.FacBuilding = row["Building"].ToString(); }

                if (row["location"].ToString() != "")
                { details.FacLocation = row["location"].ToString(); }
                if (row["WorkRequest#"].ToString() != "")
                { details.WRNumber = row["WorkRequest#"].ToString(); }
                if (row["BSL"].ToString() != "")
                { details.YsnBsl = Convert.ToInt32(row["BSL"].ToString()); }
                if (row["AAALAC"].ToString() != "")
                { details.YsnAaalac = Convert.ToInt32(row["AAALAC"].ToString()); }
                if (row["TJC"].ToString() != "")
                { details.YsnTJC = Convert.ToInt32(row["TJC"].ToString()); }
                if (row["Comments"].ToString() != "")
                { details.Comment = row["Comments"].ToString(); }
                if (row["Status"].ToString() != "")
                { details.Status = row["Status"].ToString(); }

                if (row["TypeorUse"].ToString() != "")
                { details.TypeOrUse = row["TypeorUse"].ToString(); }
                if (row["Manufacturer"].ToString() != "")
                { details.Manufacturer = row["Manufacturer"].ToString(); }
                if (row["Model"].ToString() != "")
                { details.ModelNo = row["Model"].ToString(); }
                if (row["SerialNo"].ToString() != "")
                { details.SerialNo = row["SerialNo"].ToString(); }
                if (row["Size"].ToString() != "")
                { details.Size = row["Size"].ToString(); }
                if (row["InstallDate"].ToString() != "")
                { details.InstalledDate = Convert.ToDateTime(row["InstallDate"].ToString()); }
                if (row["Capacity"].ToString() != "")
                { details.Capacity = row["Capacity"].ToString(); }
                if (row["CapacityHeadTest"].ToString() != "")
                { details.CapacityHeadTest = row["CapacityHeadTest"].ToString(); }
                if (row["FuelRefrigeration"].ToString() != "")
                { details.FuelRefrigeration = row["FuelRefrigeration"].ToString(); }
                if (row["MotorManufacturer"].ToString() != "")
                { details.MotorManufacturer = row["MotorManufacturer"].ToString(); }
                if (row["HP"].ToString() != "")
                { details.HP = row["HP"].ToString(); }

                if (row["MotorType"].ToString() != "")
                { details.MotorType = row["MotorType"].ToString(); }
                if (row["MotorSerialNo"].ToString() != "")
                { details.MotorSerialNo = row["MotorSerialNo"].ToString(); }
                if (row["MotorInstallDate"].ToString() != "")
                { details.MotorInstalledDate = Convert.ToDateTime(row["MotorInstallDate"].ToString()); }
                if (row["MotorModel"].ToString() != "")
                { details.MotorModel = row["MotorModel"].ToString(); }
                if (row["Frame"].ToString() != "")
                { details.Frame = row["Frame"].ToString(); }
                if (row["RPM"].ToString() != "")
                { details.RPM = row["RPM"].ToString(); }
                if (row["Voltage"].ToString() != "")
                { details.Voltage = row["Voltage"].ToString(); }
                if (row["Amperes"].ToString() != "")
                { details.Amperes = row["Amperes"].ToString(); }
                if (row["PhaseCycle"].ToString() != "")
                { details.PhaseCycle = row["PhaseCycle"].ToString(); }
                if (row["BSLClassification"].ToString() != "")
                { details.BslClassification = row["BSLClassification"].ToString(); }
                if (row["PMSchedule"].ToString() != "")
                { details.PMSchedule = row["PMSchedule"].ToString(); }
                if (row["TJCValue"].ToString() != "")
                { details.TJCValue = Convert.ToInt16(row["TJCValue"].ToString()); }

                if (row["FacilityGroup"].ToString() != "")
                { details.FacilityGroup = row["FacilityGroup"].ToString(); }

                //if (row["VOLTS"].ToString() != "")
                //{ details.Volts = row["VOLTS"].ToString(); }
                //if (row["AMP"].ToString() != "")
                //{ details.AMP = row["AMP"].ToString(); }
                //if (row["KVA"].ToString() != "")
                //{ details.KVA = row["KVA"].ToString(); }
                //if (row["VOLTSprimary"].ToString() != "")
                //{ details.VoltsPrimary = row["VOLTSprimary"].ToString(); }
                //if (row["VOLTSSecondary"].ToString() != "")
                //{ details.VoltsSecondary = row["VOLTSSecondary"].ToString(); }
                //if (row["PH"].ToString() != "")
                //{ details.PH = row["PH"].ToString(); }
                //if (row["W"].ToString() != "")
                //{ details.W = row["W"].ToString(); }
                //if (row["NOofCKTS"].ToString() != "")
                //{ details.CktsNum = row["NOofCKTS"].ToString(); }
                //if (row["CKTSUsed"].ToString() != "")
                //{ details.CktsUsed = row["CKTSUsed"].ToString(); }

            }

            return details;
        }

        public static FacilityDet GetElectrialEquipDetails(int facSystemID)
        {
            FacilityDet details = null;
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@ID", facSystemID));
            DataSet ds = DBCommands.GetData("spn_Inv_GetFacilityDetail", sqlParams);
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                //populate wr fieds
                details = new FacilityDet();
                DataRow row = ds.Tables[0].Rows[0];
                details.Key = facSystemID;
                details.FacTempNum = row["Facility#Temp"].ToString();
                if (row["Facility#"].ToString() != "")
                { details.FacNum = row["Facility#"].ToString(); }
                if (row["FacilityFunction"].ToString() != "")
                { details.FacFunction = row["FacilityFunction"].ToString(); }
                if (row["Floor"].ToString() != "")
                { details.FacFloor = row["Floor"].ToString(); }
                if (row["FacilitySystem"].ToString() != "")
                { details.FacSystem = row["FacilitySystem"].ToString(); }
                if (row["FacilityID"].ToString() != "")
                { details.FacID = row["FacilityID"].ToString(); }
                if (row["Building"].ToString() != "")
                { details.FacBuilding = row["Building"].ToString(); }
                if (row["Status"].ToString() != "")
                { details.Status = row["Status"].ToString(); }

                if (row["location"].ToString() != "")
                { details.FacLocation = row["location"].ToString(); }
                if (row["WorkRequest#"].ToString() != "")
                { details.WRNumber = row["WorkRequest#"].ToString(); }
                if (row["BSL"].ToString() != "")
                { details.YsnBsl = Convert.ToInt32(row["BSL"].ToString()); }
                if (row["AAALAC"].ToString() != "")
                { details.YsnAaalac = Convert.ToInt32(row["AAALAC"].ToString()); }
                if (row["TJC"].ToString() != "")
                { details.YsnTJC = Convert.ToInt32(row["TJC"].ToString()); }
                if (row["Comments"].ToString() != "")
                { details.Comment = row["Comments"].ToString(); }

                if (row["FacilityGroup"].ToString() != "")
                { details.FacilityGroup = row["FacilityGroup"].ToString(); }

                if (row["TypeorUse"].ToString() != "")
                { details.TypeOrUse = row["TypeorUse"].ToString(); }
                if (row["Manufacturer"].ToString() != "")
                { details.Manufacturer = row["Manufacturer"].ToString(); }
                if (row["ElectricalOther"].ToString() != "")
                { details.ElectricalOther = row["ElectricalOther"].ToString(); }

                //if (row["Model"].ToString() != "")
                //{ details.ModelNo = row["Model"].ToString(); }
                //if (row["SerialNo"].ToString() != "")
                //{ details.SerialNo = row["SerialNo"].ToString(); }
                //if (row["Size"].ToString() != "")
                //{ details.Size = row["Size"].ToString(); }
                //if (row["InstallDate"].ToString() != "")
                //{ details.InstalledDate = Convert.ToDateTime(row["InstallDate"].ToString()); }
                //if (row["Capacity"].ToString() != "")
                //{ details.Capacity = row["Capacity"].ToString(); }
                //if (row["CapacityHeadTest"].ToString() != "")
                //{ details.CapacityHeadTest = row["CapacityHeadTest"].ToString(); }
                //if (row["FuelRefrigeration"].ToString() != "")
                //{ details.FuelRefrigeration = row["FuelRefrigeration"].ToString(); }
                //if (row["MotorManufacturer"].ToString() != "")
                //{ details.MotorManufacturer = row["MotorManufacturer"].ToString(); }
                //if (row["HP"].ToString() != "")
                //{ details.HP = row["HP"].ToString(); }

                //if (row["MotorType"].ToString() != "")
                //{ details.MotorType = row["MotorType"].ToString(); }
                //if (row["MotorSerialNo"].ToString() != "")
                //{ details.MotorSerialNo = row["MotorSerialNo"].ToString(); }
                //if (row["MotorInstallDate"].ToString() != "")
                //{ details.MotorInstalledDate = Convert.ToDateTime(row["MotorInstallDate"].ToString()); }
                //if (row["MotorModel"].ToString() != "")
                //{ details.MotorModel = row["MotorModel"].ToString(); }
                //if (row["Frame"].ToString() != "")
                //{ details.CapacityHeadTest = row["Frame"].ToString(); }
                //if (row["RPM"].ToString() != "")
                //{ details.RPM = row["RPM"].ToString(); }
                //if (row["Voltage"].ToString() != "")
                //{ details.Voltage = row["Voltage"].ToString(); }
                //if (row["Amperes"].ToString() != "")
                //{ details.Amperes = row["Amperes"].ToString(); }
                //if (row["PhaseCycle"].ToString() != "")
                //{ details.PhaseCycle = row["PhaseCycle"].ToString(); }
                //if (row["BSLClassification"].ToString() != "")
                //{ details.BslClassification = row["BSLClassification"].ToString(); }
                //if (row["PMSchedule"].ToString() != "")
                //{ details.PMSchedule = row["PMSchedule"].ToString(); }
                //if (row["TJCValue"].ToString() != "")
                //{ details.TJCValue = Convert.ToInt16(row["TJCValue"].ToString()); }

                if (row["VOLTS"].ToString() != "")
                { details.Volts = row["VOLTS"].ToString(); }
                if (row["AMP"].ToString() != "")
                { details.AMP = row["AMP"].ToString(); }
                if (row["KVA"].ToString() != "")
                { details.KVA = row["KVA"].ToString(); }
                if (row["VOLTSprimary"].ToString() != "")
                { details.VoltsPrimary = row["VOLTSprimary"].ToString(); }
                if (row["VOLTSSecondary"].ToString() != "")
                { details.VoltsSecondary = row["VOLTSSecondary"].ToString(); }
                if (row["PH"].ToString() != "")
                { details.PH = row["PH"].ToString(); }
                if (row["W"].ToString() != "")
                { details.W = row["W"].ToString(); }
                if (row["NOofCKTS"].ToString() != "")
                { details.CktsNum = row["NOofCKTS"].ToString(); }
                if (row["CKTSUsed"].ToString() != "")
                { details.CktsUsed = row["CKTSUsed"].ToString(); }
            }

            return details;
        }
        public static List<EquipmentDet> GetEquipmentList(string parentFacID)
        {
            List<EquipmentDet> equipList = null;
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@FacilityNum", parentFacID));
            DataSet ds = DBCommands.GetData("spn_Inv_GetEquipmentList", sqlParams);
        
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                equipList = new List<EquipmentDet>();
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    EquipmentDet details = new EquipmentDet();
                    details.ParentFacilityNum = parentFacID;
                    equipList.Add(PopulateEquipmentDet(row, details, false));
                }
            }

            return equipList;
        }

        private static EquipmentDet PopulateEquipmentDet(DataRow row, EquipmentDet details, bool isFacility)
        {            
            if (!isFacility)
            {
                details.EquipID = row["EquipmentID"].ToString();
                if (row["Location"].ToString() != "")
                { details.EquipLocation = row["Location"].ToString(); }
                details.EquipSequenceNum = (int)row["EquipmentSerialNo"];
            }

            details.Key = (int)row["ID"];
            if (row["TypeorUse"].ToString() != "")
            { details.TypeOrUse = row["TypeorUse"].ToString(); }
            if (row["Manufacturer"].ToString() != "")
            { details.Manufacturer = row["Manufacturer"].ToString(); }
            if (row["Model"].ToString() != "")
            { details.ModelNo = row["Model"].ToString(); }
            if (row["SerialNo"].ToString() != "")
            { details.SerialNo = row["SerialNo"].ToString(); }
            if (row["Size"].ToString() != "")
            { details.Size = row["Size"].ToString(); }
            if (row["InstallDate"].ToString() != "")
            { details.InstalledDate = Convert.ToDateTime(row["InstallDate"].ToString()); }
            if (row["Capacity"].ToString() != "")
            { details.Capacity = row["Capacity"].ToString(); }
            if (row["CapacityHeadTest"].ToString() != "")
            { details.CapacityHeadTest = row["CapacityHeadTest"].ToString(); }
            if (row["FuelRefrigeration"].ToString() != "")
            { details.FuelRefrigeration = row["FuelRefrigeration"].ToString(); }
            if (row["MotorManufacturer"].ToString() != "")
            { details.MotorManufacturer = row["MotorManufacturer"].ToString(); }
            if (row["HP"].ToString() != "")
            { details.HP = row["HP"].ToString(); }

            if (row["MotorType"].ToString() != "")
            { details.MotorType = row["MotorType"].ToString(); }
            if (row["MotorSerialNo"].ToString() != "")
            { details.MotorSerialNo = row["MotorSerialNo"].ToString(); }
            if (row["MotorInstallDate"].ToString() != "")
            { details.MotorInstalledDate = Convert.ToDateTime(row["MotorInstallDate"].ToString()); }
            if (row["MotorModel"].ToString() != "")
            { details.MotorModel = row["MotorModel"].ToString(); }
            if (row["Frame"].ToString() != "")
            { details.Frame = row["Frame"].ToString(); }

            if (row["RPM"].ToString() != "")
            { details.RPM = row["RPM"].ToString(); }
            if (row["Voltage"].ToString() != "")
            { details.Voltage = row["Voltage"].ToString(); }
            if (row["Amperes"].ToString() != "")
            { details.Amperes = row["Amperes"].ToString(); }
            if (row["PhaseCycle"].ToString() != "")
            { details.PhaseCycle = row["PhaseCycle"].ToString(); }
            if (row["BSLClassification"].ToString() != "")
            { details.BslClassification = row["BSLClassification"].ToString(); }
            if (row["PMSchedule"].ToString() != "")
            { details.PMSchedule = row["PMSchedule"].ToString(); }
            if (row["TJCValue"].ToString() != "")
            { details.TJCValue = Convert.ToInt16(row["TJCValue"].ToString()); }

            return details;
        }

        //private static EquipEletrical PopulateEletricalEquipmentDet(DataRow row)
        //{
        //    EquipEletrical details = new EquipEletrical();
          
        //    details.EquipID = row["FacilityID"].ToString();
            
        //    details.Key = (int)row["ID"];
        //    details.FacTempNum = row["Facility#Temp"].ToString();
        //    if (row["Facility#"].ToString() != "")
        //    { details.FacNum = row["Facility#"].ToString(); }
        //    if (row["FacilityFunction"].ToString() != "")
        //    { details.FacFunction = row["FacilityFunction"].ToString(); }
        //    if (row["Floor"].ToString() != "")
        //    { details.FacFloor = row["Floor"].ToString(); }
        //    if (row["FacilitySystem"].ToString() != "")
        //    { details.FacSystem = row["FacilitySystem"].ToString(); }
          
        //    if (row["Building"].ToString() != "")
        //    { details.FacBuilding = row["Building"].ToString(); }

        //    if (row["location"].ToString() != "")
        //    { details.FacLocation = row["location"].ToString(); }
        //    if (row["WorkRequest#"].ToString() != "")
        //    { details.WRNumber = row["WorkRequest#"].ToString(); }
        //    if (row["BSL"].ToString() != "")
        //    { details.YsnBsl = Convert.ToInt32(row["BSL"].ToString()); }
        //    if (row["AAALAC"].ToString() != "")
        //    { details.YsnAaalac = Convert.ToInt32(row["AAALAC"].ToString()); }
        //    if (row["TJC"].ToString() != "")
        //    { details.YsnTJC = Convert.ToInt32(row["TJC"].ToString()); }
        //    if (row["Comments"].ToString() != "")
        //    { details.Comment = row["Comments"].ToString(); }
        //    if (row["TypeorUse"].ToString() != "")
        //    { details.TypeOrUse = row["TypeorUse"].ToString(); }
        //    if (row["Manufacturer"].ToString() != "")
        //    { details.Manufacturer = row["Manufacturer"].ToString(); }

        //    if (row["VOLTS"].ToString() != "")
        //    { details.Volts = row["VOLTS"].ToString(); }
        //    if (row["AMP"].ToString() != "")
        //    { details.AMP = row["AMP"].ToString(); }
        //    if (row["KVA"].ToString() != "")
        //    { details.KVA = row["KVA"].ToString(); }
        //    if (row["VOLTSprimary"].ToString() != "")
        //    { details.VoltsPrimary = row["VOLTSprimary"].ToString(); }
        //    if (row["VOLTSSecondary"].ToString() != "")
        //    { details.VoltsSecondary = row["VOLTSSecondary"].ToString(); }
        //    if (row["PH"].ToString() != "")
        //    { details.PH = row["PH"].ToString(); }
        //    if (row["W"].ToString() != "")
        //    { details.W = row["W"].ToString(); }
        //    if (row["NOofCKTS"].ToString() != "")
        //    { details.CktsNum = row["NOofCKTS"].ToString(); }
        //    if (row["CKTSUsed"].ToString() != "")
        //    { details.CktsUsed = row["CKTSUsed"].ToString(); }

        //    return details;
        //}

        public static ValidationResult UpdateFacilityDetails(FacilityDet details, bool fullInfo)
        {
            //update/insert data into database
            String result = "";
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            SqlParameter paramID = DBCommands.ParameterMaker("@ID", SqlDbType.Int, 10, ParameterDirection.InputOutput, details.Key);
            sqlParams.Add(paramID);
            SqlParameter paramNum= DBCommands.ParameterMaker("@FacilityNo", SqlDbType.VarChar, 50, ParameterDirection.InputOutput, details.FacNum);
            sqlParams.Add(paramNum);
            sqlParams.Add(new SqlParameter("@System", details.FacSystem));
            sqlParams.Add(new SqlParameter("@Building", details.FacBuilding));
            sqlParams.Add(new SqlParameter("@FacilityID", details.FacID));
            sqlParams.Add(new SqlParameter("@Comments", String.IsNullOrEmpty(details.Comment) ? DBNull.Value : (Object)details.Comment));
            sqlParams.Add(new SqlParameter("@Floor", String.IsNullOrEmpty(details.FacFloor) ? DBNull.Value : (Object)details.FacFloor));
            sqlParams.Add(new SqlParameter("@FacilityLocation", String.IsNullOrEmpty(details.FacLocation) ? DBNull.Value : (Object)details.FacLocation));
            sqlParams.Add(new SqlParameter("@WorkRequestNo", String.IsNullOrEmpty(details.WRNumber) ? DBNull.Value : (Object)details.WRNumber));
            sqlParams.Add(new SqlParameter("@Function", String.IsNullOrEmpty(details.FacFunction) ? DBNull.Value : (Object)details.FacFunction));
            sqlParams.Add(new SqlParameter("@BSL", (Object)details.YsnBsl));
            sqlParams.Add(new SqlParameter("@AAALAC", (Object)details.YsnAaalac));
            sqlParams.Add(new SqlParameter("@TJC", (Object)details.YsnTJC));
            //equpid will have either empty or "-1"
            sqlParams.Add(new SqlParameter("@EquipmentID", String.IsNullOrEmpty(details.EquipID) ? DBNull.Value : (Object)details.EquipID));
            sqlParams.Add(new SqlParameter("@EquipmentLocation", String.IsNullOrEmpty(details.EquipLocation) ? DBNull.Value : (Object)details.EquipLocation));
            sqlParams.Add(new SqlParameter("@TypeorUse", String.IsNullOrEmpty(details.TypeOrUse) ? DBNull.Value : (Object)details.TypeOrUse));
            sqlParams.Add(new SqlParameter("@Manufacturer", String.IsNullOrEmpty(details.Manufacturer) ? DBNull.Value : (Object)details.Manufacturer));
            sqlParams.Add(new SqlParameter("@ModelNo", String.IsNullOrEmpty(details.ModelNo) ? DBNull.Value : (Object)details.ModelNo));
            sqlParams.Add(new SqlParameter("@SerialNo", String.IsNullOrEmpty(details.SerialNo) ? DBNull.Value : (Object)details.SerialNo));
            sqlParams.Add(new SqlParameter("@Size", String.IsNullOrEmpty(details.Size) ? DBNull.Value : (Object)details.Size));
            sqlParams.Add(new SqlParameter("@InstallDate", details.InstalledDate == DateTime.MinValue ? DBNull.Value : (Object)details.InstalledDate));
            sqlParams.Add(new SqlParameter("@Capacity", String.IsNullOrEmpty(details.Capacity) ? DBNull.Value : (Object)details.Capacity));

            sqlParams.Add(new SqlParameter("@CapacityHeadTest", String.IsNullOrEmpty(details.CapacityHeadTest) ? DBNull.Value : (Object)details.CapacityHeadTest));
            sqlParams.Add(new SqlParameter("@FuelRefrigeration", String.IsNullOrEmpty(details.FuelRefrigeration) ? DBNull.Value : (Object)details.FuelRefrigeration));
            sqlParams.Add(new SqlParameter("@MotorManufacturer", String.IsNullOrEmpty(details.MotorManufacturer) ? DBNull.Value : (Object)details.MotorManufacturer));
            sqlParams.Add(new SqlParameter("@HP", String.IsNullOrEmpty(details.HP) ? DBNull.Value : (Object)details.HP));
            sqlParams.Add(new SqlParameter("@MotorType", String.IsNullOrEmpty(details.MotorType) ? DBNull.Value : (Object)details.MotorType));
            sqlParams.Add(new SqlParameter("@MotorSerialNo", String.IsNullOrEmpty(details.MotorSerialNo) ? DBNull.Value : (Object)details.MotorSerialNo));
            sqlParams.Add(new SqlParameter("@MotorModel", String.IsNullOrEmpty(details.MotorModel) ? DBNull.Value : (Object)details.MotorModel));
            sqlParams.Add(new SqlParameter("@MotorInstallDate", details.InstalledDate == DateTime.MinValue ? DBNull.Value : (Object)details.InstalledDate));
            sqlParams.Add(new SqlParameter("@Frame", String.IsNullOrEmpty(details.Frame) ? DBNull.Value : (Object)details.Frame));
            sqlParams.Add(new SqlParameter("@RPM", String.IsNullOrEmpty(details.RPM) ? DBNull.Value : (Object)details.RPM));
            sqlParams.Add(new SqlParameter("@Voltage", String.IsNullOrEmpty(details.Voltage) ? DBNull.Value : (Object)details.Voltage));
            sqlParams.Add(new SqlParameter("@Amperes", String.IsNullOrEmpty(details.Amperes) ? DBNull.Value : (Object)details.Amperes));
            sqlParams.Add(new SqlParameter("@PhaseCycle", String.IsNullOrEmpty(details.PhaseCycle) ? DBNull.Value : (Object)details.PhaseCycle));
            sqlParams.Add(new SqlParameter("@BSLClassification", String.IsNullOrEmpty(details.BslClassification) ? DBNull.Value : (Object)details.BslClassification));
            sqlParams.Add(new SqlParameter("@TJCValue", details.TJCValue <= 0 ? DBNull.Value : (Object)details.TJCValue));
            sqlParams.Add(new SqlParameter("@PMSchedule", String.IsNullOrEmpty(details.PMSchedule) ? DBNull.Value : (Object)details.PMSchedule));
            
         
            
            sqlParams.Add(new SqlParameter("@UserName", String.IsNullOrEmpty(details.UserName) ? DBNull.Value : (Object)details.UserName));



            ValidationResult vr = DBCommands.ExecuteNonQueryWithResReturn("spn_inv_UpdateFacility", sqlParams);

            if (vr.Success)
            {
                //if no error, update id               
                details.FacNum = paramNum.Value.ToString();
                details.Key = Convert.ToInt32(paramID.Value);
            }
            return vr;


        }


        public static ValidationResult UpdateEquipmentDetails(EquipmentDet details)
        {
            //update/insert data into database
            String result = "";
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            SqlParameter paramID = DBCommands.ParameterMaker("@ID", SqlDbType.Int, 10, ParameterDirection.InputOutput, details.Key);
            sqlParams.Add(paramID);
            sqlParams.Add(new SqlParameter("@EquipmentID", details.EquipID));
            sqlParams.Add(new SqlParameter("@EquipmentLocation", String.IsNullOrEmpty(details.EquipLocation) ? DBNull.Value : (Object)details.EquipLocation));
            sqlParams.Add(new SqlParameter("@TypeorUse", String.IsNullOrEmpty(details.TypeOrUse) ? DBNull.Value : (Object)details.TypeOrUse));
            sqlParams.Add(new SqlParameter("@Manufacturer", String.IsNullOrEmpty(details.Manufacturer) ? DBNull.Value : (Object)details.Manufacturer));
            sqlParams.Add(new SqlParameter("@ModelNo", String.IsNullOrEmpty(details.ModelNo) ? DBNull.Value : (Object)details.ModelNo));
            sqlParams.Add(new SqlParameter("@SerialNo", String.IsNullOrEmpty(details.SerialNo) ? DBNull.Value : (Object)details.SerialNo));
            sqlParams.Add(new SqlParameter("@Size", String.IsNullOrEmpty(details.Size) ? DBNull.Value : (Object)details.Size));
            sqlParams.Add(new SqlParameter("@InstallDate", details.InstalledDate == DateTime.MinValue ? DBNull.Value : (Object)details.InstalledDate));
            sqlParams.Add(new SqlParameter("@Capacity", String.IsNullOrEmpty(details.Capacity) ? DBNull.Value : (Object)details.Capacity));

            sqlParams.Add(new SqlParameter("@CapacityHeadTest", String.IsNullOrEmpty(details.CapacityHeadTest) ? DBNull.Value : (Object)details.CapacityHeadTest));
            sqlParams.Add(new SqlParameter("@FuelRefrigeration", String.IsNullOrEmpty(details.FuelRefrigeration) ? DBNull.Value : (Object)details.FuelRefrigeration));
            sqlParams.Add(new SqlParameter("@MotorManufacturer", String.IsNullOrEmpty(details.MotorManufacturer) ? DBNull.Value : (Object)details.MotorManufacturer));
            sqlParams.Add(new SqlParameter("@HP", String.IsNullOrEmpty(details.HP) ? DBNull.Value : (Object)details.HP));
            sqlParams.Add(new SqlParameter("@MotorType", String.IsNullOrEmpty(details.MotorType) ? DBNull.Value : (Object)details.MotorType));
            sqlParams.Add(new SqlParameter("@MotorSerialNo", String.IsNullOrEmpty(details.MotorSerialNo) ? DBNull.Value : (Object)details.MotorSerialNo));
            sqlParams.Add(new SqlParameter("@MotorModel", String.IsNullOrEmpty(details.MotorModel) ? DBNull.Value : (Object)details.MotorModel));
            sqlParams.Add(new SqlParameter("@MotorInstallDate", details.MotorInstalledDate == DateTime.MinValue ? DBNull.Value : (Object)details.MotorInstalledDate));
            sqlParams.Add(new SqlParameter("@Frame", String.IsNullOrEmpty(details.Frame) ? DBNull.Value : (Object)details.Frame));
            sqlParams.Add(new SqlParameter("@RPM", String.IsNullOrEmpty(details.RPM) ? DBNull.Value : (Object)details.RPM));
            sqlParams.Add(new SqlParameter("@Voltage", String.IsNullOrEmpty(details.Voltage) ? DBNull.Value : (Object)details.Voltage));
            sqlParams.Add(new SqlParameter("@Amperes", String.IsNullOrEmpty(details.Amperes) ? DBNull.Value : (Object)details.Amperes));
            sqlParams.Add(new SqlParameter("@PhaseCycle", String.IsNullOrEmpty(details.PhaseCycle) ? DBNull.Value : (Object)details.PhaseCycle));
            sqlParams.Add(new SqlParameter("@BSLClassification", String.IsNullOrEmpty(details.BslClassification) ? DBNull.Value : (Object)details.BslClassification));
            sqlParams.Add(new SqlParameter("@TJCValue", details.TJCValue <= 0 ? DBNull.Value : (Object)details.TJCValue));
            sqlParams.Add(new SqlParameter("@PMSchedule", String.IsNullOrEmpty(details.PMSchedule) ? DBNull.Value : (Object)details.PMSchedule));
                        
            sqlParams.Add(new SqlParameter("@UserName", String.IsNullOrEmpty(details.UserName) ? DBNull.Value : (Object)details.UserName));
            sqlParams.Add(new SqlParameter("@ParentFacilityNo", String.IsNullOrEmpty(details.ParentFacilityNum) ? DBNull.Value : (Object)details.ParentFacilityNum));
            sqlParams.Add(new SqlParameter("@EquipmentSerial", details.EquipSequenceNum));

            ValidationResult vr = DBCommands.ExecuteNonQueryWithResReturn("spn_inv_UpdateEquipment", sqlParams);

            if (vr.Success)
            {
                //if no error, update id               
                details.Key = Convert.ToInt32(paramID.Value);
            }
            return vr;         

           
        }

        public static ValidationResult UpdateElectrialEquipment(FacilityDet details)
        {
            //update/insert data into database
            String result = "";
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            SqlParameter paramID = DBCommands.ParameterMaker("@ID", SqlDbType.Int, 10, ParameterDirection.InputOutput, details.Key);
            sqlParams.Add(paramID);
            sqlParams.Add(new SqlParameter("@FacilityID", details.FacID));
            SqlParameter paramNum = DBCommands.ParameterMaker("@FacilityNo", SqlDbType.VarChar, 50, ParameterDirection.InputOutput, details.FacNum);
            sqlParams.Add(paramNum);
            sqlParams.Add(new SqlParameter("@System", details.FacSystem));
            sqlParams.Add(new SqlParameter("@Building", details.FacBuilding));
            sqlParams.Add(new SqlParameter("@Comments", String.IsNullOrEmpty(details.Comment) ? DBNull.Value : (Object)details.Comment));
            sqlParams.Add(new SqlParameter("@Floor", String.IsNullOrEmpty(details.FacFloor) ? DBNull.Value : (Object)details.FacFloor));
            sqlParams.Add(new SqlParameter("@FacilityLocation", String.IsNullOrEmpty(details.FacLocation) ? DBNull.Value : (Object)details.FacLocation));
            sqlParams.Add(new SqlParameter("@WorkRequestNo", String.IsNullOrEmpty(details.WRNumber) ? DBNull.Value : (Object)details.WRNumber));
            sqlParams.Add(new SqlParameter("@Function", String.IsNullOrEmpty(details.FacFunction) ? DBNull.Value : (Object)details.FacFunction));
            sqlParams.Add(new SqlParameter("@BSL", (Object)details.YsnBsl));
            sqlParams.Add(new SqlParameter("@AAALAC", (Object)details.YsnAaalac));
            sqlParams.Add(new SqlParameter("@TJC", (Object)details.YsnTJC));
            sqlParams.Add(new SqlParameter("@UserName", String.IsNullOrEmpty(details.UserName) ? DBNull.Value : (Object)details.UserName));

            sqlParams.Add(new SqlParameter("@ElectricalOther", String.IsNullOrEmpty(details.ElectricalOther) ? DBNull.Value : (Object)details.ElectricalOther));
            sqlParams.Add(new SqlParameter("@TypeorUse", String.IsNullOrEmpty(details.TypeOrUse) ? DBNull.Value : (Object)details.TypeOrUse));
            sqlParams.Add(new SqlParameter("@Manufacturer", String.IsNullOrEmpty(details.Manufacturer) ? DBNull.Value : (Object)details.Manufacturer));
            sqlParams.Add(new SqlParameter("@VOLTS", String.IsNullOrEmpty(details.Volts) ? DBNull.Value : (Object)details.Volts));
            sqlParams.Add(new SqlParameter("@AMP", String.IsNullOrEmpty(details.AMP) ? DBNull.Value : (Object)details.AMP));
            sqlParams.Add(new SqlParameter("@KVA", String.IsNullOrEmpty(details.KVA) ? DBNull.Value : (Object)details.KVA));
            sqlParams.Add(new SqlParameter("@VOLTSPrimary", String.IsNullOrEmpty(details.VoltsPrimary) ? DBNull.Value : (Object)details.VoltsPrimary));
            sqlParams.Add(new SqlParameter("@VOLTSSecondary", String.IsNullOrEmpty(details.VoltsSecondary) ? DBNull.Value : (Object)details.VoltsSecondary));
            sqlParams.Add(new SqlParameter("@PH", String.IsNullOrEmpty(details.PH) ? DBNull.Value : (Object)details.PH));
            sqlParams.Add(new SqlParameter("@W", String.IsNullOrEmpty(details.W) ? DBNull.Value : (Object)details.W));
            sqlParams.Add(new SqlParameter("@NOofCKTS", String.IsNullOrEmpty(details.CktsNum) ? DBNull.Value : (Object)details.CktsNum));
            sqlParams.Add(new SqlParameter("@CKTSUsed", String.IsNullOrEmpty(details.CktsUsed) ? DBNull.Value : (Object)details.CktsUsed));

            ValidationResult vr = DBCommands.ExecuteNonQueryWithResReturn("spn_inv_UpdateEletricalEquipment", sqlParams);

            if (vr.Success)
            {
                //if no error, update id               
                details.Key = Convert.ToInt32(paramID.Value);
                details.FacNum = paramNum.Value.ToString();
            }
            return vr;


        }

        public static ValidationResult UpdateFacilityAdmin(FacilityDet details)
        {
            //update/insert data into database
            String result = "";
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@TableID", details.Key));
            sqlParams.Add(new SqlParameter("@FacilityNo", details.FacNum));
            sqlParams.Add(new SqlParameter("@FacilityID", details.FacID));            
            sqlParams.Add(new SqlParameter("@System", details.FacSystem));
            sqlParams.Add(new SqlParameter("@Building", details.FacBuilding));
            sqlParams.Add(new SqlParameter("@Comments", String.IsNullOrEmpty(details.Comment) ? DBNull.Value : (Object)details.Comment));
            sqlParams.Add(new SqlParameter("@Floor", String.IsNullOrEmpty(details.FacFloor) ? DBNull.Value : (Object)details.FacFloor));
            sqlParams.Add(new SqlParameter("@FacilityLocation", String.IsNullOrEmpty(details.FacLocation) ? DBNull.Value : (Object)details.FacLocation));
            sqlParams.Add(new SqlParameter("@WorkRequestNo", String.IsNullOrEmpty(details.WRNumber) ? DBNull.Value : (Object)details.WRNumber));
            sqlParams.Add(new SqlParameter("@Function", String.IsNullOrEmpty(details.FacFunction) ? DBNull.Value : (Object)details.FacFunction));
            sqlParams.Add(new SqlParameter("@BSL", (Object)details.YsnBsl));
            sqlParams.Add(new SqlParameter("@AAALAC", (Object)details.YsnAaalac));
            sqlParams.Add(new SqlParameter("@TJC", (Object)details.YsnTJC));
            sqlParams.Add(new SqlParameter("@UserName", String.IsNullOrEmpty(details.UserName) ? DBNull.Value : (Object)details.UserName));
            sqlParams.Add(new SqlParameter("@Status", details.Status));

            return DBCommands.ExecuteNonQueryWithResReturn("spn_inv_UpdateFacility_Admin", sqlParams);
            
        }

        public static DataSet GetFacilityList(string system, string group, string building, string facNo, string wrnum, string status)
        {
            //get data from database
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            // sqlParams.Add(new SqlParameter("@Sea_Pla_Created_By", uname));
            //string.empty for search coordinator
            sqlParams.Add(new SqlParameter("@System", (string.IsNullOrEmpty(system) ? System.DBNull.Value : (Object)system)));
            sqlParams.Add(new SqlParameter("@Group", (string.IsNullOrEmpty(group) ? System.DBNull.Value : (Object)group)));
            sqlParams.Add(new SqlParameter("@Building", (string.IsNullOrEmpty(building) ? System.DBNull.Value : (Object)building)));
            sqlParams.Add(new SqlParameter("@FacilityNo", (string.IsNullOrEmpty(facNo) ? System.DBNull.Value : (Object)facNo)));
            sqlParams.Add(new SqlParameter("@WorkRequest", (string.IsNullOrEmpty(wrnum) ? System.DBNull.Value : (Object)wrnum)));
            sqlParams.Add(new SqlParameter("@Status", (Object)status));
            return DBCommands.GetData("spn_Inv_GetFacility_Search", sqlParams);
        }
    }
}

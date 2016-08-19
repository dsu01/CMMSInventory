using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NIH.CMMS.Inventory.BOL.Common;
using NIH.CMMS.Inventory.DAL.Facility;
using NIH.CMMS.Inventory.BOL.Facility;
using System.Data;

namespace NIH.CMMS.Inventory.BPL.Facility
{
    public static class facility_logic
    { 
      
        public static FacilityDet GetFacilityDetails(int facSystemID)
        {
            
            FacilityDet details = facility_db.GetFacilityDetails(facSystemID);
            //todo: add isEletrical?
            if (details != null)
            {              
                //get event sessions
                details.FacEquipments = GetEquipmentsList(details.FacNum);
            }
            return details;

        }

        public static FacilityDet GetFacilityDetailsByFacNum(string facNum)
        {

            FacilityDet details = facility_db.GetFacilityDetailsByFacNum(facNum);
            //todo: add isEletrical?
            if (details != null)
            {
                //get event sessions
                details.FacEquipments = GetEquipmentsList(details.FacNum);
            }
            return details;

        }

        public static FacilityDet GetElectrialEquipDetails(int facSystemID)
        {
            return facility_db.GetElectrialEquipDetails(facSystemID);          

        }
        public static List<EquipmentDet> GetEquipmentsList(string parentFacNum)
        {
            return facility_db.GetEquipmentList(parentFacNum);
           

        }
        

        public static ValidationResult UpdateFacility(FacilityDet details, bool fullInfo)
        {
            return facility_db.UpdateFacilityDetails(details, fullInfo);
        }

        public static ValidationResult UpdateEquipment(EquipmentDet details)
        {
            return facility_db.UpdateEquipmentDetails(details);
        }

        public static ValidationResult UpdateElectrialEquipment(FacilityDet details)
        {
            return facility_db.UpdateElectrialEquipment(details);
        }

        public static ValidationResult UpdateFacilityAdmin(FacilityDet details)
        {
            return facility_db.UpdateFacilityAdmin(details);
        }
       
        public static DataSet GetFacilityList(string system, string group, string building, string facNo, string wrnum, string status)
        {
            return facility_db.GetFacilityList(system, group,building,facNo, wrnum, status);
        }
    }
}

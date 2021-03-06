﻿using System;
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

        public static FacilityDet GetFacilityDetailsByWRNum(string wrNum)
        {

            FacilityDet details = facility_db.GetFacilityDetailsByWRNum(wrNum);
            //todo: add isEletrical?
            if (details != null)
            {
                //get event sessions
                details.FacEquipments = GetEquipmentsList(details.FacNum);
            }
            return details;

        }

        public static FacilityDet GetEleMechaEquipDetails(int facSystemID)
        {
            return facility_db.GetEleMechaEquipDetails(facSystemID);          

        }

        public static EquipmentDet GetInvEquipmentDetails(int ID)
        {
            return facility_db.GetInvEquipmentDetails(ID);
        }
        public static List<EquipmentDet> GetEquipmentsList(string parentFacNum)
        {
            if (!string.IsNullOrEmpty(parentFacNum))
                return facility_db.GetEquipmentList(parentFacNum);
            else
                return null;          

        }
        

        //public static ValidationResult UpdateFacility(FacilityDet details, bool fullInfo)
        //{
        //    return facility_db.UpdateFacilityDetails(details, fullInfo);
        //}

        public static ValidationResult UpdateFacAttachment(Attachment details)
        {
            return facility_db.UpdateFacAttachment(details);
        }

        //public static ValidationResult UpdateEquipment(EquipmentDet details)
        //{
        //    return facility_db.UpdateEquipmentDetails(details);
        //}

        //public static ValidationResult UpdateElectrialEquipment(FacilityDet details)
        //{
        //    return facility_db.UpdateElectrialEquipment(details);
        //}

        public static ValidationResult AddUpdateElectricalEquipment(FacilityDet details)
        {
            return facility_db.AddUpdateElectricalEquipment(details);
        }
        public static ValidationResult AddUpdateMechanicalEquipment(FacilityDet details)
        {
            //if (string.IsNullOrEmpty(details.FacBuilding) || string.IsNullOrEmpty(details.FacSysteme) || string.IsNullOrEmpty(txtFacilityID.Text.Trim()) || string.IsNullOrEmpty(txtLocation.Text.Trim()))
            //{
            //    Utils.ShowPopUpMsg("Facility ID, System, Building and Location are required.", this);
            //}
            return facility_db.AddUpdateMechanicalEquipment(details);
        }
        public static ValidationResult AddElectricalMechanicalSystem(FacilityDet details, bool isElectrical)
        {
            return facility_db.AddElectricalMechanicalSystem(details, isElectrical);
        }
        public static ValidationResult UpdateElectricalMechanicalSystem(FacilityDet details)
        {
            return facility_db.UpdateElectricalMechanicalSystem(details);
        }
        public static ValidationResult AddUpdateElectricalComponent(EquipmentDet details)
        {
            return facility_db.AddUpdateElectricalComponent(details);
        }
        public static ValidationResult AddUpdateMechanicalComponent(EquipmentDet details)
        {
            return facility_db.AddUpdateMechanicalComponent(details);
        }
        //public static ValidationResult UpdateMechanicalEquipment(FacilityDet details)
        //{
        //    return facility_db.UpdateMechanicalEquipment(details);
        //}

        //public static ValidationResult AddMechanicalEquipment(FacilityDet details)
        //{
        //    return facility_db.AddMechanicalEquipment(details);
        //}

        public static ValidationResult UpdateFacilityAdmin(FacilityDet details)
        {
            return facility_db.UpdateFacilityAdmin(details);
        }
        public static ValidationResult DeactivateInvEquipment(int ID, string uname)
        {
            return facility_db.DeactivateInvEquipment(ID, uname);
        }

        public static DataSet GetFacilityList(string system, string group, string building, string facNo, string wrnum, string status)
        {
            return facility_db.GetFacilityList(system, group,building,facNo, wrnum, status);
        }

        public static DataSet GetFacilitySearchResult(SearchCriteria crit)
        {
            return facility_db.GetFacilitySearchResult(crit);
        }
    }
}

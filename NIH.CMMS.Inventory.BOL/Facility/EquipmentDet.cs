using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NIH.CMMS.Inventory.BOL.Facility
{
    [Serializable]
    public class EquipmentDet
    {
        #region "Private properties"

        private string _equipID = string.Empty;
        private string _equipLocation = string.Empty;
        private string _typeOrUse = string.Empty;
        private string _manufacturer = string.Empty;
        private string _modelNo = string.Empty;
        private string _serialNo = string.Empty;
        private string _size = string.Empty;
        private DateTime _installedDate = DateTime.MinValue;

        private string _capacity = string.Empty;
        private string _capacityHeadTest = string.Empty;
        private string _fuelRefrigeration = string.Empty;
        private string _motorManufacturer = string.Empty;
        private string _HP = string.Empty;
        private string _motorType = string.Empty;
        private string _motorSerialNo = string.Empty;
        private DateTime _MotorInstalledDate = DateTime.MinValue;
        private string _motorModel = string.Empty;
        private string _frame = string.Empty;
        private string _RPM = string.Empty;
        private string _voltage = string.Empty;
        private string _amperes = string.Empty;
        private string _phaseCycle = string.Empty;
        private string _bslClassification = string.Empty;
        private int _TJCValue = 0;
        private string _PMSchedule = string.Empty;

        
        private string _parentFacilityNum = string.Empty;
        private int _equipSequenceNum = 0;

        private string _userName = string.Empty;
        private int _key = -1;

        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedDate = DateTime.MinValue;
        public string EquipmentNo { get; set; }

        public string Volts = string.Empty;
        public string AMP = string.Empty;
        public string KVA = string.Empty;
        public string VoltsPrimary = string.Empty;
        public string VoltsSecondary = string.Empty;
        public string PH = string.Empty;
        public string W = string.Empty;
        public string CktsNum = string.Empty;
        public string CktsUsed = string.Empty;
        public string ElectricalOther { get; set; }
        public string InventoryBy { get; set; }
        public string Status { get; set; }
        public DateTime InventoryDate = DateTime.MinValue;

       
        #endregion

        #region " Business Properties

        public string EquipID
        {
            get { return _equipID; }
            set
            {
                _equipID = value;
            }
        }        
        public string EquipLocation
        {
            get { return _equipLocation; }
            set
            {
                _equipLocation = value;
            }
        }
        public string TypeOrUse
        {
            get { return _typeOrUse; }
            set
            {
                _typeOrUse = value;
            }
        }
        public string Manufacturer
        {
            get { return _manufacturer; }
            set
            {
                _manufacturer = value;
            }
        }
        public string ModelNo
        {
            get { return _modelNo; }
            set
            {
                _modelNo = value;
            }
        }
        public string SerialNo
        {
            get { return _serialNo; }
            set
            {
                _serialNo = value;
            }
        }
        public string Size
        {
            get { return _size; }
            set
            {
                _size = value;
            }
        }
        public DateTime InstalledDate
        {
            get { return _installedDate; }
            set
            {
                _installedDate = value;
            }
        }

        public string Capacity
        {
            get { return _capacity; }
            set
            {
                _capacity = value;
            }
        }
        public string CapacityHeadTest
        {
            get { return _capacityHeadTest; }
            set
            {
                _capacityHeadTest = value;
            }
        }
        public string FuelRefrigeration
        {
            get { return _fuelRefrigeration; }
            set
            {
                _fuelRefrigeration = value;
            }
        }
        public string MotorManufacturer
        {
            get { return _motorManufacturer; }
            set
            {
                _motorManufacturer = value;
            }
        }
        public string HP
        {
            get { return _HP; }
            set
            {
                _HP = value;
            }
        }
        public string MotorType
        {
            get { return _motorType; }
            set
            {
                _motorType = value;
            }
        }
        public string MotorSerialNo
        {
            get { return _motorSerialNo; }
            set
            {
                _motorSerialNo = value;
            }
        }
        public DateTime MotorInstalledDate
        {
            get { return _MotorInstalledDate; }
            set
            {
                _MotorInstalledDate = value;
            }
        }
        public string MotorModel
        {
            get { return _motorModel; }
            set
            {
                _motorModel = value;
            }
        }
        public string Frame
        {
            get { return _frame; }
            set
            {
                _frame = value;
            }
        }
        public string RPM
        {
            get { return _RPM; }
            set
            {
                _RPM = value;
            }
        }
        public string Voltage
        {
            get { return _voltage; }
            set
            {
                _voltage = value;
            }
        }
        public string Amperes
        {
            get { return _amperes; }
            set
            {
                _amperes = value;
            }
        }
        public string PhaseCycle
        {
            get { return _phaseCycle; }
            set
            {
                _phaseCycle = value;
            }
        }
        public string BslClassification
        {
            get { return _bslClassification; }
            set
            {
                _bslClassification = value;
            }
        }
        public string PMSchedule
        {
            get { return _PMSchedule; }
            set
            {
                _PMSchedule = value;
            }
        }

        public int TJCValue
        {
            get { return _TJCValue; }
            set
            {
                _TJCValue = value;
            }
        }


        public string ParentFacilityNum
        {
            get { return _parentFacilityNum; }
            set
            {
                _parentFacilityNum = value;
            }
        }

        public int EquipSequenceNum
        {
            get { return _equipSequenceNum; }
            set
            {
                _equipSequenceNum = value;
            }
        }

        public string UserName
        {
            get { return _userName; }
            set
            {
                _userName = value;
            }
        }

        public int Key
        {
            get { return _key; }
            set
            {
                _key = value;
            }
        }

        #endregion
    }
}

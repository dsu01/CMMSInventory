using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NIH.CMMS.Inventory.BOL.Facility
{
    [Serializable]
    public class FacilityDet : EquipmentDet
    {
        #region "Private properties"
        private string _facTempNum = "";
        private string _facNum = "";
        private string _facID = "";
        private string _facFunction = "";
        private string _facFloor = "";
        private string _facSystem = "";
        private string _facBuilding = "";
        private string _facLocation = "";
        private int _ysnBsl = 0;
        private int _ysnAaalac = 0;
        private int _ysnTJC = 0;
       
        private DateTime _updatedOn = DateTime.MinValue;
        private string _status = string.Empty;
        private string _comment = "";     
        private string _takenBy = "";
        private string _userName = "";
        private string _wrnumber = "";
        private List<EquipmentDet> _facEquipments;

        private string _typeOrUse = string.Empty;
        private string _manufacturer = string.Empty;
        private string _volts = string.Empty;
        private string _amp = string.Empty;
        private string _kva = string.Empty;
        private string _voltsPrimary = string.Empty;
        private string _voltsSecondary = string.Empty;
        private string _ph = string.Empty;
        private string _w = string.Empty;
        private string _cktsNum = string.Empty;
        private string _cktsUsed = string.Empty;
        public string ElectricalOther { get; set; }
        private int _key = -1;

        public string FacilityGroup { get; set; }
        public int FacSystemID { get; set; }
        public string InventoryBy { get; set; }
        public DateTime InventoryDate = DateTime.MinValue;

        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedDate = DateTime.MinValue;
       
        #endregion

        #region " Business Properties

        public int Key
        {
            get { return _key; }
            set
            {
                _key = value;
            }
        }
        public string Status
        {
            get { return _status; }
            set
            {
                _status = value;
            }
        }
        public string FacID
        {
            get { return _facID; }
            set
            {
                _facID = value;
            }
        }
       
       public string FacNum
        {
            get { return _facNum; }
            set
            {
                _facNum = value;
            }
        }
        public string FacTempNum
        {
            get { return _facTempNum; }
            set
            {
                _facTempNum = value;
            }
        }
         public string FacFunction
        {
            get { return _facFunction; }
            set
            {
                _facFunction = value;
            }
        }
         public string FacFloor
        {
            get { return _facFloor; }
            set
            {
                _facFloor = value;
            }
        }
         public string FacSystem
        {
            get { return _facSystem; }
            set
            {
                _facSystem = value;
            }
        }
          public string FacBuilding
        {
            get { return _facBuilding; }
            set
            {
                _facBuilding = value;
            }
        }
         public string FacLocation
        {
            get { return _facLocation; }
            set
            {
                _facLocation = value;
            }
        }
      
         public int YsnBsl
         {
             get { return _ysnBsl; }
             set
             {
                 _ysnBsl = value;
             }
         }
         public int YsnAaalac
         {
             get { return _ysnAaalac; }
             set
             {
                 _ysnAaalac = value;
             }
         }
         public int YsnTJC
         {
             get { return _ysnTJC; }
             set
             {
                 _ysnTJC = value;
             }
         }
        public DateTime UpdatedOn
        {
            get { return _updatedOn; }
            set
            {
                _updatedOn = value;
            }
        }
      
        public string Comment
        {
            get { return _comment; }
            set
            {
                _comment = value;
            }
        }
        
        public string TakenBy
        {
            get { return _takenBy; }
            set
            {
                _takenBy = value;
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

      
        public string WRNumber
        {
            get { return _wrnumber; }
            set
            {
                _wrnumber = value;
            }
        }

        public List<EquipmentDet> FacEquipments
        {
            get { return _facEquipments; }
            set
            {
                _facEquipments = value;
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



        public string Volts
        {
            get { return _volts; }
            set
            {
                _volts = value;
            }
        }
        public string AMP
        {
            get { return _amp; }
            set
            {
                _amp = value;
            }
        }
        public string KVA
        {
            get { return _kva; }
            set
            {
                _kva = value;
            }
        }
        public string VoltsPrimary
        {
            get { return _voltsPrimary; }
            set
            {
                _voltsPrimary = value;
            }
        }
        public string VoltsSecondary
        {
            get { return _voltsSecondary; }
            set
            {
                _voltsSecondary = value;
            }
        }
        public string PH
        {
            get { return _ph; }
            set
            {
                _ph = value;
            }
        }
        public string W
        {
            get { return _w; }
            set
            {
                _w = value;
            }
        }
        public string CktsNum
        {
            get { return _cktsNum; }
            set
            {
                _cktsNum = value;
            }
        }
        public string CktsUsed
        {
            get { return _cktsUsed; }
            set
            {
                _cktsUsed = value;
            }
        }

        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NIH.CMMS.Inventory.BOL.Common
{
    [Serializable]
    public class Attachment 
    {
        public Attachment()
        {
        }

        public string CreatedBy { get; set; }

        public DateTime CreatedOn { get; set; }

        public string UpdatedBy { get; set; }

        public DateTime UpdatedOn { get; set; }

        // TODO - TBD
        public string InvFacID = "";

        public int InvAttachmentSysID { get; set; }

        //public string InvEquipID { get; set; }

        public int InvParentSysID { get; set; }

        public string FileName { get; set; }

        public string FileType { get; set; }

        public string Title { get; set; }

        public Byte[] FileData { get; set; }

        public bool IsActive { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using NIH.CMMS.Inventory.DAL.Common;
using NIH.CMMS.Inventory.BOL.Common;


namespace NIH.CMMS.Inventory.BPL.Common
{
    public class AttachmentLogic
    {
        public static List<Attachment> GetAttachments(int equipmentSysId, bool isEquipmentOrFacility)
        {
            try
            {
                List<Attachment> col = null;
                DataSet ds = Attachment_db.GetAttachmentList(equipmentSysId, isEquipmentOrFacility);

                if (ds != null)
                {
                    col = new List<Attachment>();
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        col.Add(PopulateAttachment(row));
                    }
                }

                return col;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static Attachment GetAttachment(int attachmentSysID, bool isEquipmentOrFacility)
        {
            try
            {
                Attachment attachment = null;
                var ds = Attachment_db.GetAttachment(attachmentSysID, isEquipmentOrFacility);

                if (ds != null)
                {
                    attachment = PopulateAttachment(ds.Tables[0].Rows[0]);
                }
                return attachment;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static ValidationResult DeleteAttachment(int attachmentSysID, bool isEquipmentOrFacility)
        {
            try
            {
                return Attachment_db.DeleteAttachment(attachmentSysID, isEquipmentOrFacility);
            }
            catch (Exception e)
            {
                return new ValidationResult(false, "Exception:" + e.ToString());
            }
        }

        public static ValidationResult UpdateAttachment(Attachment details, bool isEquipmentOrFacility)
        {
            //var result = ApplicationConstants.NO_ERROR_USP_EXECUTION;
            var result = new ValidationResult(true, "Success");

            try
            {
                //insert/update 
                result = Attachment_db.UpdateAttachment(details, isEquipmentOrFacility);
            }
            catch (Exception e)
            {
                result = new ValidationResult(false, e.ToString());
            }

            return result;
        }

        private static Attachment PopulateAttachment(DataRow row)
        {
            Attachment attachment = new Attachment()
            {
                InvAttachmentSysID = (int)row["ID"],
                InvParentSysID = (int)row["InvParentSysID"],
                FileName = (string)row["FileName"],
                FileType = row["ContentType"] != DBNull.Value ? (string)row["ContentType"] : null,
                FileData = (byte[])row["Data"],
                CreatedOn = (DateTime)row["CreatedOn"],
                CreatedBy = (string)row["CreatedBy"],
                IsActive = (bool)row["IsActive"],
                Title = (string)row["Title"],
            };

            return attachment;
        }
    }
}

using System;
using System.Data;
using NIH.CMMS.Inventory.DAL.Common;
using NIH.CMMS.Inventory.BOL.Common;


namespace NIH.CMMS.Inventory.BPL.Common
{
    public class AttachmentLogic
    {
        public static AttachmentCollection GetAllRptAttachments(int source, int sourceID)
        {
            AttachmentCollection seaAttCol = null;
            DataSet ds = Attachment_db.GetAttachmentDetails(source, sourceID, -1);

            if (ds != null)
            {
                seaAttCol = new AttachmentCollection();
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    seaAttCol.Add(PopulateAttachmentDetails(row));
                }
            }
            return seaAttCol;
        }

        public static Attachment GetAttachmentDetails(int source, int sourceID, int attID)
        {
            Attachment details = null;
            DataSet ds = Attachment_db.GetAttachmentDetails(source, sourceID, attID);

            if (ds != null)
            {
                details = PopulateAttachmentDetails(ds.Tables[0].Rows[0]);

            }
            return details;
        }

        public static ValidationResult DeleteAttachmentDetails(int attID)
        {
            return Attachment_db.DeleteAttachmentDetails(attID);
        }

        public static ValidationResult UpdateAttachmentDetails(Attachment details)
        {
            //var result = ApplicationConstants.NO_ERROR_USP_EXECUTION;
            ValidationResult result = new ValidationResult(true, "Success");

            try
            {
                //insert/update 
                result = Attachment_db.UpdateAttachmentDetails(details);

            }
            catch (Exception e)
            {
                result = new ValidationResult(false, e.ToString());
            }

            return result;
        }

        private static Attachment PopulateAttachmentDetails(DataRow row)
        {
            Attachment details = new Attachment();
            //details.Key = (int)row["Att_SysID"];
            //details.Source = (int)row["Att_Source"];
            //details.SourceID = (int)row["Att_SourceID"];
            //if (row["Att_Dist_Code"] != System.DBNull.Value)
            //{ details.DistrictCode = (string)row["Att_Dist_Code"]; }

            //if (row["Att_Desc"] != System.DBNull.Value)
            //{ details.Description = (string)row["Att_Desc"]; }
            //details.Title = (string)row["Att_Title"];

            //details.FileLocation = (string)row["Att_Filepath"];
            //details.CreatedOn = (DateTime)row["Att_Created_On"];
            //details.CreatedByUserID = (int)row["Att_Created_By"];
            //details.IsPublic = (bool)row["Att_IsPublic"];
            return details;
        }

    }
}

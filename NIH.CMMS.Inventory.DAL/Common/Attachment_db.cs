using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using NIH.CMMS.Inventory.DAL.Utility;
using NIH.CMMS.Inventory.BOL.Common;

namespace NIH.CMMS.Inventory.DAL.Common
{
    public class Attachment_db
    {
        public static DataSet GetAttachmentList(int parentSysID, bool isEquipmentOrFacility)
        {
            List<Attachment> list = null;
            var sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@isEquipmentOrFacility", isEquipmentOrFacility));
            sqlParams.Add(new SqlParameter("@parentSysId", parentSysID));
            return DBCommands.GetData("spn_Inv_GetAttachmentList", sqlParams);
        }

        public static DataSet GetAttachment(int attachmentSysID, bool isEquipmentOrFacility)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@isEquipmentOrFacility", isEquipmentOrFacility));
            sqlParams.Add(new SqlParameter("@attachmentSysId", attachmentSysID));
            return DBCommands.GetData("spn_Inv_GetAttachmentByID", sqlParams);
        }

        public static ValidationResult DeleteAttachment(int attachmentSysId, bool isEquipmentOrFacility)
        {
            var sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@isEquipmentOrFacility", isEquipmentOrFacility));
            sqlParams.Add(new SqlParameter("@attachmentSysId", attachmentSysId));
            return DBCommands.ExecuteNonQueryWithResReturn("spn_inv_deleteAttachment", sqlParams);
        }

        public static ValidationResult UpdateAttachment(Attachment attachment, bool isEquipmentOrFacility)
        {
            int attachmentID = -1;

            var sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@isEquipmentOrFacility", isEquipmentOrFacility));
            sqlParams.Add(new SqlParameter("@invParentSysID", attachment.InvParentSysID));
            sqlParams.Add(new SqlParameter("@FileName", attachment.FileName));
            sqlParams.Add(new SqlParameter("@ContentType", attachment.FileType));
            sqlParams.Add(new SqlParameter("@Data", attachment.FileData));
            sqlParams.Add(new SqlParameter("@CreatedOn", attachment.CreatedOn));
            sqlParams.Add(new SqlParameter("@CreatedBy", attachment.CreatedBy));
            sqlParams.Add(new SqlParameter("@IsActive", attachment.IsActive));
            sqlParams.Add(new SqlParameter("@Title", attachment.Title));

            SqlParameter outID = new SqlParameter("@ID", SqlDbType.Int);
            outID.Direction = ParameterDirection.Output;
            sqlParams.Add(outID);
            SqlParameter outResult = new SqlParameter("@Res", SqlDbType.Int);
            outResult.Direction = ParameterDirection.Output;
            sqlParams.Add(outResult);

            using (SqlConnection dbConn = DBConnection.GetDBConnection())
            {
                using (SqlCommand dbCommand = DBCommands.GetCommandObject("spn_inv_updateAttachment", dbConn, sqlParams.ToArray()))
                {
                    dbConn.Open();
                    try
                    {
                        dbCommand.ExecuteNonQuery();
                        if (dbCommand.Parameters["@Res"].Value.ToString() == "0")
                        {
                            if (dbCommand.Parameters["@ID"].Value != DBNull.Value)
                                attachment.InvAttachmentSysID = (int)dbCommand.Parameters["@ID"].Value;
                        }
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                    finally { dbConn.Close(); }
                }
            }

            return null;
        }
    }
}

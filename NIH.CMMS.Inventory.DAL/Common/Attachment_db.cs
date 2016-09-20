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
        public static DataSet GetEquipmentAttachmentList(int equipmentSysID)
        {
            List<Attachment> list = null;
            var sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@equipmentSysId", equipmentSysID));
            return DBCommands.GetData("spn_Inv_GetEquipmentAttachmentList", sqlParams);
        }

        public static DataSet GetAttachment(int attachmentSysID)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@attachmentSysId", attachmentSysID));
            return DBCommands.GetData("spn_Inv_GetEquipmentAttachmentByID", sqlParams);
        }

        public static ValidationResult DeleteAttachment(int attachmentSysId)
        {
            var sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@attachmentSysId", attachmentSysId));
            return DBCommands.ExecuteNonQueryWithResReturn("spn_inv_deleteEquipmentAttachment", sqlParams);
        }

        public static ValidationResult UpdateAttachment(Attachment attachment)
        {
            int attachmentID = -1;

            var sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@invEquipmentSysID", attachment.InvEquipSysID));
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
                using (SqlCommand dbCommand = DBCommands.GetCommandObject("spn_inv_updateEquipmentAttachment", dbConn, sqlParams.ToArray()))
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

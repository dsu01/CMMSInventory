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
        public static List<Attachment> GetEquipmentAttachmentList(int equipmentSysID)
        {
            List<Attachment> list = null;
            var sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@equipmentSysId", equipmentSysID));
            DataSet ds = DBCommands.GetData("spn_Inv_GetEquipmentAttachmentList", sqlParams);

            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                list = new List<Attachment>();
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    var attachment = new Attachment();
                    attachment.InvEquipSysID = equipmentSysID;
                    //list.Add(PopulateEquipmentDet(row, attachment, false));
                }
            }

            return list;
        }

        public static DataSet GetAttachment(int attachmentSysID)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@Att_SysID", (attachmentSysID <= 0 ? DBNull.Value : (object)attachmentSysID)));
            return DBCommands.GetData("usp_common_GetAttachmentDetails", sqlParams);
        }

        public static ValidationResult DeleteAttachment(int attID)
        {
            //get data from database
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@Att_SysID", attID));
            return DBCommands.ExecuteNonQueryWithResReturn("usp_common_DeleteAttachmentDetails", sqlParams);

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
                                attachment.InvFacSysID = (int)dbCommand.Parameters["@ID"].Value;
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

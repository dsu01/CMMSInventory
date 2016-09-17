using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using NIH.CMMS.Inventory.DAL.Utility;
using NIH.CMMS.Inventory.BOL.Common;

namespace NIH.CMMS.Inventory.DAL.Common
{
    public class Attachment_db
    {
        public static DataSet GetAttachmentDetails(int source, int sourceID, int attID)
        {

            //get data from database
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@Rpt_Source", (source <= 0 ? DBNull.Value : (object)source)));
            sqlParams.Add(new SqlParameter("@Rpt_SourceID", (sourceID <= 0 ? DBNull.Value : (object)sourceID)));
            sqlParams.Add(new SqlParameter("@Att_SysID", (attID <= 0 ? DBNull.Value : (object)attID)));
            return DBCommands.GetData("usp_common_GetAttachmentDetails", sqlParams);

        }

        public static ValidationResult DeleteAttachmentDetails(int attID)
        {
            //get data from database
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@Att_SysID", attID));
            return DBCommands.ExecuteNonQueryWithResReturn("usp_common_DeleteAttachmentDetails", sqlParams);

        }

        public static ValidationResult UpdateAttachmentDetails(Attachment details)
        {
            int attachmentID = -1;

            var sqlParams = new List<SqlParameter>();

            sqlParams.Add(new SqlParameter("@invEquipmentID", details.InvEquipSysID));
            sqlParams.Add(new SqlParameter("@FileName", details.FileName));
            sqlParams.Add(new SqlParameter("@ContentType", details.FileType));
            sqlParams.Add(new SqlParameter("@Data", details.FileData));
            sqlParams.Add(new SqlParameter("@CreatedOn", details.CreatedOn));
            sqlParams.Add(new SqlParameter("@CreatedBy", details.CreatedBy));
            sqlParams.Add(new SqlParameter("@IsActive", details.IsActive));
            sqlParams.Add(new SqlParameter("@Title", details.Title));

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
                                details.InvFacSysID = (int)dbCommand.Parameters["@ID"].Value;
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


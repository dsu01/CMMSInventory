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
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            SqlParameter paramID = DBCommands.ParameterMaker("@Att_SysID", SqlDbType.Int, 10, ParameterDirection.InputOutput, details.Key);
            sqlParams.Add(paramID);
            //sqlParams.Add(new SqlParameter("@Att_Source", details.Source));
            //sqlParams.Add(new SqlParameter("@Att_SourceID", details.SourceID));
            //sqlParams.Add(new SqlParameter("@Att_Desc", (string.IsNullOrEmpty(details.Description)) ? System.DBNull.Value : (Object)details.Description));
            //sqlParams.Add(new SqlParameter("@Att_Title", details.Title));
            //sqlParams.Add(new SqlParameter("@Att_Dist_Code", (string.IsNullOrEmpty(details.DistrictCode)) ? System.DBNull.Value : (Object)details.DistrictCode));
            //sqlParams.Add(new SqlParameter("@Att_FilePath", details.FileLocation));
            //sqlParams.Add(new SqlParameter("@Att_IsPublic", details.IsPublic));
            //sqlParams.Add(new SqlParameter("@Att_Updated_By", details.UpdatedByUserID));

            //Assign new location id value otherwise throw exception error
            //if (DBCommands.ExecuteNonQuery("usp_search_common_UpdateAttachmentDetails", sqlParams))
            //{
            //    details.Key = (int)paramID.Value;
            //}
            //else
            //{
            //   // throw new Exception(ApplicationConstants.DB_ERROR + result);
            //}

            return null;
        }
    }
}

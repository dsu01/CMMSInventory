using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NIH.CMMS.Inventory.BOL.People;
using NIH.CMMS.Inventory.DAL.Utility;
using System.Data.SqlClient;
using System.Data;
using NIH.CMMS.Inventory.BOL.Common;

namespace NIH.CMMS.Inventory.DAL.People
{
    public static class LoginUser_db
    {
        public static LoginUser GetLoginUserBasicInfo(string domainName, string loginID)
        {           
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@strDomain", domainName));
            sqlParams.Add(new SqlParameter("@strLogin", loginID));
            SqlParameter outUserName = new SqlParameter("@strUserName", SqlDbType.VarChar, 50);
            outUserName.Direction = ParameterDirection.Output;
            sqlParams.Add(outUserName);
            SqlParameter outTakenBy = new SqlParameter("@strTakenBy", SqlDbType.VarChar, 50);
            outTakenBy.Direction = ParameterDirection.Output;
            sqlParams.Add(outTakenBy);
            SqlParameter outNIHRole = new SqlParameter("@strNIHRole", SqlDbType.VarChar, 50);
            outNIHRole.Direction = ParameterDirection.Output;
            sqlParams.Add(outNIHRole);
            SqlParameter outResult = new SqlParameter("@res", SqlDbType.Int);
            outResult.Direction = ParameterDirection.Output;
            sqlParams.Add(outResult);
            LoginUser loginUsrDet = null;
            using (SqlConnection dbConn = DBConnection.GetDBConnection())
            {
                using (SqlCommand myCommand = DBCommands.GetCommandObject("spn_LoginAuthentication_Inventory", dbConn, sqlParams.ToArray()))
                { 
                    dbConn.Open();
                    try
                    {
                        myCommand.ExecuteNonQuery();
                        if (myCommand.Parameters["@res"].Value.ToString() == "0")
                        {
                            loginUsrDet = new LoginUser();
                            loginUsrDet.LaborName = myCommand.Parameters["@strUserName"].Value.ToString();
                            loginUsrDet.TakenBy =myCommand.Parameters["@strTakenBy"].Value.ToString();
                            loginUsrDet.Role = myCommand.Parameters["@strNIHRole"].Value.ToString();
                        }                        
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                    finally { dbConn.Close(); }

                }
            }
            return loginUsrDet;
        }

        public static LoginUser GetLoginUserFullInfo(LoginUser usr)
        {           
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@Labor", usr.LaborName));          
            DataSet ds = DBCommands.GetData("spn_GetLoginUsersDetail_Inventory", sqlParams);
            #region populate fields
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                //populate wr fieds
                DataRow row = ds.Tables[0].Rows[0]; 
                if (row["Address"].ToString() != "")
                { usr.Building = row["Address"].ToString(); }
                if (row["URL"].ToString() != "")
                { usr.Room = row["URL"].ToString(); }
                if (row["PhoneWork"].ToString() != "")
                { usr.Phone = row["PhoneWork"].ToString(); }
                if (row["City"].ToString() != "")
                { usr.City = row["City"].ToString(); }

                usr.YsnBethesda = (int)row["intBethesda"];
                usr.YsnPoolesville = (int)row["intPoolesville"];
                usr.YsnBaltimore = (int)row["intBaltimore"];
                usr.YsnNorthCarolina = (int)row["intNorthCarolina"];
                usr.YsnRML = (int)row["intRML"];
                usr.YsnLeased = (int)row["intLeased"];
                usr.YsnFrederick = (int)row["intFrederick"];
                if (row["refreshinterval"].ToString() != "")
                { usr.RefreshInterval = Convert.ToInt16(row["refreshinterval"]); }
                if (row["dayslimit"].ToString() != "")
                { usr.DaysLimit =  Convert.ToInt16(row["dayslimit"]); }
                if (row["ysnAudioWarning"].ToString() != "")
                { usr.AudioWarning = (int)row["ysnAudioWarning"]; }
                if (row["ysnInventory"].ToString() != "")
                { usr.YsnInventory = (int)row["ysnInventory"]; }
                return usr;
            }
            else { return null; }
            #endregion

        }
        public static ValidationResult UpdateUserPreference(string uname, int refreshInterval, int dayslimit, int ysnAudioWarning)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@Labor", uname));
            sqlParams.Add(new SqlParameter("@RefreshInterval", refreshInterval));
            sqlParams.Add(new SqlParameter("@Dayslimit", dayslimit));
            sqlParams.Add(new SqlParameter("@ysnAudioWarning", ysnAudioWarning));
            return DBCommands.ExecuteNonQueryWithResReturn("spn_UpdateLoginUser_Preference_HelpDesk", sqlParams);
        }
        public static string LoginUpdate(string uname, string initial)
        {
            string loginID = string.Empty;
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("@UserName", uname));
            sqlParams.Add(new SqlParameter("@TakenBy", initial));
            SqlParameter outID = new SqlParameter("@ID", SqlDbType.Int);
            outID.Direction = ParameterDirection.Output;
            sqlParams.Add(outID);
            SqlParameter outResult = new SqlParameter("@res", SqlDbType.Int);
            outResult.Direction = ParameterDirection.Output;
            sqlParams.Add(outResult);

            using (SqlConnection dbConn = DBConnection.GetDBConnection())
            {
                using (SqlCommand myCommand = DBCommands.GetCommandObject("spn_Inv_LoginAppLog", dbConn, sqlParams.ToArray()))
                {
                    dbConn.Open();
                    try
                    {
                        myCommand.ExecuteNonQuery();
                        if (myCommand.Parameters["@res"].Value.ToString() == "0")
                        {
                            loginID = myCommand.Parameters["@ID"].Value.ToString();                            
                        }
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                    finally { dbConn.Close(); }

                }
            }

            return loginID;
        }


       

    }

    
}

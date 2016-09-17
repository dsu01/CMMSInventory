using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NIH.CMMS.Inventory.BPL.Common;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using NIH.CMMS.Inventory.DAL.Utility;

namespace NIH.CMMS.Inventory.BPL.LookUp
{
    public class GeneralLookUp
    {
        //public class BuildingListByProperty : LookUpCollection
        //{
        //    public BuildingListByProperty(string property)
        //    {
        //        //get data from database
        //        List<SqlParameter> sqlParams = new List<SqlParameter>();
        //        SqlParameter spProperty = new SqlParameter("@Property", property);
        //        SqlParameter dpProperty = (SqlParameter)spProperty;
        //        sqlParams.Add(dpProperty);

        //        populateCollection("spn_new_GetBuildingList_Property", sqlParams, string.Empty, "Description");
        //    }
        //}

        public static DataSet GetSystemList()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetSystem_Search", null);
        }
        public static DataSet GetListByType(string type)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            SqlParameter sptype = new SqlParameter("@SystemGroup", type);
            sqlParams.Add(sptype);
            return DBCommands.GetData("spn_Inv_GetListByType_Search", sqlParams);
        }
        public static DataSet GetEletricalSystemList()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetSystemList_Electrical", null);
        }
        public static DataSet GetMechanicalSystemList()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetSystemList_Mechanical", null);
        }

        public static DataSet GetTypeList()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetTypeList", null);
        }

        public static DataSet GetEletricalTypeOrUse()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetSystemEquipmentList_Electrical", null);
        }
        public static DataSet GetMechanicalTypeOrUse()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetSystemEquipmentList_Mechanical", null);
        }
        public static DataSet GetSearchBuildingList()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetBuildingList_Search", null);
        }
        public static DataSet GetBuildingList()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetBuildingList", null);
        }
        public static DataSet GetStatusList()
        {
            //get data from 
            return DBCommands.GetData("spn_Inv_GetStatusList", null);
        }
        //public static string GetGroupByBuilding(string building)
        //{
        //    List<SqlParameter> sqlParams = new List<SqlParameter>();
        //    SqlParameter spProperty = new SqlParameter("@getShop_building_HelpDesk", building);
        //    sqlParams.Add(spProperty);
        //    return DBCommands.GetStringResult("getShop_building_HelpDesk", sqlParams);
        //}

      

        //get work location building list by property
        //public static DataSet BuildingListByProperty(string property)
        //{
        //    List<SqlParameter> sqlParams = new List<SqlParameter>();
        //    SqlParameter spProperty = new SqlParameter("@Property", property);
        //    sqlParams.Add(spProperty);
        //    //get data from database
        //    return DBCommands.GetData("spn_GetBuildingList_Property_HelpDesk", sqlParams);
        //}

        ////get group list by property
        //public static DataSet GroupListByProperty(string property)
        //{
        //    List<SqlParameter> sqlParams = new List<SqlParameter>();
        //    SqlParameter spProperty = new SqlParameter("@Property", string.IsNullOrEmpty(property) ? DBNull.Value : (Object)property);
        //    sqlParams.Add(spProperty);
        //    //get data from database
        //    return DBCommands.GetData("spn_GetShop_Property_HelpDesk", sqlParams);
        //}

        //public static DataSet GetGroupList()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_GetShop_HelpDesk", null);
        //}
       
         
        // public static DataSet GetSearchRequesterList(string fname, string lname, string ins)
        //{
        //    List<SqlParameter> sqlParams = new List<SqlParameter>();           
        //    sqlParams.Add(new SqlParameter("@strFirst", (string.IsNullOrEmpty(fname)) ? DBNull.Value : (Object)fname));
        //    sqlParams.Add(new SqlParameter("@strLast", (string.IsNullOrEmpty(lname)) ? DBNull.Value : (Object)lname));
        //    sqlParams.Add(new SqlParameter("@strInstitute", (string.IsNullOrEmpty(ins)) ? DBNull.Value : (Object)ins));
        //    return DBCommands.GetData("spn_GetRequester_Search_HelpDesk", sqlParams);
        //}
        
       
    }
}

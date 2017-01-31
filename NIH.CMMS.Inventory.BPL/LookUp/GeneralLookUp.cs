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

        //public static DataSet GetSystemList()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetSystem_Search", null);
        //}
        public static DataSet GetListByType(string type)
        {
            //1 is mechenical 2 is electrical
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            SqlParameter sptype = new SqlParameter("@SearchIndex", type);
            sqlParams.Add(sptype);
            return DBCommands.GetData("spn_Inv_GetSystem_Search_newSite", sqlParams);
        }
        //public static DataSet GetEletricalSystemList()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetSystemList_Electrical", null);
        //}
        //public static DataSet GetMechanicalSystemList()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetSystemList_Mechanical", null);
        //}

        //public static DataSet GetTypeList()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetTypeList", null);
        ////}
        //public static DataSet GetSystemEquipmentList()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetSystemEquipmentList", null);
        //}

        ////for Electrical equipment system dropdown
        //public static DataSet GetEletricalTypeOrUse()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetSystemEquipmentList_Electrical", null);
        //}

        ////for Mechanical equipment system dropdown
        //public static DataSet GetMechanicalTypeOrUse()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetSystemEquipmentList_Mechanical", null);
        //}

        //public static DataSet GetEletricalSystemList()
        //{
        //    //get data from 
        //    return DBCommands.GetData("spn_Inv_GetSystemList_Electrical_newsite", null);
        //}

        public static DataSet GetSystemList(string sysgroup)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            SqlParameter sptype = new SqlParameter("@SystemGroup", String.IsNullOrEmpty(sysgroup) ? DBNull.Value : (Object)sysgroup);
            sqlParams.Add(sptype);
            return DBCommands.GetData("spn_Inv_GetSystemList_newsite", sqlParams);           
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
             
    }
}

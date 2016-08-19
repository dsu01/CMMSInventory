using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using NIH.CMMS.Inventory.DAL.Utility;
using System.Data.SqlClient;

namespace NIH.CMMS.Inventory.DAL.Common
{
    public static class LookupCollection_db
    {
        public static DataSet GetLookupCollectionDataSet(string storeProcedure, List<SqlParameter> sqlParams)
        {
            return DBCommands.GetData(storeProcedure, sqlParams);
        }
    }
}

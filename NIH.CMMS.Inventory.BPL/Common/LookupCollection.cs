using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using NIH.CMMS.Inventory.DAL;
using System.Data.SqlClient;
using System.Data;
using NIH.CMMS.Inventory.DAL.Common;

namespace NIH.CMMS.Inventory.BPL.Common
{
    public class LookUpCollection : CollectionBase
    {
        public LookUpCollection()
        {

        }

        /// <summary>
        /// Populates the collection.
        /// </summary>
        /// <param name="storeProcedure">The store procedure.</param>
        /// <param name="sqlParams">The SQL params.</param>
        /// <param name="codeColumn">The code column.</param>
        /// <param name="descColumn">The desc column.</param>
        protected void populateCollection(string storeProcedure, List<SqlParameter> sqlParams, string codeColumn, string descColumn)
        {
            DataSet ds = LookupCollection_db.GetLookupCollectionDataSet(storeProcedure, sqlParams);

            if (ds != null)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (string.IsNullOrEmpty(codeColumn))
                    { List.Add((string)dr[descColumn]); }
                    else
                    { List.Add(new NameValue((int)dr[codeColumn], (string)dr[descColumn])); }
                    
                }
            }
        }

        public ArrayList LookupList()
        {
            return this.InnerList;

        }

        public int IndexOf(int key)
        {
            int index = -1;
            int lcv = 0;
            //check to see if list is not empty
            if ((this.InnerList != null) && (this.InnerList.Count > 0))
            {
                //loop through all objects to find matching key
                foreach (NameValue obj in this.InnerList)
                {
                    if (obj.Key == key)
                    {
                        index = lcv;
                        break;
                    }
                    lcv++;
                }
            }
            return index;
        }

    }

    public class NameValue
    {

        int _key;
        string _description;

        public NameValue()
        {
        }
        public NameValue(string description)
        {
            _description = description;
        }
        public NameValue(int key, string description)
        {
            _key = key;
            _description = description;
        }

        public int Key
        {
            get { return _key; }
            set
            {
                _key = value;
            }
        }

        public string Description
        {
            get { return _description; }
            set
            {
                _description = value;
            }
        }
    }
}

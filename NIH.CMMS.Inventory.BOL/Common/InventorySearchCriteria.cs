using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace NIH.CMMS.Inventory.BOL.Common
{
    public class SearchCriteria
    {
        public const string SESSION_INSTANCE_KEY = "SearchReportSearchCriteria";
        public const string SESSION_KEEPALIVE_KEY = "SearchReportSearchKeepAlive";

        private static SearchCriteria instance = null;
        public static SearchCriteria Instance
        {
            get
            {
              //  if (instance == null && SearchCriteria.KeepAlive && System.Web.HttpContext.Current.Session[SESSION_INSTANCE_KEY] != null)
                if (System.Web.HttpContext.Current.Session[SESSION_INSTANCE_KEY] != null)   
                instance = (SearchCriteria)HttpContext.Current.Session[SESSION_INSTANCE_KEY];
                //if (instance == null) KeepAlive = false;
                return instance;
            }
            set
            {
                instance = value;
                KeepAlive = false;

                //add the selected search criteria to session
                if (instance != null)
                {
                    if (HttpContext.Current.Session[SESSION_INSTANCE_KEY] != null)
                        HttpContext.Current.Session[SESSION_INSTANCE_KEY] = value;
                    else HttpContext.Current.Session.Add(SESSION_INSTANCE_KEY, value);
                }
                else if (HttpContext.Current.Session[SESSION_INSTANCE_KEY] != null)
                    HttpContext.Current.Session.Remove(SESSION_INSTANCE_KEY);
            }
        }
        public static SearchCriteria NewInstance
        {
            get
            {
                Instance = new SearchCriteria();
                KeepAlive = false;
                return Instance;
            }
        }
        public static bool KeepAlive
        {
            get
            {
                if (HttpContext.Current.Session[SESSION_KEEPALIVE_KEY] == null) return false;
                return (bool)HttpContext.Current.Session[SESSION_KEEPALIVE_KEY];
            }
            set { HttpContext.Current.Session[SESSION_KEEPALIVE_KEY] = value; }
        }

        //all public fields added for crosspagepostback
        public string systemIds;
        public string systemDescs;
        public string componentIds;
        public string buildingIds;
        public string buildingDescs;
        public string typeId;
        public string facnum;
        public string wrnum;
        public int flagAssigned = 1; //default is 1 un-assigned
        private SearchCriteria() { }
    }

}

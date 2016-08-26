using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SearchCriteria
/// </summary>
namespace NIH.CMMS.Inventory.Web
{
    /// <summary>
    /// Summary description for SearchCriteria
    /// </summary>
    public class SearchCriteria
    {
        public const string SESSION_INSTANCE_KEY = "SearchReportSearchCriteria";
        public const string SESSION_KEEPALIVE_KEY = "SearchReportSearchKeepAlive";

        private static SearchCriteria instance = null;
        public static SearchCriteria Instance
        {
            get
            {
                if (instance == null && SearchCriteria.KeepAlive && System.Web.HttpContext.Current.Session[SESSION_INSTANCE_KEY] != null)
                    instance = (SearchCriteria)HttpContext.Current.Session[SESSION_INSTANCE_KEY];
                if (instance == null) KeepAlive = false;
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
        public string systemIds = string.Empty;
        public string componentIds = string.Empty;
        public string buildingIds = string.Empty;
        public string typeIds = string.Empty;
        public int flagAssigned = -1;
        private SearchCriteria() { }
    }

}
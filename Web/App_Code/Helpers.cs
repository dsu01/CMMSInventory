using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Specialized;
using System.Collections;

using NIH.CMMS.Inventory.BPL.LookUp;

namespace NIH.CMMS.Inventory.Web
{
    /// <summary>
    /// Summary description for Helpers
    /// </summary>
    public static class Helpers
    {
        static Helpers()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        //private static string[] _properties = new string[] { 
        // "Baltimore", "Bethesda", "Bethesda Off Campus", "Frederick", "Greenbelt",
        //  "Leased", "Navy", "North Carolina","Poolesville", "Rockville", "Rocky Mountain Lab","Washington DC",
        //};

        //public static StringCollection GetProperties()
        //{
        //    StringCollection properties = new StringCollection();
        //    properties.AddRange(_properties);
        //    return properties;
        //}

        //public static SortedList GetProperties(bool insertEmpty)
        //{
        //    SortedList properties = new SortedList();
        //    if (insertEmpty)
        //        properties.Add("-1", "--Please select one--");
        //    foreach (String property in _properties)
        //        properties.Add(property, property);
        //    return properties;
        //}

        //public static void GetProperties(DropDownList drplst)
        //{
        //    DataSet dsProperties = null;
        //    if (HttpContext.Current.Cache["CacheProperties"] == null)
        //    {
        //        dsProperties = GeneralLookUp.GetProperties();
        //        HttpContext.Current.Cache.Insert("CacheProperties", dsProperties, null, DateTime.Now.AddDays(5), TimeSpan.Zero);
        //    }
        //    else
        //    { dsProperties = (DataSet)HttpContext.Current.Cache["CacheProperties"]; }
        //    drplst.Items.Clear();
        //    drplst.DataSource = dsProperties;
        //    drplst.DataBind();
        //    drplst.Items.Insert(0, new ListItem("--Please select one--", "-1"));
        //}
        

        //public static void PopulateGroupListByProperty(string property, DropDownList drplst)
        //{
        //    DataSet dsGroupsByProperty = GeneralLookUp.GroupListByProperty(property);
        //    drplst.Items.Clear();
        //    drplst.DataSource = dsGroupsByProperty;
        //    drplst.DataBind();
        //    drplst.Items.Insert(0, new ListItem("--Please select one--", "-1"));

        //}

       
    }
}
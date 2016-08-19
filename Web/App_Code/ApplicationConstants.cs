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

namespace NIH.CMMS.Inventory.Web
{
    /// <summary>
    /// Summary description for ApplicationConstants
    /// </summary>
    public static class ApplicationConstants
    { 
        static ApplicationConstants()
        {
        }
    

        //Form Fields
        public const string FORM_TXT_OTHER = "Other";
        public const string SESSION_UOBJECT = "UserObject";
        public const string SESSION_USEROBJLOGINDET = "UserLoginObject";       
        public const string lOGIN_ID = "LoginId";
        public const string DBErrorMessage = "Cannot modify the WO information now until the proper procedure is followed.";
        public const string GeneralSuccessMessage = "Update successfully!";
        public const string TYPE = "Trouble Call";
        
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NIH.CMMS.Inventory.BOL.People;
using NIH.CMMS.Inventory.DAL.People;
using NIH.CMMS.Inventory.BOL.Common;

namespace NIH.CMMS.Inventory.BPL.People
{
   public static class LoginUser_Logic
    {
       public static LoginUser GetLoginUserBasicInfo(string domainName, string loginID)
       {
           if (!string.IsNullOrEmpty(domainName) && !string.IsNullOrEmpty(loginID))
           { return LoginUser_db.GetLoginUserBasicInfo(domainName, loginID); }
           else
           { return null; }
           
       }

       public static LoginUser GetLoginUserFullInfo(LoginUser basicInfoUser)
       {
           return LoginUser_db.GetLoginUserFullInfo(basicInfoUser);            

       }


       public static string LoginUpdate(string uname, string initial)
       {
           return LoginUser_db.LoginUpdate(uname, initial);
       }

       public static ValidationResult UpdateUserPreference(string uname, int refreshInterval, int dayslimit, int ysnAudioWarning)
       {
           return LoginUser_db.UpdateUserPreference(uname, refreshInterval, dayslimit, ysnAudioWarning);
       }
    }
}

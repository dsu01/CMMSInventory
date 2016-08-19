using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Collections;
using System.Text;

/// <summary>
/// Summary description for GetTypeOrUseList
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class GetTypeOrUseList : System.Web.Services.WebService
{


    [WebMethod]
    public string GetList()
    {
    //http://www.codeproject.com/KB/aspnet/Jquery_Autocomplete.aspx
        //var fetchEmail = emp.GetEmployeeList()
        //.Where(m => m.Email.ToLower().StartsWith(mail.ToLower()));
        //return fetchEmail.ToList();
        DataSet ds = NIH.CMMS.Inventory.BPL.LookUp.GeneralLookUp.GetEletricalTypeOrUse();
        StringBuilder sbTypeOrUse = new StringBuilder();

        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string s = ds.Tables[0].Rows[i][0].ToString();
                //if (s.ToUpper().StartsWith(prefixText.ToUpper())) 
                //{
                    sbTypeOrUse.AppendFormat("{0}:", s);
                //}

                sbTypeOrUse = sbTypeOrUse.Remove(sbTypeOrUse.Length - 1, 1); //Removes the extra ":"

            }
        }

        return sbTypeOrUse.ToString();
    }


}


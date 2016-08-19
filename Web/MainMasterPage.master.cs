using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIH.CMMS.Inventory.Web;
using NIH.CMMS.Inventory.BOL.People;

public partial class MainMasterPage : System.Web.UI.MasterPage
{
    
    ///Note: Cache data
    ///http://www.4guysfromrolla.com/articles/100902-1.3.aspx
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session[ApplicationConstants.SESSION_UOBJECT] == null)
            { 
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                LoginUser loginUsr = (LoginUser)Session[ApplicationConstants.SESSION_UOBJECT];
                //Page not use leftNav would not work
                if (lbUserName != null)
                    lbUserName.Text = "Welcome, " + loginUsr.LaborName;
            }
        }

     
    }

    override protected void OnInit(EventArgs e)
    {
        base.OnInit(e);


        //It appears from testing that the Request and Response both share the 
        // same cookie collection.  If I set a cookie myself in the Reponse, it is 
        // also immediately visible to the Request collection.  This just means that 
        // since the ASP.Net_SessionID is set in the Session HTTPModule (which 
        // has already run), thatwe can't use our own code to see if the cookie was 
        // actually sent by the agent with the request using the collection. Check if 
        // the given page supports session or not (this tested as reliable indicator 
        // if EnableSessionState is true), should not care about a page that does 
        // not need session
        if (Context.Session != null)
        {
            //Tested and the IsNewSession is more advanced then simply checking if 
            // a cookie is present, it does take into account a session timeout, because 
            // I tested a timeout and it did show as a new session
            if (Session.IsNewSession)
            {
                // If it says it is a new session, but an existing cookie exists, then it must 
                // have timed out (can't use the cookie collection because even on first 
                // request it already contains the cookie (request and response
                // seem to share the collection)
                string szCookieHeader = Request.Headers["Cookie"];
                if ((null != szCookieHeader) && (szCookieHeader.IndexOf("ASP.NET_SessionId") >= 0))
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
    }

    //protected void imgbtnWOSearch_Click(object sender, ImageClickEventArgs e)
    //{
    //    //string wonum = txtSearchWONum.Text.Trim();
    //    //if (wonum != "")
    //    //{ Response.Redirect("~/WODet.aspx?list=0&wonumber=" + wonum); }

    //}
    //protected void imgbtnWRSearch_Click(object sender, ImageClickEventArgs e)
    //{
    //    //string wrnum = txtSearchWRNum.Text.Trim();
    //    //if (wrnum != "")
    //    //{
    //    //    string wonum = WO_logic.FindWONumberByWRNumber(Convert.ToInt32(wrnum));
    //    //    if (wonum != string.Empty)
    //    //    {
    //    //        Response.Redirect("~/WODet.aspx?list=0&wonumber=" + wonum);
    //    //    }
    //    //    else {
    //    //        lblNoFound.Visible = true;
    //    //        lblNoFound.Text = "Cannot find a Work Order by this Work Request Number.";
    //    //    }
    //    //}
    //}


}

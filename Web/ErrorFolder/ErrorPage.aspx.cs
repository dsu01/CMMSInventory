using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ErrorFolder_ErrorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string src = Request.QueryString["id"];
                if (src == "1")
                {
                    //if come from authentication
                    Label1.Text = "Sorry, you are not authorized to use this application.<br />";
                }
                else if (src == "2")
                {
                    Label1.Text = "Sorry, your initial is not correct.<br />";
                }
                else if (Request.QueryString["error"].ToString() != "")
                {
                    Label1.Text = Request.QueryString["error"].ToString();
                }
                else
                {
                    Label1.Text = "Sorry, error occur.";
                }
            }
        }

    }
}

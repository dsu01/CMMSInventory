using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIH.CMMS.Inventory.BOL.People;
using NIH.CMMS.Inventory.BPL.People;
using NIH.CMMS.Inventory.Web;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    int count;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
            //When user open the web page, run spn_loginAuthentication. 
            //If ok, get TakenBy and Username. If not, go to the error page asking him to call Tom Myers,... 
            string[] s = User.Identity.Name.Split('\\');
            LoginUser loginUsrdet = new LoginUser();
            //pass in domain name s[0] and login id s[1], return username,takenby and role
            if (string.IsNullOrEmpty(s[0]) || string.IsNullOrEmpty(s[1]))
            {
                FailureText.Text = "Please check your Windows Login: Domain: ";
                if (!string.IsNullOrEmpty(s[0]))
                {
                    FailureText.Text += s[0];
                    if (!string.IsNullOrEmpty(s[1]))
                    { FailureText.Text += "User Name: " + s[1]; }
                }

            }
            else
            {
                //get user name, taken by, and role
                loginUsrdet = LoginUser_Logic.GetLoginUserBasicInfo(s[0], s[1]);

                if (loginUsrdet != null)
                {
                    HttpContext.Current.Session[ApplicationConstants.SESSION_USEROBJLOGINDET] = loginUsrdet;
                    if (!string.IsNullOrEmpty(loginUsrdet.LaborName))
                    {
                        lbUserName.Text = loginUsrdet.LaborName;
                        hidTakenBy.Value = loginUsrdet.TakenBy;

                        //for testing only
                        //FailureText.Text = "User data retrieved from windows: Domain Name: " + s[0] + ", UserName: " + s[1];
                        //FailureText.Text += "<br />User data retrieved from database: UserName: " + loginUsrdet.UserName + " Takenby: " + loginUsrdet.TakenBy;
                    }
                    else
                    {
                        //Message.Text = "User not exist " & s(0) & s(1)
                        Response.Redirect("~/ErrorFolder/ErrorPage.aspx?id=1");
                    }
                    hidCount.Value = "0";
                    //Todo: add Modal popup
                    //btnSubmit.Attributes.Add("onclick", "var strReturn; strReturn=window.showModalDialog('Warning.aspx',null,'status:no;dialogWidth:510px; dialogHeight:400px;dialogHide:false;help:no;scroll:yes');if (strReturn == null) self.close();");
                    Page.SetFocus(strPassword);
                }
                else
                { Response.Redirect("~/ErrorFolder/ErrorPage.aspx?id=1"); }


            }

        //}
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            #region "log in user"
            string uname = lbUserName.Text.Trim();
            string pwd = strPassword.Text.Trim();

            if (pwd != string.Empty)
            {
                if (hidTakenBy.Value != string.Empty && uname != string.Empty)
                {
                    if (pwd.ToUpper() == hidTakenBy.Value.ToUpper())
                    {
                        LoginUser basicUserInfo = (LoginUser)HttpContext.Current.Session[ApplicationConstants.SESSION_USEROBJLOGINDET];
                        LoginUser fullUserInfo = LoginUser_Logic.GetLoginUserFullInfo(basicUserInfo);
                        HttpContext.Current.Session[ApplicationConstants.SESSION_UOBJECT] = fullUserInfo;

                        //Insert a record in tblZAppUser
                       string loginID = LoginUser_Logic.LoginUpdate(uname, pwd);
                       //string loginID = "55";
                         if (loginID != "")
                        {
                            if (fullUserInfo.YsnInventory != -1)
                            { //cannot log in to this system.
                                FailureText.Text = "You are not allowed to use this application."; }
                            else
                            {
                                Session[ApplicationConstants.lOGIN_ID] = loginID;
                                FormsAuthentication.SetAuthCookie(uname, false);
                                //not save the cookie persistently
                                FormsAuthentication.RedirectFromLoginPage(uname, false);
                            }
                        }                       
                        else
                        { FailureText.Text = "Cannot add login record!"; }
                    }
                    else
                    {
                        FailureText.Text = "Please try again! Initial does not match!";
                        count = Convert.ToInt16(hidCount.Value);
                        count = count + 1;
                        if (count >= 3)
                        {
                            Response.Redirect("ErrorFolder/ErrorPage.aspx?id=2");
                        }
                        hidCount.Value = count.ToString();
                    }

                }
                else
                { FailureText.Text = "Missing required field."; }
            }
            else
            {
                //btnSubmit.Attributes.Add("onclick"
                btnSubmit.Attributes.Remove("onclick");
                FailureText.Text = "Please enter initial!";
            }
            #endregion

        }
        else
        { FailureText.Text = "Missing required field."; }
    }
}


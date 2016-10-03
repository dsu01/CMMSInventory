<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CMMS Inventory Login</title>
<link href="App_Themes/MainTheme/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="frmLogin" runat="server" defaultbutton="btnSubmit">
    <center>
  <p>&nbsp;</p>
                    <table width="700" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td class="baseTL"></td>
    <td class="baseTop"></td>
    <td class="baseTR"></td>
  </tr>
  <tr>
    <td class="baseLSide"></td>
    <td class="baseContent">
    
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:White">
            <tr height="47">
                <td align="left" bgcolor="#007866" colspan="3"><asp:HyperLink ID="hplBackHome" runat="server" NavigateUrl="~/Default.aspx"><asp:Image ID="imgHeader" runat="server" ImageUrl="~/Image/NIH_logo_new.png" /></asp:HyperLink></td>
                
            </tr>
            <tr>
               <td width="420" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="24">
                      <tr>
                        <td valign="top" align="left"><p class="redheading">WARNING NOTICE</p>
                          <p class="text7">This is a U.S. Government computer system, which may be accessed and used only
                        for authorized Government business by authorized personnel. Unauthorized access
                        or use of this computer system may subject violators to criminal, civil, and/or
                        administrative action.</p>
                        <p class="text7">All information on this computer system may be intercepted, recorded, read,
                        copied, and disclosed by and to authorized personnel for official purposes,
                        including criminal investigations. Such information includes sensitive data
                        encrypted to comply with confidentiality and privacy requirements. Access or use
                        of this computer system by and person, whether authorized or unauthorized,
                        constitutes consent to these terms. There is no right of privacy in this system.</p>
                          </td>
                      </tr>
                    </table>
                </td>
                <td style="background: url(Image/bg_Login.jpg);" width="1">&nbsp;</td>
                <td width="260" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="10">
                        <tr>
            <td valign="top" width="100%"><br /><p class="redheading">Account Login</p>
              
<!--- Login form begins here --->              
              <table width="100%" border="0" cellspacing="4" cellpadding="4">
              
                <tr>
			                <td class="leftLabel" Width="150">User Name:</td>
			                <td Width="100" align="left">
                                <asp:Label ID="lbUserName" runat="server" Font-Size="0.8em" Width="100"></asp:Label>	
                               
			                </td>
		                </tr>
		                 <tr>
			                <td  class="leftLabel" valign="top">Initials:</td>
			                <td><asp:TextBox ID="strPassword" runat="server" Font-Size="0.8em" TextMode="Password" Width="100"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="strPassword"
                                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
		                    </td>		
		                </tr>
		                <tr>
                            <td>
                                <br />                            </td>
                            <td> <br /> 
                            <asp:Button ID="btnSubmit" runat="server" CssClass="submit" Text="Login" OnClick="btnSubmit_Click" />
                            
                            </td>
                        </tr>
                         <tr>
                            <td align="center" colspan="2" style="color: red" class="text7">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
							<td colspan="2" class="footer"><br>
								
							<b>Notes:</b> This is the CMMS Inventory system. Please contact with <%= ConfigurationManager.AppSettings["POCNames"].ToString()%> for your login account.
							    	
							</td>
						</tr>
                        <tr>
								<td colspan="2">
								<INPUT type="hidden" runat="server" id="hidCount" NAME="hidCount">
								<INPUT type="hidden" runat="server" id="hidUserName" NAME="hidUserName">
								<INPUT type="hidden" runat="server" id="hidTakenBy" NAME="hidTakenBy">
								
								</td>
							</tr>
              </table>
<!--- Form table ends here --->               
              
              </td>
          </tr>
        </table></td>
      </tr>
    </table>
      
                             
		           
    </td>
     <td class="baseRSide"></td>
    </tr>
   
 
  <tr>
    <td class="baseBL"></td>
    <td class="baseBTTM"></td>
    <td class="baseBR"></td>
  </tr>
  <tr><td align="center" colspan="3">
  
     <div align="center" style="font-size: 11px; padding-top: 8px">
                                Contact: <%= ConfigurationManager.AppSettings["POCNames"].ToString()%>  &nbsp;&nbsp;
			                    Email: <A href='mailto:<%= ConfigurationManager.AppSettings["POCEmail"].ToString()%>?Subject=<%= ConfigurationManager.AppSettings["ApplicationTitle"].ToString()%> Version'><font color="white"><u><%= ConfigurationManager.AppSettings["POCNames"].ToString()%></u></font></A> &nbsp;
			                   Tel: <%= ConfigurationManager.AppSettings["POCPhone"].ToString()%></div>
                            <div align="center" style="font-size: 11px; padding-top: 8px">                                
                                Copyright &copy;2016, OD/ORF. All Rights Reserved. </div>
   </td></tr>
</table>                                   
                                        
          
  </center>


    </form>
</body>
</html>

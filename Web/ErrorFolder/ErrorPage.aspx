<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorFolder_ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>CMMSWeb Error Page</title>
   
</head>
<body>
    
  
     <div id="fullheightcontainer">
        <form id="form2" runat="server" class="formFullSize"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td class="baseTL"></td>
    <td class="baseTop"></td>
    <td class="baseTR"></td>
  </tr>
  <tr>
    <td class="baseLSide"></td>
    <td class="baseContent">
           <div id="wrapper">
                <div id="banner">
                <table width="100%">
                    <tr>
                         <!-- Modified to change banner from Search and Incident to Safety and Integrity -->
                        <td align="center" width="426"><asp:HyperLink ID="hplBackHome" runat="server" NavigateUrl="~/Default.aspx"><asp:Image ID="imgHeader" runat="server" SkinID="logo"/></asp:HyperLink></td>
                        <td></td>
                    </tr>
                </table>               
            </div>
             
                <div id="outer">
                  
                                <div id="leftNav">
                                </div>
                                 <div id="center">
<table width="100%" cellpadding="1" cellspacing="1" border="0">
				
				<tr>
					<td class="redheading" width="100%" colSpan="2" height="40"><br />&nbsp;Error Page&nbsp;</td>
				</tr> <!--end of greeting line-->
				<tr class="text7">
					<td><br>
						<br>
						<center>
							<b><asp:Label id="Label1" runat="server"></asp:Label><br>
							Please call <%= ConfigurationManager.AppSettings["POCNames"].ToString()%> at <%= ConfigurationManager.AppSettings["POCPhone"].ToString()%> or <A href='mailto:<%= ConfigurationManager.AppSettings["POCEmail"].ToString()%>?Subject=<%= ConfigurationManager.AppSettings["ApplicationTitle"].ToString()%> Version'><font color="white"><u><%= ConfigurationManager.AppSettings["POCNames"].ToString()%></u></font></A>
								</b>
							<br />
							<br />
							<br />
							<asp:Panel ID="pnlError" Runat="server" Visible="False"></asp:Panel>
						</center>
					</td>
				</tr>
				<tr>
				    <td><br /><br /></td>
				</tr>
				<tr>
				    <td><br /><br /></td>
				</tr>
				<tr>
				    <td><br /><br /></td>
				</tr>
			</table>
 </div>
                                
                </div>   
                       
           </div> 
     </td>
     <td class="baseRSide"></td>
    </tr>
   
 
  <tr>
    <td class="baseBL"></td>
    <td class="baseBTTM"></td>
    <td class="baseBR"></td>
  </tr>
  <tr><td align="center" colspan="3"> <p class="footer">Copyright ©2011, OD/ORF. All Rights Reserved.</p></td></tr>
</table>                                   
         </form>
     </div>
   
</body>
</html>



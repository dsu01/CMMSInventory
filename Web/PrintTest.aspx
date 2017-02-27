<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintTest.aspx.cs" Inherits="PrintTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
		<link href="App_Themes/MainTheme/main.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<form id="frmPrintFacility" method="post" runat="server">
		
		    <asp:Button ID="btnPrintAll" CssClass="submitRed" runat="Server" Text="Print All Pages" OnClientClick="Javascript:CallPrint('printGrid','displayText');" UseSubmitBehavior="False" />
		     <div id="printGrid" style="margin:10px; background-color: white">	
              <div id="displayText" style="display:none"></div>  
              <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
         </div>               
	 
		
		</form>
	</body>
</html>

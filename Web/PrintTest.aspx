<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintTest.aspx.cs" Inherits="PrintTest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Page</title>
		<link href="App_Themes/MainTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" language="JavaScript" src="JS/PrintGrid.js"></script>
</head>
	<body>
		<form id="frmPrintFacility" method="post" runat="server">		
		    &nbsp;&nbsp; <asp:Button ID="btnPrint" CssClass="submitRed" runat="Server" Text="Print Page" OnClientClick="Javascript:CallPrint('printGrid','displayText');" UseSubmitBehavior="False" />
      
		    <div id="printGrid">	
              <div id="displayText" style="display:none"></div>
              <asp:PlaceHolder ID="PlaceHolder1" runat="server" EnableViewState="true"></asp:PlaceHolder>
            </div>
		
		</form>
	</body>
</html>

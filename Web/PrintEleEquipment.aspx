﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintEleEquipment.aspx.cs" Inherits="PrintEleEquipment" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

		<link href="App_Themes/MainTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" language="JavaScript" src="JS/PrintGrid.js"></script>
   
</head>
	<body>
		<form id="frmPrintEleEquipment" runat="server">
            <br /><br />
        &nbsp;&nbsp; <asp:Button ID="btnPrint" CssClass="submitRed" runat="Server" Text="Print Page" OnClientClick="Javascript:CallPrint('printGrid','displayText');" UseSubmitBehavior="False" />
       <%--  &nbsp;&nbsp; <asp:Button ID="btnPrint" CssClass="submitRed" runat="Server" Text="Print Page" OnClientClick="Javascript:window.print();" UseSubmitBehavior="False" />--%>
		<div id="printGrid" style="background-color:white;">	
             <div id="displayText" style="display:none"></div>
	                 <table cellspacing="0" cellpadding="3" width="635">   
                        <tr style="height:30pt; border-bottom: solid 1px #000;">
                            <td colspan="4" style="width:420px; border-bottom: solid 1px #000; font-weight:bold; text-align: center;">
                                Electrical Equipment Inventory Card

                            </td>
                            <td class="inventoryTopRightCell" width="100" valign="baseline">Facility#:</td>
                            <td width="100"> 
                             <asp:Label ID="lbFacNum" runat="server" CssClass="text11fix"></asp:Label>        
                            </td>                
                        </tr>
                        <tr style="height:25pt; border-bottom: solid 1px #000;">
                            <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                            <asp:Label id="lbFacSystem" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                            </td>
                            <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                            <td class="inventoryTopRightCellBtm"><asp:Label id="lbFacFacilityID" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                            </td> 
                        </tr>
                        <tr style="height:25pt; border-bottom: solid 1px #000;">
                            <td colspan="4" class="inventoryTopLeftCell">Function:
                            <asp:Label id="lbFacFunction" CssClass="text11fix" Runat="server"  />
                           </td>
                            <td colspan="2" class="inventoryTopRightCell">AAALAC
		                    <asp:CheckBox ID="ckAAALAC" Runat="server" Enabled="False"></asp:CheckBox>
		                    &nbsp;BSL<asp:CheckBox ID="ckBSL" Runat="server" Enabled="False"></asp:CheckBox>&nbsp;TJC<asp:CheckBox ID="ckTJC" Runat="server" Enabled="False"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr style="height:25pt">   
                            <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                            <asp:Label id="lbFacBuilding" Runat="server" SkinID="NoborderShortTextBoxForPrint" />&nbsp;&nbsp;
                            Floor:<asp:Label id="lbFacFloor" Runat="server" SkinID="NoborderShortTextBoxForPrint" />&nbsp;&nbsp;
                            <font color="#BA3516">Location:</font><asp:Label id="lbFacLocation" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
                            <td class="inventoryTopRightCell">WR#:</td>
                            <td class="inventoryTopRightCellBtm"><asp:Label id="lbWRNumber" Runat="server" SkinID="NoborderShortTextBoxForPrint" /></td>
                        </tr>
           
                      </table>
	                 <table width="635" border="1" cellpadding="2" cellspacing="0" class="componentTable">	
				            <tr style="height:40pt">
					            <td class="leftLabel" width="120">Equipment ID (Other):</td>
					            <td class="text7" width="213">
					            <asp:Label ID="lbEquipmentID" runat="server" />
					            </td>					
					            <td class="leftLabel" width="120">VOLTS:</td>
					            <td class="text7" width="159"><asp:Label runat="server" ID="lbVolts" />
					            </td>
				            </tr>
				            <tr style="height:40pt">
					            <td class="leftLabel">Type or Use:</td>
					            <td class="text7"><asp:Label ID="lbTypeOrUse" runat="server" /></td>
					            <td class="leftLabel">Manufacturer ID:</td>
					            <td class="text7"><asp:Label ID="lbManufacturer" runat="server" />
					            </td>
				            </tr>
				            <tr style="height:40pt">
					            <td class="leftLabel">AMP</td>
					            <td class="text7"><asp:Label ID="lbAMP" runat="server" /></td>
					            <td class="leftLabel">KVA:</td>
					            <td class="text7"><asp:Label ID="lbKVA" runat="server" />
					            </td>
				            </tr>
				            <tr style="height:40pt">
					            <td class="leftLabel">Volts Primary:</td>
					            <td class="text7" ><asp:Label ID="lbVoltsPrimary" runat="server">&nbsp;</asp:Label></td>
					            <td class="leftLabel">Volts Secondary:</td>
					            <td class="text7" ><asp:Label ID="lbVoltsSecondary" runat="server">&nbsp;</asp:Label>
					            </td>
				            </tr>
				            <tr style="height:40pt">
					            <td class="leftLabel">Ph</td>
					            <td class="text7"><asp:Label ID="lbPH" runat="server">&nbsp;</asp:Label></td>
					            <td class="leftLabel">W:</td>
					            <td class="text7"><asp:Label ID="lbW" runat="server">&nbsp;</asp:Label>
					            </td>
				            </tr>
				            <tr style="height:40pt">
					            <td class="leftLabel">No. of CKTS:</td>
					            <td class="text7" ><asp:Label ID="lbNumCKTS" runat="server">&nbsp;</asp:Label></td>
					            <td class="leftLabel">CKTS Used:</td>
					            <td class="text7"><asp:Label ID="lbCKTSUsed" runat="server">&nbsp;</asp:Label>
					            </td>
				            </tr>
			            </table>
		             <table width="635" border="0">
				            <tr style="height:80pt">
					            <td class="leftLabel" colspan="2"><br />Comments:<br /><br />
					            <asp:Label id="lbEletricalComments" SkinID="NoborderCommentForPrint" Runat="server">&nbsp;</asp:Label><br />
						
					            </td>
				            </tr>				
				            <tr style="height:10pt">
				                <td colspan="2"><hr size="2" /></td>
				            </tr>
				            <tr style="font-size:x-small;height:20pt">
				                <td align="left">NIH-1884<br />Rev.02/2011</td>
				                <td align="right">NIH\ORF\RPMO</td>
				            </tr>
		                </table>	
	         
			
		</div>
		
	
             
		</form>
	</body>
</html>
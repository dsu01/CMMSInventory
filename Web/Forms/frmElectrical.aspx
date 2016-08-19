<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" CodeFile="frmElectrical.aspx.cs" Inherits="Forms_frmElectrialEquipment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
		<link href="../App_Themes/MainTheme/main.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<form id="frmEletrical" method="post" runat="server">
		<div id="contentstart" style="background-color:White">
             <table cellspacing="0" cellpadding="3" width="635" border="0">   
            <tr style="height:30pt">
                <td colspan="4" class="inventoryTopLeftTitle" width="420">Equipment Inventory Card</td>
                <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="130"> 
                 &nbsp;  
                </td>
                
            </tr>
            <tr style="height:25pt">
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
               &nbsp;
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCellBtm">&nbsp;
                </td> 
            </tr>
            <tr style="height:25pt">
                <td colspan="4" class="inventoryTopLeftCell">Function:
                &nbsp;
               </td>
                <td colspan="2" class="inventoryTopRightCell">AAALAC
		        <asp:CheckBox ID="ckAAALAC" Runat="server" Enabled="False"></asp:CheckBox>
		        &nbsp;BSL<asp:CheckBox ID="ckBSL" Runat="server" Enabled="False"></asp:CheckBox>&nbsp;TJC<asp:CheckBox ID="ckTJC" Runat="server" Enabled="False"></asp:CheckBox>
                </td>
            </tr>
            <tr style="height:25pt">   
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Floor:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <font color="#BA3516">Location:</font>&nbsp;</td>
                <td class="inventoryTopRightCell">WR#:</td>
                <td class="inventoryTopRightCellBtm">&nbsp;</td>
            </tr>
           
          </table>
	         <table width="635" border="0" cellpadding="2" cellspacing="0" class="componentTable">	
				<tr style="height:40pt">
					<td class="leftLabel" width="120">Equipment ID (Other):</td>
					<td class="text7" width="213">
					&nbsp;
					</td>					
					<td class="leftLabel" width="120">VOLTS:</td>
					<td class="text7" width="159">&nbsp;
					</td>
				</tr>
				<tr style="height:40pt">
					<td class="leftLabel">Type or Use:</td>
					<td class="text7">&nbsp;</td>
					<td class="leftLabel">Manufacturer ID:</td>
					<td class="text7">&nbsp;
					</td>
				</tr>
				<tr style="height:40pt">
					<td class="leftLabel">AMP</td>
					<td class="text7">&nbsp;</td>
					<td class="leftLabel">KVA:</td>
					<td class="text7">&nbsp;
					</td>
				</tr>
				<tr style="height:40pt">
					<td class="leftLabel">Volts Primary:</td>
					<td class="text7" >&nbsp;</td>
					<td class="leftLabel">Volts Secondary:</td>
					<td class="text7" >&nbsp;
					</td>
				</tr>
				<tr style="height:40pt">
					<td class="leftLabel">Ph</td>
					<td class="text7">&nbsp;</td>
					<td class="leftLabel">W:</td>
					<td class="text7">&nbsp;
					</td>
				</tr>
				<tr style="height:40pt">
					<td class="leftLabel">No. of CKTS:</td>
					<td class="text7" >&nbsp;</td>
					<td class="leftLabel">CKTS Used:</td>
					<td class="text7">&nbsp;
					</td>
				</tr>
			</table>
		     <table width="635" border="0">
				<tr style="height:80pt">
					<td class="leftLabel" colspan="2"><br />Comments:<br /><br />
				&nbsp;
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

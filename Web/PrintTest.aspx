<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintTest.aspx.cs" Inherits="PrintTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
		<link href="App_Themes/MainTheme/main.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<form id="frmPrintFacility" method="post" runat="server">
		<div id="contentstart" style="background-color:White">
		 <div style="page-break-after:always">	  			
	       <table cellspacing="0" cellpadding="3" width="635" border="0">   
           <tr style="height:15pt">
                <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="100"> 
                <asp:Label ID="lbFacNum1" runat="server" CssClass="text11fix"></asp:Label>           
                </td>
                
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                <asp:Label id="lbFacSystem1" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCellBtm"><asp:Label id="lbFacFacilityID1" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td> 
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell">Function:
                <asp:TextBox id="lbFacFunction1" Runat="server" SkinID="NoborderTextBoxForPrint"/>
               </td>
                <td colspan="2" class="inventoryTopRightCell">
                AAALAC<asp:CheckBox ID="ckAAALAC1" Runat="server" Enabled="False"></asp:CheckBox>
		        &nbsp;BSL<asp:CheckBox ID="ckBSL1" Runat="server" Enabled="False"></asp:CheckBox>&nbsp;
		        TJC<asp:CheckBox ID="ckTJC1" Runat="server" Enabled="False"></asp:CheckBox>
                </td>
            </tr>
            <tr style="height:12pt">   
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                <asp:TextBox id="lbFacBuilding1" Runat="server" SkinID="NoborderShortTextBoxForPrint" />
                Floor:<asp:TextBox id="lbFacFloor1" Runat="server" SkinID="NoborderShortTextBoxForPrint" />
                <font color="#BA3516">Location:</font><asp:TextBox id="lbFacLocation1" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
                <td class="inventoryTopRightCell">WR#:</td>
                <td class="inventoryTopRightCellBtm"><asp:TextBox id="lbWRNumber1" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
            </tr>           
          </table>	
             <asp:PlaceHolder ID = "PlaceHolder1" runat="server" /> 

			<table width="635" border="0" cellpadding="1" cellspacing="0" class="componentTable">		
				 	
				<tr style="height:10pt">
				    <td class="leftLabel" width="160">1.Equipment ID:</td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID1" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">2.Location:</td>
					<td class="text7"><asp:TextBox ID="lbLocation1" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					
					<td class="leftLabel">3.Type or Use:</td>
					<td class="text7"><asp:TextBox ID="lbTypeUse1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTypeUse2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">4.Manufacturer:</td>
					<td class="text7"><asp:TextBox ID="lbManufacturer1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbManufacturer2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
				<td class="leftLabel">5.Model No.:</td>
					<td class="text7"><asp:TextBox ID="lbModelNum1" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">6.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbSerialNum1" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">			
					<td class="leftLabel">7.Size:</td>
					<td class="text7"><asp:TextBox ID="lbSize1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbSize2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">8.Date Installed:</td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbInstalledDate2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">				
					<td class="leftLabel">9.Capacity:</td>
					<td class="text7"><asp:TextBox ID="lbCapacity1" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">10.Capacity (H/T):</td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbCapacityHT2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">11.Fual or Refri:</td>
					<td class="text7"><asp:TextBox ID="lbFuel1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbFuel2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">12.Motor Mfg'r:</td>
					<td class="text7"><asp:TextBox ID="lbMotorManu1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorManu2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">13.H.P.:</td>
					<td class="text7"><asp:TextBox ID="lbHP1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbHP2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">14.Type:</td>
					<td class="text7"><asp:TextBox ID="lbMotorType1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorType2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">15.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorSerialNum2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">16.Motor Installed:</td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorInstalledDate2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">17.Model:</td>
					<td class="text7"><asp:TextBox ID="lbMotorModel1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorModel2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">18.Frame:</td>
					<td class="text7"><asp:TextBox ID="lbFrame1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbFrame2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">19.R.P.M.:</td>
					<td class="text7"><asp:TextBox ID="lbRPM1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbRPM2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">20.Voltage:</td>
					<td class="text7"><asp:TextBox ID="lbVoltage1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbVoltage2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">21.Amperes:</td>
					<td class="text7"><asp:TextBox ID="lbAmperes1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbAmperes2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">22.Phase-Cycle:</td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPhaseCycle2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">				
					<td class="leftLabel">23.BSL Class.:</td>
					<td class="text7"><asp:TextBox ID="lbBSLClass1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbBSLClass2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">24.TJC Value:</td>
					<td class="text7"><asp:TextBox ID="lbTJC1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTJC2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">25.PM Schedule:</td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule1" Runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPMSchedule2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule4" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				
			
			</table>
			<table width="635" border="0">
				<tr style="height:18pt">
					<td class="leftLabel" colspan="2">Comments:<br />
					<asp:TextBox id="lbComments1" Runat="server" SkinID="NoborderCommentForPrint" />						
					</td>
				</tr>				
				<tr style="height:5pt">
				    <td colspan="2"><hr size="2" /></td>
				</tr>
				<tr style="font-size:x-small;height:8pt">
				    <td align="left">NIH-1884<br />Rev.02/2011</td>
				    <td align="right">NIH\ORF\RPMO</td>
				</tr>
				
		    </table>	
			</asp:Panel>
		</div><p>&nbsp;</p>
		<div style="page-break-after:always" id="divMechanicalPage2" runat="server" visible="false">
		<table cellspacing="0" cellpadding="3" width="635" border="0">   
           <tr style="height:15pt">
                <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="100"> 
                <asp:Label ID="lbFacNum2" runat="server" CssClass="text11fix">></asp:Label>          
                </td>
                
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                <asp:Label id="lbFacSystem2" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCellBtm"><asp:Label id="lbFacFacilityID2" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td> 
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell">Function:
                 <asp:TextBox id="lbFacFunction2" Runat="server" SkinID="NoborderTextBoxForPrint"/>                
               </td>
                <td colspan="2" class="inventoryTopRightCell">AAALAC
		        <asp:CheckBox ID="ckAAALAC2" Runat="server" Enabled="False"></asp:CheckBox>
		        &nbsp;BSL<asp:CheckBox ID="ckBSL2" Runat="server" Enabled="False"></asp:CheckBox>&nbsp;TJC<asp:CheckBox ID="ckTJC2" Runat="server" Enabled="False"></asp:CheckBox>
                </td>
            </tr>
            <tr style="height:12pt">   
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                 <asp:TextBox id="lbFacBuilding2" Runat="server" SkinID="NoborderShortTextBoxForPrint" />               
                Floor:<asp:TextBox id="lbFacFloor2" Runat="server" SkinID="NoborderShortTextBoxForPrint" />              
                <font color="#BA3516">Location:</font><asp:TextBox id="lbFacLocation2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
                <td class="inventoryTopRightCell">WR#:</td>
                <td class="inventoryTopRightCellBtm"><asp:TextBox id="lbWRNumber2" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
            </tr>
           
          </table>			
		<table width="635" border="0" cellpadding="2" cellspacing="0" class="componentTable">			
				<tr style="height:10pt">
				    <td class="leftLabel" width="160">1.Equipment ID:</td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID6" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">2.Location:</td>
					<td class="text7"><asp:TextBox ID="lbLocation6" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					
					<td class="leftLabel">3.Type or Use:</td>
					<td class="text7"><asp:TextBox ID="lbTypeUse6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTypeUse7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">4.Manufacturer:</td>
					<td class="text7"><asp:TextBox ID="lbManufacturer6" runat="server" Text="" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbManufacturer7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
				<td class="leftLabel">5.Model No.:</td>
					<td class="text7"><asp:TextBox ID="lbModelNum6" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">6.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbSerialNum6" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">				
					<td class="leftLabel">7.Size:</td>
					<td class="text7"><asp:TextBox ID="lbSize6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbSize7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">8.Date Installed:</td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbInstalledDate7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">9.Capacity:</td>
					<td class="text7"><asp:TextBox ID="lbCapacity6" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">10.Capacity (H/T):</td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbCapacityHT7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">11.Fual or Refri:</td>
					<td class="text7"><asp:TextBox ID="lbFuel6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbFuel7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">12.Motor Mfg'r:</td>
					<td class="text7"><asp:TextBox ID="lbMotorManu6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorManu7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">13.H.P.:</td>
					<td class="text7"><asp:TextBox ID="lbHP6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbHP7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">14.Type:</td>
					<td class="text7"><asp:TextBox ID="lbMotorType6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorType7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">15.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorSerialNum7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">16.Motor Installed:</td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorInstalledDate7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">17.Model:</td>
					<td class="text7"><asp:TextBox ID="lbMotorModel6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorModel7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">18.Frame:</td>
					<td class="text7"><asp:TextBox ID="lbFrame6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbFrame7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">19.R.P.M.:</td>
					<td class="text7"><asp:TextBox ID="lbRPM6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbRPM7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">20.Voltage:</td>
					<td class="text7"><asp:TextBox ID="lbVoltage6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbVoltage7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">21.Amperes:</td>
					<td class="text7"><asp:TextBox ID="lbAmperes6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbAmperes7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">22.Phase-Cycle:</td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPhaseCycle7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">23.BSL Class.:</td>
					<td class="text7"><asp:TextBox ID="lbBSLClass6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbBSLClass7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">24.TJC Value:</td>
					<td class="text7"><asp:TextBox ID="lbTJC6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTJC7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">25.PM Schedule:</td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule6" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPMSchedule7" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule8" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule9" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule10" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				
				
			</table>
		<table width="635" border="0">
				<tr style="height:18pt">
					<td class="leftLabel" colspan="2">Comments:<br />
					<asp:TextBox id="lbComments2" Runat="server" SkinID="NoborderCommentForPrint" />						
					</td>
				</tr>				
				<tr style="height:5pt">
				    <td colspan="2"><hr size="2" /></td>
				</tr>
				<tr style="font-size:x-small;height:8pt">
				    <td align="left">NIH-1884<br />Rev.02/2011</td>
				    <td align="right">NIH\ORF\RPMO</td>
				</tr>
				
		    </table>	
		</div><p>&nbsp;</p>
		<div style="page-break-after:always" id="divMechanicalPage3" runat="server" visible="false">	
		<table cellspacing="0" cellpadding="3" width="635" border="0">   
           <tr style="height:15pt">
                <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="100"> 
                <asp:Label ID="lbFacNum3" runat="server" CssClass="text11fix"></asp:Label>  
                </td>
                
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                <asp:Label id="lbFacSystem3" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCellBtm"><asp:Label id="lbFacFacilityID3" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td> 
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell">Function:
              <asp:TextBox id="lbFacFunction3" Runat="server" SkinID="NoborderTextBoxForPrint"/>    
               </td>
                <td colspan="2" class="inventoryTopRightCell">
                AAALAC<asp:CheckBox ID="ckAAALAC3" Runat="server" Enabled="False"></asp:CheckBox>
		        &nbsp;BSL<asp:CheckBox ID="ckBSL3" Runat="server" Enabled="False"></asp:CheckBox>&nbsp;
		        TJC<asp:CheckBox ID="ckTJC3" Runat="server" Enabled="False"></asp:CheckBox>
                </td>
            </tr>
            <tr style="height:12pt">   
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                <asp:TextBox ID="lbFacBuilding3" Runat="server" SkinID="NoborderShortTextBoxForPrint" /> 
                Floor:<asp:TextBox ID="lbFacFloor3" Runat="server" SkinID="NoborderShortTextBoxForPrint" /> 
                <font color="#BA3516">Location:</font><asp:TextBox ID="lbFacLocation3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
                <td class="inventoryTopRightCell">WR#:</td>
                <td class="inventoryTopRightCellBtm"><asp:TextBox ID="lbWRNumber3" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
            </tr>
           
          </table>		
		<table width="635" border="0" cellpadding="2" cellspacing="0" class="componentTable">
				<tr style="height:10pt">
				    <td class="leftLabel" width="160">1.Equipment ID:</td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID11" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">2.Location:</td>
					<td class="text7"><asp:TextBox ID="lbLocation11" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					
					<td class="leftLabel">3.Type or Use:</td>
					<td class="text7"><asp:TextBox ID="lbTypeUse11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTypeUse12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">4.Manufacturer:</td>
					<td class="text7"><asp:TextBox ID="lbManufacturer11" runat="server" Text="" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbManufacturer12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
				<td class="leftLabel">5.Model No.:</td>
					<td class="text7"><asp:TextBox ID="lbModelNum11" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">6.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbSerialNum11" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">				
					<td class="leftLabel">7.Size:</td>
					<td class="text7"><asp:TextBox ID="lbSize11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbSize12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">8.Date Installed:</td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbInstalledDate12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">9.Capacity:</td>
					<td class="text7"><asp:TextBox ID="lbCapacity11" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">10.Capacity (H/T):</td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbCapacityHT12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">11.Fual or Refri:</td>
					<td class="text7"><asp:TextBox ID="lbFuel11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbFuel12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">12.Motor Mfg'r:</td>
					<td class="text7"><asp:TextBox ID="lbMotorManu11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorManu12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">13.H.P.:</td>
					<td class="text7"><asp:TextBox ID="lbHP11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbHP12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">14.Type:</td>
					<td class="text7"><asp:TextBox ID="lbMotorType11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorType12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">15.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorSerialNum12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">16.Motor Installed:</td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorInstalledDate12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">17.Model:</td>
					<td class="text7"><asp:TextBox ID="lbMotorModel11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorModel12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">18.Frame:</td>
					<td class="text7"><asp:TextBox ID="lbFrame11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbFrame12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">19.R.P.M.:</td>
					<td class="text7"><asp:TextBox ID="lbRPM11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbRPM12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">20.Voltage:</td>
					<td class="text7"><asp:TextBox ID="lbVoltage11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbVoltage12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">21.Amperes:</td>
					<td class="text7"><asp:TextBox ID="lbAmperes11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbAmperes12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">22.Phase-Cycle:</td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPhaseCycle12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">23.BSL Class.:</td>
					<td class="text7"><asp:TextBox ID="lbBSLClass11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbBSLClass12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">24.TJC Value:</td>
					<td class="text7"><asp:TextBox ID="lbTJC11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTJC12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">25.PM Schedule:</td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule11" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPMSchedule12" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule13" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule14" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule15" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				
				
			</table>
			<table width="635" border="0">
				<tr style="height:18pt">
					<td class="leftLabel" colspan="2">Comments:<br />
					<asp:TextBox id="lbComments3" Runat="server" SkinID="NoborderCommentForPrint" />						
					</td>
				</tr>				
				<tr style="height:5pt">
				    <td colspan="2"><hr size="2" /></td>
				</tr>
				<tr style="font-size:x-small;height:8pt">
				    <td align="left">NIH-1884<br />Rev.02/2011</td>
				    <td align="right">NIH\ORF\RPMO</td>
				</tr>
				
		    </table>	
		</div>
		<p>&nbsp;</p>
		<div style="page-break-after:always" id="divMechanicalPage4" runat="server" visible="false">
		<table cellspacing="0" cellpadding="3" width="635" border="0">   
           <tr style="height:15pt">
                <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="100"> 
                <asp:Label ID="lbFacNum4" runat="server" CssClass="text11fix"></asp:Label>       
                </td>
                
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                <asp:Label id="lbFacSystem4" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCellBtm"><asp:Label id="lbFacFacilityID4" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td> 
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell">Function:
                  <asp:TextBox id="lbFacFunction4" Runat="server" SkinID="NoborderTextBoxForPrint"/>
               </td>
                <td colspan="2" class="inventoryTopRightCell">
                AAALAC<asp:CheckBox ID="ckAAALAC4" Runat="server" Enabled="False"></asp:CheckBox>
		        &nbsp;BSL<asp:CheckBox ID="ckBSL4" Runat="server" Enabled="False"></asp:CheckBox>&nbsp;
		        TJC<asp:CheckBox ID="ckTJC4" Runat="server" Enabled="False"></asp:CheckBox>
                </td>
            </tr>
            <tr style="height:12pt">   
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                <asp:TextBox ID="lbFacBuilding4" Runat="server" SkinID="NoborderShortTextBoxForPrint" /> 
                Floor:<asp:TextBox ID="lbFacFloor4" Runat="server" SkinID="NoborderShortTextBoxForPrint" /> 
                <font color="#BA3516">Location:</font><asp:TextBox ID="lbFacLocation4" Runat="server" SkinID="NoborderTextBoxForPrint" /> </td>
                <td class="inventoryTopRightCell">WR#:</td>
                <td class="inventoryTopRightCellBtm"><asp:TextBox ID="lbWRNumber4" Runat="server" SkinID="NoborderTextBoxForPrint" /> </td>
            </tr>
           
          </table>		
		<table width="635" border="0" cellpadding="2" cellspacing="0" class="componentTable">
				<tr style="height:10pt">
				    <td class="leftLabel" width="160">1.Equipment ID:</td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID16" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">2.Location:</td>
					<td class="text7"><asp:TextBox ID="lbLocation16" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					
					<td class="leftLabel">3.Type or Use:</td>
					<td class="text7"><asp:TextBox ID="lbTypeUse16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTypeUse17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">4.Manufacturer:</td>
					<td class="text7"><asp:TextBox ID="lbManufacturer16" runat="server" Text="" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbManufacturer17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
				<td class="leftLabel">5.Model No.:</td>
					<td class="text7"><asp:TextBox ID="lbModelNum16" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">6.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbSerialNum16" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">				
					<td class="leftLabel">7.Size:</td>
					<td class="text7"><asp:TextBox ID="lbSize16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbSize17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">8.Date Installed:</td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbInstalledDate17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">9.Capacity:</td>
					<td class="text7"><asp:TextBox ID="lbCapacity16" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">10.Capacity (H/T):</td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbCapacityHT17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">11.Fual or Refri:</td>
					<td class="text7"><asp:TextBox ID="lbFuel16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbFuel17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">12.Motor Mfg'r:</td>
					<td class="text7"><asp:TextBox ID="lbMotorManu16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorManu17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">13.H.P.:</td>
					<td class="text7"><asp:TextBox ID="lbHP16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbHP17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">14.Type:</td>
					<td class="text7"><asp:TextBox ID="lbMotorType16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorType17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">15.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorSerialNum17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">16.Motor Installed:</td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorInstalledDate17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">17.Model:</td>
					<td class="text7"><asp:TextBox ID="lbMotorModel16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorModel17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">18.Frame:</td>
					<td class="text7"><asp:TextBox ID="lbFrame16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbFrame17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">19.R.P.M.:</td>
					<td class="text7"><asp:TextBox ID="lbRPM16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbRPM17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">20.Voltage:</td>
					<td class="text7"><asp:TextBox ID="lbVoltage16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbVoltage17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">21.Amperes:</td>
					<td class="text7"><asp:TextBox ID="lbAmperes16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbAmperes17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">22.Phase-Cycle:</td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPhaseCycle17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">23.BSL Class.:</td>
					<td class="text7"><asp:TextBox ID="lbBSLClass16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbBSLClass17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">24.TJC Value:</td>
					<td class="text7"><asp:TextBox ID="lbTJC16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTJC17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">25.PM Schedule:</td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule16" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPMSchedule17" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule18" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule19" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule20" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				
				
			</table>
		<table width="635" border="0">
				<tr style="height:18pt">
					<td class="leftLabel" colspan="2">Comments:<br />
					<asp:TextBox id="lbComments4" Runat="server" SkinID="NoborderCommentForPrint" />						
					</td>
				</tr>				
				<tr style="height:5pt">
				    <td colspan="2"><hr size="2" /></td>
				</tr>
				<tr style="font-size:x-small;height:8pt">
				    <td align="left">NIH-1884<br />Rev.02/2011</td>
				    <td align="right">NIH\ORF\RPMO</td>
				</tr>
				
		    </table>	
		</div>
		<p>&nbsp;</p>
		<div style="page-break-after:always" id="divMechanicalPage5" runat="server" visible="false">
			<table cellspacing="0" cellpadding="3" width="635" border="0">   
           <tr style="height:15pt">
                <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="100"> 
                <asp:Label ID="lbFacNum5" runat="server" CssClass="text11fix"></asp:Label>          
                </td>
                
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                <asp:Label id="lbFacSystem5" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCellBtm"><asp:Label id="lbFacFacilityID5" Runat="server" CssClass="text11fix">&nbsp;</asp:Label>
                </td> 
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell">Function:
               <asp:TextBox id="lbFacFunction5" Runat="server" SkinID="NoborderTextBoxForPrint"/>
               </td>
                <td colspan="2" class="inventoryTopRightCell">
                AAALAC<asp:CheckBox ID="ckAAALAC5" Runat="server" Enabled="False"></asp:CheckBox>
		        &nbsp;BSL<asp:CheckBox ID="ckBSL5" Runat="server" Enabled="False"></asp:CheckBox>&nbsp;
		        TJC<asp:CheckBox ID="ckTJC5" Runat="server" Enabled="False"></asp:CheckBox>
                </td>
            </tr>
            <tr style="height:12pt">   
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                <asp:TextBox ID="lbFacBuilding5" Runat="server" SkinID="NoborderShortTextBoxForPrint" />
                Floor:<asp:TextBox ID="lbFacFloor5" Runat="server" SkinID="NoborderShortTextBoxForPrint" />
                <font color="#BA3516">Location:</font><asp:TextBox ID="lbFacLocation5" Runat="server" SkinID="NoborderShortTextBoxForPrint" /></td>
                <td class="inventoryTopRightCell">WR#:</td>
                <td class="inventoryTopRightCellBtm"><asp:TextBox ID="lbWRNumber5" Runat="server" SkinID="NoborderTextBoxForPrint" /></td>
            </tr>
           
          </table>				
		<table width="635" border="0" cellpadding="2" cellspacing="0" class="componentTable">
				<tr style="height:10pt">	
				    <td class="leftLabel" width="160">1.Equipment ID:</td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID21" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7" width="95"><asp:TextBox ID="lbEquipmentID25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">2.Location:</td>
					<td class="text7"><asp:TextBox ID="lbLocation21" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbLocation25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					
					<td class="leftLabel">3.Type or Use:</td>
					<td class="text7"><asp:TextBox ID="lbTypeUse21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTypeUse22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTypeUse25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">4.Manufacturer:</td>
					<td class="text7"><asp:TextBox ID="lbManufacturer21" runat="server" Text="" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbManufacturer22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbManufacturer25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
				<td class="leftLabel">5.Model No.:</td>
					<td class="text7"><asp:TextBox ID="lbModelNum21" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbModelNum25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">6.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbSerialNum21" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSerialNum25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">7.Size:</td>
					<td class="text7"><asp:TextBox ID="lbSize21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbSize22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbSize25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">8.Date Installed:</td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbInstalledDate22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbInstalledDate25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">9.Capacity:</td>
					<td class="text7"><asp:TextBox ID="lbCapacity21" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacity25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">10.Capacity (H/T):</td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbCapacityHT22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbCapacityHT25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">							
					<td class="leftLabel">11.Fual or Refri:</td>
					<td class="text7"><asp:TextBox ID="lbFuel21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					<td class="text7"><asp:TextBox ID="lbFuel22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFuel25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">12.Motor Mfg'r:</td>
					<td class="text7"><asp:TextBox ID="lbMotorManu21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorManu22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorManu25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">13.H.P.:</td>
					<td class="text7"><asp:TextBox ID="lbHP21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbHP22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbHP25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">14.Type:</td>
					<td class="text7"><asp:TextBox ID="lbMotorType21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorType22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorType25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">							
					<td class="leftLabel">15.Serial No.:</td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorSerialNum22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorSerialNum25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">16.Motor Installed:</td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbMotorInstalledDate22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorInstalledDate25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">17.Model:</td>
					<td class="text7"><asp:TextBox ID="lbMotorModel21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbMotorModel22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbMotorModel25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">18.Frame:</td>
					<td class="text7"><asp:TextBox ID="lbFrame21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbFrame22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbFrame25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">							
					<td class="leftLabel">19.R.P.M.:</td>
					<td class="text7"><asp:TextBox ID="lbRPM21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbRPM22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbRPM25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">20.Voltage:</td>
					<td class="text7"><asp:TextBox ID="lbVoltage21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbVoltage22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbVoltage25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">							
					<td class="leftLabel">21.Amperes:</td>
					<td class="text7"><asp:TextBox ID="lbAmperes21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbAmperes22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbAmperes25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">22.Phase-Cycle:</td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPhaseCycle22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPhaseCycle25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">23.BSL Class.:</td>
					<td class="text7"><asp:TextBox ID="lbBSLClass21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
					 <td class="text7"><asp:TextBox ID="lbBSLClass22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbBSLClass25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">		
					<td class="leftLabel">24.TJC Value:</td>
					<td class="text7"><asp:TextBox ID="lbTJC21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbTJC22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbTJC25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">							
					<td class="leftLabel">25.PM Schedule:</td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule21" runat="server" SkinID="NoborderTextBoxForPrint" />
					</td>
				    <td class="text7"><asp:TextBox ID="lbPMSchedule22" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule23" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule24" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
					<td class="text7"><asp:TextBox ID="lbPMSchedule25" runat="server" SkinID="NoborderTextBoxForPrint" /></td>
				</tr>
				
				
			</table>
			<table width="635" border="0">
				<tr style="height:18pt">
					<td class="leftLabel" colspan="2">Comments:<br />
					<asp:TextBox id="lbComments5" Runat="server" SkinID="NoborderCommentForPrint" />						
					</td>
				</tr>				
				<tr style="height:5pt">
				    <td colspan="2"><hr size="2" /></td>
				</tr>
				<tr style="font-size:x-small;height:8pt">
				    <td align="left">NIH-1884<br />Rev.02/2011</td>
				    <td align="right">NIH\ORF\RPMO</td>
				</tr>
				
		    </table>	
		</div>
		
		</div>
		</form>
	</body>
</html>

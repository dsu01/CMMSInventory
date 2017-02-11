<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintEleSystem.aspx.cs" Inherits="PrintEleSystem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
		<link href="App_Themes/MainTheme/main.css" type="text/css" rel="stylesheet" />
     <script type="text/javascript" language="JavaScript" src="JS/PrintGrid.js"></script>
	</head>
	<body>
		<form id="frmPrintFacility" method="post" runat="server">
		 <br /><br />  &nbsp;&nbsp; Previous Five <asp:Button Text=" << " ID="btnPreviousFive" runat="server" /> Next Five <asp:Button Text=" >> " ID="btnNextFive" runat="server" />
         &nbsp;&nbsp; <asp:Button ID="btnPrint" CssClass="submitRed" runat="Server" Text="Print Current Page" OnClientClick="Javascript:CallPrint('printGrid','displayText');" UseSubmitBehavior="False" />
      <br /><br /><asp:Button ID="btnPrintAll" CssClass="submitRed" runat="Server" Text="Print All Pages" OnClientClick="Javascript:CallPrint('printGrid','displayText');" UseSubmitBehavior="False" />
		<div id="printGrid" style="margin:10px; background-color: white">	
             <div id="displayText" style="display:none"></div>                 
	 
                    <table cellspacing="0" cellpadding="3" class="printTable" border="0">
                        <tr style="height: 15pt">
                            <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                            <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                            <td style="border-bottom: solid 1px #000;" width="100">
                                <span id="lbFacNum1" class="text11fix"><b><font color='green'>T00009(Active)</font></b></span>
                            </td>

                        </tr>
                        <tr style="height: 12pt">
                            <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Electrical System:&nbsp;&nbsp;</font>
                                <span id="lbFacSystem1" class="text11fix">Air Handling Unit</span>
                            </td>
                            <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                            <td class="inventoryTopRightCellBtm"><span id="lbFacFacilityID1" class="text11fix">asdasd069055125212asd</span>
                            </td>
                        </tr>
                        <tr style="height: 12pt">
                            <td colspan="4" class="inventoryTopLeftCell">Function:
                <input name="lbFacFunction1" type="text" value="dasdasdasd069055125212" id="lbFacFunction1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td colspan="2" class="inventoryTopRightCell">AAALAC<span disabled="disabled"><input id="ckAAALAC1" type="checkbox" name="ckAAALAC1" checked="checked" disabled="disabled" /></span>
                                &nbsp;BSL<span disabled="disabled"><input id="ckBSL1" type="checkbox" name="ckBSL1" checked="checked" disabled="disabled" /></span>&nbsp;
		        TJC<span disabled="disabled"><input id="ckTJC1" type="checkbox" name="ckTJC1" disabled="disabled" /></span>
                            </td>
                        </tr>
                        <tr style="height: 12pt">
                            <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                                <input name="lbFacBuilding1" type="text" value="13" id="lbFacBuilding1" class="noBorderShortTextBoxForPrint" />
                                Floor:<input name="lbFacFloor1" type="text" value="5" id="lbFacFloor1" class="noBorderShortTextBoxForPrint" />
                                <font color="#BA3516">Location:</font>
                                <input name="lbFacLocation1" type="text" value="sadasda" id="lbFacLocation1" class="noBorderTextBoxForPrint" /></td>
                            <td class="inventoryTopRightCell">WR#:</td>
                            <td class="inventoryTopRightCellBtm">
                                <input name="lbWRNumber1" type="text" value="asdasdasd" id="lbWRNumber1" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                    </table>
                    <table class="printTable" border="0" cellpadding="1" cellspacing="0">

                        <tr style="height: 10pt">
                            <td class="leftLabel" width="160">1.Equipment ID:</td>
                            <td class="text7" width="95">
                                <input name="lbEquipmentID1" type="text" value="EquipID1" id="lbEquipmentID1" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7" width="95">
                                <input name="lbEquipmentID2" type="text" value="EquipID2" id="lbEquipmentID2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7" width="95">
                                <input name="lbEquipmentID3" type="text" value="EquipID3" id="lbEquipmentID3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7" width="95">
                                <input name="lbEquipmentID4" type="text" value="EquipID4" id="lbEquipmentID4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7" width="95">
                                <input name="lbEquipmentID5" type="text" value="EquipID5" id="lbEquipmentID5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">2.Location:</td>
                            <td class="text7">
                                <input name="lbLocation1" type="text" value="Location1" id="lbLocation1" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbLocation2" type="text" value="Location1" id="lbLocation2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbLocation3" type="text" value="Location1" id="lbLocation3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbLocation4" type="text" value="Location1" id="lbLocation4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbLocation5" type="text" value="Location1" id="lbLocation5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">

                            <td class="leftLabel">3.Type or Use:</td>
                            <td class="text7">
                                <input name="lbTypeUse1" type="text" value="TypeOfUse1" id="lbTypeUse1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbTypeUse2" type="text" value="TypeOfUse1" id="lbTypeUse2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbTypeUse3" type="text" value="TypeOfUse1" id="lbTypeUse3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbTypeUse4" type="text" value="TypeOfUse1" id="lbTypeUse4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbTypeUse5" type="text" value="TypeOfUse1" id="lbTypeUse5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">4.Manufacturer:</td>
                            <td class="text7">
                                <input name="lbManufacturer1" type="text" value="Manufac1" id="lbManufacturer1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbManufacturer2" type="text" value="Manufac2" id="lbManufacturer2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbManufacturer3" type="text" value="Manufac1" id="lbManufacturer3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbManufacturer4" type="text" value="Manufa" id="lbManufacturer4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbManufacturer5" type="text" value="Manufac1" id="lbManufacturer5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">5.Model No.:</td>
                            <td class="text7">
                                <input name="lbModelNum1" type="text" value="ModelNo1" id="lbModelNum1" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbModelNum2" type="text" value="ModelNo2" id="lbModelNum2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbModelNum3" type="text" value="ModelNo1" id="lbModelNum3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbModelNum4" type="text" value="ModelNo1" id="lbModelNum4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbModelNum5" type="text" value="ModelNo1" id="lbModelNum5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">6.Serial No.:</td>
                            <td class="text7">
                                <input name="lbSerialNum1" type="text" value="SerailNo1" id="lbSerialNum1" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbSerialNum2" type="text" value="SerailNo2" id="lbSerialNum2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbSerialNum3" type="text" value="SerailNo1" id="lbSerialNum3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbSerialNum4" type="text" value="SerailNo1" id="lbSerialNum4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbSerialNum5" type="text" value="SerailNo1" id="lbSerialNum5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">7.Size:</td>
                            <td class="text7">
                                <input name="lbSize1" type="text" value="Size1" id="lbSize1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbSize2" type="text" value="Size1" id="lbSize2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbSize3" type="text" value="Size1" id="lbSize3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbSize4" type="text" value="Size1" id="lbSize4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbSize5" type="text" value="Size1" id="lbSize5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">8.Date Installed:</td>
                            <td class="text7">
                                <input name="lbInstalledDate1" type="text" value="1/16/2011" id="lbInstalledDate1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbInstalledDate2" type="text" value="1/17/2011" id="lbInstalledDate2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbInstalledDate3" type="text" value="1/18/2011" id="lbInstalledDate3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbInstalledDate4" type="text" value="1/19/2011" id="lbInstalledDate4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbInstalledDate5" type="text" value="1/20/2011" id="lbInstalledDate5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">9.Capacity:</td>
                            <td class="text7">
                                <input name="lbCapacity1" type="text" value="Capacity1" id="lbCapacity1" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbCapacity2" type="text" value="Capacity1" id="lbCapacity2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbCapacity3" type="text" value="Capacity1" id="lbCapacity3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbCapacity4" type="text" value="Capacity1" id="lbCapacity4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbCapacity5" type="text" value="Capacity1" id="lbCapacity5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">10.Capacity (H/T):</td>
                            <td class="text7">
                                <input name="lbCapacityHT1" type="text" value="HT1" id="lbCapacityHT1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbCapacityHT2" type="text" value="HT1" id="lbCapacityHT2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbCapacityHT3" type="text" value="HT1" id="lbCapacityHT3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbCapacityHT4" type="text" value="HT1" id="lbCapacityHT4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbCapacityHT5" type="text" value="HT1" id="lbCapacityHT5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">11.Fual or Refri:</td>
                            <td class="text7">
                                <input name="lbFuel1" type="text" value="Fual1" id="lbFuel1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbFuel2" type="text" value="HT1" id="lbFuel2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbFuel3" type="text" value="Fual1" id="lbFuel3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbFuel4" type="text" value="Fual1" id="lbFuel4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbFuel5" type="text" value="Fual1" id="lbFuel5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">12.Motor Mfg'r:</td>
                            <td class="text7">
                                <input name="lbMotorManu1" type="text" value="Motor1" id="lbMotorManu1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbMotorManu2" type="text" value="Motor1" id="lbMotorManu2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorManu3" type="text" value="Motor1" id="lbMotorManu3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorManu4" type="text" value="Motor1" id="lbMotorManu4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorManu5" type="text" value="Motor1" id="lbMotorManu5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">13.H.P.:</td>
                            <td class="text7">
                                <input name="lbHP1" type="text" value="HP1" id="lbHP1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbHP2" type="text" value="HP1" id="lbHP2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbHP3" type="text" value="HP1" id="lbHP3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbHP4" type="text" value="HP1" id="lbHP4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbHP5" type="text" value="HP1" id="lbHP5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">14.Type:</td>
                            <td class="text7">
                                <input name="lbMotorType1" type="text" value="Type1" id="lbMotorType1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbMotorType2" type="text" value="Type1" id="lbMotorType2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorType3" type="text" value="Type1" id="lbMotorType3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorType4" type="text" value="Type1" id="lbMotorType4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorType5" type="text" value="Type1" id="lbMotorType5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">15.Serial No.:</td>
                            <td class="text7">
                                <input name="lbMotorSerialNum1" type="text" value="MotorSerial1" id="lbMotorSerialNum1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbMotorSerialNum2" type="text" value="MotorSerial1" id="lbMotorSerialNum2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorSerialNum3" type="text" value="MotorSerial1" id="lbMotorSerialNum3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorSerialNum4" type="text" value="MotorSerial1" id="lbMotorSerialNum4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorSerialNum5" type="text" value="MotorSerial1" id="lbMotorSerialNum5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">16.Motor Installed:</td>
                            <td class="text7">
                                <input name="lbMotorInstalledDate1" type="text" value="1/13/2011" id="lbMotorInstalledDate1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbMotorInstalledDate2" type="text" value="1/13/2011" id="lbMotorInstalledDate2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorInstalledDate3" type="text" value="1/13/2011" id="lbMotorInstalledDate3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorInstalledDate4" type="text" value="1/19/2011" id="lbMotorInstalledDate4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorInstalledDate5" type="text" value="1/20/2011" id="lbMotorInstalledDate5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">17.Model:</td>
                            <td class="text7">
                                <input name="lbMotorModel1" type="text" value="Model1" id="lbMotorModel1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbMotorModel2" type="text" value="Model1" id="lbMotorModel2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorModel3" type="text" value="Model1" id="lbMotorModel3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorModel4" type="text" value="Model1" id="lbMotorModel4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbMotorModel5" type="text" value="Model1" id="lbMotorModel5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">18.Frame:</td>
                            <td class="text7">
                                <input name="lbFrame1" type="text" value="Frame1" id="lbFrame1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbFrame2" type="text" value="Frame1" id="lbFrame2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbFrame3" type="text" value="Frame1" id="lbFrame3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbFrame4" type="text" value="Frame1" id="lbFrame4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbFrame5" type="text" value="Frame1" id="lbFrame5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">19.R.P.M.:</td>
                            <td class="text7">
                                <input name="lbRPM1" type="text" value="RPM1" id="lbRPM1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbRPM2" type="text" value="RPM1" id="lbRPM2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbRPM3" type="text" value="RPM1" id="lbRPM3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbRPM4" type="text" value="RPM1" id="lbRPM4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbRPM5" type="text" value="RPM1" id="lbRPM5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">20.Voltage:</td>
                            <td class="text7">
                                <input name="lbVoltage1" type="text" value="Voltage1" id="lbVoltage1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbVoltage2" type="text" value="Voltage1" id="lbVoltage2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbVoltage3" type="text" value="Voltage1" id="lbVoltage3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbVoltage4" type="text" value="Voltage1" id="lbVoltage4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbVoltage5" type="text" value="Voltage1" id="lbVoltage5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">21.Amperes:</td>
                            <td class="text7">
                                <input name="lbAmperes1" type="text" value="Amperes1" id="lbAmperes1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbAmperes2" type="text" value="Amperes1" id="lbAmperes2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbAmperes3" type="text" value="Amperes1" id="lbAmperes3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbAmperes4" type="text" value="Amperes1" id="lbAmperes4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbAmperes5" type="text" value="Amperes1" id="lbAmperes5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">22.Phase-Cycle:</td>
                            <td class="text7">
                                <input name="lbPhaseCycle1" type="text" value="Phasecyle1" id="lbPhaseCycle1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbPhaseCycle2" type="text" value="Phasecyle1" id="lbPhaseCycle2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbPhaseCycle3" type="text" value="Phasecyle1" id="lbPhaseCycle3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbPhaseCycle4" type="text" value="Phasecyle1" id="lbPhaseCycle4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbPhaseCycle5" type="text" value="Phasecyle1" id="lbPhaseCycle5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">23.BSL Class.:</td>
                            <td class="text7">
                                <input name="lbBSLClass1" type="text" value="BSLClass1" id="lbBSLClass1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbBSLClass2" type="text" value="BSLClass1" id="lbBSLClass2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbBSLClass3" type="text" value="BSLClass1" id="lbBSLClass3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbBSLClass4" type="text" value="BSLClass1" id="lbBSLClass4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbBSLClass5" type="text" value="BSLClass1" id="lbBSLClass5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">24.TJC Value:</td>
                            <td class="text7">
                                <input name="lbTJC1" type="text" value="2" id="lbTJC1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbTJC2" type="text" value="3" id="lbTJC2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbTJC3" type="text" value="4" id="lbTJC3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbTJC4" type="text" value="5" id="lbTJC4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbTJC5" type="text" value="6" id="lbTJC5" class="noBorderTextBoxForPrint" /></td>
                        </tr>
                        <tr style="height: 10pt">
                            <td class="leftLabel">25.PM Schedule:</td>
                            <td class="text7">
                                <input name="lbPMSchedule1" type="text" value="PMS1" id="lbPMSchedule1" class="noBorderTextBoxForPrint" />
                            </td>
                            <td class="text7">
                                <input name="lbPMSchedule2" type="text" value="PMS1" id="lbPMSchedule2" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbPMSchedule3" type="text" value="PMS1" id="lbPMSchedule3" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbPMSchedule4" type="text" value="PMS1" id="lbPMSchedule4" class="noBorderTextBoxForPrint" /></td>
                            <td class="text7">
                                <input name="lbPMSchedule5" type="text" value="PMS1" id="lbPMSchedule5" class="noBorderTextBoxForPrint" /></td>
                        </tr>


                    </table>
                    <table width="635" class="printTable"border="0">
                        <tr style="height: 18pt">
                            <td class="leftLabel" colspan="2">Comments:<br />
                                <input name="lbComments1" type="text" value="Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here." id="lbComments1" class="noborderCommentForPrint" />
                            </td>
                        </tr>
                        <tr style="height: 5pt">
                            <td colspan="2">
                                <hr size="2" />
                            </td>
                        </tr>
                        <tr style="font-size: x-small; height: 8pt">
                            <td align="left">NIH-1884<br />
                                Rev.02/2011</td>
                            <td align="right">NIH\ORF\RPMO</td>
                        </tr>

                    </table>

		
		</div>
		</form>
	</body>
</html>
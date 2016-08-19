<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMechanical.aspx.cs" Inherits="Forms_frmMechanical" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="print.css" media="print"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="content">
            <table cellspacing="0" cellpadding="5" width="100%" border="0">   
                <tr>
                    <td colspan="4" class="inventoryTopLeftTitle" width="60%">Equipment Inventory Card</td>
                    <td colspan="2" class="inventoryTopRightCell" width="40%" valign="baseline">Facility#:                  
                    </td>
                </tr>
                 <tr>
                    <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:</font>                    
                    </td>
                    <td colspan="2" class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font>                   
                    </td> 
                </tr>
                 <tr>
                    <td colspan="4" class="inventoryTopLeftCell">Function:</td>
                    <td colspan="2" class="inventoryTopRightCell">AAALAC<asp:CheckBox ID="ckAAALAC" runat="server" />
                    &nbsp;&nbsp;&nbsp;BSL<asp:CheckBox ID="ckBSL" runat="server" />&nbsp;&nbsp;&nbsp;TJC<asp:CheckBox ID="ckTJC" runat="server" /></td>
                </tr>
                <tr>     
                    <td colspan="2" class="inventoryTopLeftCell" width="40%"><font color="#BA3516">Building:</font>
                   </td>
                   <td class="inventoryTopLeftCell">
                    Floor:&nbsp;&nbsp;&nbsp;
                    </td>
                    <td class="inventoryTopLeftCell"><font color="#BA3516">Location:</font></td>
                    <td colspan="2" class="inventoryTopRightCell">Work Request#:</td>
                </tr>
               
              </table>
   
                <table id="inputTable" cellspacing="0" cellpadding="0" width="100%" border="0" style="font-size:.75em">
    <tr>
        <td width="15%" style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbEquipment" CssClass="tableLabel" runat="server" Text="1.Equipment ID *"></asp:Label></td>
           <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbLocation" CssClass="tableLabel" runat="server" Text="2.Location"></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000; ><asp:Label ID="lbTypeUse" CssClass="tableLabel" runat="server" Text="3.Type of Use"></asp:Label></td>
             <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbManufacturer" CssClass="tableLabel" runat="server" Text="4.Manufacturer"></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbModelNum" CssClass="tableLabel" runat="server" Text="5.Model No."></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbSerialNum" CssClass="tableLabel" runat="server" Text="6.Serial No."></asp:Label></td>
            <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbSize" CssClass="tableLabel" runat="server" Text="7.Size"></asp:Label></td>
             <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbInstalledDate" CssClass="tableLabel" runat="server" Text="8.Date Installed"></asp:Label></td>
           <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbCapacity" CssClass="tableLabel" runat="server" Text="9.Capacity"></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbCapacityHT" CssClass="tableLabel" runat="server" Text="10.Capacity(H/T)"></asp:Label></td>
            <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbFuel" CssClass="tableLabel" runat="server" Text="11.Fual or Refri"></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbMotorManu" CssClass="tableLabel" runat="server" Text="12.Motor Mfg'r"></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbHP" CssClass="tableLabel" runat="server" Text="13. H.P."></asp:Label></td>
            <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbMotorType" CssClass="tableLabel" runat="server" Text="14.Type"></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbMotorSerialNum" CssClass="tableLabel" runat="server" Text="15.Serial No."></asp:Label></td>
             <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbMotorInstalledDate" CssClass="tableLabel" runat="server" Text="16.Date Installed"></asp:Label></td>
              <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbMotorModel" CssClass="tableLabel" runat="server" Text="17.Model"></asp:Label></td>
            <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbFrame" CssClass="tableLabel" runat="server" Text="18.Frame"></asp:Label></td>
          <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbRPM" CssClass="tableLabel" runat="server" Text="19.R.P.M."></asp:Label></td>
             <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbVoltage" CssClass="tableLabel" runat="server" Text="20.Voltage"></asp:Label></td>
             <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbAmperes" CssClass="tableLabel" runat="server" Text="21.Amperes"></asp:Label></td>
           <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbPhaseCycle" CssClass="tableLabel" runat="server" Text="22.Phase-Cycle"></asp:Label></td>
            <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbBSLClass" CssClass="tableLabel" runat="server" Text="23.BSL Class."></asp:Label></td>
               <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbTJC" CssClass="tableLabel" runat="server" Text="24.TJC Value"></asp:Label></td>
               <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"><asp:Label ID="lbPMSchedule" CssClass="tableLabel" runat="server" Text="25.PM Schedule"></asp:Label></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
        <td style="border-bottom: solid 1px #000;border-right: solid 1px #000;"></td>
    </tr>
 
</table>
                <table cellspacing="0" cellpadding="5" width="100%" border="0">
  <tr>      
       <td colspan="2"><br /><b>Comments</b><br />
        <br />
        <br />
        </td>
        
    </tr>
 
</table>
        </div>
        </div>



    </form>
</body>
</html>

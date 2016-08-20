<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="equipMechanicalNew.aspx.cs" Inherits="Equipment_equipMechanicalNew" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="headerPlaceHolder" runat="server">

    <script type="text/javascript" src="../JS/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../JS/jquery-ui-1.8.12.custom.min.js"></script>
    <script type="text/javascript" src="../JS/jquery.scannerdetection.compatibility.js"></script>
    <script type="text/javascript" src="../JS/jquery.scannerdetection.js"></script>
    <link href="../CSS/jquery-ui-1.8.12.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../JS/jquery-ui-1.8.12.custom.min.js"></script>

    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            // $("#date").datepicker({ showOn: 'button', buttonText: "select" });
            //$("#txtInstalledDate1").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: 'images/icon_cal.png' });
       <%--     $('#<%=txtInstalledDate1.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate2.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate3.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate4.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate5.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate1.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate2.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate3.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate4.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate5.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });--%>

      
        });

    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
  <asp:Panel ID="generalInfoPanel" runat="server">
                <table cellspacing="0" cellpadding="5" width="100%" border="0">
                    <tr>
                        <td id="InventoryCardTitle" colspan="4" class="inventoryTopLeftTitle" width="50%">Equipment Inventory Card</td>
                        <td class="inventoryTopRightCell" width="15%" valign="baseline">Facility#:</td>
                        <td style="border-bottom: solid 1px #000;" width="35%" colspan="3">
                            <font color="gray">&nbsp;<asp:Label ID="txtFacilityNum" runat="server" /></font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                            <asp:DropDownList ID="drplstSystem" runat="server" SkinID="midDropDown" DataTextField="SystemTitle" DataValueField="SystemTitle" AppendDataBoundItems="true" TabIndex="1">
                                <asp:ListItem Value="">--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rqSystem" runat="server" ControlToValidate="drplstSystem" Display="Dynamic" ErrorMessage="System is required" InitialValue=""></asp:RequiredFieldValidator>
                        </td>
                        <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                        <td class="inventoryTopRightCell">
                            <asp:TextBox ID="txtFacilityID" runat="server" MaxLength="50" TabIndex="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqvFacilityID" runat="server" ControlToValidate="txtFacilityID" Display="Dynamic" ErrorMessage="Facility ID is required"></asp:RequiredFieldValidator>
                        </td>
                        <td class="inventoryTopRightCell"><font color="#BA3516">Barcode:</font></td>
                        <td class="inventoryTopRightCellBtm">
                            <asp:TextBox ID="txtBarcode" runat="server" MaxLength="50" TabIndex="2" AutoPostBack="False"/>
                        </td>
                        <td>
                            <%--<button id="buttonScan" >Scan</button>--%>
                            <asp:Button ID="ButtonScan" runat="server" Enabled="true" UseSubmitBehavior="false" CausesValidation="false"
                                Text="Scan" CssClass="submitYellow" OnClientClick="javascript:ToggleScan() ; return false;" />&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="inventoryTopLeftCell">Function:
                            <asp:TextBox ID="txtFunction" runat="server" SkinID="MaxTextBox" MaxLength="50" TabIndex="3"></asp:TextBox></td>
                        <td colspan="2" class="inventoryTopRightCell">AAALAC<asp:CheckBox ID="ckAAALAC" runat="server" TabIndex="4" />
                            &nbsp;&nbsp;&nbsp;BSL<asp:CheckBox ID="ckBSL" runat="server" TabIndex="5" />&nbsp;&nbsp;&nbsp;TJC<asp:CheckBox ID="ckTJC" runat="server" TabIndex="6" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                            <asp:DropDownList ID="drplstBuilding" runat="server" SkinID="noCssDropDown" DataTextField="Building" DataValueField="Building" AppendDataBoundItems="true" TabIndex="7">
                                <asp:ListItem Value="">--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rqBuilding" runat="server" ControlToValidate="drplstBuilding" Display="Dynamic" ErrorMessage="Building is required" InitialValue=""></asp:RequiredFieldValidator>

                            Floor:<asp:TextBox ID="txtFloor" runat="server" MaxLength="10" SkinID="ShortInputTextBox" TabIndex="8"></asp:TextBox><font color="#BA3516">Location:</font><asp:TextBox ID="txtLocation" runat="server" SkinID="ShortInputTextBox" MaxLength="50" TabIndex="9"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" ErrorMessage="Location is required"></asp:RequiredFieldValidator></td>
                        <td class="inventoryTopRightCell">Work Request#:</td>
                        <td class="inventoryTopRightCellBtm">
                            <asp:TextBox ID="txtWRNum" runat="server" MaxLength="50" TabIndex="10"></asp:TextBox></td>
                    </tr>
                    <tr>  
                            <td><asp:Button ID="Button4" runat="server" Text="Add New" BackColor="#00CCFF" /></td>  
                            <td><asp:Button ID="Button3" runat="server" Text="Save Change" BackColor="#00CCFF" /></td>  
                        </tr>
                </table>
            </asp:Panel>

  <asp:Panel runat="server" ID="DetailInfoPanel" style="margin-top: 20px; size:1.2em">
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
        <ajaxToolkit:TabPanel runat="server" HeaderText="List Of Components" ID="TabPanel1">
           <ContentTemplate>  

                     <table border="1" width="100%" cellpadding="1" cellspacing="1" style="font-size:smaller; text-align:left">
                         <tr>
                            <td> <b>Comments</b></td>
                          <td colspan="6">
                            <textarea name="ctl00$ContentPlaceHolderMain$txtComments" rows="3" cols="55" id="ctl00_ContentPlaceHolderMain_txtComments" tabindex="36" class="txtEquipmentInput" style="width:90%;">Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here.</textarea>
                          
                        </td>
                         </tr> 
                                            <tr style="background-color:#cccccc">   
                                               <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_lnkFacility" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$lnkFacility','')">Comonent#</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_lnkName" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$lnkName','')">Equipment ID</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton1" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton1','')">Location</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton2" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton2','')">Type of Use</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton3" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton3','')">Model#</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton4" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton4','')">Serial#</a></th> 
                                                 <th align="left"><a id="ctl00_ContentPlaceHolderMain_ListView1_LinkButton5" href="javascript:__doPostBack('ctl00$ContentPlaceHolderMain$ListView1$LinkButton5','')">Size</a></th> 
                                              
	
                                            </tr> 
                                             
                                          <tr> 
                                           <td width="5%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=9">1</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="5%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblFacID">asdasd069055125212asd</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblFacFunction">dasdasdasd069055125212</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblFacSystem">Air Handling Unit</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblLocation">sadasda</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl0_lblTotalEquipments">19</span></td>  
                                         
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=10">2</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblFacID">addada</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblFacFunction">Test function</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblFacSystem">Air Handling Unit</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblLocation">dasd</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl1_lblTotalEquipments">5</span></td>  
                                         
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=12">3</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblFacID">Test equip id</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblFacFunction">Test function</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblFacSystem">Control Panel</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblLocation">Test Location</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl2_lblTotalEquipments">0</span></td>  
                                          
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=13">4</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblFacID">yyyy</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblFacFunction">Test function sfsdf sfsdf sfsdfsdf</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblFacSystem">Control Panel</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblLocation">Test Location</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl3_lblTotalEquipments">0</span></td>  
                                          
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=14">5</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblFacID">Test FacilityID if not</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblFacFunction">Test function</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblFacSystem">Emergency Light</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblLocation">Test Location</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl4_lblTotalEquipments">0</span></td>  
                                         
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=16">6</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblFacID">dfsf</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblFacFunction">fsf</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblFacSystem">Air Dryer</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblLocation">sdfs</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl5_lblTotalEquipments">0</span></td>  
                                         
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=17">7</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblFacID">sdfsdf</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblFacFunction">dfsdf</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblFacSystem">Air Dryer</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblLocation">dfsd</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl6_lblTotalEquipments">0</span></td>  
                                        
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=18">8</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblFacID">sdfsdf</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblFacFunction">sdds</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblFacSystem">Air Dryer</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblLocation">sdfsd</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl7_lblTotalEquipments">0</span></td>  
                                          
                                          </tr> 
                                     
                                          <tr> 
                                           <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_hlFacNum" href="Equipment/equipElectrical.aspx?ParentFacilitySysID=19">9</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblFacID">sfsfsdf</span></td>   
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblFacFunction">sfsdfsdf</span></td> 
                                           <td width="20%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblFacSystem">Control Panel</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblBuilding">13</span></td>  
                                           <td width="15%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblLocation">sfdsfsdf</span></td> 
                                           <td width="10%"><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl8_lblTotalEquipments">0</span></td>  
                                          
                                          </tr> 
                                     
                                      <tr style="background-color:#EFEFEF"> 
                                            <td width="10%">
                                                                                             
                                                 <a id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_hlFacNum" href="Equipment/equipMechanical.aspx?ParentFacilitySysID=6">10</a>  
                                              
                                               
                                               
                                           </td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblFacID">Test</span></td>   
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblFacFunction">Test function</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblFacSystem">Air Dryer</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblBuilding">13</span></td>  
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblLocation">Test Location</span></td> 
                                           <td><span id="ctl00_ContentPlaceHolderMain_ListView1_ctrl9_lblTotalEquipments">10</span></td>  
                                          
                                          </tr> 
                                     
                                        </table> 
                                       
                </ContentTemplate>  
        </ajaxToolkit:TabPanel>
           <ajaxToolkit:TabPanel runat="server" HeaderText="Edit Existing Component" ID="TabPanel3">
              <ContentTemplate>  
                   
                      <table id="inputTable" cellspacing="0" cellpadding="0" width="80%" border="1" style="font-size: .8em">
                <tr bgcolor="#ffffcc" height="18">
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_Label1" class="tableLabel"></span></td>
                    <td width="75%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbComponent1" class="componentLabel1">Component Information</span></td>
                    </tr>
                <tr>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbEquipment" class="tableLabel">1.Equipment ID *</span></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtEquipmentID1" value="Test Info" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtEquipmentID1" tabindex="11" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbLocation" class="tableLabel">2.Location</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtLocation1" value="Test Info"  type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtLocation1" tabindex="12" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbTypeUse" class="tableLabel">3.Type or Use</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtTypeUse1" value="Test Info"  type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtTypeUse1" tabindex="13" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbManufacturer" class="tableLabel">4.Manufacturer</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtManufacturer1" value="Test Info"  type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtManufacturer1" tabindex="14" class="noBorderTextBox" style="width:80%;" />
                    </td>
                        </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbModelNum" class="tableLabel">5.Model No.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtModelNum1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtModelNum1" tabindex="15" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbSerialNum" class="tableLabel">6.Serial No.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtSerialNum1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtSerialNum1" tabindex="16" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbSize" class="tableLabel">7.Size</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtSize1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtSize1" tabindex="17" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbInstalledDate" class="tableLabel">8.Date Installed</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtInstalledDate1" type="text" id="ctl00_ContentPlaceHolderMain_txtInstalledDate1" tabindex="18" class="noBorderTextBox" style="width:80%;" />

                        <span id="ctl00_ContentPlaceHolderMain_cvInstalledDate1" class="errortext" style="color:Red;display:none;">Invalid Date format.</span>
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbCapacity" class="tableLabel">9.Capacity</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtCapacity1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtCapacity1" tabindex="19" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbCapacityHT" class="tableLabel">10.Capacity(H/T)</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtCapacityHT1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtCapacityHT1" tabindex="20" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbFuel" class="tableLabel">11.Fual or Refri</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtFuel1" type="text" id="ctl00_ContentPlaceHolderMain_txtFuel1" tabindex="21" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorManu" class="tableLabel">12.Motor Mfg'r</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorManu1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorManu1" tabindex="22" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbHP" class="tableLabel">13. H.P.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtHP1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtHP1" tabindex="23" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorType" class="tableLabel">14.Type</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorType1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorType1" tabindex="24" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorSerialNum" class="tableLabel">15.Serial No.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorSerialNum1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorSerialNum1" tabindex="25" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorInstalledDate" class="tableLabel">16.Motor Installed</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorInstalledDate1" type="text" id="ctl00_ContentPlaceHolderMain_txtMotorInstalledDate1" tabindex="26" class="noBorderTextBox" style="width:80%;" />
                        <span id="ctl00_ContentPlaceHolderMain_CompareValidator5" class="errortext" style="color:Red;display:none;">Invalid Date format.</span>
                    </td>
                   
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorModel" class="tableLabel">17.Model</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorModel1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorModel1" tabindex="27" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbFrame" class="tableLabel">18.Frame</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtFrame1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtFrame1" tabindex="28" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbRPM" class="tableLabel">19.R.P.M.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtRPM1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtRPM1" tabindex="29" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbVoltage" class="tableLabel">20.Voltage</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtVoltage1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtVoltage1" tabindex="30" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbAmperes" class="tableLabel">21.Amperes</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtAmperes1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtAmperes1" tabindex="31" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbPhaseCycle" class="tableLabel">22.Phase-Cycle</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtPhaseCycle1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtPhaseCycle1" tabindex="32" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbBSLClass" class="tableLabel">23.BSL Class.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtBSLClass1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtBSLClass1" tabindex="33" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbTJC" class="tableLabel">24.TJC Value</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtTJC1" type="text" id="ctl00_ContentPlaceHolderMain_txtTJC1" tabindex="34" class="noBorderTextBox" style="width:80%;" />
                        <span id="ctl00_ContentPlaceHolderMain_valTJC1" class="errortext" style="color:Red;display:none;">Must be an integer.</span>
                    </td>
                   
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbPMSchedule" class="tableLabel">25.PM Schedule</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtPMSchedule1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtPMSchedule1" tabindex="35" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td colspan="2" style="font-size: 10px; font-style: italic;">*If no Equipment ID provided, it will be a single inventory.
                 
                    </td>
                </tr>
              <tr>  
                            <td align="center"><br/><asp:Button ID="Button1" runat="server" Text="Save Info" BackColor="#00CCFF" /></td>  
                          
                        </tr>

            </table>
                </ContentTemplate>  
        </ajaxToolkit:TabPanel>
          <ajaxToolkit:TabPanel runat="server" HeaderText="Add New Component" ID="TabPanel2">
              <ContentTemplate>  
                  
                   <table id="inputTable" cellspacing="0" cellpadding="0" width="80%" border="1" style="font-size: .8em">
                <tr bgcolor="#ffffcc" height="18">
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_Label1" class="tableLabel"></span></td>
                    <td width="75%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbComponent1" class="componentLabel1">Component Information</span></td>
                    </tr>
                <tr>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbEquipment" class="tableLabel">1.Equipment ID *</span></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtEquipmentID1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtEquipmentID1" tabindex="11" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbLocation" class="tableLabel">2.Location</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtLocation1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtLocation1" tabindex="12" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbTypeUse" class="tableLabel">3.Type or Use</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtTypeUse1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtTypeUse1" tabindex="13" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbManufacturer" class="tableLabel">4.Manufacturer</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtManufacturer1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtManufacturer1" tabindex="14" class="noBorderTextBox" style="width:80%;" />
                    </td>
                        </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbModelNum" class="tableLabel">5.Model No.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtModelNum1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtModelNum1" tabindex="15" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbSerialNum" class="tableLabel">6.Serial No.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtSerialNum1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtSerialNum1" tabindex="16" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbSize" class="tableLabel">7.Size</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtSize1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtSize1" tabindex="17" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbInstalledDate" class="tableLabel">8.Date Installed</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtInstalledDate1" type="text" id="ctl00_ContentPlaceHolderMain_txtInstalledDate1" tabindex="18" class="noBorderTextBox" style="width:80%;" />

                        <span id="ctl00_ContentPlaceHolderMain_cvInstalledDate1" class="errortext" style="color:Red;display:none;">Invalid Date format.</span>
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbCapacity" class="tableLabel">9.Capacity</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtCapacity1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtCapacity1" tabindex="19" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbCapacityHT" class="tableLabel">10.Capacity(H/T)</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtCapacityHT1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtCapacityHT1" tabindex="20" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbFuel" class="tableLabel">11.Fual or Refri</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtFuel1" type="text" id="ctl00_ContentPlaceHolderMain_txtFuel1" tabindex="21" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorManu" class="tableLabel">12.Motor Mfg'r</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorManu1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorManu1" tabindex="22" class="noBorderTextBox" style="width:80%;" />
                    </td>
                     </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbHP" class="tableLabel">13. H.P.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtHP1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtHP1" tabindex="23" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorType" class="tableLabel">14.Type</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorType1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorType1" tabindex="24" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorSerialNum" class="tableLabel">15.Serial No.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorSerialNum1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorSerialNum1" tabindex="25" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorInstalledDate" class="tableLabel">16.Motor Installed</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorInstalledDate1" type="text" id="ctl00_ContentPlaceHolderMain_txtMotorInstalledDate1" tabindex="26" class="noBorderTextBox" style="width:80%;" />
                        <span id="ctl00_ContentPlaceHolderMain_CompareValidator5" class="errortext" style="color:Red;display:none;">Invalid Date format.</span>
                    </td>
                   
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbMotorModel" class="tableLabel">17.Model</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtMotorModel1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtMotorModel1" tabindex="27" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbFrame" class="tableLabel">18.Frame</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtFrame1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtFrame1" tabindex="28" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbRPM" class="tableLabel">19.R.P.M.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtRPM1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtRPM1" tabindex="29" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbVoltage" class="tableLabel">20.Voltage</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtVoltage1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtVoltage1" tabindex="30" class="noBorderTextBox" style="width:80%;" />
                    </td>
                      </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbAmperes" class="tableLabel">21.Amperes</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtAmperes1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtAmperes1" tabindex="31" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbPhaseCycle" class="tableLabel">22.Phase-Cycle</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtPhaseCycle1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtPhaseCycle1" tabindex="32" class="noBorderTextBox" style="width:80%;" />
                    </td>
                    </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbBSLClass" class="tableLabel">23.BSL Class.</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtBSLClass1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtBSLClass1" tabindex="33" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbTJC" class="tableLabel">24.TJC Value</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtTJC1" type="text" id="ctl00_ContentPlaceHolderMain_txtTJC1" tabindex="34" class="noBorderTextBox" style="width:80%;" />
                        <span id="ctl00_ContentPlaceHolderMain_valTJC1" class="errortext" style="color:Red;display:none;">Must be an integer.</span>
                    </td>
                   
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <span id="ctl00_ContentPlaceHolderMain_lbPMSchedule" class="tableLabel">25.PM Schedule</span></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <input name="ctl00$ContentPlaceHolderMain$txtPMSchedule1" type="text" maxlength="50" id="ctl00_ContentPlaceHolderMain_txtPMSchedule1" tabindex="35" class="noBorderTextBox" style="width:80%;" />
                    </td>
                   </tr>
                <tr>
                    <td colspan="2" style="font-size: 10px; font-style: italic;">*If no Equipment ID provided, it will be a single inventory.
                 
                    </td>
                </tr>
              <tr>  
                            <td align="center"><br/><asp:Button ID="Button2" runat="server" Text="Save New Component Information" BackColor="#00CCFF" /></td>  
                          
                        </tr>

            </table>
                </ContentTemplate>  
        </ajaxToolkit:TabPanel>
         <ajaxToolkit:TabPanel runat="server" HeaderText="View All and Print" ID="TabPanel4">
              <ContentTemplate>  
                   
                     <table cellspacing="0" cellpadding="3" width="635" border="0">   
           <tr style="height:15pt">
                <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="100"> 
                <span id="lbFacNum1" class="text11fix"><b><font color='green'>T00009(Active)</font></b></span>           
                </td>
                
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
                <span id="lbFacSystem1" class="text11fix">Air Handling Unit</span>
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCellBtm"><span id="lbFacFacilityID1" class="text11fix">asdasd069055125212asd</span>
                </td> 
            </tr>
            <tr style="height:12pt">
                <td colspan="4" class="inventoryTopLeftCell">Function:
                <input name="lbFacFunction1" type="text" value="dasdasdasd069055125212" id="lbFacFunction1" class="noBorderTextBoxForPrint" />
               </td>
                <td colspan="2" class="inventoryTopRightCell">
                AAALAC<span disabled="disabled"><input id="ckAAALAC1" type="checkbox" name="ckAAALAC1" checked="checked" disabled="disabled" /></span>
		        &nbsp;BSL<span disabled="disabled"><input id="ckBSL1" type="checkbox" name="ckBSL1" checked="checked" disabled="disabled" /></span>&nbsp;
		        TJC<span disabled="disabled"><input id="ckTJC1" type="checkbox" name="ckTJC1" disabled="disabled" /></span>
                </td>
            </tr>
            <tr style="height:12pt">   
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Building:&nbsp;</font>
                <input name="lbFacBuilding1" type="text" value="13" id="lbFacBuilding1" class="noBorderShortTextBoxForPrint" />
                Floor:<input name="lbFacFloor1" type="text" value="5" id="lbFacFloor1" class="noBorderShortTextBoxForPrint" />
                <font color="#BA3516">Location:</font><input name="lbFacLocation1" type="text" value="sadasda" id="lbFacLocation1" class="noBorderTextBoxForPrint" /></td>
                <td class="inventoryTopRightCell">WR#:</td>
                <td class="inventoryTopRightCellBtm"><input name="lbWRNumber1" type="text" value="asdasdasd" id="lbWRNumber1" class="noBorderTextBoxForPrint" /></td>
            </tr>           
          </table>	
			<table width="635" border="0" cellpadding="1" cellspacing="0" class="componentTable">		
				 	
				<tr style="height:10pt">
				    <td class="leftLabel" width="160">1.Equipment ID:</td>
					<td class="text7" width="95"><input name="lbEquipmentID1" type="text" value="EquipID1" id="lbEquipmentID1" class="noBorderTextBoxForPrint" /></td>
					<td class="text7" width="95"><input name="lbEquipmentID2" type="text" value="EquipID2" id="lbEquipmentID2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7" width="95"><input name="lbEquipmentID3" type="text" value="EquipID3" id="lbEquipmentID3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7" width="95"><input name="lbEquipmentID4" type="text" value="EquipID4" id="lbEquipmentID4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7" width="95"><input name="lbEquipmentID5" type="text" value="EquipID5" id="lbEquipmentID5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">2.Location:</td>
					<td class="text7"><input name="lbLocation1" type="text" value="Location1" id="lbLocation1" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbLocation2" type="text" value="Location1" id="lbLocation2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbLocation3" type="text" value="Location1" id="lbLocation3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbLocation4" type="text" value="Location1" id="lbLocation4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbLocation5" type="text" value="Location1" id="lbLocation5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					
					<td class="leftLabel">3.Type or Use:</td>
					<td class="text7"><input name="lbTypeUse1" type="text" value="TypeOfUse1" id="lbTypeUse1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbTypeUse2" type="text" value="TypeOfUse1" id="lbTypeUse2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbTypeUse3" type="text" value="TypeOfUse1" id="lbTypeUse3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbTypeUse4" type="text" value="TypeOfUse1" id="lbTypeUse4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbTypeUse5" type="text" value="TypeOfUse1" id="lbTypeUse5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">4.Manufacturer:</td>
					<td class="text7"><input name="lbManufacturer1" type="text" value="Manufac1" id="lbManufacturer1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbManufacturer2" type="text" value="Manufac2" id="lbManufacturer2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbManufacturer3" type="text" value="Manufac1" id="lbManufacturer3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbManufacturer4" type="text" value="Manufa" id="lbManufacturer4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbManufacturer5" type="text" value="Manufac1" id="lbManufacturer5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
				<td class="leftLabel">5.Model No.:</td>
					<td class="text7"><input name="lbModelNum1" type="text" value="ModelNo1" id="lbModelNum1" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbModelNum2" type="text" value="ModelNo2" id="lbModelNum2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbModelNum3" type="text" value="ModelNo1" id="lbModelNum3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbModelNum4" type="text" value="ModelNo1" id="lbModelNum4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbModelNum5" type="text" value="ModelNo1" id="lbModelNum5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">6.Serial No.:</td>
					<td class="text7"><input name="lbSerialNum1" type="text" value="SerailNo1" id="lbSerialNum1" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbSerialNum2" type="text" value="SerailNo2" id="lbSerialNum2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbSerialNum3" type="text" value="SerailNo1" id="lbSerialNum3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbSerialNum4" type="text" value="SerailNo1" id="lbSerialNum4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbSerialNum5" type="text" value="SerailNo1" id="lbSerialNum5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">			
					<td class="leftLabel">7.Size:</td>
					<td class="text7"><input name="lbSize1" type="text" value="Size1" id="lbSize1" class="noBorderTextBoxForPrint" />
					</td>
					<td class="text7"><input name="lbSize2" type="text" value="Size1" id="lbSize2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbSize3" type="text" value="Size1" id="lbSize3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbSize4" type="text" value="Size1" id="lbSize4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbSize5" type="text" value="Size1" id="lbSize5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">8.Date Installed:</td>
					<td class="text7"><input name="lbInstalledDate1" type="text" value="1/16/2011" id="lbInstalledDate1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbInstalledDate2" type="text" value="1/17/2011" id="lbInstalledDate2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbInstalledDate3" type="text" value="1/18/2011" id="lbInstalledDate3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbInstalledDate4" type="text" value="1/19/2011" id="lbInstalledDate4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbInstalledDate5" type="text" value="1/20/2011" id="lbInstalledDate5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">				
					<td class="leftLabel">9.Capacity:</td>
					<td class="text7"><input name="lbCapacity1" type="text" value="Capacity1" id="lbCapacity1" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbCapacity2" type="text" value="Capacity1" id="lbCapacity2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbCapacity3" type="text" value="Capacity1" id="lbCapacity3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbCapacity4" type="text" value="Capacity1" id="lbCapacity4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbCapacity5" type="text" value="Capacity1" id="lbCapacity5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">10.Capacity (H/T):</td>
					<td class="text7"><input name="lbCapacityHT1" type="text" value="HT1" id="lbCapacityHT1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbCapacityHT2" type="text" value="HT1" id="lbCapacityHT2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbCapacityHT3" type="text" value="HT1" id="lbCapacityHT3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbCapacityHT4" type="text" value="HT1" id="lbCapacityHT4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbCapacityHT5" type="text" value="HT1" id="lbCapacityHT5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">11.Fual or Refri:</td>
					<td class="text7"><input name="lbFuel1" type="text" value="Fual1" id="lbFuel1" class="noBorderTextBoxForPrint" />
					</td>
					<td class="text7"><input name="lbFuel2" type="text" value="HT1" id="lbFuel2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbFuel3" type="text" value="Fual1" id="lbFuel3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbFuel4" type="text" value="Fual1" id="lbFuel4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbFuel5" type="text" value="Fual1" id="lbFuel5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">12.Motor Mfg'r:</td>
					<td class="text7"><input name="lbMotorManu1" type="text" value="Motor1" id="lbMotorManu1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbMotorManu2" type="text" value="Motor1" id="lbMotorManu2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorManu3" type="text" value="Motor1" id="lbMotorManu3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorManu4" type="text" value="Motor1" id="lbMotorManu4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorManu5" type="text" value="Motor1" id="lbMotorManu5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">13.H.P.:</td>
					<td class="text7"><input name="lbHP1" type="text" value="HP1" id="lbHP1" class="noBorderTextBoxForPrint" />
					</td>
					 <td class="text7"><input name="lbHP2" type="text" value="HP1" id="lbHP2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbHP3" type="text" value="HP1" id="lbHP3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbHP4" type="text" value="HP1" id="lbHP4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbHP5" type="text" value="HP1" id="lbHP5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">14.Type:</td>
					<td class="text7"><input name="lbMotorType1" type="text" value="Type1" id="lbMotorType1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbMotorType2" type="text" value="Type1" id="lbMotorType2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorType3" type="text" value="Type1" id="lbMotorType3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorType4" type="text" value="Type1" id="lbMotorType4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorType5" type="text" value="Type1" id="lbMotorType5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">15.Serial No.:</td>
					<td class="text7"><input name="lbMotorSerialNum1" type="text" value="MotorSerial1" id="lbMotorSerialNum1" class="noBorderTextBoxForPrint" />
					</td>
					 <td class="text7"><input name="lbMotorSerialNum2" type="text" value="MotorSerial1" id="lbMotorSerialNum2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorSerialNum3" type="text" value="MotorSerial1" id="lbMotorSerialNum3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorSerialNum4" type="text" value="MotorSerial1" id="lbMotorSerialNum4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorSerialNum5" type="text" value="MotorSerial1" id="lbMotorSerialNum5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">	
					<td class="leftLabel">16.Motor Installed:</td>
					<td class="text7"><input name="lbMotorInstalledDate1" type="text" value="1/13/2011" id="lbMotorInstalledDate1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbMotorInstalledDate2" type="text" value="1/13/2011" id="lbMotorInstalledDate2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorInstalledDate3" type="text" value="1/13/2011" id="lbMotorInstalledDate3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorInstalledDate4" type="text" value="1/19/2011" id="lbMotorInstalledDate4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorInstalledDate5" type="text" value="1/20/2011" id="lbMotorInstalledDate5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">17.Model:</td>
					<td class="text7"><input name="lbMotorModel1" type="text" value="Model1" id="lbMotorModel1" class="noBorderTextBoxForPrint" />
					</td>
					 <td class="text7"><input name="lbMotorModel2" type="text" value="Model1" id="lbMotorModel2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorModel3" type="text" value="Model1" id="lbMotorModel3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorModel4" type="text" value="Model1" id="lbMotorModel4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbMotorModel5" type="text" value="Model1" id="lbMotorModel5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">18.Frame:</td>
					<td class="text7"><input name="lbFrame1" type="text" value="Frame1" id="lbFrame1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbFrame2" type="text" value="Frame1" id="lbFrame2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbFrame3" type="text" value="Frame1" id="lbFrame3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbFrame4" type="text" value="Frame1" id="lbFrame4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbFrame5" type="text" value="Frame1" id="lbFrame5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">19.R.P.M.:</td>
					<td class="text7"><input name="lbRPM1" type="text" value="RPM1" id="lbRPM1" class="noBorderTextBoxForPrint" />
					</td>
					 <td class="text7"><input name="lbRPM2" type="text" value="RPM1" id="lbRPM2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbRPM3" type="text" value="RPM1" id="lbRPM3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbRPM4" type="text" value="RPM1" id="lbRPM4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbRPM5" type="text" value="RPM1" id="lbRPM5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">20.Voltage:</td>
					<td class="text7"><input name="lbVoltage1" type="text" value="Voltage1" id="lbVoltage1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbVoltage2" type="text" value="Voltage1" id="lbVoltage2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbVoltage3" type="text" value="Voltage1" id="lbVoltage3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbVoltage4" type="text" value="Voltage1" id="lbVoltage4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbVoltage5" type="text" value="Voltage1" id="lbVoltage5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">					
					<td class="leftLabel">21.Amperes:</td>
					<td class="text7"><input name="lbAmperes1" type="text" value="Amperes1" id="lbAmperes1" class="noBorderTextBoxForPrint" />
					</td>
					 <td class="text7"><input name="lbAmperes2" type="text" value="Amperes1" id="lbAmperes2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbAmperes3" type="text" value="Amperes1" id="lbAmperes3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbAmperes4" type="text" value="Amperes1" id="lbAmperes4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbAmperes5" type="text" value="Amperes1" id="lbAmperes5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">22.Phase-Cycle:</td>
					<td class="text7"><input name="lbPhaseCycle1" type="text" value="Phasecyle1" id="lbPhaseCycle1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbPhaseCycle2" type="text" value="Phasecyle1" id="lbPhaseCycle2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbPhaseCycle3" type="text" value="Phasecyle1" id="lbPhaseCycle3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbPhaseCycle4" type="text" value="Phasecyle1" id="lbPhaseCycle4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbPhaseCycle5" type="text" value="Phasecyle1" id="lbPhaseCycle5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">				
					<td class="leftLabel">23.BSL Class.:</td>
					<td class="text7"><input name="lbBSLClass1" type="text" value="BSLClass1" id="lbBSLClass1" class="noBorderTextBoxForPrint" />
					</td>
					 <td class="text7"><input name="lbBSLClass2" type="text" value="BSLClass1" id="lbBSLClass2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbBSLClass3" type="text" value="BSLClass1" id="lbBSLClass3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbBSLClass4" type="text" value="BSLClass1" id="lbBSLClass4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbBSLClass5" type="text" value="BSLClass1" id="lbBSLClass5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">
					<td class="leftLabel">24.TJC Value:</td>
					<td class="text7"><input name="lbTJC1" type="text" value="2" id="lbTJC1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbTJC2" type="text" value="3" id="lbTJC2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbTJC3" type="text" value="4" id="lbTJC3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbTJC4" type="text" value="5" id="lbTJC4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbTJC5" type="text" value="6" id="lbTJC5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				<tr style="height:10pt">						
					<td class="leftLabel">25.PM Schedule:</td>
					<td class="text7"><input name="lbPMSchedule1" type="text" value="PMS1" id="lbPMSchedule1" class="noBorderTextBoxForPrint" />
					</td>
				    <td class="text7"><input name="lbPMSchedule2" type="text" value="PMS1" id="lbPMSchedule2" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbPMSchedule3" type="text" value="PMS1" id="lbPMSchedule3" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbPMSchedule4" type="text" value="PMS1" id="lbPMSchedule4" class="noBorderTextBoxForPrint" /></td>
					<td class="text7"><input name="lbPMSchedule5" type="text" value="PMS1" id="lbPMSchedule5" class="noBorderTextBoxForPrint" /></td>
				</tr>
				
			
			</table>
			<table width="635" border="0">
				<tr style="height:18pt">
					<td class="leftLabel" colspan="2">Comments:<br />
					<input name="lbComments1" type="text" value="Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here.Test comment information here." id="lbComments1" class="noborderCommentForPrint" />						
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
			

                </ContentTemplate>  
        </ajaxToolkit:TabPanel>
     </ajaxToolkit:TabContainer>
   </asp:Panel>
   
</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="systemMechanical.aspx.cs" Inherits="Equipment_systemMechanical" %>
<asp:Content ID="headerContent" ContentPlaceHolderID="headerPlaceHolder" runat="server">

    <script type="text/javascript" src="../JS/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../JS/jquery-ui-1.8.12.custom.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table style="font-size: 9pt; width: 100%">
        <tr>
            <td align="right">
                <a href='../printFacility.aspx?FacilityNumber=<%= txtFacilityNum.Text %>' target="_blank">
                    <img src="../Image/btn_print.gif" border="0" alt="print" /></a>
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>

        <asp:Panel ID="contentPanel" runat="server">
           
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
                    <td>
                        <asp:Label ID="lbLocation" CssClass="tableLabel" runat="server" Text="2.Location"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtComLocation" MaxLength="50" runat="server" TabIndex="9" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbTypeUse" CssClass="tableLabel" runat="server" Text="3.Type or Use"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTypeUse" MaxLength="50" runat="server" TabIndex="10" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lbManufacturer" CssClass="tableLabel" runat="server" Text="4.Manufacturer"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtManufacturer" MaxLength="50" runat="server" TabIndex="11" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbModelNum" CssClass="tableLabel" runat="server" Text="5.Model No."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtModelNum" MaxLength="50" runat="server" TabIndex="12" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lbSerialNum" CssClass="tableLabel" runat="server" Text="6.Serial No."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSerialNum" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lbSize" CssClass="tableLabel" runat="server" Text="7.Size"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSize" MaxLength="50" runat="server" TabIndex="11" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbInstalledDate" CssClass="tableLabel" runat="server" Text="8.Date Installed"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtInstalledDate" MaxLength="50" runat="server" TabIndex="12" />
                    
                        <asp:CompareValidator ID="cvInstalledDate" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lbCapacity" CssClass="tableLabel" runat="server" Text="9.Capacity"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCapacity" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbCapacityHT" CssClass="tableLabel" runat="server" Text="10.Capacity(H/T)"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCapacityHT" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbFuel" CssClass="tableLabel" runat="server" Text="11.Fual or Refri"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFuel" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lbMotorManu" CssClass="tableLabel" runat="server" Text="12.Motor Mfg'r"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMotorManu" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbHP" CssClass="tableLabel" runat="server" Text="13. H.P."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtHP" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbMotorType" CssClass="tableLabel" runat="server" Text="14.Type"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMotorType" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbMotorSerialNum" CssClass="tableLabel" runat="server" Text="15.Serial No."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMotorSerialNum" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbMotorInstalledDate" CssClass="tableLabel" runat="server" Text="16.Motor Installe"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMotorInstalledDate" MaxLength="50" runat="server" TabIndex="13" />
                    <asp:CompareValidator ID="CompareValidator5" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtMotorInstalledDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                   
                         </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbMotorModel" CssClass="tableLabel" runat="server" Text="17.Model"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMotorModel" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lbFrame" CssClass="tableLabel" runat="server" Text="18.Frame"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFrame" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbRPM" CssClass="tableLabel" runat="server" Text="19.R.P.M."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRPM" MaxLength="50" runat="server" TabIndex="13" />
                    
                         </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbVoltage" CssClass="tableLabel" runat="server" Text="20.Voltage"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVoltage" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbAmperes" CssClass="tableLabel" runat="server" Text="21.Amperes"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAmperes" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbPhaseCycle" CssClass="tableLabel" runat="server" Text="22.Phase-Cycle"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhaseCycle" MaxLength="50" runat="server" TabIndex="13" />
                    
                         </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbBSLClass" CssClass="tableLabel" runat="server" Text="23.BSL Class."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBSLClass" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="lbTJC" CssClass="tableLabel" runat="server" Text="24.TJC Value"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTJC" MaxLength="50" runat="server" TabIndex="13" />
                     <asp:RangeValidator ID="valTJC" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC"></asp:RangeValidator>
                   
                         </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lbPMSchedule" CssClass="tableLabel" runat="server" Text="25.PM Schedule"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPMSchedule" MaxLength="50" runat="server" TabIndex="13" />
                    </td>
                </tr>
                     <tr>
                        <td colspan="2">
                            
                            <b>Comments</b>
                        </td>
                         <td>
                            <asp:TextBox ID="txtComments" runat="server" MaxLength="255" TextMode="MultiLine" Rows="3" Columns="55" TabIndex="36"></asp:TextBox>
                            <br />
                        </td>

                    </tr>
                </table>
            </asp:Panel>

</asp:Content>


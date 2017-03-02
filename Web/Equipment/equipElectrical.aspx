<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="equipElectrical.aspx.cs" Inherits="Equipment_equipElectrical" %>

<%@ Register Src="/CommonControl/ctrlAttachment.ascx" TagName="mngAttachment" TagPrefix="ctrlAtt" %>
<asp:Content ID="headerContent" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link href="../CSS/jquery-ui-1.8.12.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../JS/jquery-ui-1.8.12.custom.min.js"></script>
 <%--   <script type="text/javascript" src="../JS/jquery.scannerdetection.compatibility.js"></script>
    <script type="text/javascript" src="../JS/jquery.scannerdetection.js"></script>--%>
    <script type="text/javascript" src="../JS/OpenAttachmentImage.js"></script>

    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {



            $('#<%=txtInventoryDate.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });

        });

        //$(document).scannerDetection({
        //    timeBeforeScanTest: 200, // wait for the next character for upto 200ms
        //    endChar: [13], // be sure the scan is complete if key 13 (enter) is detected
        //    avgTimeByChar: 40, // it's not a barcode if a character takes longer than 40ms
        //    ignoreIfFocusOn: 'input', // turn off scanner detection if an input has focus
        //    onComplete: function(barcode, qty) {
        //        alert('Scanned...');
        //    }, // main callback function
        //    scanButtonKeyCode: 116, // the hardware scan button acts as key 116 (F5)
        //    scanButtonLongPressThreshold: 5, // assume a long press if 5 or more events come in sequence
        //    onScanButtonLongPressed: showKeyPad, // callback for long pressing the scan button
        //    onError: function (string) { alert('Error ' + string); }
        //});



    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
 
        <asp:Panel ID="contentPanel" runat="server">
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Button ID="btnBackToList" runat="server" Text="Back to Search List" CssClass="submitGreen" UseSubmitBehavior="false" CausesValidation="false" OnClick="btnBackToList_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <%--<a href='../printEleEquipment.aspx?equipmentSysID=<%= hidEquipmentSysID.Value %>' target="_blank"><img src="../Image/btn_print.gif" border="0" alt="print" /></a>--%>
                    </td>
                    <td colspan="4" align="right">
                        <asp:Button ID="btnFinish" runat="server" Text="Save" CssClass="submitGreen" OnClick="btnFinish_Click" TabIndex="24" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="submitGreen" UseSubmitBehavior="false" CausesValidation="false" OnClick="btnReset_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnAddNew" runat="server" Text="Add Another" CssClass="submitGreen" UseSubmitBehavior="false" CausesValidation="false" OnClick="btnAddNew_Click" />


                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="inventoryTopLeftTitle" width="60%">Electrical Equipment Inventory Card</td>
                    <td class="inventoryTopRightCell" width="15%" valign="baseline">Facility#:</td>
                    <td style="border-bottom: solid 1px #000;" width="25%">
                        <font color="gray">&nbsp;<asp:Label ID="txtFacilityNum" runat="server"></asp:Label></font>
                        <asp:HiddenField ID="hidEquipmentSysID" runat="server" Value="-1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Electrical System:&nbsp;&nbsp;</font>
                        <asp:DropDownList ID="drplstSystem" runat="server" SkinID="longDropDown" DataTextField="SystemTitle" DataValueField="SystemTitle" AppendDataBoundItems="true" TabIndex="1">
                            <asp:ListItem Value="">--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rqSystem" runat="server" ControlToValidate="drplstSystem" Display="Dynamic" ErrorMessage="System is required" InitialValue=""></asp:RequiredFieldValidator>
                    </td>
                    <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                    <td class="inventoryTopRightCellBtm">
                        <asp:TextBox ID="txtFacilityID" MaxLength="50" runat="server" TabIndex="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqvFacilityID" runat="server" ControlToValidate="txtFacilityID" Display="Dynamic" ErrorMessage="Facility ID is required"></asp:RequiredFieldValidator>
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

                        Floor:
                        <asp:TextBox ID="txtFloor" runat="server" MaxLength="10" SkinID="ShortInputTextBox" TabIndex="8"></asp:TextBox><font color="#BA3516"> Location: </font><asp:TextBox ID="txtLocation" MaxLength="50" runat="server" SkinID="ShortInputTextBox" TabIndex="9"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" ErrorMessage="Location is required"></asp:RequiredFieldValidator>
                    </td>
                    <td class="inventoryTopRightCell">Work Request#:</td>
                    <td class="inventoryTopRightCellBtm">
                        <asp:TextBox ID="txtWRNum" runat="server" MaxLength="50" TabIndex="10"></asp:TextBox></td>
                </tr>
            </table>
            <table id="inputTable" cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbModelNum" CssClass="tableLabel" runat="server" Text="Model No."></asp:Label></td>
                    <td width="35%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtModelNum" runat="server" MaxLength="50" TabIndex="11" />
                    </td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbSerialNum" CssClass="tableLabel" runat="server" Text="Serial No."></asp:Label></td>
                    <td width="35%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtSerialNum" runat="server" MaxLength="50" TabIndex="12" />
                    </td>
                </tr>
                <tr>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbSize" CssClass="tableLabel" runat="server" Text="Size"></asp:Label></td>
                    <td width="35%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtSize" runat="server" MaxLength="50" TabIndex="13" /></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbVolts" CssClass="tableLabel" runat="server" Text="VOLTS"></asp:Label></td>
                    <td width="35%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtVolts" runat="server" MaxLength="20" TabIndex="14" /></td>
                </tr>
                <tr>
                    <%--<td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbTypeOrUse" CssClass="tableLabel" runat="server" Text="Type or Use"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtTypeOrUse" runat="server" MaxLength="50" TabIndex="31" />
                    </td>--%>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbPMSchedule" runat="server" CssClass="tableLabel" Text="PM Schedule"></asp:Label>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtPMSchedule" MaxLength="50" runat="server" TabIndex="15" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbManufacturer" CssClass="tableLabel" runat="server" Text="Manufacturer"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtManufacturer" runat="server" MaxLength="50" TabIndex="16" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbAMP" CssClass="tableLabel" runat="server" Text="AMP"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtAMP" runat="server" MaxLength="20" TabIndex="17" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbKVA" CssClass="tableLabel" runat="server" Text="KVA"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtKVA" runat="server" MaxLength="20" TabIndex="18" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbVoltsPrimary" CssClass="tableLabel" runat="server" Text="Volts Primary"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtVoltsPrimary" runat="server" MaxLength="20" TabIndex="19" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbVoltsSecondary" CssClass="tableLabel" runat="server" Text="Volts Secondary"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtVoltsSecondary" runat="server" MaxLength="20" TabIndex="20" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label1" CssClass="tableLabel" runat="server" Text="Ph"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtPH" runat="server" MaxLength="6" TabIndex="21" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label3" CssClass="tableLabel" runat="server" Text="W"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtW" runat="server" MaxLength="6" TabIndex="22" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label4" CssClass="tableLabel" runat="server" Text="No. of CKTS."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtCKTSNum" runat="server" MaxLength="6" TabIndex="23" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label5" CssClass="tableLabel" runat="server" Text="CKTS Used"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtCKTSUsed" runat="server" MaxLength="6" TabIndex="24" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbInstalledDate" CssClass="tableLabel" runat="server" Text="Date Installed"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtInstalledDate" runat="server" TabIndex="25" />
                        <asp:CompareValidator ID="cvInstalledDate" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbTJC" runat="server" CssClass="tableLabel" Text="TJC Value"></asp:Label>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtTJC" MaxLength="50" runat="server" TabIndex="30" />
                        <asp:RangeValidator ID="valTJC" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC"></asp:RangeValidator>

                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbBSLClass" CssClass="tableLabel" runat="server" Text="BSL Class."></asp:Label>
                    </td>

                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtBSLClass" MaxLength="50" runat="server" TabIndex="29" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbElectricalOther" CssClass="tableLabel" runat="server" Text="Electrical Other"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtElectricalOther" runat="server" MaxLength="200" TabIndex="28" /></td>
                </tr>
                <tr>

                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbInventoryBy" CssClass="tableLabel" runat="server" Text="Inventory By"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtInventoryBy" runat="server" MaxLength="50" TabIndex="27" />
                    </td>

                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbInventoryDate" CssClass="tableLabel" runat="server" Text="Inventory Date"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtInventoryDate" runat="server" TabIndex="26" />
                        <asp:CompareValidator ID="cvInventoryDate" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInventoryDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>

                </tr>
                <tr>
                    <td class="tableLabel">
                        <br />
                        Comments
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="3" Columns="55" TabIndex="23"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbLastUpdatedBy" CssClass="tableLabel" runat="server"></asp:Label></td>
                </tr>

                <tr id="trAttachment" runat="server">
                    <td>
                        <asp:Label CssClass="tableLabel" runat="server" Text="Attachments" />
                     </td>
                    <td colspan="3">
                        <asp:Button ID="btnAddAttachment" runat="server" Text="Add New Attachment" CssClass="submitGreen" CausesValidation="false" />
                        <br />
                        <br />
                    </td>
                  
                </tr>

                <tr id="trAttList" runat="server">
                    <td colspan="3">
                        <asp:GridView ID="gvExtAttachment" SkinID="NoPagingSortingGV" runat="server" AutoGenerateColumns="false" GridLines="None"
                            OnRowCommand="gvExtAttachment_onRowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Open" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="Open" CommandArgument='<%# Eval("InvAttachmentSysID").ToString() %>' ID="btnOpenAttachment" Text="<img src='/Image/btn_edit.gif' alt='Open' />" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="Deleting" CommandArgument='<%# Eval("InvAttachmentSysID").ToString() %>' ID="btnDeleteAttachment" Text="<img src='/Image/btn_delete.png' alt='Delete' />" runat="server" OnClientClick="return confirm('OK to Delete?');"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Title" DataField="Title" HeaderStyle-HorizontalAlign="left" />
                                <asp:BoundField HeaderText="File" DataField="FileName" />
                                <asp:BoundField HeaderText="Created" DataField="CreatedOn" />
                                <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                    </td>
                      <td>
                        <a id="imageAttachmentAnchor" href="#" runat="server">
                            <asp:Image ID="imageAttachment" runat="server" Width="150" />
                        </a>
                    </td>
                </tr>
            </table>

            <ajaxToolkit:ModalPopupExtender ID="mpeAttachment" runat="server" TargetControlID="btnAddAttachment"
                BehaviorID="psrAtt" PopupControlID="panelAttachment" BackgroundCssClass="modal" DropShadow="true" OkControlID="btnClose" />

            <asp:Panel ID="panelAttachment" runat="server" Style="width: 750px; background: white; border: 2px black solid; display: none; text-align: left;">
                <ctrlAtt:mngAttachment ID="ctrlAddAttachment" runat="server" IsEquipmentOrFacility="false" ModalExtenderID="mpeAttachment" SectionHeaderText="Attachments" AutoLoad="True" />
                <br />
                <br />
                <div align="center">
                    <asp:Button ID="btnClose" runat="server" Text="Close" />
                </div>
                <br />
            </asp:Panel>
        </asp:Panel>
   
</asp:Content>


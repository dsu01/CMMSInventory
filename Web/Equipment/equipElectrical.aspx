<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="equipElectrical.aspx.cs" Inherits="Equipment_equipElectrical" %>

<%@ Register Src="/CommonControl/ctrlAttachment.ascx" TagName="mngAttachment" TagPrefix="ctrlAtt" %>
<asp:Content ID="headerContent" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link href="../CSS/jquery-ui-1.8.12.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../JS/jquery-ui-1.8.12.custom.min.js"></script>
    <script type="text/javascript" src="../JS/jquery.scannerdetection.compatibility.js"></script>
    <script type="text/javascript" src="../JS/jquery.scannerdetection.js"></script>

    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            //alert('$(document).ready');
            $('#<%=txtTypeOrUse.ClientID%>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../WebService/GetTypeOrUseList.asmx/GetList",
                        data: "{}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataFilter: function (data) { return data; },
                        success: function (data) {
                            var datafromServer = data.d.split(":");
                            return { value: datafromServer }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });
                },
                minLength: 2
            });
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

        //     $('#<%=txtTypeOrUse.ClientID%>').autocomplete({
        //          source: ["c++", "java", "php", "coldfusion", "javascript", "asp", "ruby"]
        //          });
        //}); 

    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table style="font-size: 9pt; width: 100%">
        <tr>

            <td align="right"><a href='../printFacility.aspx?FacilityNumber=<%= txtFacilityNum.Text %>' target="_blank">
                <img src="../Image/btn_print.gif" border="0" alt="print" /></a>&nbsp;&nbsp;</td>
        </tr>
    </table>
    <div style="padding: 5px">
        <asp:Panel ID="contentPanel" runat="server">
            <table cellspacing="0" cellpadding="5" width="100%" border="0">

                <tr>
                    <td colspan="4" class="inventoryTopLeftTitle" width="60%">Equipment Inventory Card</td>
                    <td class="inventoryTopRightCell" width="15%" valign="baseline">Facility#:</td>
                    <td style="border-bottom: solid 1px #000;" width="25%">
                        <font color="gray">&nbsp;<asp:Label ID="txtFacilityNum" runat="server"></asp:Label></font>
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

                        Floor:<asp:TextBox ID="txtFloor" runat="server" MaxLength="10" SkinID="ShortInputTextBox" TabIndex="8"></asp:TextBox><font color="#BA3516">Location:</font><asp:TextBox ID="txtLocation" MaxLength="50" runat="server" SkinID="ShortInputTextBox" TabIndex="9"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" ErrorMessage="Location is required"></asp:RequiredFieldValidator>
                    </td>
                    <td class="inventoryTopRightCell">Work Request#:</td>
                    <td class="inventoryTopRightCellBtm">
                        <asp:TextBox ID="txtWRNum" runat="server" MaxLength="50" TabIndex="10"></asp:TextBox></td>
                </tr>

            </table>
            <table id="inputTable" cellspacing="0" cellpadding="2" width="100%" border="0" style="font-size: .75em">
                <tr>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbEquipmentID" CssClass="tableLabel" runat="server" Text="Equipment ID (Other)"></asp:Label></td>
                    <td width="35%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtEquipmentID" runat="server" MaxLength="50" TabIndex="11" />
                    </td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbVolts" CssClass="tableLabel" runat="server" Text="VOLTS"></asp:Label></td>
                    <td width="35%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtVolts" runat="server" MaxLength="20" TabIndex="17" /></td>

                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbTypeOrUse" CssClass="tableLabel" runat="server" Text="Type or Use"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtTypeOrUse" runat="server" MaxLength="50" TabIndex="12" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbManufacturer" CssClass="tableLabel" runat="server" Text="Manufacturer"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtManufacturer" runat="server" MaxLength="50" TabIndex="18" /></td>

                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbAMP" CssClass="tableLabel" runat="server" Text="AMP"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtAMP" runat="server" MaxLength="20" TabIndex="13" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbKVA" CssClass="tableLabel" runat="server" Text="KVA"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtKVA" runat="server" MaxLength="20" TabIndex="19" /></td>

                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbVoltsPrimary" CssClass="tableLabel" runat="server" Text="Volts Primary"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtVoltsPrimary" runat="server" MaxLength="20" TabIndex="14" />
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
                        <asp:TextBox ID="txtPH" runat="server" MaxLength="6" TabIndex="15" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label3" CssClass="tableLabel" runat="server" Text="W"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtW" runat="server" MaxLength="6" TabIndex="21" /></td>

                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label4" CssClass="tableLabel" runat="server" Text="No. of CKTS."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtCKTSNum" runat="server" MaxLength="6" TabIndex="16" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label5" CssClass="tableLabel" runat="server" Text="CKTS Used"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtCKTSUsed" runat="server" MaxLength="6" TabIndex="22" /></td>

                </tr>

                  <tr>
                    <td>
                        <asp:Label ID="Label2" CssClass="tableLabel" runat="server" Text="Attachments"></asp:Label></td>
                    <td colspan="4">
                        user control
                    </td>
                    

                </tr>
            
                <tr>
                    <td >
                        <br />
                       <b> Comments</b>
                    </td>
                    <td colspan="4">
                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="3" Columns="55" TabIndex="23"></asp:TextBox>
                        <br />
                    </td>

                </tr>
                <tr>
                    <td align="center"></td>
                    <td colspan="4">
                        <asp:Button ID="btnFinish" runat="server" Text="Save" CssClass="submitGreen" OnClick="btnFinish_Click" TabIndex="24" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="submitYellow" UseSubmitBehavior="false" CausesValidation="false" OnClick="btnReset_Click" />
                        <asp:HiddenField ID="hidFacSystemID" runat="server" Value="-1" />
                    </td>
                </tr>
            </table>

            <%--<asp:HiddenField ID="attachmentClick" runat="server" />--%>
            
            <asp:Button ID="attachmentClick" runat="server" />

            <ajaxToolkit:ModalPopupExtender ID="mpeAttachment" runat="server" TargetControlID="attachmentClick"
                BehaviorID="psrAtt" PopupControlID="Panel2" BackgroundCssClass="modal" DropShadow="true" OkControlID="CloseButton" />

            <asp:Panel ID="Panel2" runat="server" Style="width: 500px; background: white; border: 2px black solid; display: none; text-align: left;">
                <ctrlAtt:mngAttachment ID="mngAttachment" runat="server" ModalExtenderID="mpeAttachment" SectionHeaderText="Attachments" AutoLoad="True" />
                <br />
                <br />
                <div align="center">
                    <asp:Button ID="CloseButton" runat="server" Text="Close" />
                </div>
                <br />
            </asp:Panel>
        </asp:Panel>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="equipMechanical.aspx.cs" Inherits="Equipment_equipMechanical" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="headerPlaceHolder" runat="server">

    <script type="text/javascript" src="../JS/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../JS/jquery-ui-1.8.12.custom.min.js"></script>
    <script type="text/javascript" src="../JS/jquery.scannerdetection.compatibility.js"></script>
    <script type="text/javascript" src="../JS/jquery.scannerdetection.js"></script>

    <script type="text/javascript">
        var scanEnabled = false;
        <%--var scanButton = document.getElementById('<%= txtEquipmentID1.ClientID %>');
        scanButton.onclick(ev) ( function () {
            scanEnabled = !scanEnabled;
            this.enabled = !this.enabled;
        });--%>

        //(function ($) {
        //    $.fn.TestFunc1 = function (options) {

        //        alert("TestFunc1");

        //        self.TestFunc2 = function (s) {
        //            alert("TestFunc2");
        //        }

        //        this.TestFunc2();
        //        return this;
        //    }
        //})(jQuery);

        //var test = $(document).TestFunc1();
        //test.TestFunc2();


        function ToggleScan() {
            scanEnabled = !scanEnabled;
            var scanButton = document.getElementById('<%= ButtonScan.ClientID %>');
            scanButton.value = scanEnabled ? 'Done' : 'Scan';

            if (scanEnabled) {
                scanner.scannerDetection({
                    timeBeforeScanTest: 200, // wait for the next character for upto 200ms
                    endChar: [13], // be sure the scan is complete if key 13 (enter) is detected
                    avgTimeByChar: 40, // it's not a barcode if a character takes longer than 40ms
                    ignoreIfFocusOn: 'input', // turn off scanner detection if an input has focus
                    onComplete: function (barcode, qty) {
                        var cid = document.getElementById('<%= txtBarcode.ClientID %>');
                        cid.value = barcode;
                    }, // main callback function
                    scanButtonKeyCode: 116, // the hardware scan button acts as key 116 (F5)
                    scanButtonLongPressThreshold: 5, // assume a long press if 5 or more events come in sequence
                    onScanButtonLongPressed: //showKeyPad, // callback for long pressing the scan button
                        function () {
                            alert('onScanButtonLongPressed');
                        },
                    onError: function (string) { alert('Error ' + string); }
                });
                    $('#InventoryCardTitle').focus();
                }
                else {
                    scanner.scannerDetection(false);
                    $('#InventoryCardTitle').focus();
                }
            }

            var scanner = $(document).scannerDetection({
                timeBeforeScanTest: 200, // wait for the next character for upto 200ms
                endChar: [13], // be sure the scan is complete if key 13 (enter) is detected
                avgTimeByChar: 40, // it's not a barcode if a character takes longer than 40ms
                ignoreIfFocusOn: 'input', // turn off scanner detection if an input has focus
                onComplete: function (barcode, qty) {
                    var cid = document.getElementById('<%= txtBarcode.ClientID %>');
                        cid.value = barcode;
                        //alert("onComplete");
                    }, // main callback function
                    scanButtonKeyCode: 116, // the hardware scan button acts as key 116 (F5)
                    scanButtonLongPressThreshold: 5, // assume a long press if 5 or more events come in sequence
                    onScanButtonLongPressed: //showKeyPad, // callback for long pressing the scan button
                        function () {
                            alert('onScanButtonLongPressed');
                        },
                    onError: function (string) { alert('Error ' + string); }
            });
                    scanner.scannerDetection(false);

                    function checkEquipmentID1TextBox(inputCtrl) {
                        var cid = document.getElementById('<%= txtEquipmentID1.ClientID %>');
                if (cid.value.length == 0) {
                    alert("Please enter previous Equipment ID.");
                    cid.focus(); // set the focus to this input
                    return false;
                }
                return true;
            }

            function checkEquipmentID2TextBox(inputCtrl) {
                var cid = document.getElementById('<%= txtEquipmentID2.ClientID %>');
                if (cid.value.length == 0) {
                    alert("Please enter previous Equipment ID.");
                    cid.focus(); // set the focus to this input
                    return false;
                }
                return true;
            }
            function checkEquipmentID3TextBox(inputCtrl) {
                var cid = document.getElementById('<%= txtEquipmentID3.ClientID %>');
                if (cid.value.length == 0) {
                    alert("Please enter previous Equipment ID.");
                    cid.focus(); // set the focus to this input
                    return false;
                }
                return true;
            }
            function checkEquipmentID4TextBox(inputCtrl) {
                var cid = document.getElementById('<%= txtEquipmentID4.ClientID %>');
            if (cid.value.length == 0) {
                alert("Please enter previous Equipment ID.");
                cid.focus(); // set the focus to this input
                return false;
            }
            return true;
        }
    </script>

    <link href="../CSS/jquery-ui-1.8.12.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JS/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../JS/jquery-ui-1.8.12.custom.min.js"></script>

    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            // $("#date").datepicker({ showOn: 'button', buttonText: "select" });
            //$("#txtInstalledDate1").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: 'images/icon_cal.png' });
            $('#<%=txtInstalledDate1.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate2.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate3.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate4.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate5.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate1.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate2.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate3.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate4.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtMotorInstalledDate5.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });

            $("#dialogPreviousFive").dialog({
                autoOpen: false,
                bgiframe: true,
                width: 500,
                height: 300,
                modal: true,
                buttons: {
                    'Yes': function () {
                        <%=this.Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this.btnPreviousFive))%>;
                    },
                    'No': function () {
                        $(this).dialog('close');
                    }
                }
            });
            $("#dialogCancel").dialog({
                autoOpen: false,
                bgiframe: true,
                width: 500,
                height: 300,
                modal: true,
                buttons: {
                    'Yes': function () {
                        <%=this.Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this.btnCancel))%>;
                    },
                    'No': function () {
                        $(this).dialog('close');
                    }
                }
            });
            $("#dialogNextFive").dialog({
                autoOpen: false,
                bgiframe: true,
                width: 500,
                height: 300,
                modal: true,
                buttons: {
                    'Yes': function () {
                        <%=this.Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this.btnNextFive))%>;
                    },
                    'No': function () {
                        $(this).dialog('close');
                    }
                }
            });

        });

    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table style="font-size: 9pt; width: 100%">
        <tr>
            <td align="right">
                <a href='../printFacility.aspx?FacilityNumber=<%= txtFacilityNum.Text %>' target="_blank">
                    <img src="../Image/btn_print.gif" border="0" alt="print" /></a>
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <div style="padding: 5px">
        <asp:Panel ID="contentPanel" runat="server">
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
                            <asp:TextBox ID="txtBarcode" runat="server" MaxLength="20" TabIndex="2" />
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
                </table>
            </asp:Panel>
            <table id="inputTable" cellspacing="0" cellpadding="0" width="100%" border="0" style="font-size: .75em">
                <tr bgcolor="#ffffcc" height="18">
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="Label1" CssClass="tableLabel" runat="server"></asp:Label></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbComponent1" CssClass="componentLabel1" runat="server"></asp:Label></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbComponent2" CssClass="componentLabel2" runat="server"></asp:Label></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbComponent3" CssClass="componentLabel3" runat="server"></asp:Label></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbComponent4" CssClass="componentLabel4" runat="server"></asp:Label></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbComponent5" CssClass="componentLabel5" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbEquipment" CssClass="tableLabel" runat="server" Text="1.Equipment ID *"></asp:Label></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtEquipmentID1" MaxLength="50" runat="server" SkinID="NoborderTextBox" TabIndex="11" />
                    </td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtEquipmentID2" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtEquipmentID3" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtEquipmentID4" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                    <td width="15%" style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtEquipmentID5" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbLocation" CssClass="tableLabel" runat="server" Text="2.Location"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtLocation1" MaxLength="50" runat="server" SkinID="NoborderTextBox" TabIndex="12" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtLocation2" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtLocation3" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtLocation4" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox ID="txtLocation5" MaxLength="50" runat="server" SkinID="NoborderTextBox" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbTypeUse" CssClass="tableLabel" runat="server" Text="3.Type or Use"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtTypeUse1" runat="server" TabIndex="13" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtTypeUse2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtTypeUse3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtTypeUse4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtTypeUse5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbManufacturer" CssClass="tableLabel" runat="server" Text="4.Manufacturer"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtManufacturer1" runat="server" TabIndex="14" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtManufacturer2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtManufacturer3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtManufacturer4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtManufacturer5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbModelNum" CssClass="tableLabel" runat="server" Text="5.Model No."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtModelNum1" runat="server" TabIndex="15" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtModelNum2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtModelNum3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtModelNum4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtModelNum5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbSerialNum" CssClass="tableLabel" runat="server" Text="6.Serial No."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSerialNum1" runat="server" TabIndex="16" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSerialNum2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSerialNum3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSerialNum4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSerialNum5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbSize" CssClass="tableLabel" runat="server" Text="7.Size"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSize1" runat="server" TabIndex="17" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSize2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSize3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSize4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtSize5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbInstalledDate" CssClass="tableLabel" runat="server" Text="8.Date Installed"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtInstalledDate1" runat="server" TabIndex="18" />

                        <asp:CompareValidator ID="cvInstalledDate1" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate1" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtInstalledDate2" runat="server" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate2" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtInstalledDate3" runat="server" />
                        <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate3" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtInstalledDate4" runat="server" />
                        <asp:CompareValidator ID="CompareValidator3" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate4" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtInstalledDate5" runat="server" />
                        <asp:CompareValidator ID="CompareValidator4" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate5" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbCapacity" CssClass="tableLabel" runat="server" Text="9.Capacity"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacity1" runat="server" TabIndex="19" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacity2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacity3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacity4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacity5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbCapacityHT" CssClass="tableLabel" runat="server" Text="10.Capacity(H/T)"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacityHT1" runat="server" TabIndex="20" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacityHT2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacityHT3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacityHT4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtCapacityHT5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbFuel" CssClass="tableLabel" runat="server" Text="11.Fual or Refri"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtFuel1" runat="server" TabIndex="21" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtFuel2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtFuel3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtFuel4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtFuel5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbMotorManu" CssClass="tableLabel" runat="server" Text="12.Motor Mfg'r"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorManu1" runat="server" TabIndex="22" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorManu2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorManu3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorManu4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorManu5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbHP" CssClass="tableLabel" runat="server" Text="13. H.P."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtHP1" runat="server" TabIndex="23" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtHP2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtHP3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtHP4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtHP5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbMotorType" CssClass="tableLabel" runat="server" Text="14.Type"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorType1" runat="server" TabIndex="24" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorType2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorType3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorType4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorType5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbMotorSerialNum" CssClass="tableLabel" runat="server" Text="15.Serial No."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorSerialNum1" runat="server" TabIndex="25" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorSerialNum2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorSerialNum3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorSerialNum4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorSerialNum5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbMotorInstalledDate" CssClass="tableLabel" runat="server" Text="16.Motor Installed"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtMotorInstalledDate1" runat="server" TabIndex="26" />
                        <asp:CompareValidator ID="CompareValidator5" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtMotorInstalledDate1" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtMotorInstalledDate2" runat="server" />
                        <asp:CompareValidator ID="CompareValidator6" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtMotorInstalledDate2" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtMotorInstalledDate3" runat="server" />
                        <asp:CompareValidator ID="CompareValidator7" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtMotorInstalledDate3" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtMotorInstalledDate4" runat="server" />
                        <asp:CompareValidator ID="CompareValidator8" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtMotorInstalledDate4" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtMotorInstalledDate5" runat="server" />
                        <asp:CompareValidator ID="CompareValidator9" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtMotorInstalledDate5" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbMotorModel" CssClass="tableLabel" runat="server" Text="17.Model"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorModel1" runat="server" TabIndex="27" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorModel2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorModel3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorModel4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtMotorModel5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbFrame" CssClass="tableLabel" runat="server" Text="18.Frame"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtFrame1" runat="server" TabIndex="28" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtFrame2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtFrame3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtFrame4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtFrame5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbRPM" CssClass="tableLabel" runat="server" Text="19.R.P.M."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtRPM1" runat="server" TabIndex="29" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtRPM2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtRPM3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtRPM4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtRPM5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbVoltage" CssClass="tableLabel" runat="server" Text="20.Voltage"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtVoltage1" runat="server" TabIndex="30" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtVoltage2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtVoltage3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtVoltage4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtVoltage5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbAmperes" CssClass="tableLabel" runat="server" Text="21.Amperes"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtAmperes1" runat="server" TabIndex="31" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtAmperes2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtAmperes3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtAmperes4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtAmperes5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbPhaseCycle" CssClass="tableLabel" runat="server" Text="22.Phase-Cycle"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPhaseCycle1" runat="server" TabIndex="32" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPhaseCycle2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPhaseCycle3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPhaseCycle4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPhaseCycle5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbBSLClass" CssClass="tableLabel" runat="server" Text="23.BSL Class."></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtBSLClass1" runat="server" TabIndex="33" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtBSLClass2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtBSLClass3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtBSLClass4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtBSLClass5" runat="server" /></td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbTJC" CssClass="tableLabel" runat="server" Text="24.TJC Value"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtTJC1" runat="server" TabIndex="34" />
                        <asp:RangeValidator ID="valTJC1" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC1"></asp:RangeValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtTJC2" runat="server" />
                        <asp:RangeValidator ID="valTJC2" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC2"></asp:RangeValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtTJC3" runat="server" />
                        <asp:RangeValidator ID="valTJC3" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC3"></asp:RangeValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtTJC4" runat="server" />
                        <asp:RangeValidator ID="valTJC4" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC4"></asp:RangeValidator>
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" ID="txtTJC5" runat="server" />
                        <asp:RangeValidator ID="valTJC5" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC5"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:Label ID="lbPMSchedule" CssClass="tableLabel" runat="server" Text="25.PM Schedule"></asp:Label></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPMSchedule1" runat="server" TabIndex="35" />
                    </td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPMSchedule2" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPMSchedule3" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPMSchedule4" runat="server" /></td>
                    <td style="border-bottom: solid 1px #000; border-right: solid 1px #000;">
                        <asp:TextBox SkinID="NoborderTextBox" MaxLength="50" ID="txtPMSchedule5" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="6" style="font-size: 10px; font-style: italic;">*If no Equipment ID provided, it will be a single inventory.
    <asp:HiddenField ID="hidEquipmentSysID1" runat="server" Value="-1" />
                        <asp:HiddenField ID="hidEquipmentSysID5" runat="server" Value="-1" />
                        <asp:HiddenField ID="hidEquipmentSysID2" runat="server" Value="-1" />
                        <asp:HiddenField ID="hidEquipmentSysID3" runat="server" Value="-1" />
                        <asp:HiddenField ID="hidEquipmentSysID4" runat="server" Value="-1" />
                    </td>
                </tr>


            </table>
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
                <asp:Panel ID="commentsPanel" runat="server">
                    <tr>
                        <td colspan="2">
                            <br />
                            <b>Comments</b><br />
                            <asp:TextBox ID="txtComments" runat="server" MaxLength="255" TextMode="MultiLine" Rows="3" Columns="55" TabIndex="36"></asp:TextBox>
                            <br />
                        </td>

                    </tr>
                </asp:Panel>

                <tr>
                    <td width="70%" align="center" class="text7">
                        <div id="dialogNextFive" style="font-size: smaller">
                            <p>Are you sure you want to move to next page <b>without</b> saving changes on current page?</p>
                            <p>If you wish to save changes on current page, click on the "Save Current Page" button before navigating to the next page.</p>
                        </div>
                        <div id="dialogPreviousFive" style="font-size: smaller">
                            <p>Are you sure you want to move to previous page <b>without</b> saving changes on current page?</p>
                            <p>If you wish to save changes on current page, click on the "Save Current Page" button before navigating to the previous page.</p>
                        </div>
                        <div id="dialogCancel" style="font-size: smaller">
                            <p>Are you sure you want to leave this page <b>without</b> saving changes?</p>
                            <p>If you wish to save changes on current page, click on the "Save Current Page" button before navigating away from this page.</p>
                        </div>


                        <asp:Button ID="btnPreviousFive" runat="server" Enabled="false" OnClick="btnPreviousFive_Click" UseSubmitBehavior="false" CausesValidation="false"
                            Text="Previous Page" CssClass="submitYellow" OnClientClick="javascript: $('#dialogPreviousFive').dialog('open'); return false;" />&nbsp;&nbsp;
        <asp:Button ID="btnNextFive" runat="server" Enabled="false" OnClick="btnNextFive_Click" UseSubmitBehavior="false" CausesValidation="false"
            Text="Next Page" CssClass="submitYellow" OnClientClick="javascript: $('#dialogNextFive').dialog('open'); return false;" />

                    </td>
                    <td width="30%" class="text7">
                        <asp:Button ID="btnFinish" runat="server" Text="Save Current Page" CssClass="submitGreen" TabIndex="37"
                            OnClick="btnFinish_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="submitRed" UseSubmitBehavior="false" CausesValidation="false"
           OnClick="btnCancel_Click" OnClientClick="javascript: $('#dialogCancel').dialog('open'); return false;" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>


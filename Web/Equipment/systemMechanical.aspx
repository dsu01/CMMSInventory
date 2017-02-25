<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="systemMechanical.aspx.cs" Inherits="Equipment_systemMechanical" %>

<%@ Register Src="/CommonControl/ctrlAttachment.ascx" TagName="mngAttachment" TagPrefix="ctrlAtt" %>

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
            // $("#txtInventoryDate").datepicker({ showOn: 'button', buttonText: "select" });
            // $("#txtInventoryDate").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: 'images/icon_cal.png' });
            $('#<%=txtInventoryDate.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            <%--   $('#<%=txtInstalledDate2.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
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
                <td>
                    <asp:Button ID="btnBackToList" runat="server" Text="Go Back to List" CssClass="submitBlue" UseSubmitBehavior="false" CausesValidation="false" OnClick="btnGoBack_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <a href='../printMecSystem.aspx?equipmentSysID=<%= hidFacilitySysid.Value %>' target="_blank">
                          <img src="../Image/btn_print.gif" border="0" alt="print" /></a>

                </td>
                <td colspan="5" align="right">
                    <asp:Button ID="btnSaveFacility" runat="server" CssClass="submitGreen" OnClick="btnSaveFacility_Click" />
                    <asp:Label ID="lbUpdateFacilityMsg" runat="server" EnableViewState="false" CssClass="errortext"></asp:Label>
                    <asp:Button ID="btnCancelFacilityChange" runat="server" Text="Cancel" CssClass="submitRed" UseSubmitBehavior="false" CausesValidation="false"
                        OnClick="btnCancelFacility_Click" OnClientClick="return confirm('OK to Cancel?');" />

                </td>

            </tr>
            <tr>
                <td id="InventoryCardTitle" colspan="4" class="inventoryTopLeftTitle" width="50%">Mechanical Facility Inventory Card</td>
                <td class="inventoryTopRightCell" width="15%" valign="baseline">Facility#:</td>
                <td style="border-bottom: solid 1px #000;" width="35%" colspan="3">
                    <font color="gray">&nbsp;<asp:Label ID="txtFacilityNum" runat="server" /></font>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">Mechanical System:&nbsp;&nbsp;</font>
                    <asp:DropDownList ID="drplstSystem" runat="server" SkinID="longDropDown" DataTextField="SystemTitle" DataValueField="SystemTitle" AppendDataBoundItems="true" TabIndex="1">
                        <asp:ListItem Value="">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rqSystem" runat="server" ControlToValidate="drplstSystem" Display="Dynamic" ErrorMessage="System is required" InitialValue=""></asp:RequiredFieldValidator>
                </td>
                <td class="inventoryTopRightCell"><font color="#BA3516">Facility ID:</font></td>
                <td class="inventoryTopRightCell">
                    <asp:TextBox ID="txtFacilityID" runat="server" MaxLength="50" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqvFacilityID" runat="server" ControlToValidate="txtFacilityID" Display="Dynamic" ErrorMessage="Facility ID is required"></asp:RequiredFieldValidator>
                </td>
                <%--  <td class="inventoryTopRightCell"><font color="#BA3516">Barcode:</font></td>
                        <td class="inventoryTopRightCellBtm">
                            <asp:TextBox ID="txtBarcode" runat="server" MaxLength="50" TabIndex="2" AutoPostBack="False"/>
                        </td>
<%--                        <td>                          
                            <asp:Button ID="ButtonScan" runat="server" Enabled="true" UseSubmitBehavior="false" CausesValidation="false"
                                Text="Scan" CssClass="submitYellow" OnClientClick="javascript:ToggleScan() ; return false;" />&nbsp;&nbsp;
                        </td>--%>
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
                <td colspan="4" class="inventoryTopLeftCell">Inventory Date:
                       
                        <asp:TextBox ID="txtInventoryDate" runat="server" SkinID="MidTextBox" TabIndex="22" />
                    <asp:CompareValidator ID="cvInventoryDate" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInventoryDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                </td>
                <td class="inventoryTopRightCell">Inventory By:</td>
                <td class="inventoryTopRightCellBtm">

                    <asp:TextBox ID="txtInventoryBy" runat="server" MaxLength="50" TabIndex="16" />
                </td>

            </tr>
            <tr>
                <td class="inventoryTopRightCell" colspan="8">Comments:
                          
                              
                                <asp:TextBox ID="txtComments" runat="server" MaxLength="255" TextMode="MultiLine" Rows="3" Columns="55" TabIndex="36"></asp:TextBox>

                </td>

            </tr>

            <tr id="trFacilityAttachment" runat="server">
                <td>
                    <asp:Label CssClass="tableLabel" runat="server" Text="Attachments" />
                    <br />
                    <asp:Button ID="btnAddFacilityAttachment" runat="server" Text="Add New Attachment" CssClass="submitRed" CausesValidation="false" />
                </td>
                <td>
                    <asp:Image ID="imageAttachment" runat="server" alt="" Visible="true" Width="64" />
                </td>
            </tr>

            <tr id="tr1" runat="server">
                <td colspan="6">
                    <asp:GridView ID="gvExtFacilityAttachment" SkinID="NoPagingSortingGV" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnRowCommand="gvExtFacilityAttachment_onRowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Open" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:LinkButton CommandName="Open" CommandArgument='<%# Eval("InvAttachmentSysID").ToString() %>' ID="btnOpenAttachment" Text="<img src='/Image/btn_edit.gif' alt='Open' border='0' />" runat="server"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:LinkButton CommandName="Deleting" CommandArgument='<%# Eval("InvAttachmentSysID").ToString() %>' ID="btnDeleteAttachment" Text="<img src='/Image/btn_delete.png' alt='Delete' border='0'  />" runat="server" OnClientClick="return confirm('OK to Delete?');"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Title" DataField="Title" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField HeaderText="File" DataField="FileName" />
                            <asp:BoundField HeaderText="Created" DataField="CreatedOn" />
                            <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>

        <ajaxToolkit:ModalPopupExtender ID="mpeFacilityAttachment" runat="server" TargetControlID="btnAddFacilityAttachment"
            BehaviorID="psrFacilityAtt" PopupControlID="panelFacilityAttachment" BackgroundCssClass="modal" DropShadow="true" OkControlID="btnFacilityAttClose" />

        <asp:Panel ID="panelFacilityAttachment" runat="server" Style="width: 750px; background: white; border: 2px black solid; display: none; text-align: left;">
            <ctrlAtt:mngAttachment ID="ctrlAddFacilityAttachment" IsEquipmentOrFacility="false" runat="server" ModalExtenderID="mpeFacilityAttachment" SectionHeaderText="Facility Attachments" AutoLoad="False" />
            <br />
            <br />
            <div align="center">
                <asp:Button ID="btnFacilityAttClose" runat="server" Text="Close" />
            </div>
            <br />
        </asp:Panel>
    </asp:Panel>

    <asp:Panel runat="server" ID="DetailInfoPanel" Style="margin-top: 20px; font-size: 1.2em; background-color: #eeeeee;">
        <table>
            <tr>
                <td width="50%">
                    <table border="0" width="100%" cellpadding="1" cellspacing="1" style="font-size: smaller; text-align: left">

                        <tr>
                            <td colspan="2" align="left">
                                <asp:GridView ID="gv_Components" SkinID="gvRegPagingSorting" runat="server" DataSourceID="odsComponents" DataKeyNames="Key" OnRowDataBound="gv_Components_OnRowDataBound" OnRowCommand="gv_Components_onRowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="View/Edit" ItemStyle-Width="30">
                                            <ItemTemplate>
                                                <asp:LinkButton CommandName="Editing" CommandArgument='<%# Eval("Key").ToString()%>' ID="btnEditAgency" Text="<img src='../Image/btn_edit.gif' alt='Edit' border='0' />" runat="server" CausesValidation="false"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--   <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30">                                                                    
                                                    <ItemTemplate> 
                                                        <asp:LinkButton CommandName="Deleting" CommandArgument='<%# Eval("Key").ToString() %>' ID="btnDeleteAgency" Text="<img src='../Image/btn_delete.png' alt='Delete' border='0' />"  runat="server" OnClientClick="return confirm('OK to Delete?');" CausesValidation="false"></asp:LinkButton>
                                                    </ItemTemplate> 								
                                                </asp:TemplateField>  --%>
                                        <asp:TemplateField HeaderText="Seq#" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50" SortExpression="EquipSequenceNum">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEquipSequenceNum" runat="server" Text='<%# Server.HtmlEncode(Eval("EquipSequenceNum").ToString()) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Equip. ID" ItemStyle-HorizontalAlign="Left" SortExpression="EquipID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEquipmentID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("EquipID"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left" SortExpression="EquipLocation">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" runat="server" Text='<%# Server.HtmlEncode((string)Eval("EquipLocation"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TypeorUse" ItemStyle-HorizontalAlign="Left" SortExpression="TypeorUse">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTypeorUse" runat="server" Text='<%# Server.HtmlEncode((string)Eval("TypeorUse"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--                 <asp:TemplateField HeaderText="Manufacturer" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150" SortExpression="Manufacturer">
                                            <ItemTemplate>
                                                <asp:Label ID="lblManufacturer" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Manufacturer"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField> 
                                         <asp:TemplateField HeaderText="Model"  ItemStyle-HorizontalAlign="Left" SortExpression="ModelNo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModel" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ModelNo"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>  --%>
                                        <asp:TemplateField HeaderText="Serial" ItemStyle-HorizontalAlign="Left" SortExpression="SerialNo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerial" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SerialNo"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="odsComponents" runat="server" SelectMethod="GetEquipmentsList" TypeName="NIH.CMMS.Inventory.BPL.Facility.facility_logic">
                                    <SelectParameters>
                                        <asp:ControlParameter Type="String" Name="parentFacNum" ControlID="txtFacilityNum" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>

                            </td>
                        </tr>
                    </table>
                </td>
                <td width="50%">
                    <table width="100%">
                        <tr>
                            <td>
                                <table id="inputTable" cellspacing="2" cellpadding="3">
                                    <tr class="text8">
                                        <td colspan="4" class="redheading">
                                            <asp:HiddenField ID="hidEquipmentSysID" runat="server" Value="-1" />
                                            <asp:HiddenField ID="hidFacilitySysid" runat="server" Value="-1" />
                                            Add/Update Component</td>

                                    </tr>

                                    <tr>
                                        <td width="25%">
                                            <asp:Label ID="lbEquipment" CssClass="tableLabel" runat="server" Text="Equipment ID *"></asp:Label>
                                        </td>
                                        <td width="25%">
                                            <asp:TextBox ID="txtEquipmentID" MaxLength="50" runat="server" TabIndex="8" />
                                            <asp:RequiredFieldValidator ID="rqvEquipmentID" runat="server" ControlToValidate="txtEquipmentID" Display="Dynamic" ErrorMessage="Equipment ID is required"></asp:RequiredFieldValidator>
                                        </td>
                                        <td width="25%"></td>
                                        <td width="25%"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbTypeUse" CssClass="tableLabel" runat="server" Text="Type or Use *"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTypeUse" MaxLength="50" runat="server" TabIndex="10" />
                                            <asp:RequiredFieldValidator ID="rqvTypeUse" runat="server" ControlToValidate="txtEquipmentID" Display="Dynamic" ErrorMessage="Type or Use is required"></asp:RequiredFieldValidator>
                                        </td>

                                        <td>
                                            <asp:Label ID="lbManufacturer" CssClass="tableLabel" runat="server" Text="Manufacturer"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtManufacturer" MaxLength="50" runat="server" TabIndex="11" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lbLocation" CssClass="tableLabel" runat="server" Text="Location"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtComLocation" MaxLength="50" runat="server" TabIndex="9" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbModelNum" CssClass="tableLabel" runat="server" Text="Model No."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtModelNum" MaxLength="50" runat="server" TabIndex="12" />
                                        </td>
                                    </tr>
                                    <tr>


                                        <td>
                                            <asp:Label ID="lbSerialNum" CssClass="tableLabel" runat="server" Text="Serial No."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSerialNum" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbMotorType" CssClass="tableLabel" runat="server" Text="Type"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMotorType" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbSize" CssClass="tableLabel" runat="server" Text="Size"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSize" MaxLength="50" runat="server" TabIndex="11" />
                                        </td>

                                        <td>
                                            <asp:Label ID="lbInstalledDate" CssClass="tableLabel" runat="server" Text="Date Installed"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtInstalledDate" MaxLength="50" runat="server" TabIndex="12" />

                                            <asp:CompareValidator ID="cvInstalledDate" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbCapacity" CssClass="tableLabel" runat="server" Text="Capacity"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCapacity" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>

                                        <td>
                                            <asp:Label ID="lbCapacityHT" CssClass="tableLabel" runat="server" Text="Capacity(H/T)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCapacityHT" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>


                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbFuel" CssClass="tableLabel" runat="server" Text="Fual or Refri"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFuel" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbMotorModel" CssClass="tableLabel" runat="server" Text="Model"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMotorModel" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbMotorManu" CssClass="tableLabel" runat="server" Text="Motor Mfg'r"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMotorManu" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>

                                        <td>
                                            <asp:Label ID="lbHP" CssClass="tableLabel" runat="server" Text="H.P."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtHP" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>


                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbMotorSerialNum" CssClass="tableLabel" runat="server" Text="Serial No."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMotorSerialNum" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>

                                        <td>
                                            <asp:Label ID="lbMotorInstalledDate" CssClass="tableLabel" runat="server" Text="Motor Installed Date"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMotorInstalledDate" MaxLength="50" runat="server" TabIndex="13" />
                                            <asp:CompareValidator ID="CompareValidator5" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtMotorInstalledDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>

                                        </td>


                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbFrame" CssClass="tableLabel" runat="server" Text="Frame"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFrame" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbTJC" CssClass="tableLabel" runat="server" Text="TJC Value"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTJC" MaxLength="50" runat="server" TabIndex="13" />
                                            <asp:RangeValidator ID="valTJC" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC"></asp:RangeValidator>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbRPM" CssClass="tableLabel" runat="server" Text="R.P.M."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRPM" MaxLength="50" runat="server" TabIndex="13" />

                                        </td>

                                        <td>
                                            <asp:Label ID="lbVoltage" CssClass="tableLabel" runat="server" Text="Voltage"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVoltage" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbAmperes" CssClass="tableLabel" runat="server" Text="Amperes"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAmperes" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>

                                        <td>
                                            <asp:Label ID="lbPhaseCycle" CssClass="tableLabel" runat="server" Text="Phase-Cycle"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPhaseCycle" MaxLength="50" runat="server" TabIndex="13" />

                                        </td>


                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbPMSchedule" CssClass="tableLabel" runat="server" Text="PM Schedule"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPMSchedule" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbBSLClass" CssClass="tableLabel" runat="server" Text="BSL Class."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBSLClass" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                    </tr>




                                    <tr>
                                        <td align="center" colspan="4">
                                            <asp:Button ID="btnFinish" runat="server" Text="Save Component Information" CssClass="submitGreen" TabIndex="37"
                                                OnClick="btnFinish_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="submitRed" UseSubmitBehavior="false" CausesValidation="false"
               OnClick="btnCancel_Click" OnClientClick="return confirm('OK to Cancel?');" />
                                            &nbsp;&nbsp;&nbsp;&nbsp; 
                                            <asp:Button ID="btnAddNewComponent" runat="server" Text="Add Another Component" CssClass="submitYellow"
                                                OnClick="btnAddComponent_Click" />
                                        </td>

                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Image ID="imageComponentAttachment" runat="server" alt="" Visible="true" Width="64" />
                                        </td>
                                    </tr>
                                    <tr id="trAttachment" runat="server">
                                        <td>
                                            <asp:Label CssClass="tableLabel" runat="server" Text="Attachments" /><br />
                                            <asp:GridView ID="gvExtAttachment" SkinID="NoPagingSortingGV" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                OnRowCommand="gvExtAttachment_onRowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Open" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:LinkButton CommandName="Open" CommandArgument='<%# Eval("InvAttachmentSysID").ToString() %>' ID="btnOpenAttachment" Text="<img src='/Image/btn_edit.gif' alt='Open' border='0' />" runat="server"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:LinkButton CommandName="Deleting" CommandArgument='<%# Eval("InvAttachmentSysID").ToString() %>' ID="btnDeleteAttachment" Text="<img src='/Image/btn_delete.png' alt='Delete' border='0'  />" runat="server" OnClientClick="return confirm('OK to Delete?');"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Title" DataField="Title" HeaderStyle-HorizontalAlign="left" />
                                                    <asp:BoundField HeaderText="File" DataField="FileName" />
                                                    <asp:BoundField HeaderText="Created" DataField="CreatedOn" />
                                                    <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
                                                </Columns>
                                            </asp:GridView>
                                            <br />
                                            <asp:Button ID="btnAddAttachment" runat="server" Text="Add Attachment" CausesValidation="false" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <ajaxToolkit:ModalPopupExtender ID="mpeAttachment" runat="server" TargetControlID="btnAddAttachment"
                        BehaviorID="psrAtt" PopupControlID="panelEquipmentAttachment" BackgroundCssClass="modal" DropShadow="true" OkControlID="btnClose" />

                    <asp:Panel ID="panelEquipmentAttachment" runat="server" Style="width: 750px; background: white; border: 2px black solid; display: none; text-align: left;">
                        <ctrlAtt:mngAttachment ID="ctrlAddEquipmentAttachment" runat="server" IsEquipmentOrFacility="true" ModalExtenderID="mpeAttachment" SectionHeaderText="Attachments" AutoLoad="True" />
                        <br />
                        <br />
                        <div align="center">
                            <asp:Button ID="btnClose" runat="server" Text="Close" />
                        </div>
                        <br />
                    </asp:Panel>
                </td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>



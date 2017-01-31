<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="systemElectrical.aspx.cs" Inherits="Equipment_systemElectrical" %>

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
            $('#<%=txtInventoryDate.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });
            $('#<%=txtInstalledDate.ClientID%>').datepicker({ changeMonth: true, changeYear: true, yearRange: "-31:+0", buttonText: "select" });

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
         <table style="font-size: 9pt; width: 95%; ">
        <tr>
            <td align="right"><a href='../printEleSystem.aspx?equipmentSysID=<%= hidFacilitySysid.Value %>' target="_blank">
                <img src="../Image/btn_print.gif" border="0" alt="print" /></a>&nbsp;&nbsp;</td>
        </tr>
    </table>
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
            <tr id="trFacilityAttachment" runat="server">
                <td>
                    <asp:Label CssClass="tableLabel" runat="server" Text="Attachments" />

                </td>
                <td colspan="7">
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
                    <br />
                    <asp:Button ID="btnAddFacilityAttachment" runat="server" Text="Add New System Attachment" CssClass="submitBlue" CausesValidation="false" />

                </td>
            </tr>
            <tr>
                <td class="inventoryTopRightCell" colspan="8">Comments:
                          
                              
                                <asp:TextBox ID="txtComments" runat="server" MaxLength="255" TextMode="MultiLine" Rows="3" Columns="55" TabIndex="36"></asp:TextBox>

                </td>

            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSaveFacility" runat="server" CssClass="submitGreen" OnClick="btnSaveFacility_Click" />
                    <asp:Label ID="lbUpdateFacilityMsg" runat="server" EnableViewState="false" CssClass="errortext"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnCancelFacilityChange" runat="server" Text="Cancel" CssClass="submitYellow" UseSubmitBehavior="false" CausesValidation="false"
                        OnClick="btnCancelFacility_Click" OnClientClick="return confirm('OK to Cancel?');" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="Go Back to List" CssClass="submitRed" UseSubmitBehavior="false" CausesValidation="false"
                        OnClick="btnGoBack_Click" />
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

    <asp:Panel runat="server" ID="DetailInfoPanel" Style="margin-top: 20px; font-size: 1.2em;">
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <ajaxToolkit:TabPanel runat="server" HeaderText="List Of Components" ID="TabPanel1">
                <ContentTemplate>
                    <table border="0" width="100%" cellpadding="1" cellspacing="1" style="font-size: smaller; text-align: left">
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp; 
                                <asp:Button ID="btnAddComponent" runat="server" Text="Add New Component" CssClass="submitGreen" UseSubmitBehavior="false" CausesValidation="false"
                                    OnClick="btnAddNew_Click" /><br />
                                <br />
                            </td>
                        </tr>
                        <tr>

                            <td colspan="2" align="left">
                                <asp:GridView ID="gv_Components" SkinID="gvRegPagingSorting" runat="server" DataSourceID="odsComponents" DataKeyNames="Key" OnRowDataBound="gv_Components_OnRowDataBound" OnRowCommand="gv_Components_onRowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="View/Edit" ItemStyle-Width="30">
                                            <ItemTemplate>
                                                <asp:LinkButton CommandName="Editing" CommandArgument='<%# Eval("Key").ToString()%>' ID="btnEditAgency" Text="<img src='../Image/btn_edit.gif' alt='Edit' border='0' />" runat="server" CausesValidation="false"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30">
                                            <ItemTemplate>
                                                <asp:LinkButton CommandName="Deleting" CommandArgument='<%# Eval("Key").ToString() %>' ID="btnDeleteAgency" Text="<img src='../Image/btn_delete.png' alt='Delete' border='0' />" runat="server" OnClientClick="return confirm('OK to Delete?');" CausesValidation="false"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Seq#" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50" SortExpression="EquipSequenceNum">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEquipSequenceNum" runat="server" Text='<%# Server.HtmlEncode(Eval("EquipSequenceNum").ToString()) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Equip. ID" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200" SortExpression="EquipID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEquipmentID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("EquipID"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150" SortExpression="EquipLocation">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" runat="server" Text='<%# Server.HtmlEncode((string)Eval("EquipLocation"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TypeorUse" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150" SortExpression="TypeorUse">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTypeorUse" runat="server" Text='<%# Server.HtmlEncode((string)Eval("TypeorUse"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Manufacturer" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150" SortExpression="Manufacturer">
                                            <ItemTemplate>
                                                <asp:Label ID="lblManufacturer" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Manufacturer"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Model" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150" SortExpression="ModelNo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModel" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ModelNo"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Serial" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150" SortExpression="SerialNo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerial" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SerialNo"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>                                      
                                        <asp:TemplateField HeaderText="Size" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150" SortExpression="Size">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSize" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Size"))%>' />
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

                </ContentTemplate>
            </ajaxToolkit:TabPanel>

            <ajaxToolkit:TabPanel runat="server" HeaderText="Component Information" ID="TabPanel2">
                <ContentTemplate>
                    <%-- <table style="font-size: 9pt; width: 100%">
                        <tr>
                            <td>
                                &nbsp;&nbsp; <a href='../printFacility.aspx?FacilityNumber=<%= txtFacilityNum.Text %>' target="_blank">
                                    <img src="../Image/btn_print.gif" border="0" alt="print" /></a>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                   <br />--%>
                    <table width="100%">
                        <tr>
                            <td width="65%">
                                <table id="inputTable" cellspacing="2" cellpadding="3">
                                    <tr class="text8">
                                        <td colspan="2" class="redheading">
                                            <asp:HiddenField ID="hidEquipmentSysID" runat="server" Value="-1" />
                                            <asp:HiddenField ID="hidFacilitySysid" runat="server" Value="-1" />
                                            Add/Update Component
                                        </td>
                                        <td width="25%">&nbsp;</td>
                                        <td width="25%">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="25%">
                                            <asp:Label ID="lbEquipment" CssClass="tableLabel" runat="server" Text="Equipment ID *"></asp:Label>
                                        </td>
                                        <td width="25%">
                                            <asp:TextBox ID="txtEquipmentID" MaxLength="50" runat="server" TabIndex="8" />
                                            <asp:RequiredFieldValidator ID="rqvEquipmentID" runat="server" ControlToValidate="txtEquipmentID" Display="Dynamic" ErrorMessage="Equipment ID is required"></asp:RequiredFieldValidator>
                                        </td>
                                        <td width="25%">&nbsp;</td>
                                        <td width="25%">&nbsp;</td>
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
                                            <asp:Label ID="lbInstalledDate" CssClass="tableLabel" runat="server" Text="Date Installed"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtInstalledDate" MaxLength="50" runat="server" TabIndex="12" />

                                            <asp:CompareValidator ID="cvInstalledDate" runat="server" CssClass="errortext" ErrorMessage="Invalid Date format." ControlToValidate="txtInstalledDate" Type="date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
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
                                            <asp:Label ID="lbElectricalOther" CssClass="tableLabel" runat="server" Text="Electrical Other"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtElectricalOther" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>

                                    </tr>


                                    <tr>
                                        <td>
                                            <asp:Label ID="lbVOLTSElec" CssClass="tableLabel" runat="server" Text="VOLTS"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVolts" MaxLength="50" runat="server" TabIndex="9" />
                                        </td>


                                        <td>
                                            <asp:Label ID="lbAMPElec" CssClass="tableLabel" runat="server" Text="AMP"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAMP" MaxLength="50" runat="server" TabIndex="12" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbKVAElec" CssClass="tableLabel" runat="server" Text="KVA"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtKVA" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbPhElec" CssClass="tableLabel" runat="server" Text="Ph"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPH" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbVoltsPrimary" CssClass="tableLabel" runat="server" Text="Volts Primary"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVoltsPrimary" MaxLength="50" runat="server" TabIndex="11" />
                                        </td>

                                        <td>
                                            <asp:Label ID="lbVoltsSecondary" CssClass="tableLabel" runat="server" Text="Volts Secondary"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVoltsSecondary" MaxLength="50" runat="server" TabIndex="12" />
                                        </td>


                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbWElec" CssClass="tableLabel" runat="server" Text="W"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtW" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>

                                        <td>
                                            <asp:Label ID="lbNumOfCKTS" CssClass="tableLabel" runat="server" Text="No. of CKTS."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCKTSNum" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>


                                    </tr>
                                    <tr>


                                        <td>
                                            <asp:Label ID="lbBSLClass" CssClass="tableLabel" runat="server" Text="BSL Class."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBSLClass" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCKTSUsed" CssClass="tableLabel" runat="server" Text="CKTS Used"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCKTSUsed" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbTJC" CssClass="tableLabel" runat="server" Text="TJC Value"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTJC" MaxLength="50" runat="server" TabIndex="13" />
                                            <asp:RangeValidator ID="valTJC" runat="server" Type="integer" CssClass="errortext" Display="Dynamic" MinimumValue="1" MaximumValue="5000000" ErrorMessage="Must be an integer." ControlToValidate="txtTJC"></asp:RangeValidator>

                                        </td>
                                        <td>
                                            <asp:Label ID="lbPMSchedule" CssClass="tableLabel" runat="server" Text="PM Schedule"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPMSchedule" MaxLength="50" runat="server" TabIndex="13" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <asp:Button ID="btnFinish" runat="server" Text="Save Component Information" CssClass="submitGreen" TabIndex="37"
                                                OnClick="btnFinish_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="submitRed" UseSubmitBehavior="false" CausesValidation="false"
                                                   OnClick="btnCancel_Click" OnClientClick="return confirm('OK to Cancel?');" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                                            <asp:Button ID="btnAddNewComponent" runat="server" Text="Add Another Component" CssClass="submitYellow" TabIndex="37"
                                                OnClick="btnAddComponent_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="35%">
                                <table width="100%">
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
                                            <asp:Button ID="btnAddAttachment" runat="server" Text="Add New Component Attachment" CssClass="submitBlue" CausesValidation="false" />

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
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" HeaderText="View All and Print" ID="TabPanel4" Visible="false">
                <ContentTemplate>

                    <table cellspacing="0" cellpadding="3" width="635" border="0">
                        <tr style="height: 15pt">
                            <td colspan="4" class="inventoryTopLeftTitle" width="450">Equipment Inventory Card</td>
                            <td class="inventoryTopRightCell" width="70" valign="baseline">Facility#:</td>
                            <td style="border-bottom: solid 1px #000;" width="100">
                                <span id="lbFacNum1" class="text11fix"><b><font color='green'>T00009(Active)</font></b></span>
                            </td>

                        </tr>
                        <tr style="height: 12pt">
                            <td colspan="4" class="inventoryTopLeftCell"><font color="#BA3516">System:&nbsp;&nbsp;</font>
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
                    <table width="635" border="0" cellpadding="1" cellspacing="0" class="componentTable">

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
                    <table width="635" border="0">
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


                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>


    </asp:Panel>

</asp:Content>

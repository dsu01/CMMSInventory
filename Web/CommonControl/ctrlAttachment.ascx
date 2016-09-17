<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlAttachment.ascx.cs" Inherits="CommonControl_ctrlAttachment" %>
<table>
    <tr>
        <td>
            <asp:TextBox runat="server" ID="txtHidAttID" Visible="false" Text="-1"></asp:TextBox>
            <asp:TextBox runat="server" ID="txtHidSourceID" Visible="false" Text="-1"></asp:TextBox>
            <asp:TextBox runat="server" ID="txtHidSource" Visible="false" Text="-1"></asp:TextBox>

        </td>
        <td>
            <p><b>Attachments </b></p>
            <table width="100%">
                <tr>
                    <td class="notes" colspan="2">Attach any related documents, e.g., photos and written statements. Acceptable file types are .DOC(X), .WPD, .XLS(X), .PDF, .JPG, .GIF, .VSD, .WAV, .MP3 and .PPT(X).  Enter a Title in order to save the attachment.</td>
                </tr>

                <tr>
                    <td colspan="2">
                        <br />
                        <b>New Attachment</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label runat="server" ID="lblValidationError" CssClass="errortext" Visible="false" EnableViewState="false"></asp:Label></td>
                </tr>
                <tr>
                    <td>Title of Attachment&nbsp;<span class="requiredMark">*</span></td>

                    <td>
                        <asp:TextBox ID="txtAttTitle" runat="server" MaxLength="100" SkinID="longText" />
                    </td>
                </tr>
                <tr>
                    <td>Upload File&nbsp;<span class="requiredMark">*</span></td>

                    <td class="text7">
                        <asp:FileUpload ID="attachmentFileUpload" runat="server" Width="350px" />&nbsp;(Max size 10MB)
                                    <br />
                        <asp:Label runat="server" ID="lbHidExistFile" Text="Existing File: " Visible="false" CssClass="errortext"></asp:Label><asp:Label runat="server" ID="txtHidFacFileName" Visible="false" CssClass="text7"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="errortext" align="left" style="font-size: xx-small; font-style: italic">* In order to save your Attachment, you must enter Title and upload a File.</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSaveAttachment" runat="server" Text="Save Attachment" OnClick="btnSaveAttachment_OnClick" />
                        <asp:Label ID="lbAddAttachmentError" runat="server" EnableViewState="false" CssClass="errortext"></asp:Label>
                        <br />
                    </td>
                </tr>
                <asp:Panel ID="pnlExtAttachment" runat="server">
                    <tr>
                        <td class="leftLabel" colspan="2">
                            <br />
                            Existing Attachment(s): (Click the
                            <img src='../Image/btn_delete.png' align='bottom' border='0' alt='Delete' />
                            to remove)
				         <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <asp:GridView ID="gvExtAttachment" SkinID="VerticalLineGV" runat="server" AutoGenerateColumns="false" GridLines="None"
                                OnRowCommand="gvExtAttachment_onRowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="Update" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                        <ItemTemplate>
                                            <asp:LinkButton CommandName="Editing" CommandArgument='<%# Eval("Key").ToString() %>' ID="btnEditAttachment" Text="<img src='../Image/edit.gif' alt='Edit' />" runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30" HeaderStyle-HorizontalAlign="left">
                                        <ItemTemplate>
                                            <asp:LinkButton CommandName="Deleting" CommandArgument='<%# Eval("Key").ToString() %>' ID="btnDeleteAttachment" Text="<img src='../Image/delete.gif' alt='Delete' />" runat="server" OnClientClick="return confirm('OK to Delete?');"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Title" DataField="Title" HeaderStyle-HorizontalAlign="left" />
                                    <asp:TemplateField HeaderText="Name of File" HeaderStyle-HorizontalAlign="left">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" Target="_blank" runat="server" NavigateUrl='<%# "~/Attachments/Incident/" + (string)Eval("FileLocation")%>' Text='<%# (string)Eval("OriginalFileName") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Created On" DataField="CreatedOn" />

                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </asp:Panel>

            </table>
        </td>
    </tr>
</table>

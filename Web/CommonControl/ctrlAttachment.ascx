<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlAttachment.ascx.cs" Inherits="CommonControl_ctrlAttachment" %>
<table class="attachmentTable">
    <tr>
        <td>
            <p class="redheading">Add Attachments </p>
            <table width="100%">
                <tr>
                    <td class="notes" colspan="2">Attach any related documents, e.g., photos and written statements. Acceptable file types are .DOC(X), .WPD, .XLS(X), .PDF, .JPG, .GIF, .VSD, .WAV, .MP3 and .PPT(X).  Enter a Title in order to save the attachment.</td>
                </tr>
               
                <tr>
                    <td colspan="2" class="errortext" align="left" style="font-size: x-small; font-style: italic">* In order to save your Attachment, you must enter Title and upload a File.</td>
                </tr>
                <tr>
                    <td class="text7"><b>Title &nbsp;<span class="requiredMark">*</span></b></td>
                    <td>
                        <asp:TextBox ID="txtAttachmentTitle" runat="server" MaxLength="100" SkinID="longText" />
                    </td>
                </tr>
                <tr>
                    <td class="text7"><b>Upload File&nbsp;<span class="requiredMark">*</span></b></td>
                    <td class="text7">
                        <asp:FileUpload ID="attachmentFileUpload" runat="server" Width="450px" />&nbsp;(Max size 10MB)
                                    <br />
                        <asp:Label runat="server" ID="lbHidExistFile" Text="Existing File: " Visible="false" CssClass="errortext"></asp:Label><asp:Label runat="server" ID="txtHidFacFileName" Visible="false" CssClass="text7"></asp:Label>
                    </td>
                </tr>
              <tr>
                    <td colspan="2">
                        <asp:Label runat="server" ID="lblValidationMessage" CssClass="errortext" Visible="false" EnableViewState="false"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSaveAttachment" runat="server" Text="Save Attachment" OnClick="btnSaveAttachment_OnClick" UseSubmitBehavior="false" CausesValidation="false" />
                        <%--<asp:Label ID="lbAddAttachmentError" runat="server" EnableViewState="false" CssClass="errortext"></asp:Label>--%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

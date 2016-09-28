using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using NIH.CMMS.Inventory.BOL.Common;
using NIH.CMMS.Inventory.BPL.Common;
using System.IO;
using NIH.CMMS.Inventory.Web;

public partial class CommonControl_ctrlAttachment : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }
    public bool AutoLoad { get; set; }

    public string ModalExtenderID { get; set; }

    ModalPopupExtender ModalExtender
    {
        get
        {
            if (!String.IsNullOrEmpty(ModalExtenderID))
                return (ModalPopupExtender)FindControlRecursive(Page, ModalExtenderID);
            return null;
        }
    }

    public int ParentEquipmentID
    {
        get
        {
            return !string.IsNullOrEmpty(Request.QueryString["ParentFacilitySysID"])
                ? Convert.ToInt32(Request.QueryString["ParentFacilitySysID"])
                : -1;
        }
    }

    public bool LoadData()
    {
        ShowAttachments();

        return true;
    }

    public bool SaveData()
    {
        bool saved = false;

        var fileName = Server.HtmlEncode(attachmentFileUpload.FileName);
        var extension = System.IO.Path.GetExtension(fileName);

        if (!Utils.IsAllowedExtension(extension))
        {
            lblValidationMessage.Visible = true;
            lblValidationMessage.Text = "Attachments acceptable file types are .DOC(X), .WPD, .XLS(X), .PDF, .JPG, .GIF, .PNG, .VSD and .PPT(X). Please check your file extension";
            return false;
        }

        var attachment = new Attachment()
        {
            InvEquipSysID = this.ParentEquipmentID,
            IsActive = true,
            Title = txtAttachmentTitle.Text.Trim(),
            FileName = fileName,
            FileType = extension.ToLower(),
            CreatedOn = DateTime.Now,
            CreatedBy = Page.User.Identity.Name,
            UpdatedBy = Page.User.Identity.Name,
        };

        if (attachment.InvEquipSysID >= 0)
        {
            var fs = attachmentFileUpload.PostedFile.InputStream;
            var br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            attachment.FileData = bytes;

            // .FileType

            if (attachmentFileUpload.PostedFile.ContentLength > 10485760)
            {
                lblValidationMessage.Visible = true;
                lblValidationMessage.Text = "Attachments cannot be greater than 10MB. Please upload another attachment and try again.";
                return false;
            }

            // Call the SaveAs method to save the uploaded file to the specified path. 
            //if the file fize is greater than 10MB throw an error.
            var result = AttachmentLogic.UpdateAttachment(attachment);
            //if (result.Success)
            if (attachment.InvAttachmentSysID > 0)
            {
                Utils.ShowPopUpMsg("Attachment saved", this.Page);
                lblValidationMessage.Visible = true;
                saved = true;
                lblValidationMessage.Text = "Attachment saved.";
            }
            else
            {
                //Utils.ShowPopUpMsg("Error Occurred!", this);
                lblValidationMessage.Visible = true;
                lblValidationMessage.Text = "Error Occurred.";
            }
        }
        else
        {
            //attDetail is null
            lblValidationMessage.Visible = true;
            lblValidationMessage.Text = "Error Occurred.";
        }

        return saved;
    }

    /// <summary>
    /// Handles the onRowCommand event of the gvExtAttachment control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewCommandEventArgs"/> instance containing the event data.</param>
    protected void gvExtAttachment_onRowCommand(object sender, GridViewCommandEventArgs e)
    {
        var id = Convert.ToInt32((string)e.CommandArgument);
        if (id <= 0)    // should never happen
            return;

        var attachment = AttachmentLogic.GetAttachment(id);
        if (attachment == null)
        {
            Utils.ShowPopUpMsg("Cannot load attachment", this.Page);
            return;
        }

        var deleted = false;
        if (e.CommandName == "Open")
        {
            DisplayContent(attachment);
        }
        else // if command == delete
        {
            var result = AttachmentLogic.DeleteAttachment(id);

            if (result.Success)
            {
                deleted = true;
                Utils.ShowPopUpMsg("Attachment deleted", this.Page);
            }
            else
            {
                Utils.ShowPopUpMsg("Attachment delete error", this.Page);
            }
        }

        if (deleted)
            LoadData();

        if (ModalExtender != null) ModalExtender.Show();
    }

    protected void btnSaveAttachment_OnClick(object sender, EventArgs e)
    {
        var fileName = Server.HtmlEncode(attachmentFileUpload.FileName);
        if (string.IsNullOrEmpty(fileName) || string.IsNullOrEmpty(txtAttachmentTitle.Text))
        {
            lbAddAttachmentError.Visible = true;
            lbAddAttachmentError.Text = "Please select an Attachment ";
            return;
        }

        if (SaveData())
        {
            LoadData();

            ClearFields();
        }

        if (ModalExtender != null) ModalExtender.Show();
    }

    /// <summary>
    /// Shows the ext attachment list from querystring incident id.
    /// </summary>
    private void ShowAttachments()
    {
        var list = AttachmentLogic.GetEquipmentAttachments(this.ParentEquipmentID);

        if (list != null)
        {
            pnlExtAttachment.Visible = true;
            gvExtAttachment.DataSource = list;
            gvExtAttachment.DataBind();
        }
        else
        { pnlExtAttachment.Visible = false; }
    }

    private void DisplayContent(Attachment attachment)
    {
        var data = attachment.FileData;
        if (data == null || data.Length == 0)
            return;

        Response.Clear();
        Response.ContentType = string.Format("application/{0}", attachment.FileType);
        Response.AddHeader("content-disposition", "attachment;filename=" + attachment.FileName);
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.BinaryWrite(data);
        Response.End();
    }

    private void ClearFields()
    {
        txtAttachmentTitle.Text = null;
    }

    private Control FindControlRecursive(Control Root, string Id)
    {
        if (Root != null || !String.IsNullOrEmpty((Root.ID)))
        {
            if (Root.ID == Id) return Root;
            foreach (Control Ctl in Root.Controls)
            {
                Control FoundCtl = FindControlRecursive(Ctl, Id);
                if (FoundCtl != null) return FoundCtl;
            }
        }
        return null;
    }
}

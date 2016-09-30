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
    }

    public delegate void AttachmentSavedHandler(bool result);

    public event AttachmentSavedHandler AttachmentSaved;

    public int ParentEquipmentID
    {
        get
        {
            return !string.IsNullOrEmpty(Request.QueryString["ParentFacilitySysID"])
                ? Convert.ToInt32(Request.QueryString["ParentFacilitySysID"])
                : -1;
        }
    }

    public bool SaveData()
    {
        bool saved = false;

        var fileName = Server.HtmlEncode(attachmentFileUpload.FileName);
        if (string.IsNullOrEmpty(fileName) || string.IsNullOrEmpty(txtAttachmentTitle.Text))
        {
            lblValidationMessage.Visible = true;
            lblValidationMessage.Text = "Please select a file to upload";
            return false;
        }

        var extension = System.IO.Path.GetExtension(fileName);
        if (!Utils.IsAllowedExtension(extension))
        {
            lblValidationMessage.Visible = true;
            lblValidationMessage.Text = "Attachments acceptable file types are .DOC(X), .WPD, .XLS(X), .PDF, .JPG, .GIF, .PNG, .VSD and .PPT(X). Please check your file extension";
            return false;
        }

        var attachment = new Attachment()
        {
            InvParentSysID = this.ParentEquipmentID,
            IsActive = true,
            Title = txtAttachmentTitle.Text.Trim(),
            FileName = fileName,
            FileType = extension.ToLower(),
            CreatedOn = DateTime.Now,
            CreatedBy = Page.User.Identity.Name,
            UpdatedBy = Page.User.Identity.Name,
        };

        if (attachment.InvParentSysID >= 0)
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
            var result = AttachmentLogic.UpdateAttachment(attachment, true);
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

    protected void btnSaveAttachment_OnClick(object sender, EventArgs e)
    {
        var saved = SaveData();
        if (saved)
        {
            ClearFields();
        }

        if (AttachmentSaved != null)
            AttachmentSaved(saved);
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

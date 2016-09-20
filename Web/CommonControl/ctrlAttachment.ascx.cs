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

    /// <summary>
    /// Show existing attachment in the list.
    /// </summary>
    /// <param name="incidentId">The incident id.</param>
    /// <returns></returns>
    public bool LoadData()
    {
        ShowAttachments();

        return true;
    }

    public bool SaveData()
    {
        bool saved = false;

        var fileName = Server.HtmlEncode(attachmentFileUpload.FileName);
        var extension = System.IO.Path.GetExtension(fileName).ToLower();

        var attachment = new Attachment()
        {
            InvEquipSysID = this.ParentEquipmentID,
            IsActive = true,
            Title = txtAttachmentTitle.Text.Trim(),
            FileName = fileName,
            FileType = extension,
            CreatedOn = DateTime.Now,
            CreatedBy = Page.User.Identity.Name,
            UpdatedBy = Page.User.Identity.Name,
        };
        if (attachment.InvEquipSysID >= 0)
        {
            //if (txtHidAttID.Text != "-1" && attachmentFileUpload.FileName == string.Empty)
            //{
            //    //if only update the Title, no need to save file          

            //}
            //else
            {
                var fs = attachmentFileUpload.PostedFile.InputStream;
                var br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                attachment.FileData = bytes;

                //if (!Utils.IsAllowedExtension(extension))
                //{
                //    lblValidationError.Visible = true;
                //    lblValidationError.Text = "Attachments acceptable file types are .DOC(X), .WPD, .XLS(X), .PDF, .JPG, .GIF, .VSD and .PPT(X). Please check your file extension.";
                //    return false;
                //}

                // .FileType

                if (attachmentFileUpload.PostedFile.ContentLength > 10485760)
                {
                    lblValidationError.Visible = true;
                    lblValidationError.Text =
                        "Attachments cannot be greater than 10MB. Please upload another attachment and try again.";
                    return false;
                }
                else
                {
                    //try
                    //{
                    //    fuEleFileUpload.SaveAs(savePath);
                    //}
                    //catch // if upload file failed.
                    //{
                    //    //Utils.ShowPopUpMsg("Error Occurred!", this);
                    //    lblValidationError.Visible = true;
                    //    lblValidationError.Text = "Error Occurred!";
                    //    //if file deleted and it is an update, need to delete that database record also
                    //    if (txtHidAttID.Text != "-1")
                    //    { IncAttachmentLogic.DeleteAttachment(attDetail); }
                    //    return false;
                }

                // Call the SaveAs method to save the uploaded file to the specified path. 
                //if the file fize is greater than 10MB throw an error.
                var result = AttachmentLogic.UpdateAttachment(attachment);
                //if (result.Success)
                if (attachment.InvAttachmentSysID > 0)
                {
                    Utils.ShowPopUpMsg("Attachment saved!", this.Page);
                    lblValidationError.Visible = true;
                    saved = true;
                    lblValidationError.Text = "Attachment saved.";
                }
                else
                {
                    //Utils.ShowPopUpMsg("Error Occurred!", this);
                    lblValidationError.Visible = true;
                    lblValidationError.Text = "Error Occurred.";
                }
            }
        }
        else
        {
            //attDetail is null
            lblValidationError.Visible = true;
            lblValidationError.Text = "Error Occurred.";
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
            Utils.ShowPopUpMsg("Cannot load attachment.", this.Page);
            return;
        }

        if (e.CommandName == "Open")
        {
            DisplayContent(attachment);
        }
        else // if command == delete
        {
            var result = AttachmentLogic.DeleteAttachment(id);

            //if (result == ApplicationConstants.NO_ERROR_USP_EXECUTION)
            //{
            //    //Physically delete the file
            //    //File.Delete(PATH + incAtt.FileLocation);
            //    //repopulate the existing initiator list
            //    ShowAttachments();
            //    //clean up the values if there is any
            //    //drplstEleAttaCatagory.SelectedIndex = 0;
            //    ClearFields();

            //}
            //else
            //{
            //    //handle error
            //    Utils.ShowPopUpMsg("Cannot delete attachment.", this.Page);
            //}
        }

        if (ModalExtender != null) ModalExtender.Show();
    }

    /// <summary>
    /// Handles the Click event of the btnAddAnother control, add another attachment
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
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

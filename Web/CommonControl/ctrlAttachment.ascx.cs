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

    #region " Attachment/Photos Section -- event handling "
    public bool SaveData()
    {
        bool saved = false;

        var fileName = Server.HtmlEncode(attachmentFileUpload.FileName);
        var extension = System.IO.Path.GetExtension(fileName).ToLower();
        var attachmentTitle = txtAttachmentTitle.Text.Trim();

        //both file name and Title are reqried
        //if (txtHidAttID.Text != "-1")
        //{
        //    //if it is an update, need to delete old one and insert new one
        //    //attDetail = facility_logic.GetAttachment(Convert.ToInt32(txtHidFacAttID.Text));
        //}
        //else { attDetail = new Attachment(); }

        var attachment = new Attachment()
        {
            InvEquipSysID = this.ParentEquipmentID,
            IsActive = true,
            Title = txtAttachmentTitle.Text,
            CreatedOn = DateTime.Now,
            CreatedBy = Page.User.Identity.Name,
            UpdatedBy = Page.User.Identity.Name,
        };
        if (attachment.InvEquipSysID >= 0)
        {
            //common things to update
            //attDetail.InvFacID = txtFacilityID.Text.Trim();

            //if (txtHidAttID.Text != "-1" && attachmentFileUpload.FileName == string.Empty)
            //{
            //    //if only update the Title, no need to save file          

            //}
            //else
            {
                //if it is new attachment or Update to a new attachment
                var fs = attachmentFileUpload.PostedFile.InputStream;
                var br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                attachment.FileData = bytes;
                attachment.FileName = fileName;

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
                    //if (txtHidFacAttID.Text != "-1")
                    //{
                    //    //if it is an update to Title and File, need to delete old one and insert new one
                    //    //System.IO.File.Delete(savePath + attDetail.FileLocation);
                    //}

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

                    //}
                    //}
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
        //IncidentAttachments incAtt = IncAttachmentLogic.GetAttachment(Convert.ToInt32(e.CommandArgument.ToString()));

        //if (incAtt != null)
        //{
        //    if (e.CommandName == "Opening")
        //    {
        //        #region "show existing attachment information"
        //        txtHidAttID.Text = incAtt.Key.ToString();
        //        rlElePoliceRpt.SelectedValue = incAtt.ReportFiled.ToString();
        //        // drplstEleAttaCatagory.SelectedValue = incAtt.FileType;
        //        //fuEleFileUpload.FileName is readonly;
        //        txtEleAttTitle.Text = incAtt.Title;
        //        txtHidAttFileName.Visible = true;
        //        lbHidExistFile.Visible = true;
        //        txtHidAttFileName.Text = incAtt.OriginalFileName;
        //        #endregion
        //    }
        //    else // if command == delete
        //    {
        //        #region "Delete attachment using attachment object"
        //        String result = IncAttachmentLogic.DeleteAttachment(incAtt);

        //        if (result == ApplicationConstants.NO_ERROR_USP_EXECUTION)
        //        {
        //            //Physically delete the file
        //            //File.Delete(PATH + incAtt.FileLocation);
        //            //repopulate the existing initiator list
        //            ShowAttachments();
        //            //clean up the values if there is any
        //            //drplstEleAttaCatagory.SelectedIndex = 0;
        //            ClearFields();

        //        }
        //        else
        //        {
        //            //handle error
        //            WebUtils.ShowPopUpMsg("Cannot delete attachment.", this.Page);
        //        }
        //        #endregion
        //    }
        //}
        //else
        //{
        //    //handle error
        //    WebUtils.ShowPopUpMsg("Error. No attachment found.", this.Page);
        //}

        //if (ModalExtender != null) ModalExtender.Show();
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

    //sirs-1163 allow to delete
    //protected void gvExtAttachment_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        if (ViewState["ApprovedDate"] != null)
    //        {
    //            DateTime dtApproved = (DateTime)ViewState["ApprovedDate"];
    //            DateTime dtCreated = Convert.ToDateTime(e.Row.Cells[4].Text);

    //            if (dtApproved >= dtCreated)
    //            {
    //                ((LinkButton)e.Row.FindControl("btnOpenAttachment")).Visible = false;
    //                //((LinkButton)e.Row.FindControl("btnDeleteAttachment")).Visible = false;
    //            }
    //        }
    //    }
    //}
    #endregion

    #region "Private methods"
    #region " Show Existing Attachment/Photos Section "

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

    #endregion

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

    #endregion
}

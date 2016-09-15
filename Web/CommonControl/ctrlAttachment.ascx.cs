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

public partial class CommonControl_ctrlAttachment : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

    public int ReportID
    {
        get
        {
            if (ViewState["RptID"] != null) return (int)ViewState["RptID"];
            if (!String.IsNullOrEmpty(Request.QueryString["RptID"]))
                return int.Parse(Request.QueryString["RptID"]);
            return -1;
        }
        set
        {
            ViewState["RptID"] = value;
            if (AutoLoad) LoadData(ReportSourceID, value);
        }
    }

    public int ReportSourceID
    {
        get
        {
            if (ViewState["ReportSourceID"] != null) return (int)ViewState["ReportSourceID"];
            return -1;
        }
        set
        {
            ViewState["ReportSourceID"] = value;
        }
    }
    /// <summary>
    /// Show existing attachment in the list.
    /// </summary>
    /// <param name="incidentId">The incident id.</param>
    /// <returns></returns>
    public bool LoadData(int source, int sourceId)
    {
        if (source <= 0)
            source = ReportSourceID;
        if (sourceId <= 0)
            sourceId = ReportID;
        txtHidSource.Text = source.ToString();
        txtHidSourceID.Text = sourceId.ToString();
        ClearFields();
      
        if (source == 1)
        {
            //Get Search Report Detail using the ID     
            
        }
        else if (source == 2)
        {
           
        }
        else 
        {
         
        }        

        return true;
    }

     
    #region " Attachment/Photos Section -- event handling "
    public bool SaveData(int incidentId)
    {
        bool savres = false;

        // Get the name of the file to upload.      
        String fileName = Server.HtmlEncode(fuFileUpload.FileName);

        // Get the extension of the uploaded file.
        string extension = System.IO.Path.GetExtension(fileName).ToLower();

        String fileTitle = txtAttTitle.Text.Trim();
       
        //since filename is readonly, so retrieve it from hidden value
        //or use fu1.Attributes["FileName"] = ful.FullName;

        if (txtHidAttID.Text != "-1" && fileName == "")
        {
            //fileName = txtHidFileName.Text;
        }

        //both file name and Title are reqried
        if (fileName != "" & fileTitle != "")
        {
            #region "Create Attachement Oject and Save."

            // Specify the path on the server to save the uploaded file to.
            Attachment attDetail = new Attachment();
            if (txtHidAttID.Text != "-1")
            {
                //if it is an update, need to delete old one and insert new one
                //attDetail = facility_logic.GetAttachmentDetails(Convert.ToInt32(txtHidFacAttID.Text));
            }
            else { attDetail = new Attachment(); }
            if (attDetail != null)
            {
                //common things to update
                //attDetail.CreatedBy = loginUsr.LaborName;
                //attDetail.InvFacID = txtFacilityID.Text.Trim();
                attDetail.Title = fileTitle;
                attDetail.UpdatedBy = Page.User.Identity.Name;
               
                if (txtHidAttID.Text != "-1" && fuFileUpload.FileName == string.Empty)
                {
                    //if only update the Title, no need to save file          

                }
                else
                {
                    //if it is new attachment or Update to a new attachment
                    Stream fs = fuFileUpload.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    attDetail.FileData = bytes;
                    attDetail.FileName = fileName;

                    #region "Save File"
                    //if (!Utils.IsAllowedExtension(extension))
                    //{
                    //    lblValidationError.Visible = true;
                    //    lblValidationError.Text = "Attachments acceptable file types are .DOC(X), .WPD, .XLS(X), .PDF, .JPG, .GIF, .VSD and .PPT(X). Please check your file extension.";
                    //    return false;
                    //}
                    //else if (fuFacFileUpload.PostedFile.ContentLength > 10485760)
                    //{
                    //    lblValidationError.Visible = true;
                    //    lblValidationError.Text = "Attachments cannot be greater than 10MB. Please upload another attachment and try again.";
                    //    return false;
                    //}
                    //else
                    //{
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
                        //    { IncAttachmentLogic.DeleteAttachmentDetails(attDetail); }
                        //    return false;

                        //}
                    //}

                    #endregion
                }

                // Call the SaveAs method to save the uploaded file to the specified path. 
                //if the file fize is greater than 10MB throw an error.
                ValidationResult res = AttachmentLogic.UpdateAttachmentDetails(attDetail);
                if (res.Success)
                {//show successs msg
                    // Utils.ShowPopUpMsg("Attachment saved!", this);
                    lblFacValidationError.Visible = true;
                    savres = true;
                    lblFacValidationError.Text = "Attachment saved.";
                }
                else
                {
                    //Utils.ShowPopUpMsg("Error Occurred!", this);
                    lblFacValidationError.Visible = true;
                    lblFacValidationError.Text = "Error Occurred.";
                }
            }
            else
            {
                //attDetail is null
                lblFacValidationError.Visible = true;
                lblFacValidationError.Text = "Error Occurred.";
            }
            #endregion
        }
        else if (fileName != "" && fileTitle == "")
        {
            lblFacValidationError.Visible = true;
            lblFacValidationError.Text = "Please enter attachment title.";
        }
        else if (fileName == "" && fileTitle != "")
        {     //if no file name or title
            lblFacValidationError.Visible = true;
            lblFacValidationError.Text = "Please upload a file.";
        }
      
        return savres;
    }
    /// <summary>
    /// Handles the onRowCommand event of the gvExtAttachment control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewCommandEventArgs"/> instance containing the event data.</param>
    protected void gvExtAttachment_onRowCommand(object sender, GridViewCommandEventArgs e)
    {
        //IncidentAttachments incAtt = IncAttachmentLogic.GetAttachmentDetails(Convert.ToInt32(e.CommandArgument.ToString()));

        //if (incAtt != null)
        //{
        //    if (e.CommandName == "Editing")
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
        //        String result = IncAttachmentLogic.DeleteAttachmentDetails(incAtt);

        //        if (result == ApplicationConstants.NO_ERROR_USP_EXECUTION)
        //        {
        //            //Physically delete the file
        //            //File.Delete(PATH + incAtt.FileLocation);
        //            //repopulate the existing initiator list
        //            ShowExtAttachment();
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
    public void btnAddAnother_Click(object sender, EventArgs e)
    {
        //// Get the name of the file to upload.
        //String fileName = fuEleFileUpload.FileName;
        //String fileTitle = txtEleAttTitle.Text.Trim();

        ////since filename is readonly, so retrieve it from hidden value
        ////or use fu1.Attributes["FileName"] = ful.FullName;
        //if (txtHidAttID.Text != "-1" && fileName == "")
        //{ fileName = txtHidAttFileName.Text; }

        //if (fileName != "" & fileTitle != "")
        //{
        //    SaveData(this.INCID);
        //    ShowExtAttachment();
        //    ClearFields();
        //}
        //else
        //{
        //    lbAddAttachmentError.Visible = true;
        //    lbAddAttachmentError.Text = "Please select an Attachment before attempting to add another.";
        //}

        //if (ModalExtender != null) ModalExtender.Show();
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
    //                ((LinkButton)e.Row.FindControl("btnEditAttachment")).Visible = false;
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
    private void ShowExtAttachment(int source, int sourceID)
    {
        //AttachmentCollection attList = AttachmentLogic.GetAllRptAttachments(source, sourceID);

        //if (attList != null)
        //{
        //    pnlExtAttachment.Visible = true;
        //    gvExtAttachment.DataSource = attList;
        //    gvExtAttachment.DataBind();
        //}
        //else
        //{ pnlExtAttachment.Visible = false; }
    }


    #endregion

    private void ClearFields()
    {
        //txtHidAttID.Text = "-1";
        //txtEleAttTitle.Text = "";

        //txtHidAttFileName.Text = "";
        //txtHidAttFileName.Visible = false;
        //lbHidExistFile.Visible = false;
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

    protected void btnSaveAttachment_OnClick(object sender, EventArgs e)
    {
        

    }

}
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIH.CMMS.Inventory.BOL.Common;

namespace NIH.CMMS.Inventory.Web.Extensions
{
    public static class WebExtensions
    {

        public static void DisplayAttachmentContent(this Page page, Attachment attachment)
        {
            var data = attachment.FileData;
            if (data == null || data.Length == 0)
                return;

            page.Response.Clear();
            page.Response.ContentType = string.Format("application/{0}", attachment.FileType);
            page.Response.AddHeader("content-disposition", "attachment;filename=" + attachment.FileName);
            page.Response.Charset = "";
            page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            page.Response.BinaryWrite(data);
            page.Response.End();
        }

        public static void DisplayAttachmentImage(this Page page, List<Attachment> attachments, bool isEquipmentOrFacility, Image image)
        {
            try
            {
                if (attachments == null)
                {
                    image.Visible = false;
                    return;
                }

                var firstImage = attachments.FirstOrDefault(x => IsImage(x));
                if (firstImage == null || firstImage.FileData == null || firstImage.FileData.Length == 0)
                {
                    image.Visible = false;
                    return;
                }

                image.ImageUrl =  string.Format("~/AttachmentImageHandler.ashx?EquipOrFac={0}&Id={1}&Size={2}",
                            isEquipmentOrFacility? "1" : "0", firstImage.InvAttachmentSysID, "64") ;
                image.Visible = true;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        private static Func<Attachment, bool> IsImage
        {
            get
            {
                return (Attachment x) =>
                        x.FileType == ".GIF" || x.FileType == ".JPG" || x.FileType == ".TIF" || x.FileType == ".PNG"
                        || x.FileType == ".gif" || x.FileType == ".jpg" || x.FileType == ".tif" || x.FileType == ".png";
            }
        }
    }
}

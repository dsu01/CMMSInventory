using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
    }
}

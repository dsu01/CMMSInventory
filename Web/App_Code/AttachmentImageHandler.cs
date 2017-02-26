using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using NIH.CMMS.Inventory.BPL.Common;

namespace NIH.CMMS.Inventory.Web
{
    public class AttachmentImageHandler : IHttpHandler
    {
        private const string TYPE_PARAM = "EquipOrFac";
        private const string ID_PARAM = "Id";
        private const string SIZE_PARAM = "Size";

        public bool IsReusable
        {
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                if (string.IsNullOrEmpty(context.Request.QueryString[TYPE_PARAM])
                    || string.IsNullOrEmpty(context.Request.QueryString[ID_PARAM])
                    || string.IsNullOrEmpty(context.Request.QueryString[SIZE_PARAM]))
                    return;

                var attachmentType = context.Request.QueryString[TYPE_PARAM] == "1" ? true : false;
                var attachmentId = Convert.ToInt32(context.Request.QueryString[ID_PARAM]);
                var size = Convert.ToInt32(context.Request.QueryString[SIZE_PARAM]);

                var attachment = AttachmentLogic.GetAttachment(attachmentId, attachmentType);
                if (attachment == null || attachment.FileData == null || attachment.FileData.Length == 0)
                    return;

                var response = context.Response;
                response.Clear();
                response.ContentType = "image/png";

                if (size == 0) // default
                {
                    using (var sourceStream = new MemoryStream(attachment.FileData))
                    {
                        var outputImage = Image.FromStream(sourceStream);
                        var outputStream = new MemoryStream();
                        outputImage.Save(outputStream, System.Drawing.Imaging.ImageFormat.Png);
                        outputStream.WriteTo(response.OutputStream);
                        outputImage.Dispose();
                        outputStream.Close();
                        sourceStream.Close();
                    }
                }
                else
                {
                    using (var sourceStream = new MemoryStream(attachment.FileData))
                    using (var sourceImage = Image.FromStream(sourceStream))
                    using (var outputImage = this.CreateThumbnail(sourceImage, size))
                    {
                        var outputStream = new MemoryStream();
                        outputImage.Save(outputStream, System.Drawing.Imaging.ImageFormat.Png);
                        outputStream.WriteTo(response.OutputStream);
                        outputImage.Dispose();
                        outputStream.Close();
                        sourceImage.Dispose();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private System.Drawing.Image CreateThumbnail(System.Drawing.Image image, int size)
        {
            var width = image.Width;
            var height = image.Height;

            if (width > size)
            {
                height = (height * size) / width;
                width = size;
            }
            if (height > size)
            {
                width = (width * size) / height;
                height = size;
            }

            return image.GetThumbnailImage(width, height, delegate () { return false; }, IntPtr.Zero);
        }
    }
}

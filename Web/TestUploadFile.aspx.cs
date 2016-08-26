using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

public partial class TestUploadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BindGrid();
        }
    }

    protected void Upload(object sender, EventArgs e)
    {
        
        //if (FileUpload1.HasFiles)
        //{
        //    foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
        //    {
        //        string filename = Path.GetFileName(postedFile.FileName);
        //        string contentType = postedFile.ContentType;
        //        using (Stream fs = postedFile.InputStream)
        //        {
        //            using (BinaryReader br = new BinaryReader(fs))
        //            {
        //                byte[] bytes = br.ReadBytes((Int32) fs.Length);
        //                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //                using (SqlConnection con = new SqlConnection(constr))
        //                {
        //                    string query = "insert into tblFiles values (@Name, @ContentType, @Data)";
        //                    using (SqlCommand cmd = new SqlCommand(query))
        //                    {
        //                        cmd.Connection = con;
        //                        cmd.Parameters.AddWithValue("@Name", filename);
        //                        cmd.Parameters.AddWithValue("@ContentType", contentType);
        //                        cmd.Parameters.AddWithValue("@Data", bytes);
        //                        con.Open();
        //                        cmd.ExecuteNonQuery();
        //                        con.Close();
        //                    }
        //                }
        //            }
        //        }
        //    }
        //}
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT Id, Name FROM tblFiles";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }

    public void ResizeImage(string OriginalFile, string NewFile, int NewWidth, int MaxHeight, bool OnlyResizeIfWider)
    {
        System.Drawing.Image FullsizeImage = System.Drawing.Image.FromFile(OriginalFile);

        // Prevent using images internal thumbnail
        FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
        FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);

        if (OnlyResizeIfWider)
        {
            if (FullsizeImage.Width <= NewWidth)
            {
                NewWidth = FullsizeImage.Width;
            }
        }

        int NewHeight = FullsizeImage.Height * NewWidth / FullsizeImage.Width;
        if (NewHeight > MaxHeight)
        {
            // Resize with height instead
            NewWidth = FullsizeImage.Width * MaxHeight / FullsizeImage.Height;
            NewHeight = MaxHeight;
        }

        System.Drawing.Image NewImage = FullsizeImage.GetThumbnailImage(NewWidth, NewHeight, null, IntPtr.Zero);

        // Clear handle to original file so that we can overwrite it if necessary
        FullsizeImage.Dispose();

        // Save resized picture
        NewImage.Save(NewFile);
    }
}
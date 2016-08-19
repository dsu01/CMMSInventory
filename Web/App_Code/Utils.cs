using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using iTextSharp.text;
using System.Collections.Generic;
using System.IO;
using iTextSharp.text.pdf;
using NIH.CMMS.Inventory.BOL.People;

namespace NIH.CMMS.Inventory.Web
{
    /// <summary>
    /// Summary description for Utils
    /// </summary>
    public static class Utils
    {
        public static List<string> cells = new List<string>();

        #region "Report functions"

        #region public static void ExportToExcel(string fileName, GridView gv)
        public static void ExportToExcel(string fileName, GridView gv)
        {
            gv.GridLines = GridLines.Both;

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", fileName + ".xls"));
            HttpContext.Current.Response.ContentType = "application/ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    //  Create a table to contain the grid
                    System.Web.UI.WebControls.Table table = new System.Web.UI.WebControls.Table();

                    //  include the gridline settings
                    table.GridLines = gv.GridLines;

                    //  add the header row to the table
                    if (gv.HeaderRow != null)
                    {
                        PrepareControlForExport(gv.HeaderRow);
                        table.Rows.Add(gv.HeaderRow);
                    }

                    //  add each of the data rows to the table
                    foreach (GridViewRow row in gv.Rows)
                    {
                        PrepareControlForExport(row);
                        table.Rows.Add(row);
                    }

                    //  add the footer row to the table
                    if (gv.FooterRow != null)
                    {
                        PrepareControlForExport(gv.FooterRow);
                        table.Rows.Add(gv.FooterRow);
                    }

                    //  render the table into the htmlwriter
                    table.RenderControl(htw);

                    //  render the htmlwriter into the response
                    HttpContext.Current.Response.Write(sw.ToString());
                    HttpContext.Current.Response.End();
                }
            }
        }
        #endregion

        #region private static void PrepareControlForExport(Control control)
        private static void PrepareControlForExport(Control control)
        {
            for (int i = 0; i < control.Controls.Count; i++)
            {
                Control current = control.Controls[i];
                if (current is LinkButton)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as LinkButton).Text));
                }
                else if (current is ImageButton)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as ImageButton).AlternateText));
                }
                else if (current is HyperLink)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as HyperLink).Text));
                }
                else if (current is DropDownList)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as DropDownList).SelectedItem.Text));
                }
                else if (current is CheckBox)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as CheckBox).Checked ? "True" : "False"));
                }
                else if (current is Label)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as Label).Text));
                }

                if (current.HasControls())
                {
                    PrepareControlForExport(current);
                }
            }
        }
        #endregion

        #region public static void ExportToPDF(string fileName, GridView gv)
        public static void ExportToPDFlv(string fileName, ListView lv)
        {          

            //Create a table

            iTextSharp.text.Table table = new iTextSharp.text.Table(2);

            table.Cellpadding = 5;

            //Set the column widths 

            int[] widths = new int[2];

            iTextSharp.text.Cell cell = new iTextSharp.text.Cell("Facility#");

            cell.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#008000"));

            table.AddCell(cell);
            iTextSharp.text.Cell cell2 = new iTextSharp.text.Cell("Facility2");

            cell2.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#008000"));

            table.AddCell(cell2);

            table.SetWidths(widths);



            //Transfer rows from GridView to table

            for (int i = 0; i < lv.Items.Count; i++)
            {

                if (lv.Items[i].ItemType == ListViewItemType.DataItem)
                {

                    for (int j = 0; j < 3; j++)
                    {

                        string cellText = lv.Items[i].Controls[j].ToString();

                        iTextSharp.text.Cell cell3 = new iTextSharp.text.Cell(cellText);



                        //Set Color of Alternating row

                        if (i % 2 != 0)
                        {

                            cell3.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#C2D69B"));

                        }

                        table.AddCell(cell3);

                    }

                }

            }



            //Create the PDF Document

            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

            PdfWriter.GetInstance(pdfDoc, HttpContext.Current.Response.OutputStream);

            pdfDoc.Open();

            pdfDoc.Add(table);

            pdfDoc.Close();

            HttpContext.Current.Response.ContentType = "application/pdf";

            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;" +

                                           "filename=GridViewExport.pdf");

            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

            HttpContext.Current.Response.Write(pdfDoc);

            HttpContext.Current.Response.End();

        }
        

        public static void ExportToPDF(string fileName, GridView gv, string reportTitle)
        {
            // initialize cells;
            cells.Clear();
            Document doc = new Document(PageSize.LEGAL.Rotate(), 0, 0, 15, 15);
            StringBuilder strData = new StringBuilder(string.Empty);
            try
            {
                StringWriter sw = new StringWriter();
                sw.WriteLine(Environment.NewLine);
                sw.WriteLine(Environment.NewLine);
                sw.WriteLine(Environment.NewLine);
                sw.WriteLine(Environment.NewLine);
                HtmlTextWriter htw = new HtmlTextWriter(sw);

                iTextSharp.text.Table table = new iTextSharp.text.Table(gv.Columns.Count);

                table.BorderWidth = 1;
                table.BorderColor = new Color(0, 0, 255);
                table.Padding = 4;
                table.Width = 100;

                List<string> columnHeaders = new List<string>();

                for (int i = 0; i < gv.Columns.Count; i++)
                {
                    columnHeaders.Add(gv.Columns[i].HeaderText);
                }

                // create the *table* header row
                for (int i = 0; i < columnHeaders.Count; ++i)
                {
                    Cell cell = new Cell(columnHeaders[i]);
                    cell.Header = true;
                    cell.BackgroundColor = new Color(204, 204, 204);
                    table.AddCell(cell);
                }
                List<string> rowList = new List<string>();
                List<string> rowListFiltered = new List<string>();
                foreach (GridViewRow row in gv.Rows)
                {
                    rowList.Clear();
                    rowList = getRowPdfData(row);


                    foreach (string item in rowList)
                    {
                        table.AddCell(item);
                    }
                }

                List<string> footer = new List<string>();
                //  add the footer row to the table
                if (gv.FooterRow != null && gv.ShowFooter)
                {
                    footer = getRowPdfData(gv.FooterRow);
                    foreach (string item in footer)
                    {
                        table.AddCell(item);
                    }
                }

                PdfWriter.GetInstance(doc, HttpContext.Current.Response.OutputStream);

                // create document's header; 
                // set header [1] text [2] font style
                //HeaderFooter header = new HeaderFooter(
                //  new Phrase("Report Creation Date " +
                //    DateTime.UtcNow.ToString("MM-dd-yyyy "),
                //    new Font(Font.COURIER, 14)
                //  ),
                //  false
                //);
                //// top & bottom borders on by default 
                //header.Border = Rectangle.NO_BORDER;
                //// center header
                //header.Alignment = 1;
                //// add header *before* opening document
                //doc.Header = header;

                doc.Open();

                // report "title"
                Paragraph p = new Paragraph(reportTitle);
                p.Alignment = 1;
                doc.Add(p);

                // add tabular data;    

                doc.Add(table);

                doc.Close();


            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (doc != null) doc.Close();
            }

            try
            {

                HttpContext.Current.Response.AddHeader("Content-Disposition", String.Format("attachment; filename={0}", fileName + ".pdf"));
                HttpContext.Current.Response.ContentType = "application/pdf";
                HttpContext.Current.Response.BufferOutput = false;
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region public static List<string> getRowPdfData(Control control)
        public static List<string> getRowPdfData(Control control)
        {

            for (int i = 0; i < control.Controls.Count; i++)
            {
                Control current = control.Controls[i];
                if (current is LinkButton)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as LinkButton).Text));
                    cells.Add(((current as LinkButton).Text));
                }
                else if (current is HyperLink)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as HyperLink).Text));
                    cells.Add(((current as HyperLink).Text));

                }
                else if (current is DropDownList)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as DropDownList).SelectedItem.Text));
                    cells.Add(((current as DropDownList).SelectedItem.Text));
                }
                else if (current is CheckBox)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as CheckBox).Checked ? "True" : "False"));
                    cells.Add(((current as CheckBox).Checked ? "True" : "False"));
                }
                else if (current is Label)
                {
                    control.Controls.Remove(current);
                    if ((current as Label).Text.Contains("<b>"))
                    {
                        (current as Label).Text = (current as Label).Text.Replace("<b>", "");
                    }
                    if ((current as Label).Text.Contains("</b>"))
                    {
                        (current as Label).Text = (current as Label).Text.Replace("</b>", "");
                    }
                    if ((current as Label).Text.Contains("<br/>"))
                    {
                        (current as Label).Text = (current as Label).Text.Replace("<br/>", "\n");
                    }
                    control.Controls.AddAt(i, new LiteralControl((current as Label).Text));
                    cells.Add(((current as Label).Text));
                }


                if (current.HasControls())
                {
                    getRowPdfData(current);
                }
            }

            return cells;
        }
        #endregion

        #endregion
        #region "Show popup"
        /// <summary>
        /// Shows the pop up MSG (alert box) on current screen.
        /// </summary>
        /// <param name="msg">The MSG.</param>
        /// <param name="curpage">The curpage.</param>
        public static void ShowPopUpMsg(string msg, Page curpage)
        {
            Type t = curpage.GetType();
            string strMsg = formatPopUpString(msg);
            // Build the JavaScript String
            StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script language='javascript'>");
            sb.Append("alert('" + strMsg + "');");
            sb.Append("</script>");
            //use the following for AJax
            if (!curpage.ClientScript.IsClientScriptBlockRegistered(t, "MsgPopUpScript"))
            { ScriptManager.RegisterClientScriptBlock(curpage, t, "MsgPopUpScript", sb.ToString(), false); }

        }

        /// <summary>
        /// Shows the pop up MSG and redirect to next page.
        /// </summary>
        /// <param name="msg">The MSG.</param>
        /// <param name="curpage">The curpage.</param>
        /// <param name="nextPagePath">The next page path.</param>
        public static void ShowPopUpMsgAndRedirect(string msg, Page curpage, string nextPagePath)
        {
            Type t = curpage.GetType();
            msg = formatPopUpString(msg);
            // Build the JavaScript String
            StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script language='javascript'>");
            sb.Append("alert('" + msg + "');window.location.href='" + nextPagePath + "';");
            sb.Append("</script>");
            //use the following for AJax
            if (!curpage.ClientScript.IsClientScriptBlockRegistered(t, "MsgPopUpScript"))
            { System.Web.UI.ScriptManager.RegisterClientScriptBlock(curpage, t, "MsgPopUpScript", sb.ToString(), false); }

        }

        /// <summary>
        /// Formats the pop up string.
        /// </summary>
        /// <param name="msg">The MSG.</param>
        /// <returns></returns>
        public static string formatPopUpString(string msg)
        {
            StringBuilder sb = new StringBuilder(msg);
            sb.Replace("<br />", "\\n");
            //Convert the double quote
            sb.Replace("&quot;", "\"");
            return sb.ToString();

        }

        public static LoginUser CheckSession(Page currentpage)
        {
            LoginUser retUser = null;

            if (HttpContext.Current.Session[ApplicationConstants.SESSION_USEROBJLOGINDET] == null)
            {
                //cannot use server.transfer for AJAX               
                currentpage.Response.Redirect("~/Login.aspx");

            }
            else
            { retUser = (LoginUser)HttpContext.Current.Session[ApplicationConstants.SESSION_USEROBJLOGINDET]; }
            return retUser;
        }
        #endregion
        static Utils()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}
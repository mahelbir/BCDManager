using System;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace BCDManager
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string directoryPath = HttpContext.Current.Server.MapPath("~/images");
                    DirectoryInfo directoryInfo = new DirectoryInfo(directoryPath);
                    FileInfo[] files = directoryInfo.GetFiles();
                    foreach (FileInfo file in files)
                    {
                        string imgPath = Path.GetFileName(file.FullName);
                        string imgStyle = $"<img src='/images/{imgPath}' class='img-fluid' style='max-width: 200px' />";
                        radioListCover.Items.Add(new ListItem(imgStyle, imgPath));
                    }
                }
                catch (Exception ex)
                {
                    lblInfo.Text = ex.Message;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                sdsBooks.InsertParameters["Title"].DefaultValue = txtTitle.Text;
                sdsBooks.InsertParameters["Author"].DefaultValue = txtAuthor.Text;
                sdsBooks.InsertParameters["Publisher"].DefaultValue = txtPublisher.Text;
                sdsBooks.InsertParameters["PageNumber"].DefaultValue = txtPageNumber.Text;
                sdsBooks.InsertParameters["CoverImage"].DefaultValue = radioListCover.SelectedValue;
                if (sdsBooks.Insert() > 0)
                {
                    lblInfo.CssClass = "text-success";
                    lblInfo.Text = "Added successfully!";
                    txtTitle.Text = string.Empty;
                    txtAuthor.Text = string.Empty;
                    txtPublisher.Text = string.Empty;
                    txtPageNumber.Text = string.Empty;
                    radioListCover.SelectedIndex = -1;
                }
                else
                {
                    lblInfo.CssClass = "text-warning";
                    lblInfo.Text = "Error!";
                }
            }
            catch (Exception ex)
            {
                lblInfo.CssClass = "text-danger";
                lblInfo.Text = ex.Message;
            }

        }
    }
}
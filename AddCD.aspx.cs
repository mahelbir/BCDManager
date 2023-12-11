using System;

namespace BCDManager
{
    public partial class AddCD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                sdsCDs.InsertParameters["Title"].DefaultValue = txtTitle.Text;
                sdsCDs.InsertParameters["Artist"].DefaultValue = txtArtist.Text;
                sdsCDs.InsertParameters["PYear"].DefaultValue = txtPYear.Text;
                sdsCDs.InsertParameters["Duration"].DefaultValue = txtDuration.Text;
                if (sdsCDs.Insert() > 0)
                {
                    lblInfo.CssClass = "text-success";
                    lblInfo.Text = "Added successfully!";
                    txtTitle.Text = string.Empty;
                    txtArtist.Text = string.Empty;
                    txtPYear.Text = string.Empty;
                    txtDuration.Text = string.Empty;
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
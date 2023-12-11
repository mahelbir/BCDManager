using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace BCDManager
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            this.SaveHistory();
            this.ShowHistory();
        }

        protected void ShowHistory()
        {
            if (Session["history"] != null)
            {
                ArrayList history = Session["history"] as ArrayList;
                int length = Math.Min(history.Count, 6);
                for (int i = 1; i < length; i++)
                {
                    string[] item = history[i] as string[];
                    listHistory.Items.Add(new ListItem(item[0], item[1]));
                }
            }
        }

        public void SaveHistory(string title = null)
        {

            if (Session["history"] == null)
                Session["history"] = new ArrayList();
            ArrayList history = Session["history"] as ArrayList;
            if (string.IsNullOrEmpty(title))
                title = this.Page.Title;
            if (!IsPostBack && !string.IsNullOrEmpty(title))
            {
                string[] currentPage = new string[] { title, Request.Url.ToString() };
                int oldIndex = ArrayFunctions.FindIndex(history, currentPage);
                if (oldIndex != -1)
                {
                    history = ArrayFunctions.MoveItem(history, oldIndex, 0);
                }
                else
                {
                    history.Insert(0, currentPage);
                }
                Session["history"] = history;
            }
        }


    }
}
﻿using System;
using System.Data;
using System.Web.UI;

namespace BCDManager
{
    public partial class CDInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataView view = (DataView)sdsCDInfo.Select(new DataSourceSelectArguments());
                string title = view.Table.Rows[0]["Title"] as string;
                this.Title = title;
                if (Master is MasterPage master)
                    master.SaveHistory(title);
            }
            catch (Exception)
            {
                this.Title = "CD Info";
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (MenuItem item in Menu1.Items)
        {
            if (item.Text == "View")
                item.Selected = true;
        }

        string path = Request.AppRelativeCurrentExecutionFilePath;

        foreach (MenuItem item in Menu2.Items)
        {
            item.Selected = item.NavigateUrl.Equals(path, StringComparison.InvariantCultureIgnoreCase);

        }
    }
}

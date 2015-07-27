using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //This Master page is for all Add function pages
        
        //ensures that the Add in the main menu is always selected
        foreach (MenuItem item in Menu1.Items)
        {
            if (item.Text == "Add")
                item.Selected = true;
        }


        string path = Request.AppRelativeCurrentExecutionFilePath;
        
        //makes sure the current page in the sidemenu is selected
        foreach (MenuItem item in Menu2.Items)
        {
            item.Selected = item.NavigateUrl.Equals(path, StringComparison.InvariantCultureIgnoreCase);

        }
    }
}

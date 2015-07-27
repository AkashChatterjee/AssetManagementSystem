using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewType : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //When a new row is selected from the GridView
    protected void indexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowIndex == GridView1.SelectedIndex)
            {
                row.BackColor = System.Drawing.Color.DarkSlateGray;
                row.ToolTip = string.Empty;
                popup1.Show(); //opens up modal popup
                try
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("Select ConfigurationID, configName, configValue from Configuration where typeID = '" + GridView1.SelectedRow.Cells[0].Text + "'", con);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    GridView3.DataSource = ds;
                    GridView3.DataBind();
                    //Label1.Text = GridView1.SelectedRow.Cells[1].Text;

                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }


                }
                catch (Exception ex)
                {
                    
                }
            } 
            else
            {
                row.BackColor = System.Drawing.Color.Transparent;
                row.ToolTip = "Click to select this row.";
            }
       }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
            
        }
    }


    //When done is clicked on the modal popup
    protected void done_Click1(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            row.ForeColor = System.Drawing.Color.Black;
            
            row.BackColor = System.Drawing.Color.Transparent;
            row.ToolTip = "Click to select this row.";
        }

    }
}
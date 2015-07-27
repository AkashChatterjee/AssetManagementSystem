using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
public partial class ViewOrder : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    //When a new row index is selected from GridView
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

                    SqlCommand cmd = new SqlCommand("Select typeID, quantity, costPerItem, SUM(quantity *costPerItem) as 'Total' from OrderInfo where orderID = '" + GridView1.SelectedRow.Cells[0].Text + "'group by typeID, quantity, costPerItem", con);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                    
                    SqlCommand cmd2 = new SqlCommand("Select orderSummary from OrderInfo where orderID='" + GridView1.SelectedRow.Cells[0].Text + "'", con);
                    string str = cmd2.ExecuteScalar().ToString();
                    if(str=="" || str==null)
                    {
                        Image1.Visible = false;
                    }
                    else
                    {
                        Image1.Visible = true;
                    }
                    string filepath = "~\\orderImages\\" + str;
                    Image1.ImageUrl = filepath;
                    

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

    //when done is clicked on modal popup
    protected void done_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            
            row.ForeColor = System.Drawing.Color.Black;
            row.BackColor = System.Drawing.Color.Transparent;
            row.ToolTip = "Click to select this row.";
        }
    }
}
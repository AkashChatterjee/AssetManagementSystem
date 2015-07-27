using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewAsset : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";

        }
    }

    //When a new row index is selected from grid. 
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowIndex == GridView1.SelectedIndex)
            {
                row.BackColor = System.Drawing.Color.DarkSlateGray;
                row.ToolTip = string.Empty;
                popup1.Show(); //Opens up modal popup
                try
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    bool flag1 = false, flag2=false;
                    SqlCommand cmd = new SqlCommand("Select e.employeeID, e.fname, e.lname, e.locationID, e.contactNumber, e.email, a.issueDate, a.returnedDate from EmployeeMaster e, AssignedInfo a where e.employeeID=a.employeeID AND a.assetID= '" + GridView1.SelectedRow.Cells[0].Text + "' AND a.returnedDate IS NULL", con);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        
                        flag1 = true;
                        
                    }
                    else
                    {
                        allotedGrid.DataSource = ds;
                        allotedGrid.DataBind();
                    }
                    SqlCommand cmd2 = new SqlCommand("Select e.locationID, e.locationName, e.locationHeadID, e.locationContact, e.localEmail, a.issueDate, a.returnedDate from LocationMaster e, AssignedInfo a where e.locationID=a.locationID AND a.assetID= '" + GridView1.SelectedRow.Cells[0].Text + "' AND a.returnedDate IS NULL", con);
                    SqlDataAdapter ad2 = new SqlDataAdapter(cmd2);
                    DataSet ds2 = new DataSet();
                    ad2.Fill(ds2);
                    if (ds2.Tables[0].Rows.Count == 0)
                    {
                        flag2 = true;
                       
                    }
                    else
                    {                        
                        allotedGrid.DataSource = ds2;
                        allotedGrid.DataBind();
                    }
                    if(flag1&&flag2)
                    {
                        allotedGrid.DataSource = null;
                        allotedGrid.DataBind();
                        historyGrid.DataSource = null;
                        historyGrid.DataBind();
                        lblNotAlloted.Text = "Not Alloted";
                        
                    }

                    SqlCommand cmd3 = new SqlCommand("Select e.employeeID, e.fname, e.lname, e.locationID, e.contactNumber, e.email, a.issueDate, a.returnedDate from EmployeeMaster e, AssignedInfo a where e.employeeID=a.employeeID AND a.assetID= '" + GridView1.SelectedRow.Cells[0].Text + "'", con);
                    SqlDataAdapter ad3 = new SqlDataAdapter(cmd3);

                    SqlCommand cmd4 = new SqlCommand("Select e.locationID, e.locationName, e.locationHeadID, e.locationContact, e.localEmail, a.issueDate, a.returnedDate from LocationMaster e, AssignedInfo a where e.locationID=a.locationID AND a.assetID= '" + GridView1.SelectedRow.Cells[0].Text + "'", con);
                    SqlDataAdapter ad4 = new SqlDataAdapter(cmd4);

                    DataSet ds3 = new DataSet();
                    ad3.Fill(ds3);
                    ad4.Fill(ds3);

                    historyGrid.DataSource = ds3;
                    historyGrid.DataBind();
                    
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

    //When done is clicked on the modal popup
    protected void done_Click(object sender, EventArgs e)
    {
         foreach (GridViewRow row in GridView1.Rows)
         {
               
             row.ForeColor = System.Drawing.Color.Black;
             row.BackColor = System.Drawing.Color.White;
             row.ToolTip = "Click to select this row.";
             lblNotAlloted.Text = string.Empty;
             lblNotAlloted.Text = "";
             
         }
         

    }
}
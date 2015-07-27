using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCategory : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //session 'table' stores the datatable used to display the desired configuration and units via a gridview
        if (!Page.IsPostBack)
            Session["table"] = null;
       

        
    }

    
    

   //fired when Reset button is clicked on the page
    protected void btnBack_Click(object sender, EventArgs e)
    {        
        Response.Redirect("AddCategory.aspx");        
    }

    //fired when Done button is pressed
    protected void categorySubmit_Click(object sender, EventArgs e)
    {
        try
        {

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT into Category values ('" + tbnewCategory.Text + "','" + newCatDescription.Text + "')", con);
            cmd.ExecuteNonQuery();

           

            DataTable dt = Session["table"] as DataTable;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlCommand cmd2 = new SqlCommand("Insert into categoryAttributes values('" + tbnewCategory.Text + "','" + dt.Rows[i]["attributeID"].ToString() + "','" + dt.Rows[i]["units"].ToString() + "')", con);
                cmd2.ExecuteNonQuery();
            }


            if (con.State == ConnectionState.Open)
            {
                con.Close();
                    
            }

           Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Category Added Successfully!";
        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Entry already exists";
            }
        }
        catch (Exception ex)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = ex.Message;
        } 
    }

    //fired when Add is pressed to add a new desired configuration to the datatable
    protected void btnConfigSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt;
            if(Session["table"]!=null)
            {
                dt = Session["table"] as DataTable;
            }
            else
            {
                dt = new DataTable();
                dt.Columns.Add(new DataColumn("attributeID", typeof(string)));
                dt.Columns.Add(new DataColumn("units", typeof(string)));
            }
            

            DataRow dr;            
            dr = dt.NewRow();
            dr["attributeID"] = tbconfigName.Text;
            dr["units"] = tbconfigUnits.Text;
            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Session["table"] = dt;
            tbconfigName.Text = "";
            tbconfigUnits.Text = "";


            
            
        }
        catch (Exception ex)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = ex.Message;
        }
    }

    //fired when a row is deleted from the gridview (and subsequently from the datatable)
    protected void rowDelete(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = Session["table"] as DataTable;
        dt.Rows[e.RowIndex].Delete();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}
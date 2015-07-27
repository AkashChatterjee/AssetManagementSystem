using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddVendor : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    string[] str = new string[20];
    int count=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            Session["table"] = null;
        }
    }

    //Resets page
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddVendor.aspx");
    }

    //Submitting New Vendor information
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if(con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("Insert into Vendor values ('"+tbName.Text+"','"+tbWebsite.Text+"','"+tbContact.Text+"','"+tbEmail.Text+"','"+tbAddr.Text+"',1,0,'"+tbDesc.Text+"')",con);
            cmd.ExecuteNonQuery();

            getSelections();

            for (int i = 0; i < count; i++)
            {
                SqlCommand cmd2 = new SqlCommand("Insert into PreferenceVendor values('" + tbName.Text + "','" + str[i] + "')", con);
                cmd2.ExecuteNonQuery();
            }
            count = 0;

            DataTable dt = Session["table"] as DataTable;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlCommand cmd3 = new SqlCommand("Insert into VendorContact values('" + dt.Rows[i]["contactFName"].ToString() + "','" + dt.Rows[i]["contactLName"].ToString() + "','" + dt.Rows[i]["contactNumber"].ToString() + "','"+dt.Rows[i]["contactEmail"].ToString()+"','"+tbName.Text+"')", con);
                cmd3.ExecuteNonQuery();
            }

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            GridView1.DataSource = null;
            GridView1.DataBind();
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Vendor added successfully";

        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Entry already exists";
            }
        }
        catch(Exception ex)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = ex.Message;
        }
    }

    //Get the preferred vendor selections from the CheckBoxGroup
    protected void getSelections()
    {
        foreach(ListItem item in cbPrefVen.Items)
        {
            if(item.Selected)
            {
                str[count++] = item.Text;
            }
        }
    }

    //Adds contact details to datatable and to the gridview
    protected void contactAdd_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt;
            if (Session["table"] != null)
            {
                dt = Session["table"] as DataTable;
            }
            else
            {
                dt = new DataTable();
                dt.Columns.Add(new DataColumn("contactFName", typeof(string)));
                dt.Columns.Add(new DataColumn("contactLName", typeof(string)));
                dt.Columns.Add(new DataColumn("contactNumber", typeof(string)));
                dt.Columns.Add(new DataColumn("contactEmail", typeof(string)));
                
            }


            DataRow dr;
            dr = dt.NewRow();
            dr["contactFName"] = TextBox1.Text;
            dr["contactLName"] = TextBox2.Text;
            dr["contactNumber"] = TextBox3.Text;
            dr["contactEmail"] = TextBox4.Text;
            dt.Rows.Add(dr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Session["table"] = dt;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
        catch (Exception ex)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = ex.Message;
        }
    }
    
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = Session["table"] as DataTable;
        dt.Rows[e.RowIndex].Delete();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}
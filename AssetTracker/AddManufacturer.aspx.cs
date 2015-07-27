using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class AddManufacturer : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //resets page
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddManufacturer.aspx");
    }

    //fired when Done is clicked
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("Insert into Manufacturer values ('" + tbName.Text + "','" + tbWebsite.Text + "','" + tbContact.Text + "','" + tbEmail.Text + "','" + tbAddr.Text + "',1,0,'" + tbDesc.Text + "')", con);
            cmd.ExecuteNonQuery();           
            

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }


            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Manufacturer added successfully";

            tbName.Text = "";
            tbEmail.Text = "";
            tbWebsite.Text = "";
            tbContact.Text = "";
            tbDesc.Text = "";
            tbAddr.Text = "";
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
}
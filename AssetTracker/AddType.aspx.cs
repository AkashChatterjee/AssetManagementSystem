using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddType : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    int count = 0;
    string[] dylabel = new string[20];
    string[] dytblock = new string[20];    
    string[] dyunits = new string[20];
    int indexlbl = 0;
    int indextb = 0;
    int indexunit = 0;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (newTypeDropDown.SelectedValue != "")
            showAttributes();
        
       

        if (!Page.IsPostBack)
            Session["table"] = null;

    }

    //fires when a new category is selected from the dropdown
    protected void catIndexChanged(object sender, EventArgs e)
    {
        attributePanel.Visible = true;
    }

    //Displays the attributes specific to selected category
    protected void showAttributes()
    {
        SqlCommand cmd2 = new SqlCommand("select attributeID, units from categoryAttributes where categoryID='" + newTypeDropDown.Text + "'", con);

        try
        {
            if (cmd2.Connection.State == ConnectionState.Closed)
            {
                cmd2.Connection.Open();
            }

            SqlDataReader dr = cmd2.ExecuteReader();

            attributePanel.Controls.Add(new LiteralControl("<table>"));
            while (dr.Read())
            {
                Label lbl = new Label();
                lbl.Text = dr["attributeID"].ToString();
                lbl.ID = "lblattribute" + count.ToString();

                TextBox tb = new TextBox();
                tb.ID = "tbattribute" + count.ToString();
                count++;

                DropDownList dropdown = new DropDownList();
                dropdown.ID = "drop" + count.ToString();
                dropdown.Width = 70;
                dropdown.Height = 22;
                dropdown.DataSource = dr["units"].ToString().Split('&');

                dropdown.DataBind();

                attributePanel.Controls.Add(new LiteralControl("<tr>"));
                attributePanel.Controls.Add(new LiteralControl("<td>"));
                attributePanel.Controls.Add(lbl);
                attributePanel.Controls.Add(new LiteralControl("</td>"));

                attributePanel.Controls.Add(new LiteralControl("<td>:"));
                attributePanel.Controls.Add(tb);
                attributePanel.Controls.Add(new LiteralControl("</td>"));

                attributePanel.Controls.Add(new LiteralControl("<td>"));
                attributePanel.Controls.Add(dropdown);
                attributePanel.Controls.Add(new LiteralControl("</td>"));


                attributePanel.Controls.Add(new LiteralControl("</tr>"));



            }

            attributePanel.Controls.Add(new LiteralControl("</table>"));


            if (cmd2.Connection.State == ConnectionState.Open)
            {
                cmd2.Connection.Close();
            }
        }
        catch (Exception ex)
        {
            Label2.Text = ex.Message;
        }
    }

    //Resets page
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddType.aspx");
    }

    //when done is clicked to add the new type
    protected void typeSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT into Type values('" + tbType.Text + "'," + Convert.ToInt32(newTypeLife.Text) + ",'" + newTypeDesc.Text + "','" + DropDownList3.SelectedValue + "','" + newTypeDropDown.SelectedValue + "')", con);
            cmd.ExecuteNonQuery();

            getDynamicVal();

            SqlCommand cmdval = new SqlCommand("Select MAX(ConfigurationID) as maxval from Configuration", con);
            object o = cmdval.ExecuteScalar();
            int x = 1;
            if (!(o is DBNull))
            {
                x = Convert.ToInt32(o) + 1;
            }          
            for (int i = 0; i < count; i++)
            {
                if (dytblock[i] == "")
                    dyunits[i] = "";
                SqlCommand cmd2 = new SqlCommand("INSERT into Configuration values ('" + tbType.Text + "',"+ x +",'"+ dylabel[i] + "','" + dytblock[i]+" "+dyunits[i] + "')", con);
                cmd2.ExecuteNonQuery();
            }
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            Label2.ForeColor = System.Drawing.Color.Green;
            Label2.Text = "Type Added Successfully!";

            tbType.Text = null;

            newTypeLife.Text = null;
            newTypeDesc.Text = null;

            attributePanel.Visible = false;
        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "Entry already exists";
            }
        }
        catch (Exception ex)
        {
            Label2.ForeColor = System.Drawing.Color.Red;
            Label2.Text = ex.Message;
        }
    }

    //gets the configuration values into the respective arrays
    private void getDynamicVal()
    {
        TextBox tb;
        Label lbl;
        DropDownList dlist;
        foreach (Control c in attributePanel.Controls)
        {
            if (c.GetType() == typeof(Label))
            {
                lbl = (Label)c;
                dylabel[indexlbl++] = lbl.Text;
            }
            if (c.GetType() == typeof(TextBox))
            {
                tb = (TextBox)c;
                dytblock[indextb++] = tb.Text;
            }
            if(c.GetType() == typeof(DropDownList))
            {
                dlist = (DropDownList)c;
                dyunits[indexunit++] = dlist.SelectedValue;
            }

        }

    }

    //When Create New for creating new category button is pressed
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = null;
        GridView1.DataBind();
        Session["table"] = null;

        Panel1.Enabled = false;
        Panel1.ForeColor = System.Drawing.Color.LightGray;
        MultiView1.SetActiveView(MultiView1.Views[0]);
        tbType.Focus();
    }

   
    //Back button for the View
    protected void btnBack_Click(object sender, EventArgs e)
    {

        
        MultiView1.ActiveViewIndex = -1;
        Panel1.Enabled = true;
        Panel1.ForeColor = System.Drawing.Color.Black;
        Label1.Text = "";
        Label2.Text = "";
        

        newTypeDropDown.Items.Clear();
        newTypeDropDown.Items.Add(new ListItem("--Select One--", ""));
        newTypeDropDown.DataBind();
        


    }

    //When a new category is added from the View
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
            GridView1.DataSource = null;
            GridView1.DataBind();
            tbnewCategory.Text = "";
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
    
    //When a new configuration requirement is added while creating New Category from View to the datatable and
    //subsequently to the gridview in the View
    protected void btnConfigSubmit_Click(object sender, EventArgs e)
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
        catch(Exception ex)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = ex.Message;
        }
            
    }

    //When a row is deleted from the View
    protected void rowDelete(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = Session["table"] as DataTable;
        dt.Rows[e.RowIndex].Delete();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}
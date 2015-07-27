using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddAsset : System.Web.UI.Page
{
    
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBconnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    string[] dylabel = new string[20];  //contains the configuration name label values of NewTypeView under Multiview1
    string[] dytblock = new string[20]; //contains the dynamically generated textbox values of NewTypeView   
    string[] dyunits = new string[20];  //contains the value from units dropdown (dynamically generated) of NewTypeView
    
    int count = 0;
    int indexlbl = 0;
    int indextb = 0;
    int indexunit = 0;
    


    protected void Page_Load(object sender, EventArgs e)
    {
        //shows the desired attributes of the selected category when creating new View
        if (newTypeDropDown.SelectedValue != "")
            showAttributes();

        //shows the desired attributes of the selected category when creating new congiguration
        if (DropDownList4.SelectedValue != "")
            showAttributes2();          

        //initiates session as null. This session is used to store the datatable of the selected configuration
        if (!Page.IsPostBack)
            Session["table"] = null;
       

    }

    //fired when DropDownList1 index is changed. (Select Category dropdown)
    protected void indexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add(new ListItem("--Select One--", ""));
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("Select typeID from Type where categoryID='" + DropDownList1.SelectedValue + "'", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            DropDownList2.DataSource = dset;
            DropDownList2.DataTextField = "typeID";
            DropDownList2.DataValueField = "typeID";
            DropDownList2.DataBind();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            mainPageLabel.Text = ex.Message;
        }


    }

    //fired when button newCategory is clicked
    protected void newCategory_Click(object sender, EventArgs e)
    {
        GridView2.DataSource = null;
        GridView2.DataBind();
        Panel1.Enabled = false;
        Panel1.ForeColor = System.Drawing.Color.LightGray;
        MultiView1.SetActiveView(MultiView1.Views[0]);
        tbnewCategory.Focus();
    }

    //common back button from all Views part of Multiview1
    protected void btnBack_Click(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = -1;
        Panel1.Enabled = true;
        Panel1.ForeColor = System.Drawing.Color.Black;
        Label1.Text = "";
        Label2.Text = "";
        Label3.Text = "";
       
        indexlbl = 0;
        indextb = 0;
        


        DropDownList1.Items.Clear();
        DropDownList1.Items.Add(new ListItem("--Select One--", ""));
        DropDownList1.DataBind();

        DropDownList2.Items.Clear();
        DropDownList2.Items.Add(new ListItem("--Select One--", ""));
        DropDownList2.DataBind();

        DropDownList5.Items.Clear();
        DropDownList5.Items.Add(new ListItem("--Select One--", ""));
        DropDownList5.DataBind();

        orderDropDown.Items.Clear();
        orderDropDown.Items.Add(new ListItem("--Select One--", ""));
        orderDropDown.DataBind();

        
        GridView1.Visible = false;

    }

    //fired when creating Create New for Type button is clicked on the screen
    protected void Button1_Click(object sender, EventArgs e)
    {

        Panel1.Enabled = false;
        Panel1.ForeColor = System.Drawing.Color.LightGray;
        MultiView1.SetActiveView(MultiView1.Views[1]);
        tbType.Focus();
    }


    //fired when Done is clicked on the new category creation view
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

            GridView2.DataSource = null;
            GridView2.DataBind();
            tbnewCategory.Text = null;
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Category Added Successfully!";
        }
        catch(SqlException ex)
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

    //fired when done button is clicked on the View to Create new type
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

            //This gets current max value of the configuration column and adds 1 to it for new configuration
            SqlCommand cmdval = new SqlCommand("Select MAX(ConfigurationID) as maxval from Configuration", con);
            object o = cmdval.ExecuteScalar();
            int x=1;
            if(!(o is DBNull))
            {
                x = Convert.ToInt32(o)+1; 
            }

            for (int i = 0; i < count; i++)
            {
                if (dytblock[i] == "")
                    dyunits[i] = "";
                SqlCommand cmd2 = new SqlCommand("INSERT into Configuration values ('" + tbType.Text + "'," + x + ",'" + dylabel[i] + "','" + dytblock[i] + " " + dyunits[i] + "')", con);
                cmd2.ExecuteNonQuery();
            }

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            Label2.ForeColor = System.Drawing.Color.Green;
            Label2.Text = "Type Added Successfully!";
            

            tbType.Text = null;
            newTypeDropDown.SelectedValue = "";
            newTypeLife.Text = null;
            newTypeDesc.Text = null;
            DropDownList3.SelectedValue = "";
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

    //fired when main page done button is clicked
    protected void btnDone_Click(object sender, EventArgs e)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT into AssetMaster (assetID, serialNumber, orderID, isAssigned, Validity, ConfigurationID) values ('" + tbAssetID.Text + "','" + tbSerial.Text + "','" + orderDropDown.SelectedValue + "',0,1,"+Convert.ToInt32(DropDownList5.Text)+")", con);
            cmd.ExecuteNonQuery();



            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            mainPageLabel.ForeColor = System.Drawing.Color.Green;
            mainPageLabel.Text = "Asset Added Successfully!";


        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                mainPageLabel.ForeColor = System.Drawing.Color.Red;
                mainPageLabel.Text = "Entry already exists";
            }
        }
        catch (Exception ex)
        {
            mainPageLabel.ForeColor = System.Drawing.Color.Red;
            mainPageLabel.Text = ex.Message;
        }
    }

    //resets the page(fired when reset is clicked)
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddAsset.aspx");

    }

    //dynamically generates the desired attribute textboxes and unit dropdowns when adding new type
    protected void showAttributes()
    {
        SqlCommand cmd2 = new SqlCommand("select attributeID,units from categoryAttributes where categoryID='" + newTypeDropDown.Text + "'", con);

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
            Label2.Text = ex.Message;
        }
    }

    //dynamically generates the desired attribute textboxes and unit dropdowns when adding new configuration
    protected void showAttributes2()
    {
        SqlCommand cmd2 = new SqlCommand("select attributeID, units from categoryAttributes where categoryID='" + DropDownList4.Text + "'", con);

        try
        {
            if (cmd2.Connection.State == ConnectionState.Closed)
            {
                cmd2.Connection.Open();
            }

            SqlDataReader dr = cmd2.ExecuteReader();

            Panel2.Controls.Add(new LiteralControl("<table>"));
            while (dr.Read())
            {
                Label lbl = new Label();
                lbl.Text = dr["attributeID"].ToString();
                lbl.ID = "lblattribute" + count.ToString();

                TextBox tb = new TextBox();
                tb.ID = "tbattribute" + count.ToString();
                

                DropDownList dropdown = new DropDownList();
                dropdown.ID = "drop2" + count.ToString();
                dropdown.Width = 70;
                dropdown.Height = 22;
                dropdown.DataSource = dr["units"].ToString().Split('&');

                dropdown.DataBind();

                count++;

                Panel2.Controls.Add(new LiteralControl("<tr>"));
                Panel2.Controls.Add(new LiteralControl("<td>"));
                Panel2.Controls.Add(lbl);
                Panel2.Controls.Add(new LiteralControl("</td>"));

                Panel2.Controls.Add(new LiteralControl("<td>:"));
                Panel2.Controls.Add(tb);
                Panel2.Controls.Add(new LiteralControl("</td>"));
                

                Panel2.Controls.Add(new LiteralControl("<td>"));
                Panel2.Controls.Add(dropdown);
                Panel2.Controls.Add(new LiteralControl("</td>"));

                Panel2.Controls.Add(new LiteralControl("</tr>"));

            }

            Panel2.Controls.Add(new LiteralControl("</table>"));


            if (cmd2.Connection.State == ConnectionState.Open)
            {
                cmd2.Connection.Close();
            }
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
            Label2.Text = ex.Message;
        }
    }


    //gets the configuration values from creating New Type View
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
            if (c.GetType() == typeof(DropDownList))
            {
                dlist = (DropDownList)c;
                dyunits[indexunit++] = dlist.SelectedValue;
            }
        }

    }

    //gets the configuration values from creating New Configuration View
    private void getDynamicVal2()
    {
        TextBox tb;
        Label lbl;
        DropDownList dlist;
        foreach (Control c in Panel2.Controls)
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
            if (c.GetType() == typeof(DropDownList))
            {
                dlist = (DropDownList)c;
                dyunits[indexunit++] = dlist.SelectedValue;
            }

        }

    }

    //fires when a category is selected from the create new type view
    protected void typeIndexChanged(object sender, EventArgs e)
    {
        attributePanel.Visible = true;

    }  
    
    //fired when a type is selected from main page Choose type drop down
    protected void indexChanged2(object sender, EventArgs e)
    {
        try
        {
            DropDownList5.Items.Clear();
            DropDownList5.Items.Add(new ListItem("--Select One--", ""));
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("Select distinct ConfigurationID from Configuration where typeID='" + DropDownList2.SelectedValue + "'", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            DropDownList5.DataSource = dset;
            DropDownList5.DataTextField = "ConfigurationID";
            DropDownList5.DataValueField = "ConfigurationID";
            DropDownList5.DataBind();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            mainPageLabel.Text = ex.Message;
        }
    }

    //fired when Create New is clicked for new configuration on the main page
    protected void Button5_Click(object sender, EventArgs e)
    {
        Panel1.Enabled = false;
        Panel1.ForeColor = System.Drawing.Color.LightGray;
        MultiView1.SetActiveView(MultiView1.Views[2]);
      
    }

    //fired when a new category is chosen from Choose Category drop down in the Create new configuration View
    protected void configIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Panel2.Visible = true;
            DropDownList6.Items.Clear();
            DropDownList6.Items.Add(new ListItem("--Select One--", ""));
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("Select typeID from Type where categoryID='" + DropDownList4.SelectedValue + "'", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            DropDownList6.DataSource = dset;
            DropDownList6.DataTextField = "typeID";
            DropDownList6.DataValueField = "typeID";
            DropDownList6.DataBind();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            mainPageLabel.Text = ex.Message;
        }
    }

    //fired when selected configuration in main page drop down is changed
    protected void configGridChange(object sender, EventArgs e)
    {
        try
        {
            GridView1.Visible = true;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("Select configName, configValue from Configuration where ConfigurationID=" + DropDownList5.SelectedValue + "", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            GridView1.DataSource = dset;
            GridView1.DataBind();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            mainPageLabel.Text = ex.Message;
        }
    }

    //fired when Done is pressed on the Create New configuration View
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //This gets current max value of the configuration column and adds 1 to it for new configuration
            SqlCommand cmdval = new SqlCommand("Select MAX(ConfigurationID) as maxval from Configuration", con);
            object o = cmdval.ExecuteScalar();
            int x = 1;
            if (!(o is DBNull))
            {
                x = Convert.ToInt32(o)+1;
            }          

            getDynamicVal2();            

            for (int i = 0; i < count; i++)
            {
                if (dytblock[i] == "")
                    dyunits[i] = "";
                SqlCommand cmd2 = new SqlCommand("INSERT into Configuration values ('" + DropDownList6.Text + "'," + x + ",'" + dylabel[i] + "','" + dytblock[i] + "')", con);
                cmd2.ExecuteNonQuery();
            }

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            Label3.ForeColor = System.Drawing.Color.Green;
            Label3.Text = "New Configuration Added Successfully!";

            
            DropDownList6.SelectedValue = "";            
            DropDownList4.SelectedValue = "";
            Panel2.Visible = false;

        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                Label3.ForeColor = System.Drawing.Color.Red;
                Label3.Text = "Entry already exists";
            }
        }
        catch (Exception ex)
        {
            Label3.ForeColor = System.Drawing.Color.Red;
            Label3.Text = ex.Message;
        }
    }


    //fired when the Add button is pressed in the Create New Category View
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
            GridView2.DataSource = dt;
            GridView2.DataBind();
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

    //fired when the delete button is pressed for a particular row in the grid of create new category view
    protected void rowDelete(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = Session["table"] as DataTable;
        dt.Rows[e.RowIndex].Delete();
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
}
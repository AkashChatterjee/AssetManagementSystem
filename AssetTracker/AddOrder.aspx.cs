using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.IO;



public partial class AddOrder : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["assetDBConnection"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constr);
    static int datebtnmode = 0;
    static int datestartbtnmode = 0;
    static int dateendbtnmode = 0;
    static int amcstartbtnmode = 0;
    static int amcendbtnmode = 0;
    protected void Page_Load(object sender, EventArgs e)
    {     
        
      
    }

    //fired when a category is chosen from Choose Category dropdown
    protected void indexChanged(object sender, EventArgs e)
    {
        try
        {
            ddOrderType.Items.Clear();
            ddOrderType.Items.Add(new ListItem("--Select One--", ""));
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("Select typeID from Type where categoryID='" + ddCategory.SelectedValue + "'", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            ddOrderType.DataSource = dset;
            ddOrderType.DataTextField = "typeID";
            ddOrderType.DataValueField = "typeID";
            ddOrderType.DataBind();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            
        }
    }

    //when button to open OrderDate calendar is clicked
    protected void dateChoose_Click(object sender, EventArgs e)
    {
        if (datebtnmode == 0)
        {
            orderCalender.Visible = true;
            datebtnmode = 1;
        }
        else
        {
            orderCalender.Visible = false;
            datebtnmode = 0;
        }
    }

    //fired when a new date is selected from orderdate calendar
    protected void calenderChange(object sender, EventArgs e)
    {
        
        tbDate.Text = Convert.ToDateTime(orderCalender.SelectedDate, CultureInfo.GetCultureInfo("en-US")).ToString("yyyy/MM/dd");
        orderCalender.Visible = false;

        if (datebtnmode == 0)
            datebtnmode = 1;
        else
            datebtnmode = 0;
    }

    //when a vendor name is selected from Select vendor dropdown
    protected void vendorIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddAMC.Items.Clear();
            ddWarranty.Items.Clear();
            ddAMC.Items.Add(new ListItem("--Select One--", ""));
            ddWarranty.Items.Add(new ListItem("--Select One--", ""));

            if(con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("Select warrantyID from WarrantyInfo where vendorName = '" + ddVendor.SelectedValue + "'", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            ddWarranty.DataSource = dset;
            ddWarranty.DataTextField = "warrantyID";
            ddWarranty.DataValueField = "warrantyID";
            ddWarranty.DataBind();

            SqlCommand cmd2 = new SqlCommand("Select amcID from AMCInfo where vendorName = '" + ddVendor.SelectedValue + "'", con);
            SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
            DataSet dset2 = new DataSet();
            adapter2.Fill(dset2);
            ddAMC.DataSource = dset2;
            ddAMC.DataTextField = "amcID";
            ddAMC.DataValueField = "amcID";
            ddAMC.DataBind();

            if(con.State == ConnectionState.Open)
            {
                con.Close();
            }

        }
        catch(Exception ex)
        {

        }
    }

    //fired when Create New is pressed for a new Warranty. Opens up New Warranty View
    protected void newWarranty_Click(object sender, EventArgs e)
    {
        Panel1.Enabled = false;
        Panel1.ForeColor = System.Drawing.Color.LightGray;
        MultiView1.SetActiveView(MultiView1.Views[0]);
        tbWarrantyID.Focus();
    }

    //When button is pressed to open up Start Date calendar in Create New Warranty View
    protected void btnStartDate_Click(object sender, EventArgs e)
    {
        if (datestartbtnmode == 0)
        {
            datestartbtnmode = 1;
            startDateCal.Visible = true;
        }
        else
        {
            datestartbtnmode = 0;
            startDateCal.Visible = false;
        }
    }

    //when a date is selected from New Warranty Start date calendar
    protected void startDateIndexChanged(object sender, EventArgs e)
    {

        tbStartDate.Text = Convert.ToDateTime(startDateCal.SelectedDate, CultureInfo.GetCultureInfo("en-US")).ToString("yyyy/MM/dd");
        startDateCal.Visible = false;

        if (datestartbtnmode == 0)
            datestartbtnmode = 1;
        else
            datestartbtnmode = 0;
    }

    //when button to open up end date calendar in Create New Warranty View
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (dateendbtnmode == 0)
        {
            dateendbtnmode = 1;
            endDateCal.Visible = true;
        }
        else
        {
            dateendbtnmode = 0;
            endDateCal.Visible = false;
        }
    }

    //When end date is selected from end date calendar in New Warranty View
    protected void endDateIndexChanged(object sender, EventArgs e)
    {
        tbEndDate.Text = Convert.ToDateTime(endDateCal.SelectedDate, CultureInfo.GetCultureInfo("en-US")).ToString("yyyy/MM/dd");
        endDateCal.Visible = false;

        if (dateendbtnmode == 0)
            dateendbtnmode = 1;
        else
            dateendbtnmode = 0;
    }

    //fired when back button is clicked of the Views
    protected void btnBack_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = -1;
        Panel1.Enabled = true;
        Panel1.ForeColor = System.Drawing.Color.Black;

        ddVendor.Items.Clear();
        ddVendor.Items.Add(new ListItem("--Select One--", ""));
        ddVendor.DataBind();

        datebtnmode = 0;
        datestartbtnmode = 0;
        dateendbtnmode = 0;
        amcstartbtnmode = 0;
        amcendbtnmode = 0;

        Label1.Text = "";
        tbWarrantyID.Text = "";
        tbnewAmc.Text = "";
        tbStartDate.Text = "";
        amcStartDate.Text = "";
        tbEndDate.Text = "";
        amcEndDate.Text = "";        


    }

    //Fired when Done is pressed on the Create New Warranty View
    protected void categorySubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if(con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("Insert into WarrantyInfo values ('"+tbWarrantyID.Text+"','"+tbStartDate.Text+"', '"+tbEndDate.Text+"','"+DropDownList1.SelectedValue+"')",con);
            cmd.ExecuteNonQuery();

            if(con.State==ConnectionState.Open)
            {
                con.Close();
            }

            Label2.ForeColor = System.Drawing.Color.Green;
            Label2.Text = "Warranty Info Successfully Added!";

        }
        catch (SqlException ex)
        {
            if (ex.Number == 2627)
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "Entry already exists";
            }
        }
        catch(Exception ex)
        {
            Label2.ForeColor = System.Drawing.Color.Red;
            Label2.Text = ex.Message;
        }
    }

    //Opens up or closes calendar for New AMC start date
    protected void btnAmcStart_Click(object sender, EventArgs e)
    {

        if (amcstartbtnmode == 0)
        {
            amcstartbtnmode = 1;
            CalendarAmcStart.Visible = true;
        }
        else
        {
            amcstartbtnmode = 0;
            CalendarAmcStart.Visible = false;
        }
    }

    //When a start date is selected from New AMC start date calendar
    protected void amcstartindex(object sender, EventArgs e)
    {
        amcStartDate.Text = Convert.ToDateTime(CalendarAmcStart.SelectedDate, CultureInfo.GetCultureInfo("en-US")).ToString("yyyy/MM/dd");
        CalendarAmcStart.Visible = false;
        if (amcstartbtnmode == 0)
            amcstartbtnmode = 1;
        else
            amcstartbtnmode = 0;
    }

    //When Create New is clicked for a new AMC
    protected void newAMC_Click(object sender, EventArgs e)
    {
        Panel1.Enabled = false;
        Panel1.ForeColor = System.Drawing.Color.LightGray;
        MultiView1.SetActiveView(MultiView1.Views[1]);
        tbnewAmc.Focus();
    }

    //Opens or closes calendar to enter end date for New AMC in Create New AMC View
    protected void btnAmcEnd_Click(object sender, EventArgs e)
    {
        if (amcendbtnmode == 0)
        {
            amcendbtnmode = 1;
            CalenderAmcEnd.Visible = true;
        }
        else
        {
            amcendbtnmode = 0;
            CalenderAmcEnd.Visible = false;
        }
    }

    //When an end date is selected for New AMC from the Create new AMC View calendar
    protected void amcEndSelection(object sender, EventArgs e)
    {
        amcEndDate.Text = Convert.ToDateTime(CalenderAmcEnd.SelectedDate, CultureInfo.GetCultureInfo("en-US")).ToString("yyyy/MM/dd");
        CalenderAmcEnd.Visible = false;
        if (amcendbtnmode == 0)
            amcendbtnmode = 1;
        else
            amcendbtnmode = 0;
    }

    //When done is pressed to add new AMC info
    protected void Button5_Click(object sender, EventArgs e)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("Insert into AMCInfo values ('" + tbnewAmc.Text + "','" + amcStartDate.Text + "', '" + amcEndDate.Text + "','" + DropDownList2.SelectedValue + "')", con);
            cmd.ExecuteNonQuery();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            Label3.ForeColor = System.Drawing.Color.Green;
            Label3.Text = "AMC Info Successfully Added!";

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

    //Resets page
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddOrder.aspx");
    }

    //When we submit the page information for new order
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string virtualfolder;
        string physicalfolder;
        string ext;
        string imgname;

        try
        {
            virtualfolder = "~/orderImages/";
            physicalfolder = Server.MapPath(virtualfolder);
            ext = Path.GetExtension(physicalfolder+FileUpload1.FileName);
            System.Guid guid = System.Guid.NewGuid();
            string iname = guid.ToString();
            imgname = iname+ext;
            FileUpload1.SaveAs(physicalfolder+imgname);   

        
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //string temp1, temp2;
            
            SqlCommand cmd = new SqlCommand("Insert into OrderInfo values ('"+tbOrderNo.Text+"','"+tbDate.Text+"','"+ddOrderType.SelectedValue+"',"+Convert.ToInt32(Quantity.Text)+","+Convert.ToInt32(Cost.Text)+",'"+ddWarranty.SelectedValue+"','"+ddAMC.SelectedValue+"','"+ddVendor.SelectedValue+"','"+imgname+"')", con);
            cmd.ExecuteNonQuery();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Order Info Successfully Added!";

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
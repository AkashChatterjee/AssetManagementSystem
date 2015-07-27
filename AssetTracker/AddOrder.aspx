<%@ Page Title="" Language="C#" MasterPageFile="~/AddMaster.master" AutoEventWireup="true" CodeFile="AddOrder.aspx.cs" Inherits="AddOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width:100%">
            <tr>                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <h2>Enter New Order Information</h2>
                    <asp:Panel ID="Panel1" runat="server">
                    <table style="width:100%; border-collapse:separate; border-spacing:1em">
                        
                        <tr>
                            <th style="text-align:right">
                                Order Number
                            </th>
                            <td colspan="2" style="text-align:left">:
                                <asp:TextBox ID="tbOrderNo" runat="server" placeholder="Order Number" BorderStyle="Outset" Height="22px" Width="145px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                           <th style="text-align:right">
                               Order Date
                           </th>
                            <td colspan="2" style="text-align:left">:
                                 <asp:TextBox ID="tbDate" runat="server" placeholder="Order Date" BorderStyle="Outset" Height="22px" Width="115px"></asp:TextBox>
                                <asp:Button ID="dateChoose" runat="server" Text="..." Width="24px" OnClick="dateChoose_Click" />
                            </td>
                        </tr>
                        <tr>
                           
                            <td colspan="2" style="text-align:center">

                                <asp:Calendar ID="orderCalender" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" Visible="false" OnSelectionChanged="calenderChange">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderStyle="Outset" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#0067b3" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>

                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Choose Category 
                            </th>
                            <td style="text-align:left">:

                                <asp:DropDownList ID="ddCategory" runat="server" AppendDataBoundItems="True" DataSourceID="ddCategoryDS" DataTextField="categoryID" DataValueField="categoryID" OnSelectedIndexChanged="indexChanged" AutoPostBack="true" Height="23px">
                                    <asp:ListItem Text="--Select One--" Value="" />
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="ddCategoryDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [categoryID] FROM [Category]"></asp:SqlDataSource>

                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Choose Type 
                            </th>
                            <td style="text-align:left">:
                                <asp:DropDownList ID="ddOrderType" runat="server" AppendDataBoundItems="true" Height="22px" Width="128px">
                                    <asp:ListItem Text="--Select One--" Value=""/>                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Quantity
                            </th>
                            <td colspan="2" style="text-align:left">:
                                <asp:TextBox ID="Quantity" runat="server" placeholder="Quantity" BorderStyle="Outset" Height="22px" Width="145px"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Cost per Item
                            </th>
                            <td colspan="2" style="text-align:left">:
                                <asp:TextBox ID="Cost" runat="server" placeholder="Cost Per Item" BorderStyle="Outset" Height="22px" Width="145px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Select Vendor
                            </th>
                            <td style="text-align:left">:
                                <asp:DropDownList ID="ddVendor" runat="server" DataSourceID="ddVendorDS" DataTextField="vendorName" DataValueField="vendorName" AppendDataBoundItems="true" AutoPostBack="true" Height="22px" OnSelectedIndexChanged="vendorIndexChanged" Width="128px">
                                    <asp:ListItem Text="--Select One--" Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ddVendorDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [vendorName] FROM [Vendor]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Warranty ID
                            </th>
                            <td style="text-align:left">:
                                <asp:DropDownList ID="ddWarranty" runat="server" AppendDataBoundItems="true" Height="22px" Width="128px">
                                    <asp:ListItem Text="--Select One--" Value="" />
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="newWarranty" runat="server" Text="Create New" BorderStyle="Outset" BorderWidth="3px" OnClick="newWarranty_Click"/>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                AMC ID (If Any)
                            </th>
                            <td style="text-align:left">:
                                <asp:DropDownList ID="ddAMC" runat="server" AppendDataBoundItems="true" Height="22px" Width="128px">
                                    <asp:ListItem Text="--Select One--" Value="" />
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="newAMC" runat="server" Text="Create New" BorderStyle="Outset" BorderWidth="3px" OnClick="newAMC_Click"/>

                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Upload Image
                            </th>
                            <td style="text-align:left" colspan="2">:
                                <asp:FileUpload ID="FileUpload1" runat="server" BorderWidth="3px" BorderStyle="Outset" BorderColor="#0067b3" ToolTip="Upload Order Summary" />
                                

                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">

                                <asp:Label ID="Label1" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="82px" OnClick="btnReset_Click" />
                                <asp:Button ID="btnSubmit" runat="server" Text="Done" Width="82px" OnClick="btnSubmit_Click"/>
                            </td>
                        </tr>
                    </table>
                        </asp:Panel>
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">                
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="-1">
                        <asp:View ID="ViewWarranty" runat="server" EnableViewState="true">                                              
                            <table style="width:100%; border:ridge; border-radius:10px; border-bottom-color:darkblue; border-collapse:separate; border-spacing:1em">
                                <tr>
                                    <th style="font-size:20px" colspan="2">
                                        Create New Warranty
                                    </th>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Warranty ID
                                    </th>
                                   <td style="text-align:left" colspan="2">:

                                       <asp:TextBox ID="tbWarrantyID" runat="server" Width="191px" placeholder="Warranty ID" Height="22px"></asp:TextBox>


                                   </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Start Date
                                    </th>
                                    <td style="text-align:left">:

                                        <asp:TextBox ID="tbStartDate" runat="server" Width="160px" placeholder="Start Date"></asp:TextBox>
                                        <asp:Button ID="btnStartDate" runat="server" Text="..." Width="24px" OnClick="btnStartDate_Click"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center; width:100%">
                                        <asp:Calendar ID="startDateCal" runat="server" Visible="False" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="startDateIndexChanged">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#0067b3" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        End Date
                                    </th>
                                    <td style="text-align:left">:

                                        <asp:TextBox ID="tbEndDate" runat="server" Width="160px" placeholder="End Date"></asp:TextBox>
                                        <asp:Button ID="Button1" runat="server" Text="..." Width="24px" OnClick="Button1_Click"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center;  width:100%">
                                        <asp:Calendar ID="endDateCal" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" Visible="false" OnSelectionChanged="endDateIndexChanged">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#0067b3" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Choose Vendor
                                    </th>
                                    <td style="text-align:left">:
                                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" Height="22px" Width="128px" DataSourceID="ddVendorDS" DataTextField="vendorName" DataValueField="vendorName">
                                            <asp:ListItem Text="--Select One--" Value=""/>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center" colspan="2">

                                        <asp:Label ID="Label2" runat="server"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td style="text-align:center" colspan="2">
                                        <asp:Button ID="btnBack" runat="server" Text="Back" Width="78px" OnClick="btnBack_Click" />
                                        <asp:Button ID="categorySubmit" runat="server" Text="Done" Width="78px" OnClick="categorySubmit_Click" />
                                    </td>
                                    
                                </tr>
                            </table>
                        </asp:View>

                        <asp:View ID="ViewAMC" runat="server" EnableViewState="true">                                              
                            <table style="width:100%; border:ridge; border-radius:10px; border-bottom-color:darkblue; border-collapse:separate; border-spacing:1em">
                                <tr>
                                    <th style="font-size:20px" colspan="2">
                                        Create New AMC
                                    </th>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        AMC ID
                                    </th>
                                   <td style="text-align:left">:

                                       <asp:TextBox ID="tbnewAmc" runat="server" Width="191px" placeholder="AMC ID" Height="22px"></asp:TextBox>


                                   </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Start Date
                                    </th>
                                    <td style="text-align:left">:

                                        <asp:TextBox ID="amcStartDate" runat="server" Width="160px" placeholder="Start Date"></asp:TextBox>
                                        <asp:Button ID="btnAmcStart" runat="server" Text="..." Width="24px" OnClick="btnAmcStart_Click"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Calendar ID="CalendarAmcStart" runat="server" Visible="False" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="amcstartindex">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#0067b3" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        End Date
                                    </th>
                                    <td style="text-align:left">:

                                        <asp:TextBox ID="amcEndDate" runat="server" Width="160px" placeholder="End Date"></asp:TextBox>
                                        <asp:Button ID="btnAmcEnd" runat="server" Text="..." Width="24px" OnClick="btnAmcEnd_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Calendar ID="CalenderAmcEnd" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" Visible="false" OnSelectionChanged="amcEndSelection">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#0067b3" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Choose Vendor
                                    </th>
                                    <td style="text-align:left">:
                                        <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" Height="22px" Width="128px" DataSourceID="ddVendorDS" DataTextField="vendorName" DataValueField="vendorName">
                                            <asp:ListItem Text="--Select One--" Value=""/>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center" colspan="2">

                                        <asp:Label ID="Label3" runat="server"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td style="text-align:center" colspan="2">
                                        <asp:Button ID="Button4" runat="server" Text="Back" Width="78px" OnClick="btnBack_Click" />
                                        <asp:Button ID="Button5" runat="server" Text="Done" Width="78px" OnClick="Button5_Click"  />
                                    </td>
                                    
                                </tr>
                            </table>
                        </asp:View>

                    </asp:MultiView>
                
                </td>
            </tr>
        </table>
</asp:Content>


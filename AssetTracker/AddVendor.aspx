<%@ Page Title="" Language="C#" MasterPageFile="~/AddMaster.master" AutoEventWireup="true" CodeFile="AddVendor.aspx.cs" Inherits="AddVendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
            <tr>
                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <h2>Enter New Vendor</h2>
                     
                        <table style="width:100%; border-collapse:separate; border-spacing:1em ">
                            <tr>
                                <th style="text-align:right">
                                    Vendor Name
                                </th>
                                <td style="text-align:left">:                                    
                                    <asp:TextBox ID="tbName" runat="server" BorderStyle="Outset"  Width="156px" placeholder="Vendor Name" Height="22px"></asp:TextBox>
                                                                      
                                </td>
                            </tr>            
                            <tr>
                                <th style="text-align:right">
                                    Website
                                </th>
                                <td style="text-align:left">:
                                    <asp:TextBox ID="tbWebsite" runat="server" BorderStyle="Outset"  Width="156px" placeholder="Website" Height="22px"></asp:TextBox>
                                </td>
                            </tr>                  
                            <tr>
                                <th style="text-align:right">
                                    Contact Number
                                </th>
                                <td style="text-align:left">:
                                    <asp:TextBox ID="tbContact" runat="server" BorderStyle="Outset"  Width="156px" placeholder="Contact No" Height="22px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:right">
                                    Email Id
                                </th>
                                <td style="text-align:left">:
                                    <asp:TextBox ID="tbEmail" runat="server" BorderStyle="Outset"  Width="156px" placeholder="Email" Height="22px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:right">
                                    Address
                                </th>
                                <td style="text-align:left">:
                                    <asp:TextBox ID="tbAddr" runat="server" BorderStyle="Outset"  Width="156px" placeholder="Address" Height="42px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="tbDesc" runat="server" BorderStyle="Outset"  Width="234px" placeholder="Description" Height="42px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:left">
                                    Contact Details :
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align:left">
                                    <asp:Label ID="Label2" runat="server" Text="First Name">

                                    </asp:Label>:

                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Contact's First Name" BorderStyle="Outset" Height="22px" ></asp:TextBox>

                                </td>
                                <td style="text-align:left">
                                    <asp:Label ID="Label3" runat="server" Text="Last Name">

                                    </asp:Label>:
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Contact's Last Name" BorderStyle="Outset" Height="22px" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left">
                                    <asp:Label ID="Label4" runat="server" Text="Contact Number">

                                    </asp:Label>:
                                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Contact No." BorderStyle="Outset" Height="22px" ></asp:TextBox>

                                </td>
                                <td style="text-align:left">
                                    <asp:Label ID="Label5" runat="server" Text="Email Id">

                                    </asp:Label>:
                                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Contact's Email ID" BorderStyle="Outset" Height="22px" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="contactAdd" runat="server" Text="Add" Width="85px" OnClick="contactAdd_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">

                                    <asp:GridView ID="GridView1" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting">
                                         <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/resources/deleteIcon.png" DeleteText="" />
                                        </Columns>
                                        
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#0067b3" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>

                                </td>
                            </tr>  
                            <tr>
                                <th style="text-align:left">
                                    Vendor preferences : 
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align:left">
                                    <asp:CheckBoxList ID="cbPrefVen" runat="server" DataSourceID="prefVenDS" DataTextField="categoryID" DataValueField="categoryID"></asp:CheckBoxList>
                                    <asp:SqlDataSource ID="prefVenDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [categoryID] FROM [Category]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" Width="78px" OnClick="btnReset_Click" />

                                    <asp:Button ID="btnSubmit" runat="server" Text="Done" Width="78px" OnClick="btnSubmit_Click" />

                                </td>
                            </tr>
                            </table>
                        
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                   
                </td>
            </tr>
        </table>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/AddMaster.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%">
            <tr>                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <h2>Enter New Category</h2>
                     
                        <table style="width:100%; border-collapse:separate; border-spacing:1em ">                                
                                
                                <tr>
                                    <th style="text-align:right">
                                        Category Name
                                    </th>
                                   <td style="text-align:left">:

                                       <asp:TextBox ID="tbnewCategory" runat="server" Width="195px" BorderStyle="Outset" placeholder="Category Name" Height="22px"></asp:TextBox>


                                   </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center" colspan="2">

                                        <asp:TextBox ID="newCatDescription" runat="server" Width="234px" TextMode="MultiLine" placeholder="Description" Height="42px"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        
                                            <h3 style="text-align:center ;text-decoration:underline;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Enter Configuration Attributes</h3>
                                        
                                    </td>
                                </tr>
                            
                                <tr>
                                    <td>
                                        Configuration Name  
                                    </td>
                                    <td style="text-align:left">:
                                        <asp:TextBox ID="tbconfigName" runat="server" Height="22px" placeholder="Configuration Name"  BorderStyle="Outset"></asp:TextBox>
                                    </td>
                                </tr>
                            <tr>
                                <td>
                                    Configuration Units 
                                </td>
                                <td style="text-align:left">:
                                    <asp:TextBox ID="tbconfigUnits" runat="server" Height="22px" placeholder="Enter units seperated by '&'"  BorderStyle="Outset"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnConfigSubmit" runat="server" Text="Add" Width="85px" OnClick="btnConfigSubmit_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="rowDelete">
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/resources/deleteIcon.png" DeleteText="" />
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#0067B3" Font-Bold="True" ForeColor="White" />
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
                                    <td style="text-align:center" colspan="2">

                                        <asp:Label ID="Label1" runat="server"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td style="text-align:center" colspan="2">
                                        <asp:Button ID="btnBack" runat="server" Text="Reset" Width="78px" OnClick="btnBack_Click"/>
                                        <asp:Button ID="categorySubmit" runat="server" Text="Done" Width="78px" OnClick="categorySubmit_Click"/>
                                    </td>
                                    
                                </tr>
                            </table>
                        
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">               
                    
                        

                </td>
            </tr>
        </table>
</asp:Content>


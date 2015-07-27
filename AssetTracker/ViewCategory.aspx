<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.master" AutoEventWireup="true" CodeFile="ViewCategory.aspx.cs" Inherits="ViewCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
            <tr>                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                     <asp:GridView ID="GridView1" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="categoryID" DataSourceID="viewCategoryDS">
                        <Columns>
                            <asp:BoundField DataField="categoryID" HeaderText="categoryID" ReadOnly="True" SortExpression="categoryID" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="PreferenceVendor" HeaderText="Preferred Vendor" SortExpression="PreferenceVendor" />
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
                    

                    <asp:SqlDataSource ID="viewCategoryDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT distinct c.[categoryID], c.[Description],  substring(
        (
            Select ','+V1.vendorName  AS [text()]
            From PreferenceVendor as V1
            Where V1.categoryID = c.categoryID
            ORDER BY V1.categoryID
            For XML PATH ('')
        ), 2, 1000) [PreferenceVendor] 
From PreferenceVendor, [Category] c"></asp:SqlDataSource>
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                   
                    

                </td>
            </tr>
        </table>
</asp:Content>


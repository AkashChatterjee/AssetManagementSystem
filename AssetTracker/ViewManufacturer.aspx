<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.master" AutoEventWireup="true" CodeFile="ViewManufacturer.aspx.cs" Inherits="ViewManufacturer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
            <tr>                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="ManufacturerName" DataSourceID="manDS">
                        <Columns>
                            <asp:BoundField DataField="ManufacturerName" HeaderText="ManufacturerName" ReadOnly="True" SortExpression="ManufacturerName" />
                            <asp:BoundField DataField="website" HeaderText="website" SortExpression="website" />
                            <asp:BoundField DataField="supportNumber" HeaderText="supportNumber" SortExpression="supportNumber" />
                            <asp:BoundField DataField="supportEmail" HeaderText="supportEmail" SortExpression="supportEmail" />
                            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
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
                    <asp:SqlDataSource ID="manDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [ManufacturerName], [website], [supportNumber], [supportEmail], [address], [isActive], [isBlacklisted], [description] FROM [Manufacturer]"></asp:SqlDataSource>
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    

                </td>
            </tr>
        </table>
</asp:Content>


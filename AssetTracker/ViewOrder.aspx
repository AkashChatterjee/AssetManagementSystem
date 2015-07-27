<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.master" AutoEventWireup="true" CodeFile="ViewOrder.aspx.cs" Inherits="ViewOrder" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
            <tr>                
                <td style="text-align:center; width:450px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <div style="display:none"><asp:Button ID="btndummy" runat="server" /></div>
                    <asp:scriptmanager id="ScriptManager1" runat="server">
                    </asp:scriptmanager>

                    
                    <asp:ModalPopupExtender runat="server" Drag="true" PopupControlID="Panel1" TargetControlID="btndummy" ID="popup1" BackgroundCssClass="ModalPopupBG" DropShadow="true">

                    </asp:ModalPopupExtender>

                    <asp:Panel runat="server" ID ="Panel1" CssClass="Popup">
                        <table>
                        <tr>
                            <th>
                                Order Details
                            </th>
                        </tr>
                        <tr>
                            <td style="text-align:center; width:100%">                               
                                <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
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
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="473px" Width="429px" />
                            </td>
                        </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                </td>
                            </tr>
                        <tr>
                            <td>
                                <asp:Button ID="done" runat="server" Text="Done" OnClick="done_Click" />
                            </td>
                        </tr>
                    </table>
                    </asp:Panel>
                    <style>
                         .grid:hover
                        {
                            cursor:pointer;
                        }

                        .ModalPopupBG
                        {
                            background-color: beige;
                            filter: alpha(opacity=50);
                            opacity: 0.5;
                        }
                        .Popup
                        {
                            border:outset;
                            background:white;
                            border-width:5px;
                            border-color:#0067b3;
                            border-radius:5px;
                        }
                    </style>
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataSourceID="orderViewDS" OnSelectedIndexChanged="indexChanged" OnRowDataBound="GridView1_RowDataBound" CssClass="grid">
                        <Columns>
                            <asp:BoundField DataField="orderID" HeaderText="orderID" SortExpression="orderID" />
                            <asp:BoundField DataField="orderDate" HeaderText="orderDate" SortExpression="orderDate"/>
                            <asp:BoundField DataField="warrantyID" HeaderText="warrantyID" SortExpression="warrantyID" />
                            <asp:BoundField DataField="amcID" HeaderText="amcID" SortExpression="amcID" />
                            <asp:BoundField DataField="vendorName" HeaderText="vendorName" SortExpression="vendorName" />
                            <asp:BoundField DataField="Total" HeaderText="Total Cost" SortExpression="Total" />
                            

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
                
                    <asp:SqlDataSource ID="orderViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT distinct [orderID], [orderDate], [warrantyID], [amcID], [vendorName], SUM(quantity*costPerItem) as 'Total' FROM [OrderInfo] group by orderID, orderDate, warrantyID, amcID, vendorName"></asp:SqlDataSource>
                
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    
                    

                </td>
            </tr>
        </table>
</asp:Content>


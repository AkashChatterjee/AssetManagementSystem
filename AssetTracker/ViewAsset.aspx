<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.master" AutoEventWireup="true" CodeFile="ViewAsset.aspx.cs" Inherits="ViewAsset" EnableEventValidation="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
            <tr>                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <div style="display:none"><asp:Button ID="btndummy" runat="server" /></div>
                    <asp:scriptmanager id="ScriptManager1" runat="server">
                    </asp:scriptmanager>

                    
                    <asp:ModalPopupExtender runat="server" Drag="true" PopupControlID="Panel1" TargetControlID="btndummy" ID="popup1" BackgroundCssClass="ModalPopupBG" DropShadow="true">

                    </asp:ModalPopupExtender>  

                    <asp:Panel runat="server" ID ="Panel1" CssClass="Popup">
                        <table style="width:100%;border-collapse:separate; border-spacing:1em">
                            <tr>
                                <th style="text-align:left">
                                    Currently Alloted to :
                                </th>
                                <td style="text-align:left">
                                    <asp:Label ID="lblNotAlloted" runat="server" ForeColor="Green"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    
                                    <asp:GridView ID="allotedGrid" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
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
                                <th style="text-align:left">
                                    Allocation History (If Any)
                                </th>
                                <td>
                                    <asp:Label ID="lblHistory" runat="server" ForeColor="Green"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="historyGrid" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
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
                                <td colspan="2">
                                    <asp:Button ID="done" runat="server" Text="Done" OnClick="done_Click"/>
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
                    
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="assetID" DataSourceID="assetViewDS" ForeColor="Black" GridLines="Horizontal" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="grid">
                        <Columns>
                            <asp:BoundField DataField="assetID" HeaderText="Asset ID" ReadOnly="True" SortExpression="assetID" />
                            <asp:BoundField DataField="serialNumber" HeaderText="Serial Number" SortExpression="serialNumber" />
                            <asp:BoundField DataField="typeID" HeaderText="Type ID" SortExpression="typeID" />
                            <asp:BoundField DataField="categoryID" HeaderText="Category ID" SortExpression="categoryID" />
                            <asp:BoundField DataField="ManufacturerName" HeaderText="Manufacturer" SortExpression="ManufacturerName" />
                            <asp:BoundField DataField="orderID" HeaderText="Order ID" SortExpression="orderID" />
                            <asp:BoundField DataField="repairHistoryID" HeaderText="Repair ID" SortExpression="repairHistoryID" />
                            <asp:BoundField DataField="Validity" HeaderText="Validity" SortExpression="Validity" />
                            <asp:BoundField DataField="ConfigurationID" HeaderText="ConfigurationID" SortExpression="ConfigurationID" />
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
                    <asp:SqlDataSource ID="assetViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT distinct [assetID], [serialNumber], c.[typeID], e.[categoryID], e.[ManufacturerName], [orderID], [repairHistoryID], [isAssigned], [Validity], a.[ConfigurationID] FROM [AssetMaster] a, [Type] e, [Configuration] c where e.typeID = c.typeID AND c.ConfigurationID = a.ConfigurationID"></asp:SqlDataSource>
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                   
                    

                </td>
            </tr>
        </table>
</asp:Content>


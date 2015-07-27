﻿ <%@ Page Title="" Language="C#" MasterPageFile="~/AddMaster.master" AutoEventWireup="true" CodeFile="AddAsset.aspx.cs" Inherits="AddAsset" %>
<%@ MasterType VirtualPath="~/AddMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
            <tr>                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <h2>Enter New Asset</h2>
                     <asp:Panel ID="Panel1" runat="server">
                    <table id="formtable" runat="server" style="width:100%; border-collapse:separate; border-spacing:1em">
                        <tr>
                           <th style="text-align:right">
                               Asset ID
                           </th>
                            <td colspan="2" style="text-align:left">:
                                <asp:TextBox ID="tbAssetID" runat="server" BorderStyle="Outset" placeholder="Asset ID" Height="22px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Serial Number
                            </th>
                            <td colspan="2" style="text-align:left">:
                                <asp:TextBox ID="tbSerial" runat="server" BorderStyle="Outset" placeholder="Serial Number" Height="22px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Asset Category 
                            </th>
                            <td>:

                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="categoryDropDS" DataTextField="categoryID" DataValueField="categoryID" OnSelectedIndexChanged="indexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select One--" Value="" />   
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="categoryDropDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [categoryID] FROM [Category]"></asp:SqlDataSource>

                            </td>
                            <td>
                                <asp:Button ID="newCategory" runat="server" Text="Create New" OnClick="newCategory_Click" BorderStyle="Outset" BorderWidth="3px"/>
                               
                            </td>
                         
                        </tr>                        
                        <tr>
                            <th style="text-align:right">
                                Asset Type 
                            </th>
                            <td>:                              

                                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="indexChanged2" AutoPostBack="true">
                                    <asp:ListItem Text="--Select One--" Value="" />
                                </asp:DropDownList>                               
                                 
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Create New" OnClick="Button1_Click" BorderStyle="Outset" BorderWidth="3px" />
                            </td>
                            
                         
                        </tr>
                        <tr>
                            <th style="text-align:right">
                                Select Configuration
                            </th>
                            <td>:
                                <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="configGridChange" AutoPostBack="true">
                                    <asp:ListItem Text="--Select One--" Value="" />
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="Button5" runat="server" Text="Create New" BorderStyle="Outset" BorderWidth="3px" OnClick="Button5_Click" />
                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align:center">

                                <asp:GridView ID="GridView1" runat="server" Visible="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%">
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
                            <th style="text-align:right">
                                Order Number 
                            </th>
                            <td>:
                                <asp:DropDownList ID="orderDropDown" runat="server" DataSourceID="orderDropDownDS" DataTextField="orderID" DataValueField="orderID" AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select One--" Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="orderDropDownDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT distinct [orderID] FROM [OrderInfo]"></asp:SqlDataSource>
                            </td>
                            <td>

                            </td>
                        </tr>
                       
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="82px" OnClick="btnReset_Click" />

                                <asp:Button ID="btnDone" runat="server" Text="Done" Width="82px" OnClick="btnDone_Click" />

                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="mainPageLabel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        
                        </table>
                        </asp:Panel>
                </td>
                <td style="width:500px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                   
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="-1">
                        <asp:View ID="ViewNewCategory" runat="server" EnableViewState="true">                            
                            <table style="width:100%; border:ridge; border-radius:10px; border-bottom-color:darkblue; border-collapse:separate; border-spacing:1em">
                                <tr>
                                    <th style="font-size:20px" colspan="2">
                                        Create New Category
                                    </th>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Category Name
                                    </th>
                                   <td style="text-align:left">:

                                       <asp:TextBox ID="tbnewCategory" runat="server" Width="195px" placeholder="Category Name" Height="22px"></asp:TextBox>


                                   </td>
                                </tr>
                                <tr>

                                    <td style="text-align:center" colspan="2">

                                        <asp:TextBox ID="newCatDescription" runat="server" TextMode="MultiLine" placeholder="Description" Height="42px" Width="234px"></asp:TextBox>

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
                                <td colspan="2" style="text-align:center">
                                    <asp:Button ID="btnConfigSubmit" runat="server" Text="Add" Width="85px" OnClick="btnConfigSubmit_Click" />
                                </td>
                            </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center">
                                        <asp:GridView ID="GridView2" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="rowDelete">
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
                                        <asp:Button ID="btnBack" runat="server" Text="Back" Width="78px" OnClick="btnBack_Click"/>
                                        <asp:Button ID="categorySubmit" runat="server" Text="Done" Width="78px" OnClick="categorySubmit_Click"/>
                                    </td>
                                    
                                </tr>
                            </table>
                        </asp:View>
                            
                        <asp:View ID="NewTypeView" runat="server" EnableViewState="true">
                            <table style="width:100%; border:ridge; border-radius:10px; border-bottom-color:darkblue;border-collapse:separate; border-spacing:1em ">
                                <tr>
                                    <th style="font-size:20px" colspan="2">
                                        Create New Type
                                    </th>
                                    
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Type Name
                                    </th>
                                   <td style="width:100%; text-align:left">:

                                       <asp:TextBox ID="tbType" runat="server" Width="156px" placeholder="Type Name" Height="22px"></asp:TextBox>


                                   </td>
                                   
                                </tr>
                                <tr>
                                    <th style="text-align:right; width:50%">
                                        Choose Category
                                    </th>
                                    <td>:
                                        <asp:DropDownList ID="newTypeDropDown" runat="server" DataSourceID="newtypecategoryDS" DataTextField="categoryID" DataValueField="categoryID" Width="109px" AppendDataBoundItems="true" Height="22px" OnSelectedIndexChanged="typeIndexChanged" AutoPostBack="true">
                                             <asp:ListItem Text="--Select One--" Value="" />
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="newtypecategoryDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [categoryID] FROM [Category]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right">
                                        Life (years)
                                    </th>
                                    <td style="text-align:left">:
                                        <asp:TextBox ID="newTypeLife" runat="server" placeholder="Life in years" Width="156px" Height="22px"></asp:TextBox>
                                    </td>
                                </tr>
                                  <tr>
                                      <td style="text-align:center" colspan="2">

                                        <asp:TextBox ID="newTypeDesc" runat="server" Width="234px" TextMode="MultiLine" placeholder="Description" Height="42px"></asp:TextBox>

                                    </td>
                                  </tr> 
                                <tr>
                                    <th style="text-align:right">
                                        Manufacturer :
                                    </th>
                                    <td>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="manufacturerDS" DataTextField="ManufacturerName" DataValueField="ManufacturerName" AppendDataBoundItems="true" Height="22px">
                                             <asp:ListItem Text="--Select One--" Value="" />
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="manufacturerDS" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [ManufacturerName] FROM [Manufacturer]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="2" style="text-align:center">
                               
                                        <asp:Panel ID="attributePanel" runat="server" Visible="false">
                                            <h3 style="text-decoration:underline;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Enter Asset Configuration</h3><br/>
                                        </asp:Panel>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center">
                                        <asp:Label ID="Label2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td style="text-align:center" colspan="2">
                                        <asp:Button ID="Button2" runat="server" Text="Back" Width="78px" OnClick="btnBack_Click"/>
                                        <asp:Button ID="typeSubmit" runat="server" Text="Done" Width="78px" OnClick="typeSubmit_Click" />
                                    </td>
                                    
                                </tr>
                            </table>
                        </asp:View>

                        <asp:View ID="ViewNewAttribute" runat="server">
                             <table style="width:100%; border:ridge; border-radius:10px; border-bottom-color:darkblue;border-collapse:separate; border-spacing:1em ">
                                <tr>
                                    <th style="font-size:20px" colspan="2">
                                        Add to existing type
                                    </th>
                                    
                                </tr>
                                
                                <tr>
                                    <th style="text-align:right; width:50%">
                                        Choose Category 
                                    </th>
                                    <td>:
                                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="newtypecategoryDS" DataTextField="categoryID" DataValueField="categoryID" Width="109px" AppendDataBoundItems="true" Height="22px" AutoPostBack="true" OnSelectedIndexChanged="configIndexChanged">
                                             <asp:ListItem Text="--Select One--" Value="" />
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:assetDBconnection %>" SelectCommand="SELECT [categoryID] FROM [Category]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:right; width:50%">
                                        Choose Type  
                                    </th>
                                    <td>:

                                        <asp:DropDownList ID="DropDownList6" runat="server" AppendDataBoundItems="true" Height="22px">
                                             <asp:ListItem Text="--Select One--" Value="" />
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="2" style="text-align:center">
                               
                                        <asp:Panel ID="Panel2" runat="server" Visible="false">
                                            <h3 style="text-decoration: underline;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Enter Asset Configuration</h3><br/>
                                        </asp:Panel>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center">
                                        <asp:Label ID="Label3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td style="text-align:center" colspan="2">
                                        <asp:Button ID="Button3" runat="server" Text="Back" Width="78px" OnClick="btnBack_Click"/>
                                        <asp:Button ID="Button4" runat="server" Text="Done" Width="78px" OnClick="Button4_Click" />
                                    </td>
                                    
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>

                </td>
            </tr>
        </table>
</asp:Content>


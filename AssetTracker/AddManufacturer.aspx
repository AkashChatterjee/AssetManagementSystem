<%@ Page Title="" Language="C#" MasterPageFile="~/AddMaster.master" AutoEventWireup="true" CodeFile="AddManufacturer.aspx.cs" Inherits="AddManufacturer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
            <tr>
                
                <td style="text-align:center; width:400px; padding-left:100px; border-top-width:2px; border-top-color:#0067b3; border-top-left-radius:5px; border-top:outset">
                    <h2>Enter New Manufacturer</h2>
                     
                        <table style="width:100%; border-collapse:separate; border-spacing:1em ">
                            <tr>
                                <th style="text-align:right">
                                    Manufacturer Name
                                </th>
                                <td style="text-align:left">:                                    
                                    <asp:TextBox ID="tbName" runat="server" BorderStyle="Outset"  Width="156px" placeholder="Manufacturer Name" Height="22px"></asp:TextBox>
                                                                      
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


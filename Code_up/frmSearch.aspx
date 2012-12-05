<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmSearch.aspx.cs" Inherits="frmSearch" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="TravelsStyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Panel ID="pnlSearch" runat="server" BorderColor="Gray" BorderWidth="1" Width="55%">
                            <table width="100%">
                                <tr style="height:35px; ">
                                    <td colspan="4" align="center" style="background-color:Silver; font-weight:bold; ">
                                        Check Availability
                                    </td>
                                </tr>
                                <tr style="height:50px; color:#666666; ">
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        <asp:RadioButton ID="rbtnSingle" runat="server" Text="Single Trip" Checked="true"
                                            GroupName="rbt" AutoPostBack="true" oncheckedchanged="rbtnSingle_CheckedChanged" />
                                    </td>
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        <asp:RadioButton ID="rbtnRound" runat="server" Text="Round Trip" 
                                            GroupName="rbt" AutoPostBack="true" oncheckedchanged="rbtnRound_CheckedChanged" />
                                    </td>
                                </tr>
                                <tr style="height:50px; color:#666666; ">
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        From:<br />
                                        <asp:DropDownList ID="ddlFrom" runat="server" Width="150px" AutoPostBack="true"
                                            onselectedindexchanged="ddlFrom_SelectedIndexChanged" />
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        To:<br />
                                        <asp:DropDownList ID="ddlTo" runat="server" Width="150px" />
                                    </td>
                                </tr>
                                <tr style="height:60px; color:#666666; ">
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        Onward Date:<br />
                                        <asp:TextBox ID="txtOnwardDate" runat="server" Width="150px" 
                                            AutoPostBack="true" ontextchanged="txtOnwardDate_TextChanged"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                            TargetControlID="txtOnwardDate" Format="yyyy.MM.dd">
                                        </cc1:CalendarExtender>
                                        <br />
                                        <asp:Label ID="lblOnward" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                    </td>
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        Return Date:<br />
                                        <asp:TextBox ID="txtReturnDate" runat="server" Width="150px" 
                                            AutoPostBack="true" ontextchanged="txtReturnDate_TextChanged" Enabled="false"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtReturnDate" Format="yyyy.MM.dd">
                                        </cc1:CalendarExtender>
                                        <br />
                                        <asp:Label ID="lblReturn" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                               <tr style="height:50px; color:#666666; ">
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        Coach Type:<br />
                                        <asp:DropDownList ID="ddlCoachType" runat="server" Width="100px" 
                                            onselectedindexchanged="ddlCoachType_SelectedIndexChanged" />
                                    </td>
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        <%--No. of Passengers:--%><br />
                                        <asp:DropDownList ID="ddlNoOfPassengers" runat="server" Width="35px" Visible="false" />
                                    </td>
                                </tr>
                                <tr style="height:35px; color:#666666; ">
                                    <td colspan="4" align="center">
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" 
                                            onclick="btnSearch_Click" />
                                    </td>
                                    
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


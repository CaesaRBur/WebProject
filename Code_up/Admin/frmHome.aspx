<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmHome.aspx.cs" Inherits="frmHome" Title="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet/deepakstyles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%">
    <tr><td style="width:45px"></td>
        <td>
            <asp:Panel ID="Panel1" runat="server" Width="100%" Height="100px">
            </asp:Panel>
            
        </td>
    </tr>
</table>
<table width="100%"><tr><td style="height:5px"></td></tr></table>

<table width="100%">
    <tr>
        <td align="center">
            <asp:Panel ID="pnl" runat="server" Width="70%" Height="200px" BackColor="AliceBlue">
                <table width="100%">
                    <tr>
                        <td colspan="2" style="height:45px; width:100%; color:Green; font-weight:bold; font-style:italic" valign="middle" align="center">
                            Please Login Here
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="color:Gray; font-weight:bold">
                            User Name:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        </td>
                    </tr><tr><td style="height:20px"></td></tr>
                    <tr>
                        <td align="right" style="color:Gray; font-weight:bold">
                            Password:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr><tr><td style="height:20px"></td></tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="buttonc" 
                                onclick="btnLogin_Click" />
                            <%--<asp:Button ID="btnRegister" runat="server" CssClass="buttonc" 
                                PostBackUrl="~/Admin/frmUserRegistration.aspx" Text="Register" 
                                onclick="btnRegister_Click" />--%>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="pnl" Corners="All" Radius="8" Color="AliceBlue" BorderColor="ActiveBorder">
            </cc1:RoundedCornersExtender>
        </td>
    </tr>
</table>

<table width="100%"><tr><td style="height:5px"></td></tr></table>
<table width="100%">
    <tr><td style="width:45px"></td>
        <td>
            <asp:Panel ID="Panel2" runat="server" Width="100%" Height="100px">
            </asp:Panel>
            
        </td>
    </tr>
</table>

</asp:Content>


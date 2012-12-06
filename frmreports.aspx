<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmreports.aspx.cs" Inherits="frmreports" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<br />
<br />
<table>
<tr>
<td>
Select Pnrno
</td>
<td>
<asp:DropDownList ID="ddlpnrno" runat="server">
</asp:DropDownList>
</td>
</tr>

<tr>
<td colspan="2">
<asp:Button ID="btngetdetails" runat="server" Text="Get details" 
        onclick="btngetdetails_Click" />
</td>
</tr>
</table>
<asp:Panel ID="pnldetails" runat="server" Visible="false">
<table width="50%">
<tr>
<td align="left">
<asp:Label ID="lblfirstname" runat="server" Text="Firstname"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblfirstnamevalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lbllastname" runat="server" Text="Lastname"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lbllastnamevalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lblfromcity" runat="server" Text="From City"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblfromcityvalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lbltocity" runat="server" Text="To City"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lbltocityvalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lblgender" runat="server" Text="Gender"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblgendervalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lblage" runat="server" Text="Age"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblagevalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lblseatno" runat="server" Text="Seat No"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblseatnovalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lbladdress" runat="server" Text="Address"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lbladdressvalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lblphoneno" runat="server" Text="Phone No"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblphonenovalue" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="left">
<asp:Label ID="lblemailid" runat="server" Text="Email ID"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblemailidvalue" runat="server"></asp:Label>
</td>
</tr>

</table>
<table>
<tr>
<td>
<asp:Button ID="btnprint" runat="server" Text="Print" onclick="btnprint_Click" />
</td>
</tr>
</table>
</asp:Panel>
</center>
</asp:Content>


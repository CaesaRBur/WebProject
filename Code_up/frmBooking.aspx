<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmBooking.aspx.cs" Inherits="frmBooking" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet/deepakstyles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
<table style="border-bottom-width:thin; border-bottom-color:Silver; border-bottom-style:solid; " width="100%">
            <tr style="height:50px;">
            <td></td>
            </tr>
            <tr>
                <td align="center" style="color:#0075BC; font-size:large; ">
                    Onward Journey From <asp:Label ID="lblFrom" runat="server"></asp:Label>
                 to <asp:Label ID="lblTo" runat="server"></asp:Label> on <asp:Label ID="lblDate" runat="server"></asp:Label> 
                </td>
            </tr>
        </table><br /><br />
<table width="100%">
    <tr>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Service:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblSvcNo" runat="server"></asp:Label>
        </td>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Coach Type:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblCoachName" runat="server"></asp:Label>
        </td>
    </tr><tr><td style="height:25px"></td></tr>
    <tr>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Mobile No:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblMobileNo" runat="server"></asp:Label>
        </td>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            EmailId:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblEmailId" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<br /><br />

<table width="100%">
    <tr>
        <td>
						<asp:datagrid id="dgdSeats" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="PowderBlue">
							<SelectedItemStyle CssClass="shead"></SelectedItemStyle>
							<AlternatingItemStyle CssClass="trdata2"></AlternatingItemStyle>
							<ItemStyle CssClass="trdata1"></ItemStyle>
							<HeaderStyle CssClass="shead"></HeaderStyle>
							<FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
							<Columns>
								
								<asp:BoundColumn HeaderText="Title" DataField="Title"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="First Name" DataField="FirstName"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Last Name" DataField="LastName"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Age" DataField="Age"></asp:BoundColumn>								
								<asp:BoundColumn HeaderText="Journey Date" DataField="journeydate"></asp:BoundColumn>								
								<asp:BoundColumn HeaderText="Boarding Point" DataField="BoardingPoint"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Seat No." DataField="SeatNo"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Total Fare" DataField="TotalFare"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
        </td>
    </tr>
</table>

<br />
<asp:Panel ID="pnlReturn" runat="server" Visible="false">
<table style="border-bottom-width:thin; border-bottom-color:Silver; border-bottom-style:solid; " width="100%">
            <tr style="height:50px;">
            <td></td>
            </tr>
            <tr>
                <td align="center" style="color:#0075BC; font-size:large; ">
                    Return Journey From <asp:Label ID="lblTo1" runat="server"></asp:Label>
                 to <asp:Label ID="lblFrom1" runat="server"></asp:Label> on <asp:Label ID="lblJourneyDate1" runat="server"></asp:Label> 
                </td>
            </tr>
        </table><br />
        <table width="100%">
    <tr>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Service:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblSvcNo1" runat="server"></asp:Label>
        </td>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Coach Type:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblCoachType1" runat="server"></asp:Label>
        </td>
    </tr><tr><td style="height:25px"></td></tr>
    <tr>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Mobile No:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblMobileNo1" runat="server"></asp:Label>
        </td>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            EmailId:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="lblEmailId1" runat="server"></asp:Label>
        </td>
    </tr>
</table>
        <table width="100%">
    <tr>
        <td>
						<asp:datagrid id="dgbSeatsReturn" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="PowderBlue">
							<SelectedItemStyle CssClass="shead"></SelectedItemStyle>
							<AlternatingItemStyle CssClass="trdata2"></AlternatingItemStyle>
							<ItemStyle CssClass="trdata1"></ItemStyle>
							<HeaderStyle CssClass="shead"></HeaderStyle>
							<FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
							<Columns>
								
								<asp:BoundColumn HeaderText="Title" DataField="Title"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="First Name" DataField="FirstName"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Last Name" DataField="LastName"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Age" DataField="Age"></asp:BoundColumn>	
								<asp:BoundColumn HeaderText="Journey Date" DataField="journeydate"></asp:BoundColumn>															
								<asp:BoundColumn HeaderText="Boarding Point" DataField="BoardingPoint"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Seat No." DataField="SeatNo"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Total Fare" DataField="TotalFare"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
        </td>
    </tr>
</table>
</asp:Panel>
<br />

<table width="100%">
    <tr>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Contact Phone number:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="Label5" runat="server" Text="91-98483-57578"></asp:Label>
        </td>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            COntact Person:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="Label6" runat="server" Text="Gowtham Kudumula"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            Authorized By:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="Label7" runat="server" Text="HoneypotIt"></asp:Label>
        </td>
        <td style="width:20%; color:Gray; font-weight:bold" align="right">
            EmailId:
        </td><td style="width:5%"></td>
        <td style="width:25%; color:Green; font-weight:bold">
            <asp:Label ID="Label8" runat="server" Text="admin@honeypotit.com"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="height:30px">
        
        </td>
    </tr>
</table>
<br />
<table width="100%">
    <tr>
        <td align="center">
            <asp:Button ID="btnPrint" runat="server" Text="Print" 
                onclick="btnPrint_Click" />
            <asp:Button ID="btnNewSearch" runat="server" Text="New Search" PostBackUrl="~/frmSearch.aspx" />
        </td>
    </tr>
</table>
<table width="100%">
    <tr>
        <td style="height:50px">
        </td>
    </tr>
</table>
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


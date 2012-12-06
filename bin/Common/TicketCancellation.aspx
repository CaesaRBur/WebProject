<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TicketCancellation.aspx.cs" Inherits="Common_TicketCancellation" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="up1" runat="server">
<ContentTemplate>
<center>
    
        <table width="40%" border="1">
        <tr>
            <td bgcolor="#3366ff">
            <asp:Label ID="lblTicketcancellation" runat="server" Text="Ticket Cancellation" 
                    CssClass="FontBoldwhite"></asp:Label>
            </td>
        </tr>
    </table>
</center>
    <center>
        <table width="40%">
            <tr>
                <td width="50%" align="right">
                    <asp:Label ID="Label1" runat="server" CssClass="FontBold" Text="Enter PNR No:"></asp:Label>
                    &nbsp;</td>
                <td width="50%" align="left">
                    <asp:TextBox ID="txtPnrno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="50%" align="right">
                    <asp:Label ID="Label2" runat="server" CssClass="FontBold" Text="First Name: "></asp:Label>
                </td>
                    <td width="50%" align="left"> 
                    <asp:TextBox ID="txtFirstname" runat="server"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td width="50%" align="right">
                    <asp:Label ID="Label3" runat="server" CssClass="FontBold" Text="Last Name: "></asp:Label>
                </td>
                    <td width="50%" align="left">
                    <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox>
                    </td>
            </tr>
                <tr>
                    <td width="50%" align="left">
                        <asp:Label ID="Label4" runat="server" Text="Date Of Journey:"></asp:Label>
                        &nbsp;</td>
                    <td width="50%" align="left">
                    <asp:TextBox ID="txtDOJ" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="imgbtnJourneydate" runat="server" ImageUrl="~/Images/cal.gif" />
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                            PopupButtonID="imgbtnJourneydate" PopupPosition="Right" 
                            TargetControlID="txtDOJ">
                        </cc1:CalendarExtender>
                    </td>
                </tr>
        </table>
    </center>
    <center>
        <table width="40%">
            <tr>
                <td align="center">
                <asp:Button ID="btnSearch" runat="server" Text="Search"  />
                </td>
            </tr>
        </table>
    </center>
            <center>
                <asp:Panel ID="panel" runat="server" Visible="false">
                 <table>
            <tr>
             <td>
            <asp:GridView ID="gvTicketcancellationdetails" runat="server" CellPadding="4" 
                     ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                     <Columns>
                     <asp:BoundField HeaderText="PNR No" DataField="pnrNo" />
                     <asp:BoundField  HeaderText="ServiceNo" DataField="svcNo"/>
                     <asp:BoundField HeaderText="City From" DataField="fromcity" />
                     <asp:BoundField HeaderText="City To" DataField="tocity" />
                     <asp:BoundField HeaderText="First Name" DataField="firstName" />
                     <asp:BoundField HeaderText="Last Name" DataField="lastName" />
                     <asp:BoundField HeaderText="Gender" DataField="gender" />
                     <asp:BoundField HeaderText="Seat No" DataField="seatNo" />
                     <asp:BoundField HeaderText="Fare" DataField="fare" />
                     <asp:BoundField HeaderText="Date Of Journey" DataField="journeyDate" />
                     <asp:BoundField HeaderText="Dep Time" DataField="depTime" />
                     </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
                 </asp:GridView>    
            </td>
        </tr>
            <tr>
                <td>
                    <asp:Button ID="btnCancelyourticket" runat="server" Text="Cancel Your Ticket" 
                        />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTicket" runat="server"></asp:Label>
                </td>
            </tr>
    </table>
    </asp:Panel>
    </center>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


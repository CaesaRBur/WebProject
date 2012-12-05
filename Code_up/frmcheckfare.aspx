<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmcheckfare.aspx.cs" Inherits="frmcheckfare" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<center>
    <table width="40%" border="1">
    <tr>
        <td bgcolor="#3399ff">
        <asp:Label ID="lblCheckfare" runat="server" Text="Check Fare">
        </asp:Label>
        </td>
    </tr>
    </table>
    <table width="40%">
    <tr>
    <td width="50%" align="left">
    Source:
    </td>
    <td width="50%" align="left">
    <asp:DropDownList ID="ddlSource" runat="server" Width="150px" AutoPostBack="True" 
            onselectedindexchanged="ddlSource_SelectedIndexChanged">
    
    </asp:DropDownList>
        <asp:RequiredFieldValidator ID="reqSource" runat="server" 
            ControlToValidate="ddlSource" Display="None" 
            ErrorMessage="<b>Please Select Source<b>" InitialValue="-Select-" 
            SetFocusOnError="True"></asp:RequiredFieldValidator>
        <cc1:ValidatorCalloutExtender ID="vcesource" runat="server" TargetControlID="reqSource">
        </cc1:ValidatorCalloutExtender>
    </td>
    </tr>
        <tr>
            <td width="50%" align="left">
            From:
            </td>
            <td width="50%" align="left">
            <asp:DropDownList ID="ddlDestination" runat="server" Width="150px">
           
            </asp:DropDownList>
                <asp:RequiredFieldValidator ID="reqDestination" runat="server" 
                    ControlToValidate="ddlDestination" Display="None" 
                    ErrorMessage="<b>Please Select Destination<b>" InitialValue="-Select-" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="vcedestination" runat="server" TargetControlID="reqDestination">
                </cc1:ValidatorCalloutExtender>
                     </td>
        </tr>
        <tr>
            <td width="50%" align="left">
            Select Coach
            </td>
            <td width="50%" align="left">
            <asp:DropDownList ID="ddlcoach" runat="server"></asp:DropDownList>
           
               
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ddlcoach" ErrorMessage="Please select coach" 
                    InitialValue="-Select-"></asp:RequiredFieldValidator>
           
               
                
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table width="40%">
    <tr>
    <td align="center">
    <asp:Button ID="btnSearch" runat="server" Text="Search" 
            onclick="btnSearch_Click1" />
        &nbsp;</td>
    </tr>
    </table>
    </center>
    <center>
    <asp:Panel ID="panelCheckfaredetails" runat="server" Visible="false">
    <table>
        <tr>
            <td>
            Check Fare from&nbsp;<asp:Label ID="lblSource" runat="server" ForeColor="#3366ff">&nbsp;&nbsp;to&nbsp;&nbsp;</asp:Label>
                &nbsp;to <asp:Label ID="lblDestination" runat="server" ForeColor="#3366ff"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
    <tr>
    <td>
    <asp:GridView ID="gvCheckfaredetails" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        <asp:BoundField HeaderText="Service No" DataField="svcno" />
        <asp:BoundField HeaderText="From" DataField="fromcityname" />
        <asp:BoundField HeaderText="To" DataField="tocityname" />
        <asp:BoundField HeaderText="Coach Type" DataField="COACHNAME" />
        <asp:BoundField HeaderText="Dep.Time" DataField="depTime" />
        <asp:BoundField HeaderText="App.JourneyTime" DataField="approxJourneyTime" />
        <asp:BoundField HeaderText="Fare" DataField="fare" />
        <asp:BoundField HeaderText="No Of Seats" DataField="noOfSeats" />
        <asp:BoundField HeaderText="Coach Id" DataField="coachid" Visible="false" />
        </Columns>
        </asp:GridView>
    </td>
    </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblErrorMsg" runat="server" Text="Label" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
    
    </center>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


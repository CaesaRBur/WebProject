<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Schedules.aspx.cs" Inherits="Schedules" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="up1" runat="server">
<ContentTemplate>
<center>

<asp:GridView ID="GVSchedules" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False"  Width="100%">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#EFF3FB" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
    <Columns>
    <asp:BoundField HeaderText="Service No" DataField="svcNo" />
    <asp:BoundField HeaderText="Coach Type" DataField="coachName" />
    <asp:BoundField HeaderText="From" DataField="fromcityname" />
    <asp:BoundField HeaderText="To" DataField="tocityname" />
    <asp:TemplateField>
        <HeaderTemplate>
            Journey Time
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Label ID="lblTime" runat="server" Text='<%# GetTime(Eval("depTime")) %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    
    <asp:BoundField HeaderText="ApproxJourneyTime" DataField="approxJourneyTime"/>
      </Columns>
    </asp:GridView>
</center>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


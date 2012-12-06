<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmSelectCoach.aspx.cs" Inherits="frmSelectCoach" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>    
    <table width="100%"><tr><td style="height:70px; color:Green; font-weight:bold; font-size:larger" valign="middle">SELECT COACH</td></tr></table>
    <asp:Panel ID="pnlOnward" runat="server" width="100%">
    <table width="100%">
        <tr>
            <td style="font-weight:bold; color:#0075BC" align="center">
                Onward Journey Select a Coach from 
                <asp:Label ID="lblFrom" runat="server"></asp:Label>
                 to <asp:Label ID="lblTo" runat="server"></asp:Label> on <asp:Label ID="lblJourneyDate" runat="server"></asp:Label> 
            </td>
        </tr>
    </table>
    
    <table width="100%">
        <tr>
            <td>
                <asp:GridView ID="gvSelectCoach" runat="server" AutoGenerateColumns="false" Width="100%">
                <HeaderStyle BackColor="#0075BC" Font-Bold="true" ForeColor="White" />
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="0px">
                        <ItemTemplate>
							<input type="radio" name="optCategoryID" value='<%# DataBinder.Eval(Container.DataItem,"svcNo")%>'>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText ="ServiceNo" DataField="svcNo" />
                    <asp:BoundField HeaderText ="Coach Type" DataField="CoachName" />
                    <asp:BoundField HeaderText ="Fare" DataField="fare" />
                    <asp:BoundField HeaderText ="Availability" DataField="availability" />
                    <asp:BoundField HeaderText ="Dept Time" DataField="depTime" />
                    <asp:BoundField HeaderText ="Approx Journey Time" DataField="approxJourneyTime" />
                </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="height:40px">            
            </td>
        </tr>        
    </table>
    </asp:Panel>
    <asp:Panel ID="pnlNo1" runat="server" Width="100%" Visible="false">
        <table width="100%">
            <tr>
                <td align="center" valign="middle" style="height:50px; color:Green; font-weight:bold; ">
                    -- No Service Available --
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="pnlReturn" runat="server" width="100%" Visible="false">
    <table width="100%">
        <tr>
            <td style="font-weight:bold; color:#0075BC" align="center">
                Return Journey Select a Coach from 
                <asp:Label ID="lblReturnFrom" runat="server"></asp:Label>
                 to <asp:Label ID="lblReturnTo" runat="server"></asp:Label> on <asp:Label ID="lblReturnJourneyDate" runat="server"></asp:Label> 
            </td>
        </tr>
    </table>
    
    <table width="100%">
        <tr>
            <td>
                <asp:GridView ID="gvSelectReturnCoach" runat="server" AutoGenerateColumns="false" Width="100%">
                <HeaderStyle BackColor="#0075BC" Font-Bold="true" ForeColor="White" />
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="0px">
                        <ItemTemplate>
							<input type="radio" name="optReturnCategoryID" value='<%# DataBinder.Eval(Container.DataItem,"svcNo")%>'>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText ="ServiceNo" DataField="svcNo" />
                    <asp:BoundField HeaderText ="Coach Type" DataField="CoachName" />
                    <asp:BoundField HeaderText ="Fare" DataField="fare" />
                    <asp:BoundField HeaderText ="Availability" DataField="availability" />
                    <asp:BoundField HeaderText ="Dept Time" DataField="depTime" />
                    <asp:BoundField HeaderText ="Approx Journey Time" DataField="approxJourneyTime" />
                </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="height:40px">            
            </td>
        </tr>
        
    </table>
    </asp:Panel>
    <asp:Panel ID="pnlNo" runat="server" Width="100%" Visible="false">
        <table width="100%">
            <tr>
                <td align="center" valign="middle" style="height:50px; color:Green; font-weight:bold; ">
                    -- No Service Available --
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Button ID="btnContinue" runat="server" Text="Continue" 
                    onclick="btnContinue_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="New Search" PostBackUrl="~/frmSearch.aspx" />
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


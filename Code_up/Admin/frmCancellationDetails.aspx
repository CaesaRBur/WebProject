<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="true" AutoEventWireup="true" CodeFile="frmCancellationDetails.aspx.cs" Inherits="Admin_frmCancellationDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <%--Main Table--%>
        <table width="100%">
        <tr>
            <td width="100%">
            <table width="100%">
            <tr>
                <td style="width:50%" align="right">
                    <asp:Label ID="lblSelectCoachHeading" runat="server" Text="Coach Name" CssClass="FontBold"></asp:Label>
                </td>
                <td style="width:50%">
                        <asp:DropDownList ID="ddlCoaches" runat="server" AppendDataBoundItems="True" 
                    onselectedindexchanged="ddlCoaches_SelectedIndexChanged" 
                    AutoPostBack="True" >
                    <asp:ListItem>Select Coach</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            </table>
                
                
            </td>
        </tr>
            <tr>
                <td align="center" style="width:100%">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <asp:DataList ID="dlCancellationDetails" runat="server" DataKeyField="id" 
                        oneditcommand="dlCancellationDetails_EditCommand" 
                        onitemcommand="dlCancellationDetails_ItemCommand" CellPadding="4" 
                        ForeColor="#333333" oncancelcommand="dlCancellationDetails_CancelCommand" 
                        onupdatecommand="dlCancellationDetails_UpdateCommand">
                        
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        
                        <HeaderTemplate>
                                   <table width="100%" align="center">
                                        <tr>
                                                <td style="width:20%" align="center">
                                                        <asp:Label ID="lblDaysLeftHeading" runat="server" Text="Days Left"></asp:Label>
                                                </td>
                                                <td style="width:60%" align="center">
                                                        <asp:Label ID="lblCancellationPercentHeading" runat="server" Text="Cancellation Percent"></asp:Label>
                                                </td>
                                                <td style="width:20%">
                                                </td>
                                        </tr>
                                    </table>
                        </HeaderTemplate>
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table width="100%" align="center">
                                <tr>
                                    <td style="width:20%" align="center">
                                        <asp:Label ID="lblDaysLeft" runat="server" Text='<%# Eval("daysLeft") %>'></asp:Label>
                                    </td>
                                    <td style="width:60%" align="center">
                                            <asp:Label ID="lblCancellationPercent" runat="server" Text='<%# Eval("cancellationPercent") %>'></asp:Label>
                                    </td>
                                    <td style="width:20%" align="center">
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit"></asp:LinkButton >
                                    </td>
                                </tr>
            
                            </table>                                
                        </ItemTemplate>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingItemStyle BackColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        <EditItemTemplate>
                            <table width="100%" align="center">
                                <tr>
                                    <td style="width:20%" align="center">
                                            <asp:Label ID="lblDaysLeft" runat="server" Text='<%# Eval("daysLeft") %>'></asp:Label>
                                    </td>
                                    <td style="width:60%" align="center">
                                            <asp:TextBox ID="txtCancellationPercentage" runat="server" Text='<%# Eval("cancellationPercent") %>' Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="width:20%" align="center">
                                            <table>
                                                    <tr>
                                                        <td>
                                                                <asp:LinkButton ID="lbtnUpdate"  runat="server"  CommandName="update">Update</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                                <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                    
                    
                                    </td>
                                </tr>
            
                             </table>
                        </EditItemTemplate>
                    </asp:DataList>
                </td>
           </tr>
        </table>
        
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


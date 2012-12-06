<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmAddCoached.aspx.cs" Inherits="Admin_frmAddCoached" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td style="width:100%">
                        <table  width="100%">
                        <tr>
                            <td align="center" valign="middle">
                                <asp:Label ID="lblAddCoach" runat="server" Text="To add a Coach  " CssClass="FontBold"></asp:Label>
                                <asp:Button ID="btnAddCoach" runat="server" Text="Click Here" 
                                    onclick="btnAddCoach_Click"   />
                            </td>
                        </tr>
                        <tr>
                                <td align="center">
                                    <asp:Label ID="lblAddCoachDesc" runat="server" Text="After clicking on the button go to the end of the list u can add Coach Id,CaochName and agent Percentage" CssClass="FontDesription"></asp:Label>   
                                </td>
                        </tr>
            
                    </table>
                    </td>
                </tr>
                    
                <tr>
                    <td style="width:100%">
                            <table width="100%">
                                    <tr>
                                        <td style="width:15%">
                            
                                        </td>
                                        <td style="width:70%">
                                                    
                                                    
                                            <asp:DataList ID="dlCoaches" runat="server"  Width="100%" CellPadding="4"  DataKeyField="id"
                                                ForeColor="#333333" oneditcommand="dlCoaches_EditCommand" 
                                                oncancelcommand="dlCoaches_CancelCommand" 
                                                onupdatecommand="dlCoaches_UpdateCommand">
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderTemplate>
                                                        <table width="100%">
                                                                 <tr>
                                                                        <td style="width:10%">
                                                                        <asp:Label ID="lblSNoHeader" runat="server" Text="S.No"></asp:Label>
                                                                        </td>
                                                                         <td style="width:20%" align="left">
                                                                            <asp:Label ID="lblCoachId" runat="server" Text="Coach Id"></asp:Label>
                                                                                
                                                
                                                                        </td>
                                                                        <td style="width:30%" align="left">
                                                                                    <asp:Label ID="lblCoachName" runat="server" Text="Coach Name"></asp:Label>
                                                                                    
                                                                                    
                                                                        </td>
                                                                        <td  style="width:15%" align="center">
                                                                            <asp:Label ID="lblPerAgent" runat="server" Text="Agent Commission"></asp:Label>
                                                                            
                                                                        </td>
                                                                        <td style="width:15%" align="center">
                                                                            <asp:Label ID="lblTotalCoaches" runat="server" Text="Total Coaches"></asp:Label>
                                                                        </td>
                                                                            
                                                                        <td style="width:10%"> 
                                                                            
                                                                        </td>
                                                                </tr>
                                                        </table>
                                                </HeaderTemplate>
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <ItemTemplate>
                                                    <table width="100%">
                                                                <tr>
                                                                    <td style="width:10%">
                                                                    <asp:Label ID="lblSNoHeader" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                                    </td>
                                                                     <td style="width:20%">
                                                                            <asp:Label ID="lblCoachId" runat="server" Text='<%# Eval("coachId") %>'></asp:Label>
                                                                                
                                                
                                                                        </td>
                                                                        <td style="width:30%">
                                                                                    <asp:Label ID="lblCoachName" runat="server" Text='<%# Eval("coachName") %>'></asp:Label>
                                                                                    
                                                                                    
                                                                        </td>
                                                                        <td  style="width:15%" align="center">
                                                                            <asp:Label ID="lblPerAgent" runat="server" Text='<%# Eval("perAgent") %>'></asp:Label>
                                                                            
                                                                        </td>
                                                                        <td style="width:15%" align="center">
                                                                            <asp:Label ID="lblTotalCoaches" runat="server" 
                                                                                Text='<%# Eval("TotalNoOnCoach") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width:10%" align="right"> 
                                                                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                                                        </td>
                                                                </tr>
                                                        </table>
                                                </ItemTemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <AlternatingItemStyle BackColor="White" />
                                                <ItemStyle BackColor="#EFF3FB" />
                                                <EditItemTemplate>
                                                         <table width="100%">
                                                                <tr>
                                                                    <td style="width:10%">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                                    </td>
                                                                     <td style="width:20%">
                                                                            <asp:TextBox ID="txtCoachId" runat="server"   Width="60px" 
                                                                                Text='<%# Eval("coachId") %>'></asp:TextBox>
                                                                                
                                                
                                                                        </td>
                                                                        <td style="width:30%">
                                                                                    <asp:TextBox ID="txtCoachName" runat="server"   Width="120px" 
                                                                                        Text='<%# Eval("coachName") %>'></asp:TextBox>
                                                                                    
                                                                                    
                                                                        </td>
                                                                        <td  style="width:15%" align="center">
                                                                            <asp:TextBox ID="txtPerAgent" runat="server" Width="50px" Text='<%# Eval("perAgent") %>'></asp:TextBox>
                                                                            
                                                                        </td>
                                                                        <td style="width:15%" align="center">
                                                                            <asp:TextBox ID="txtTotalNoOnCoaches" runat="server" Width="50px" Text='<%# Eval("TotalNoOnCoach") %>' ></asp:TextBox>
                                                                        </td>
                                                                        <td style="width:10%" align="right"> 
                                                                            <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="update">update</asp:LinkButton>
                                                                            <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="cancel">cancel</asp:LinkButton>
                                                                        </td>
                                                                </tr>
                                                        </table>
                                                        
                                                </EditItemTemplate>
                                            </asp:DataList>
                                                    
                                                    <asp:Panel ID="pnlAddCoach" runat="server" Visible="False" 
                                                BackColor="#507CD1" Font-Bold="True" ForeColor="White">
                                                        <table width="100%">
                                                                <tr>
                                                                        <td style="width:10%">
                                                
                                                                        </td>
                                                                        <td style="width:20%" valign="top">
                                                                                <asp:TextBox ID="txtCoachIDFooter" runat="server"   Width="60px"></asp:TextBox>
                                                                               <br /> 
                                                                            <asp:RequiredFieldValidator ID="rfvCoachIDFooter" runat="server" 
                                                                                    ErrorMessage="* Please enter CoachID" ControlToValidate="txtCoachIDFooter" 
                                                                                    Display="Dynamic" Font-Bold="False" ValidationGroup="CheckValues"></asp:RequiredFieldValidator>
                                                
                                                                        </td>
                                                                        <td style="width:30%" valign="top">
                                                                            <asp:TextBox ID="txtCoachName" runat="server"></asp:TextBox>
                                                                            <br />
                                                                            <asp:RequiredFieldValidator ID="rfvCoachName" runat="server" 
                                                                                ErrorMessage="* Please select a coach" Display="Dynamic" 
                                                                                ControlToValidate="txtCoachName" 
                                                                                Font-Bold="False" ValidationGroup="CheckValues"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        <td  style="width:15%" align="center" valign="top">
                                                                            <asp:TextBox ID="txtperAgentFooter" runat="server" Width="50px"></asp:TextBox>
                                                                            <br />
                                                                            <asp:RangeValidator ID="rvperAgentFooter" runat="server" 
                                                                                ErrorMessage="*Enter Agent commision" ControlToValidate="txtperAgentFooter" 
                                                                                MinimumValue=0 MaximumValue=100 Type="Integer" Font-Bold="False" 
                                                                                ValidationGroup="CheckValues" Display="Dynamic"></asp:RangeValidator>
                                                                            
                                                                        </td>
                                                                        <td style="width:15%" align="center" valign="top">
                                                                            <asp:TextBox ID="txtTotalCoachesFooter" runat="server" Width="35px"></asp:TextBox>
                                                                            <br />
                                                                            <asp:RequiredFieldValidator ID="rfvTotalCoachesFooter" runat="server" 
                                                                                ErrorMessage="*please enter no of coaches" 
                                                                                ControlToValidate="txtTotalCoachesFooter" Display="Dynamic" 
                                                                                Font-Bold="False" ValidationGroup="CheckValues"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td style="width:10%" align="right" valign="top"> 
                                                                            <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" 
                                                                                ValidationGroup="CheckValues" style="margin-left: 0px"   />
                                                                        </td>
                                                                </tr>
                                                        </table>
                                                    </asp:Panel>
                                        </td>
                       
                                        <td style="width:15%">
                            
                                        </td>
                                    </tr>
                            </table>
                        </td>
                </tr>
                   
                <tr>
                    <td style="width:100%">
                        <asp:Label ID="lblErrorMessage" runat="server" ></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


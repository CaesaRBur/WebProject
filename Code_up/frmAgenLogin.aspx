<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmAgenLogin.aspx.cs" Inherits="frmAgenLogin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
        <center>
            <asp:Panel ID="pnlTable" runat="server" Width="300px">
            
            <table width="100%">
                                <tr style="height:35px; ">
                                    <td colspan="4" align="center" style="background-color:Silver; font-weight:bold; ">
                                         Agent Login
                                    </td>
                                </tr>
                                <tr style="height:50px; color:#666666; ">
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        UserName:
                                    </td>
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height:50px; color:#666666; ">
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        Password
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height:60px; color:#666666; ">
                                    <td style="width:20px"></td>
                                    <td align="right">
                                        <asp:Button ID="btnSignIn" runat="server" Text="SignIn" 
                                            onclick="btnSignIn_Click" />                                 
                                        
                                    </td>
                                    <td style="width:20px"></td>
                                    <td align="left">
                                        <asp:Label ID="lblErrorMessage" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                               
                            </table>
             </asp:Panel>
        </center>
    
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


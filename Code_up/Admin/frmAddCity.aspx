<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmAddCity.aspx.cs" Inherits="Admin_Default" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table width="100%">
            <tr>
                <td>
                    <table  width="100%">
                        <tr>
                            <td align="center" valign="middle">
                                <asp:Label ID="lblAddCity" runat="server" Text="To add a city  " CssClass="FontBold"></asp:Label>
                                <asp:Button ID="btnAddCity" runat="server" Text="Click Here" onclick="btnAddCity_Click" 
                                    />
                            </td>
                        </tr>
                        <tr>
                                <td align="center">
                                    <asp:Label ID="lblAddCityDesc" runat="server" Text="After clicking on the button go to the end of the list u can add there city Id and city name" CssClass="FontDesription"></asp:Label>   
                                </td>
                        </tr>
            
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width:100%" align="center">
                    <table width="100%">
                        <tr>
                            <td style="width:20%">
                            </td>
                        </tr>
                         <tr>
                            <td style="width:60%">
                                     <asp:DataList ID="dlCities" runat="server" DataKeyField="id" CellPadding="4" 
                                            ForeColor="#333333" onupdatecommand="dlCities_UpdateCommand"  
                                         Width="40%" oneditcommand="dlCities_EditCommand" 
                                         oncancelcommand="dlCities_CancelCommand">
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderTemplate>
                                                              <table  width="100%">
                                                                   <tr>
                                                                        <td style="width:10%">
                                                                            <asp:Label ID="lblSNOHeading" runat="server" Text="S.No"></asp:Label>
                                                                        </td>
                                                                        <td style="width:30%" align="left">
                                                                            <asp:Label ID="lblCityIdHeading" runat="server" Text="CityId"></asp:Label>
                                                                        </td>
                                                                        <td style="width:40%" align="left">
                                                                            <asp:Label ID="lblCityNameHeading" runat="server" Text="City Name"></asp:Label>
                                                                        </td>
                                                                        <td style="width:20%">
                                                                        </td>
                                                                    </tr>
                                                            </table>  
                                                        </HeaderTemplate>
                                                                
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                    <tr>
                                                                        <td style="width:10%">
                                                                            <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width:30%" align="left">
                                                                            <asp:Label ID="lblCityId" e runat="server" Text='<%# Eval("cityId") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width:40%" align="left">
                                                                            <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("cityName") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width:20%">
                                                                            <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                        </ItemTemplate>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <AlternatingItemStyle BackColor="White" />
                                                        <ItemStyle BackColor="#EFF3FB" />
                                                        <EditItemTemplate>
                                                             <table  width="100%">
                                                                    <tr>
                                                                        <td style="width:10%">
                                                                            <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width:30%" align="left">
                                                                            <asp:TextBox ID="txtCityId" ReadOnly="true" runat="server" Text='<%# Eval("cityId") %>' Width="50px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="width:40%" align="left">
                                                                            <asp:TextBox ID="txtCityName" runat="server" Text='<%# Eval("cityName") %>' Width="100px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="width:20%">
                                                                            <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="update">update</asp:LinkButton>
                                                                            <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                            </table>
                                                        </EditItemTemplate>
                                                        
                                </asp:DataList>
                                
                                                            <asp:Panel ID="pnlInsert" runat="server" Visible="false">
                                                                        <table width="40%" style="background-color:#507CD1">
                                                                            <tr>
                                                                                <td style="width:10%">
                                                                                </td>
                                                                            
                                                                                <td style="width:30%" align="left">
                                                                                    <asp:TextBox ID="txtCityId" runat="server" Width="50px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RequiredFieldValidator ID="rfvCityId" runat="server" ControlToValidate="txtCityId"
                                                                                        ErrorMessage="*Please enter CityId" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            
                                                                                <td style="width:40%" align="left">
                                                                                    <asp:TextBox ID="txtCityName" runat="server" Width="100px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RequiredFieldValidator ID="rfvCityName" runat="server" ControlToValidate="txtCityName"
                                                                                        ErrorMessage="*Please enter City Name" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            
                                                                                <td style="width:20%">
                                                                                    <asp:Button ID="btnInsert" runat="server" Text="Insert" 
                                                                                        onclick="btnInsert_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                            </asp:Panel>
                                                        
                                
                            </td>
                        </tr>
                         <tr>
                            <td style="width:20%">
                            </td>
                        </tr>
                    </table>
                    
                   
                </td>
            </tr>
            <tr>
                <td align="center">
                        <asp:Label ID="lblErrorMessage" runat="server" ></asp:Label>
                 </td>
            </tr>
        </table>
</ContentTemplate>
     </asp:UpdatePanel>

    
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmSelectSeatReturn.aspx.cs" Inherits="frmSelectSeatReturn" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet/deepakstyles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <table style="border-bottom-width:thin; border-bottom-color:Silver; border-bottom-style:solid; " width="100%">
            <tr style="height:50px;">
            <td></td>
            </tr>
            <tr>
                <td align="center" style="color:#0075BC; font-size:large; ">
                    Return Journey From <asp:Label ID="lblFrom" runat="server"></asp:Label>
                 to <asp:Label ID="lblTo" runat="server"></asp:Label> on <asp:Label ID="lblDate" runat="server"></asp:Label> 
                </td>
            </tr>
        </table>
        
        <table style="border-bottom-width:thin; border-bottom-color:Silver; border-bottom-style:solid; " width="100%">
            <tr style="height:20px;">
            <td></td>
            </tr>
            <tr>
                <td align="center" style="color:#0075BC; font-size:large; width:50% ">
                    Seat Layout
                </td>
                <td align="center" style="color:#0075BC; font-size:large; width:50% ">
                    Boarding Point Details
                </td>
            </tr>
        </table><br />
        <table width="100%">
            <tr>
                <td style="width:50%">
                    <table>   
                        <tr>
                            <td style="width:25px; height:25px; "><asp:ImageButton ID="DRV" runat="server" Height="20px" Width="20px" ImageUrl="~/Images/Driver.gif" ToolTip="Driver" Enabled="false" /></td>
                            <td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid  ">
                                <asp:ImageButton ID="S1D" runat="server" Height="20px" Width="20px" onclick="img1_Click" ToolTip="1D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S2D" runat="server" Height="20px" Width="20px" onclick="img2_Click" ToolTip="2D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S3D" runat="server" Height="20px" Width="20px" onclick="img3_Click" ToolTip="3D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S4D" runat="server" Height="20px" Width="20px" onclick="img4_Click" ToolTip="4D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S5D" runat="server" Height="20px" Width="20px" onclick="img5_Click" ToolTip="5D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S6D" runat="server" Height="20px" Width="20px" onclick="img6_Click" ToolTip="6D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S7D" runat="server" Height="20px" Width="20px" onclick="img7_Click" ToolTip="7D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S8D" runat="server" Height="20px" Width="20px" onclick="img8_Click" ToolTip="8D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S9D" runat="server" Height="20px" Width="20px" onclick="img9_Click" ToolTip="9D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S10D" runat="server" Height="20px" Width="20px" onclick="img10_Click" ToolTip="10D" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S11D" runat="server" Height="20px" Width="20px" onclick="img11_Click" ToolTip="11D" ImageUrl="~/Images/Available.gif" /></td>
                        </tr>
                        <tr><td></td>
                            <td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S1C" runat="server" Height="20px" Width="20px" onclick="img12_Click" ToolTip="1C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S2C" runat="server" Height="20px" Width="20px" onclick="img13_Click" ToolTip="2C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S3C" runat="server" Height="20px" Width="20px" onclick="img14_Click" ToolTip="3C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S4C" runat="server" Height="20px" Width="20px" onclick="img15_Click" ToolTip="4C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S5C" runat="server" Height="20px" Width="20px" onclick="img16_Click" ToolTip="5C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S6C" runat="server" Height="20px" Width="20px" onclick="img17_Click" ToolTip="6C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S7C" runat="server" Height="20px" Width="20px" onclick="img18_Click" ToolTip="7C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S8C" runat="server" Height="20px" Width="20px" onclick="img19_Click" ToolTip="8C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S9C" runat="server" Height="20px" Width="20px" onclick="img20_Click" ToolTip="9C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S10C" runat="server" Height="20px" Width="20px" onclick="img21_Click" ToolTip="10C" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S11C" runat="server" Height="20px" Width="20px" onclick="img22_Click" ToolTip="11C" ImageUrl="~/Images/Available.gif" /></td>
                        </tr>
                        <tr><td></td>
                            <td>
                                </td><td>
                                </td><td>
                                </td><td>
                                </td><td>
                                </td><td>
                                </td><td>
                                </td><td>
                                </td><td>
                                </td><td>
                                </td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S11E" runat="server" Height="20px" Width="20px" onclick="img45_Click" ToolTip="11E" ImageUrl="~/Images/Available.gif" />
                                </td>
                                
                        </tr>
                        <tr><td></td>
                            <td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S1B" runat="server" Height="20px" Width="20px" onclick="img23_Click" ToolTip="1B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S2B" runat="server" Height="20px" Width="20px" onclick="img24_Click" ToolTip="2B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S3B" runat="server" Height="20px" Width="20px" onclick="img25_Click" ToolTip="3B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid">
                                <asp:ImageButton ID="S4B" runat="server" Height="20px" Width="20px" onclick="img26_Click" ToolTip="4B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S5B" runat="server" Height="20px" Width="20px" onclick="img27_Click" ToolTip="5B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S6B" runat="server" Height="20px" Width="20px" onclick="img28_Click" ToolTip="6B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S7B" runat="server" Height="20px" Width="20px" onclick="img29_Click" ToolTip="7B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S8B" runat="server" Height="20px" Width="20px" onclick="img30_Click" ToolTip="8B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S9B" runat="server" Height="20px" Width="20px" onclick="img31_Click" ToolTip="9B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S10B" runat="server" Height="20px" Width="20px" onclick="img32_Click" ToolTip="10B" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S11B" runat="server" Height="20px" Width="20px" onclick="img33_Click" ToolTip="11B" ImageUrl="~/Images/Available.gif" /></td>
                        </tr>
                        <tr><td></td>
                            <td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S1A" runat="server" Height="20px" Width="20px" onclick="img34_Click" ToolTip="1A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S2A" runat="server" Height="20px" Width="20px" onclick="img35_Click" ToolTip="2A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S3A" runat="server" Height="20px" Width="20px" onclick="img36_Click" ToolTip="3A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S4A" runat="server" Height="20px" Width="20px" onclick="img37_Click" ToolTip="4A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S5A" runat="server" Height="20px" Width="20px" onclick="img38_Click" ToolTip="5A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S6A" runat="server" Height="20px" Width="20px" onclick="img39_Click" ToolTip="6A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S7A" runat="server" Height="20px" Width="20px" onclick="img40_Click" ToolTip="7A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S8A" runat="server" Height="20px" Width="20px" onclick="img41_Click" ToolTip="8A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S9A" runat="server" Height="20px" Width="20px" onclick="img42_Click" ToolTip="9A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S10A" runat="server" Height="20px" Width="20px" onclick="img43_Click" ToolTip="10A" ImageUrl="~/Images/Available.gif" /></td><td style="width:25px; height:25px; border-width:1px; border-color:Gray; border-style:solid ">
                                <asp:ImageButton ID="S11A" runat="server" Height="20px" Width="20px" onclick="img44_Click" ToolTip="11A" ImageUrl="~/Images/Available.gif" /></td>
                        </tr>
                    </table>
                </td>
                <td style="width:50%" valign="top">
                    <table>
                        <tr>
                            <td style="color:Gray; ">
                                Boarding Point: 
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBoardingPoint" runat="server" Width="150px"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="ddlBoardingPoint"
                                 ErrorMessage="Boarding Point is required." 
                                    InitialValue="Select Boarding Point" ToolTip="Boarding Point is required." 
                                    Display="Static" SetFocusOnError="True">* Boarding Point is required.</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:Gray; ">
                                Service: 
                            </td>
                            <td>
                                <asp:Label ID="lblService" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:Gray; ">
                                Service Number: 
                            </td>
                            <td>
                                <asp:Label ID="lblServiceNumber" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:Gray; ">
                                Journey Date: 
                            </td>
                            <td>
                                <asp:Label ID="lblJourneyDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:Gray; ">
                                CoachType: 
                            </td>
                            <td>
                                <asp:Label ID="lblCoachType" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:Gray; ">
                                Selected Seats: 
                            </td>
                            <td>
                                <asp:Label ID="lblSelectedSeats" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td style="height:30px;"></td>
            </tr>
            <tr>
                <td align="center" style="color:Gray;">
                    Available:<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Available.gif" />
                    &nbsp Selected:<asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Selected.gif" />
                    &nbsp Booked:<asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Booked.gif" />
                    &nbsp Female:<asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Female.gif" />
                    &nbsp Driver:<asp:Image ID="Image5" runat="server" ImageUrl="~/Images/Driver.gif" />
                </td>
            </tr>
            <tr>
                <td style="height:30px;">
                    
                
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                	<td style="width:100%" valign="top" colspan="5">
						<asp:datagrid id="dgdItems" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="PowderBlue">
							<SelectedItemStyle CssClass="shead"></SelectedItemStyle>
							<AlternatingItemStyle CssClass="trdata2"></AlternatingItemStyle>
							<ItemStyle CssClass="trdata1"></ItemStyle>
							<HeaderStyle CssClass="shead"></HeaderStyle>
							<FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
							<Columns>
								
								<asp:TemplateColumn HeaderText="Title">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:DropDownList ID="ddlTitle" runat="server">
                                            <asp:ListItem Selected="True">Mr</asp:ListItem>
                                            <asp:ListItem>Mrs</asp:ListItem>
                                            <asp:ListItem>Ms</asp:ListItem>
                                        </asp:DropDownList>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="First Name">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:TextBox ID="txtFirstName" Runat="server" MaxLength="20" CssClass="textbox" Width="80%">
										</asp:TextBox>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Last Name">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:TextBox ID="txtLastName" Runat="server" MaxLength="20" CssClass="textbox" Width="80%" >
										</asp:TextBox>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Age">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:TextBox ID="txtAge" Runat="server" MaxLength="3" CssClass="textbox" Width="80%">
										</asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAge" FilterType="Numbers">
                                        </cc1:FilteredTextBoxExtender>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Contact Number">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:TextBox ID="txtContactNumber" Runat="server" MaxLength="11" CssClass="textbox" Width="80%" >
										</asp:TextBox>
										<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtContactNumber" FilterType="Numbers">
                                        </cc1:FilteredTextBoxExtender>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Boarding Point" DataField="BoardingPoint"></asp:BoundColumn>
								<%--<asp:TemplateColumn HeaderText="Select">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:CheckBox Runat="server" id="chkProductId"></asp:CheckBox>
									</ItemTemplate>
								</asp:TemplateColumn>--%>
								<asp:BoundColumn HeaderText="Seat No." DataField="SeatNo"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Total Fare" DataField="TotalFare"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>

            </tr>
        </table>
        <br />
        <table width="100%" style="border-bottom-width:thin; border-bottom-color:Silver; border-bottom-style:solid;">
            <tr>
                <td style="color:#0075BC; font-size:large;">
                    Contact Information
                </td>
            </tr>
        </table><br />
         <table width="100%">
                    
                    <tr class="trdata1">
                        <td style="width:20%" align="right">
                            EMail ID:
                        </td>
                        <td style="width:30%">
                            <asp:TextBox ID="txtEmailId" runat="server" Width="150px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtEmailId" FilterType="Numbers">
                                        </cc1:FilteredTextBoxExtender>
                        </td>
                        <td style="width:20%" align="right">
                            Address:
                        </td>
                        <td style="width:30%">
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="trdata2">
                        <td style="width:20%" align="right">
                            PhotoID Proof:
                        </td>
                        <td style="width:30%">
                            <asp:DropDownList ID="ddlPhotoidProof" runat="server" Width="150px">
                                <asp:ListItem>Select Id Proof</asp:ListItem>
                                <asp:ListItem>Driving Licence</asp:ListItem>
                                <asp:ListItem>PAN card</asp:ListItem>
                                <asp:ListItem>Passport</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width:20%" align="right">
                            Mobile No:
                        </td>
                        <td style="width:30%">
                            <asp:TextBox ID="txtMobileNo" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    
                </table>
        <table width="100%">
            <tr>
                <td align="center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
                </td>
            </tr>
        </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


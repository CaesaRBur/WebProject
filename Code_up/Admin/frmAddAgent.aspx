<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmAddAgent.aspx.cs" Inherits="Admin_frmAddAgent" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <table width="100%">
                        <tr>
                            <td class="TdBlue"  >
                                <asp:Label ID="lblHeading" runat="server" Text="Login Infromation" CssClass="FontBold"></asp:Label>
                            </td>
                        </tr>
                    </table>
    

   
     <table width="100%">
         <tr>
             <td style="width:25%" align="right">
                 <asp:Label ID="lblUserName" runat="server" Text="User Name" CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td style="width:75%">
                 &nbsp;
                 <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                 <asp:Button ID="btnCheckAvaliblity" runat="server" Text="CheckAvaliblity" 
                     CausesValidation="False" onclick="btnCheckAvaliblity_Click" />
                 <asp:Label ID="lblAvailable" runat="server"></asp:Label>
                 </td>
         </tr>
         <tr>
             <td align="right">
                 <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td>
                 &nbsp;
                 <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="txtPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                 </td>
         </tr>
         <tr>
             <td align="right">
                 <asp:Label ID="lblRetypePassword" runat="server" Text= "Retype Password" CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td>
                 &nbsp;
                 <asp:TextBox ID="txtRetypePassword" runat="server" TextMode="Password"></asp:TextBox>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" 
                     ControlToCompare="txtPassword" ControlToValidate="txtRetypePassword" 
                     ErrorMessage="Password Mismatch"></asp:CompareValidator>
                 </td>
         </tr>
     </table>
     
     
     <table width="100%">
                        <tr>
                            <td class="TdBlue"  >
                                <asp:Label ID="Label1" runat="server" Text="Dealer Information" CssClass="FontBold"></asp:Label>
                            </td>
                        </tr>
                    </table>
    
     <table  width="100%">
         <tr>
             <td style="width:25%" align="right">
                 <asp:Label ID="lblName" runat="server" Text="Name" CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td style="width:25%" >
             
                 &nbsp;
                 <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
             <td style="width:15%" align="right">
                 &nbsp;
                 <asp:Label ID="lblEMail" runat="server" Text="E-Mail" CssClass="FontBold"></asp:Label></td>
             <td style="width:35%" >
                 &nbsp;
                 <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                 <br />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                     ControlToValidate="txtEmail" Display="Dynamic" 
                     ErrorMessage="Please enter a valid E-mail Adderss" 
                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                 </td>
         </tr>
         <tr>
             <td  align="right" valign="top">
                 <asp:Label ID="lblMobileNo" runat="server" Text="Mobile Number" 
                     CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td valign="top">
                 &nbsp;
                 <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                 <br />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                     ControlToValidate="txtMobileNo" ErrorMessage="enter a valid mobile number" 
                     ValidationExpression="^([9]{1})([2347890]{1})([0-9]{8})$"></asp:RegularExpressionValidator>
                 </td>
             <td  align="right" valign="top">
                 <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td valign="top">
                 <asp:RadioButton ID="rbtnMale" runat="server" Checked="True" Text="Male" 
                     ValidationGroup="a" />
                 <asp:RadioButton ID="rbtnFemale" runat="server" Text="Female" 
                     ValidationGroup="a" />
             </td>
         </tr>
     </table>
     
     <table width="100%">
                        <tr>
                            <td class="TdBlue"  >
                                <asp:Label ID="lblOfficeInfo" runat="server" Text="Office Infromation" CssClass="FontBold"></asp:Label>
                            </td>
                        </tr>
                    </table>
    

    
     <table width="100%">
         <tr>
             <td style="width:25%" align="right">
                 <asp:Label ID="lblOfficeName" runat="server" Text="Office Name" 
                     CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td style="width:25%">
                 &nbsp;
                 <asp:TextBox ID="txtOfficeName" runat="server"></asp:TextBox>
                 <br />
                 <asp:RequiredFieldValidator ID="rfvOfficeName" runat="server" 
                     ErrorMessage="*Please Enter Office name" ControlToValidate="txtOfficeName" 
                     Display="Dynamic"></asp:RequiredFieldValidator>
                 </td>
             <td style="width:15%" align="right">
                 <asp:Label ID="lblOfficeAddress" runat="server" Text="Address" 
                     CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td style="width:35%">
                 &nbsp;
                 <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                     ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                    </td>
         </tr>
         <tr>
             <td  align="right">
                 <asp:Label ID="lblOfficeLandLine" runat="server" Text="Land Line" 
                     CssClass="FontBold"></asp:Label>
                 &nbsp;</td>
             <td>
                 &nbsp;
                 <asp:TextBox ID="txtLandLine" runat="server"></asp:TextBox>
                 <br />
                <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                     ErrorMessage="RegularExpressionValidator" 
                     ValidationExpression="/^[0-9]\d{2,4}-\d{6,8}$/" 
                     ControlToValidate="txtLandLine"></asp:RegularExpressionValidator>--%>
                 </td>
             <td  align="right">
                 <asp:Label ID="lblCity" runat="server" Text="City" CssClass="FontBold"></asp:Label>
                 &nbsp;
                 </td>
             <td>
                 &nbsp;
                 <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                 <br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                     ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <tr>
             <td  align="right">
                 <asp:Label ID="lblOfficeMobile" runat="server" Text="Mobile" 
                     CssClass="FontBold"></asp:Label>
                 &nbsp;
                 
                 </td>
             <td>
                 &nbsp;
                 <asp:TextBox ID="txtOfficeMobile" runat="server"></asp:TextBox>
                 </td>
             <td  align="right">
                 <asp:Label ID="lblState" runat="server" Text="State" CssClass="FontBold"></asp:Label>
                 &nbsp;
                 </td>
             <td>
                 &nbsp;
                 <asp:DropDownList ID="ddlState" runat="server" Width="135px">
                     <asp:ListItem>AndhraPradesh</asp:ListItem>
                     <asp:ListItem>Karanataka</asp:ListItem>
                     <asp:ListItem>TamilNadu</asp:ListItem>
                 </asp:DropDownList>
             </td>
         </tr>
         <tr>
             <td  align="right">
                 <asp:Button ID="btnFinish" runat="server" Text="Finish" 
                     onclick="btnFinish_Click" Visible="true" />
             </td>
             <td>
                 &nbsp;</td>
             <td  align="right"> 
                 <asp:Label ID="lblMessage" runat="server"></asp:Label>
             </td>
             <td>
                 &nbsp;</td>
         </tr>
     </table>
    

</asp:Content>


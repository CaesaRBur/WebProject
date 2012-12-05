<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmAddService.aspx.cs" Inherits="Admin_frmAddService" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<%--Basic Information--%>


<%--Table For Displaying Heading--%>
<table width="100%">
                        <tr>
                            <td class="TdBlue"  >
                                <asp:Label ID="lblBasicInfo" runat="server" Text="Basic Information" 
                                    CssClass="FontBoldwhite"></asp:Label>
                            </td>
                        </tr>
</table>

<%--Table for Displaying Basic information Contents--%>
<table   style="width:100%">
                            <tr>
                                      
                                <td style="width:25%" align="right" valign="top">
                                        <asp:Label ID="lblServiceNumber" runat="server" Text="Service Number" 
                                            CssClass="FontBold"></asp:Label>
                                        &nbsp;
                                </td>
                                <td style="width:25%">
                                        <asp:TextBox ID="txtServiceNumber" runat="server" Width="80px"></asp:TextBox>
                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCheck" runat="server" CausesValidation="False" 
                                            onclick="btnCheck_Click" Text="Check " />
                                        
                                        <br />
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtServiceNumber" 
                                            ErrorMessage="*Please Enter Service Number" Display="Dynamic" 
                                            ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                                        <asp:Label ID="lblSvcNoMessage" runat="server"></asp:Label>
                                </td>
                                   
                                <td style="width:25%" align="right" valign="top">
                                        <asp:Label ID="lblCoachType" runat="server" Text="Coach Type" 
                                            CssClass="FontBold"></asp:Label>
                                        &nbsp;
                                </td>
                                <td style="width:25%" valign="top">
                                    <asp:DropDownList ID="ddlCoachType" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>Type of Coach</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    
                                    <asp:RequiredFieldValidator ID="rfvCoachType" runat="server" 
                                        ControlToValidate="ddlCoachType" Display="Dynamic" 
                                        ErrorMessage="*Please Select Coach Type" InitialValue="Type of Coach" 
                                        ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                                    
                                </td>
                        
                            </tr>
                            <tr>
                                
                                <td style="width:25%" align="right" valign="top">
                                        <asp:Label ID="lblFromCity" runat="server" Text="From City" CssClass="FontBold"></asp:Label>
                                        &nbsp;
                                </td>
                                <td style="width:25%" valign="top">
                                    <asp:DropDownList ID="ddlFromCity" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>Select City</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    
                                    <asp:RequiredFieldValidator ID="rfvFromCity" runat="server" 
                                        ControlToValidate="ddlFromCity" Display="Dynamic" 
                                        ErrorMessage="*Please select From city" InitialValue="Select City" 
                                        ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                                    
                                </td>
                                                       
                                <td style="width:25%" align="right" valign="top">
                                        <asp:Label ID="Label5" runat="server" Text="To City" CssClass="FontBold"></asp:Label>
                                        &nbsp;
                                </td>
                                <td style="width:25%" valign="top">
                                    <asp:DropDownList ID="ddlToCity" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>Select City</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvToCity" runat="server" 
                                        ErrorMessage="*Please select To city" Display="Dynamic" 
                                        InitialValue="Select City" ControlToValidate="ddlToCity" 
                                        ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                                </td>
                       
            </tr>
                            <tr>
                                <td  align="right" valign="top">
                                        <asp:Label ID="lblDepartureTime" runat="server" Text="Departure Time" 
                                            CssClass="FontBold"></asp:Label>
                                        &nbsp;
                                </td>
                                <td valign="top" >
                                    <asp:TextBox ID="txtDepartureTime" runat="server" Width="80px"></asp:TextBox>
                                    <br />
                                    <cc1:MaskedEditExtender ID="meeDepartureTime" runat="server"
                                            TargetControlID="txtDepartureTime" 
                                            Mask="99:99:99"
                                            MessageValidatorTip="true"
                                            OnFocusCssClass="MaskedEditFocus"
                                            OnInvalidCssClass="MaskedEditError"
                                            MaskType="Time"
                                            AcceptAMPM="True"
                                            CultureName="en-US" />
                                <cc1:MaskedEditValidator ID="mevDepartureTime" runat="server"
                                                            ControlExtender="meeDepartureTime"
                                                            ControlToValidate="txtDepartureTime"
                                                            IsValidEmpty="False"
                                                            EmptyValueMessage="Time is required"
                                                            InvalidValueMessage="Time is invalid"
                                                             ValidationGroup="BasicInfo"
                                                                Display="Dynamic"
                                                            TooltipMessage="Input a time" />
                                 
                                    <asp:RequiredFieldValidator ID="rfvDepatureTime" runat="server" 
                                        ErrorMessage="*please enter Depature time" ControlToValidate="txtDepartureTime" 
                                        Display="Dynamic" ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                               </td>
                        
                   
                                <td align="right" valign="top">
                                        <asp:Label ID="lblApproxJourneyTime" runat="server" 
                                            Text="Approx Journey Time" CssClass="FontBold"></asp:Label>
                                        &nbsp;
                                </td>
                                <td valign="top" >
                                        <asp:TextBox ID="txtApproxJourneyTime" runat="server" ></asp:TextBox>
                                        <br />
                                        <%--<cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                            TargetControlID="txtApproxJourneyTime" 
                                            Mask="99:99:99"
                                            MessageValidatorTip="true"
                                            OnFocusCssClass="MaskedEditFocus"
                                            OnInvalidCssClass="MaskedEditError"
                                            MaskType="Time"
                                            AcceptAMPM="True"
                                            CultureName="en-US" />
                                <cc1:MaskedEditValidator ID="MaskedEditValidator1" runat="server"
                                                            ControlExtender="MaskedEditExtender1"
                                                            ControlToValidate="txtApproxJourneyTime"
                                                            IsValidEmpty="False"
                                                            EmptyValueMessage="Time is required"
                                                            InvalidValueMessage="Time is invalid"
                                                             ValidationGroup="BasicInfo"
                                                                Display="Dynamic"
                                                            TooltipMessage="Input a time" />--%>
                                 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="*please enter Approx journey time" ControlToValidate="txtApproxJourneyTime" 
                                        Display="Dynamic" ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                                    
            
                                       
                                </td>
                       
                            </tr>
                            <tr>
                
                                <td align="right" valign="top">
                                        <asp:Label ID="lblNumberOfSeats" runat="server" Text="Number Of Seats" 
                                            CssClass="FontBold"></asp:Label>
                                        &nbsp;
                                </td>
                                <td >
                                        <asp:TextBox ID="txtNumberOfSeats" runat="server" Width="80px"></asp:TextBox>
                                        <br />
                                    <asp:RequiredFieldValidator ID="rfvNumberOfSeats" runat="server" 
                                            ErrorMessage="*please enter number of seats" 
                                            ControlToValidate="txtNumberOfSeats" Display="Dynamic" 
                                            ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="fteNumberOfSeats" runat="server" TargetControlID="txtNumberOfSeats" FilterType="Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                        
                                </td>
                                <td align="right" valign="top">
                                    <asp:Label ID="lblFare" runat="server" CssClass="FontBold" Text="Fare"></asp:Label>
                                </td>
                                <td>
                                        <asp:TextBox ID="txtFare" runat="server" Width="80px"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="txtFare_FilteredTextBoxExtender" 
                                        runat="server" TargetControlID="txtFare" FilterType="Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvFare" runat="server" 
                                            ErrorMessage="*please enter fare" ControlToValidate="txtFare" 
                                            Display="Dynamic" ValidationGroup="BasicInfo"></asp:RequiredFieldValidator>
                                        
                                </td>
                                
                      
                                
            </tr>
            
        </table>
        <table width="100%">
            <tr>
                <td align="center" width="82%">
                    <asp:Label ID="lblBasicInfoMessage" runat="server"></asp:Label>
                </td>
                <td align="left" width="18%">
                    <asp:Button ID="btnBasicInfoSubmit" runat="server" Text="Submit" 
                                        onclick="btnBasicInfoSubmit_Click" 
                        ValidationGroup="BasicInfo" style="height: 26px" />
                </td>
            </tr>
        </table>
        
        
        <%--Boarding Stops information--%>
        <table width="100%">
                        <tr>
                            <td class="TdBlue"  >
                                <asp:Label ID="lblStops" runat="server" Text="Add Boarding Stops" 
                                    CssClass="FontBoldwhite"></asp:Label>
                            </td>
                        </tr>
                    </table>


 <table width="100%">
    <tr>
        <td style="width:80%;" align="center">
            <table width="80%" style="background-color:White">
                                <tr>
                                                <td align="left" width="20%">
                                                        <asp:Label ID="lblCityNameHeading" runat="server" 
                                                        Text="City Name" CssClass="FontBold"></asp:Label>
                                                </td>
                                                <td align="left" width="20%">
                                                    <asp:Label ID="lblBoardingStopHeading" runat="server" 
                                                        Text="Stop Name" CssClass="FontBold"></asp:Label>
                                                </td>
                                                
                                                  <td width="22.5%"  align="center" >
                                                      <asp:Label ID="lblArrivalTimeHeading" runat="server" 
                                                          Text="Arrival Time" CssClass="FontBold"></asp:Label>
                                                </td>
                                                  
                                                <td align="center" width="15%">
                                                
                                                </td>
                                                  
                                            </tr>
                            
                            </table>
        </td>
    </tr>
 
 </table>
<table width="100%">
    <tr>
        <td align="center">
                <asp:DataList ID="dlBoardingStops" runat="server" Width="80%" CellPadding="4" 
                    ForeColor="#333333" ShowFooter="False" ShowHeader="False" Visible="False" 
                    DataKeyField="id" oneditcommand="dlBoardingStops_EditCommand" 
                    onitemcommand="dlBoardingStops_ItemCommand">
                        <FooterStyle  Font-Bold="True" ForeColor="White" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <AlternatingItemStyle BackColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                        <table width="100%">
                            <tr>
                                                <td align="left" width="20%">
                                                        <asp:Label ID="lblCityName" runat="server"  Text='<%# Eval("CityName") %>'></asp:Label>
                                                </td>
                                                <td align="left" width="20%">
                                                    <asp:Label ID="lblBoardingStop" runat="server" Text='<%# Eval("boardingStopName") %>' 
                                                         ></asp:Label>
                                                </td>
                                                
                                                  <td width="22.5%"  align="center" >
                                                      <asp:Label ID="lblArrivalTime" runat="server" Text='<%# Eval("Time") %>' 
                                                          ></asp:Label>
                                                </td>
                                                  
                                                <td align="center" width="15%">
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" 
                                                        Font-Underline="False">Edit</asp:LinkButton>
                                                </td>  
                            </tr>
                       </table>
                        </ItemTemplate>
                        <EditItemTemplate>
                                <table width="100%">
                                        <tr>
                                                <td align="left" width="20%" valign="top">
                                                                 <asp:DropDownList ID="ddlBorStopEdit" runat="server"  
                                                                     AppendDataBoundItems="True" DataSource="<%# cityDataSet() %>"  
                                                                     DataValueField="cityId" DataTextField="cityName" >
                                                                        <asp:ListItem>Select City</asp:ListItem>
                                                                </asp:DropDownList>   
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="rfvBorStopEdit" runat="server" ErrorMessage="*Select City" 
                                                                 ControlToValidate="ddlBorStopEdit" Display="Dynamic" 
                                                                 InitialValue="Select City" ValidationGroup="BoardingStopEdit"></asp:RequiredFieldValidator>       
                                            </td>
                                                                       
                                                </td>
                                                <td align="left" width="20%" valign="top" >
                                                                <asp:TextBox ID="txtBoardingStopNameEdit" runat="server" Width="100px" Text='<%# Eval("boardingStopName") %>' ></asp:TextBox>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="rfvBoardingStopNameEdit" runat="server" 
                                                                    ErrorMessage="*enter Stop Name" ControlToValidate="txtBoardingStopNameEdit" 
                                                                    Display="Dynamic" ValidationGroup="BoardingStopEdit"></asp:RequiredFieldValidator>
                                                                
                                                </td>
                    
                                                 <td  align="center" valign="top" width="22.5%" >
                                                    
                                                               <asp:TextBox ID="txtArrivalTimeEdit" runat="server" Width="80px" ></asp:TextBox>
                                                               <br />
                                                                <cc1:MaskedEditExtender ID="meeArrivalTimeEdit" runat="server" 
                                                                    AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                                                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                                                                    OnInvalidCssClass="MaskedEditError" TargetControlID="txtArrivalTimeEdit" />
                                                                <cc1:MaskedEditValidator ID="mevArrivalTimeEdit" runat="server" 
                                                                    ControlExtender="meeArrivalTimeEdit" ControlToValidate="txtArrivalTimeEdit" 
                                                                    Display="Dynamic" EmptyValueMessage="Time is required" 
                                                                    InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                                                                    TooltipMessage="Input a time" ValidationGroup="BoardingStopEdit" />
                                                               
                                                    
                                                 </td>
                    
                                            <td align="center" valign="top" width="15%">
                                                <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="lbtnUpdateBording_click" ValidationGroup="BoardingStopEdit" >Update </asp:LinkButton>
                                                &nbsp;
                                                <asp:LinkButton ID="lbtnDelete" runat="server" 
                                                    CommandName="lbtnDeleteBording_click" >Delete</asp:LinkButton>
                                                <br />
                                                <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="lbtnCancel_click" >Cancel</asp:LinkButton>
                                                   
                                            </td>
                             
                                        </tr>
                                </table>
                        </EditItemTemplate>
    
                </asp:DataList>
        </td>
    </tr>
    <tr>
        <td align="center" style="width:80%" >
            <table  width="80%" style="background-color:#507CD1">
                <tr>
                    <td align="left" width="20%" valign="top">
                                     <asp:DropDownList ID="ddlBorStop" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem>Select City</asp:ListItem>
                        </asp:DropDownList>   
                        <br />
                        <asp:RequiredFieldValidator ID="rfvSerStop" runat="server" ErrorMessage="*Select City" 
                                         ControlToValidate="ddlBorStop" Display="Dynamic" 
                                         InitialValue="Select City" ValidationGroup="BoardingStop"></asp:RequiredFieldValidator>       
                    </td>
                    <td align="left" width="20%" valign="top" >
                        <asp:TextBox ID="txtBoardingStopName" runat="server" Width="100px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvBorStopName" runat="server" 
                            ErrorMessage="*enter Stop Name" ControlToValidate="txtBoardingStopName" 
                            Display="Dynamic" ValidationGroup="BoardingStop"></asp:RequiredFieldValidator>
                    </td>
                    
                     <td  align="center" valign="top" width="22.5%" >
                        
                    
                        <asp:TextBox ID="txtArrivalTime" runat="server" Width="80px"></asp:TextBox>
                        <br />
                        <cc1:MaskedEditExtender ID="meeArrivalTime" runat="server" 
                            AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                            OnInvalidCssClass="MaskedEditError" TargetControlID="txtArrivalTime" />
                        <cc1:MaskedEditValidator ID="mevArivalTime" runat="server" 
                            ControlExtender="meeArrivalTime" ControlToValidate="txtArrivalTime" 
                            Display="Dynamic" EmptyValueMessage="Time is required" 
                            InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                            TooltipMessage="Input a time" ValidationGroup="BoardingStop" />
                        
                </td>
                    
                    
                   
                <td align="right" valign="top" width="15%">
                    <asp:Button ID="btnBoardingStopsInsert" runat="server" Text="Insert" 
                        onclick="btnBoardingStopsInsert_Click" ValidationGroup="BoardingStop" />
                        <br />
                    <asp:Label ID="lblBordingMessage" runat="server" ></asp:Label>
                </td>
                
                    
             
                </tr>
            </table>
        
        </td>
            
                    
                </tr>
</table>
<table width="100%">
            <tr>
                <td class="TdBlue">
                    <asp:Label ID="lblHeading" runat="server" CssClass="FontBoldwhite" 
                        Text="Add Service Stops"></asp:Label>
                </td>
            </tr>
        </table>
 <table width="100%">
 <tr>
    <td align="center">
        <table width="80%" style="background-color:#507CD1">
                                        <tr>
                                            <td align="left" width="20%">
                                                <asp:Label ID="lblStopNameHeading" runat="server" Text="Stop Name" 
                                                    CssClass="FontBold" ></asp:Label>
                                            </td>
                                            <td align="center" width="20%">
                                                <asp:Label ID="lblDepTimeHeading" runat="server" Text="Depature Time" 
                                                    CssClass="FontBold"></asp:Label>
                                            </td>
                                            
                                            <td width="15%">
                                                &nbsp;</td>
                                        </tr>
                            
                            </table>
    
    </td>
 </tr>
    <tr>
        <td align="center">
                <asp:DataList ID="dlServiceInfo" runat="server" Width="80%" CellPadding="4" 
                    ForeColor="#333333" Visible="False" 
                    oneditcommand="dlServiceInfo_EditCommand" 
                    onitemcommand="dlServiceInfo_ItemCommand" DataKeyField="id">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <AlternatingItemStyle BackColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                        <table width="100%">
                             <tr>
                                            <td align="left" width="20%">
                                                <asp:Label ID="lblStopNameHeading" runat="server" Text='<%# Eval("StopName") %>' 
                                                    ></asp:Label>
                                            </td>
                                            <td align="center" width="20%">
                                                <asp:Label ID="lblDepTimeHeading" runat="server" Text='<%# Eval("Time") %>' 
                                                    ></asp:Label>
                                            </td>
                                            
                                            <td width="15%">
                                                <asp:LinkButton ID="lbtnServStopsEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                             </td>
                                        </tr>
                       </table>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table width="100%">
                                <tr>
                                        <td align="left" valign="top" width="20%">
                                            <asp:DropDownList ID="ddlAddServiceStopEdit" runat="server" DataSource="<%# cityDataSet() %>" DataValueField="cityId" DataTextField="cityName" 
                                                AppendDataBoundItems="True">
                                                <asp:ListItem>select city</asp:ListItem>
                                            </asp:DropDownList>
                                             <br />
                                            <asp:RequiredFieldValidator ID="rfvAddServiceStopEdit" runat="server" ErrorMessage="*Select City" 
                                                             ControlToValidate="ddlAddServiceStopEdit" Display="Dynamic" 
                                                             InitialValue="select city" ValidationGroup="ServiceStopEdit" ></asp:RequiredFieldValidator>   
                                        </td>
                    <td align="center" valign="top" width="20%">
                        <asp:TextBox ID="txtServiceDepEdit" runat="server" Width="80px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="meetxtServiceDepEdit" runat="server" 
                            AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                            OnInvalidCssClass="MaskedEditError" TargetControlID="txtServiceDepEdit" />
                            <br />
                        <cc1:MaskedEditValidator ID="mevtxtServiceDepEdit" runat="server" 
                            ControlExtender="meetxtServiceDepEdit" ControlToValidate="txtServiceDepEdit" 
                            Display="Dynamic" EmptyValueMessage="Time is required" 
                            InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                            TooltipMessage="Input a time" ValidationGroup="ServiceStopEdit" />
                    </td>
                    <td align="right" valign="top" width="15%">
                                                <asp:LinkButton ID="lbtnUpdateSer" runat="server" CommandName="lbtnUpdateService_click" ValidationGroup="ServiceStopEdit" >Update </asp:LinkButton>
                                                &nbsp;
                                                <asp:LinkButton ID="lbtnDeleteSer" runat="server" 
                                                    CommandName="lbtnDeleteService_click" >Delete</asp:LinkButton>
                                                <br />
                                                <asp:LinkButton ID="lbtnCancelSer" runat="server" CommandName="lbtnCancelService_click" >Cancel</asp:LinkButton>
                       
                    </td>
                </tr>
                            </table>
                            
                        </EditItemTemplate>
    
                </asp:DataList>
        </td>
    </tr>
    <tr>
        <td align="center" style="width:80%" >
            <table  width="80%" style="background-color:#507CD1">
                <tr>
                    <td align="left" valign="top" width="20%">
                        <asp:DropDownList ID="ddlAddServiceStop" runat="server" 
                            AppendDataBoundItems="True">
                            <asp:ListItem>select city</asp:ListItem>
                        </asp:DropDownList>
                         <br />
                        <asp:RequiredFieldValidator ID="rfvAddServiceStop" runat="server" ErrorMessage="*Select City" 
                                         ControlToValidate="ddlAddServiceStop" Display="Dynamic" 
                                         InitialValue="select city" ValidationGroup="ServiceStop" ></asp:RequiredFieldValidator>   
                    </td>
                    <td align="center" valign="top" width="20%">
                        <asp:TextBox ID="txtServiceDep" runat="server" Width="80px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="meetxtServiceDep" runat="server" 
                            AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                            OnInvalidCssClass="MaskedEditError" TargetControlID="txtServiceDep" />
                            <br />
                        <cc1:MaskedEditValidator ID="mevtxtServiceDep" runat="server" 
                            ControlExtender="meetxtServiceDep" ControlToValidate="txtServiceDep" 
                            Display="Dynamic" EmptyValueMessage="Time is required" 
                            InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                            TooltipMessage="Input a time" ValidationGroup="ServiceStop" />
                    </td>
                    
                    <td align="right" valign="top" width="15%">
                        <asp:Button ID="btnServiceStopInsert" runat="server" Text="Insert" 
                            ValidationGroup="ServiceStop" onclick="btnServiceStopInsert_Click" />
                        <br />
                        <asp:Label ID="lblSerStopMessage" runat="server" ></asp:Label>
                    </td>
                </tr>
            </table>
        
        </td>
            
                    
                </tr>
</table>


<table width="100%">
    <tr>
        <td style="width:80%; " align="center">
        
        

 
 </td>
    </tr>

</table>
 

    
</asp:Content>


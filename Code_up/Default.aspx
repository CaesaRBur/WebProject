<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
    
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    
    
        <table class="style1">
            <tr>
                <td align="center">
                    <asp:Label ID="Label1" runat="server" Text="Stop Name"></asp:Label>
                </td>
                <td  align="center">
                    <asp:Label ID="Label2" runat="server" Text="Depature Time"></asp:Label>
                </td>
                <td  align="center">
                    <asp:Label ID="Label3" runat="server" Text="Journey Time"></asp:Label>
                </td>
                <td  align="center">
                    <asp:Label ID="Label4" runat="server" Text="Fare"></asp:Label>
                </td>
            </tr>
             <tr>
                <td align="center">
                    
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                 </td>
                <td align="center">
                    
                    <asp:TextBox ID="txtTime1" runat="server" Width="100px"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                        AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                        OnInvalidCssClass="MaskedEditError" TargetControlID="txtTime1" />
                    <cc1:MaskedEditValidator ID="MaskedEditValidator1" runat="server" 
                        ControlExtender="MaskedEditExtender1" ControlToValidate="txtTime1" 
                        Display="Dynamic" EmptyValueMessage="Time is required" 
                        InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                        TooltipMessage="Input a time" ValidationGroup="Demo1" />
                
                 </td>
                <td align="center">
                    <asp:TextBox ID="txtApproxJourneyTimehh" runat="server" Width="30px"></asp:TextBox>
                    <asp:TextBox ID="txtApproxJourneyTimemm" runat="server" Width="30px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                        TargetControlID="txtApproxJourneyTimehh" WatermarkCssClass="watermarked" 
                        WatermarkText="HH">
                    </cc1:TextBoxWatermarkExtender>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                 </td>
                <td align="center">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender11" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                 </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
                <td align="center">
                    <asp:TextBox ID="txtTime2" runat="server" Width="100px"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" 
                        AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                        OnInvalidCssClass="MaskedEditError" TargetControlID="txtTime1" />
                    <cc1:MaskedEditValidator ID="MaskedEditValidator2" runat="server" 
                        ControlExtender="MaskedEditExtender1" ControlToValidate="txtTime1" 
                        Display="Dynamic" EmptyValueMessage="Time is required" 
                        InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                        TooltipMessage="Input a time" ValidationGroup="Demo1" />
                </td>
                <td align="center">
                    <asp:TextBox ID="txtApproxJourneyTimehh0" runat="server" Width="30px"></asp:TextBox>
                    <asp:TextBox ID="txtApproxJourneyTimemm0" runat="server" Width="30px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" 
                        TargetControlID="txtApproxJourneyTimehh" WatermarkCssClass="watermarked" 
                        WatermarkText="HH">
                    </cc1:TextBoxWatermarkExtender>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
                <td align="center">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender12" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                    </asp:DropDownList>
                </td>
                <td align="center">
                    <asp:TextBox ID="txtTime3" runat="server" Width="100px"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" 
                        AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                        OnInvalidCssClass="MaskedEditError" TargetControlID="txtTime1" />
                    <cc1:MaskedEditValidator ID="MaskedEditValidator3" runat="server" 
                        ControlExtender="MaskedEditExtender1" ControlToValidate="txtTime1" 
                        Display="Dynamic" EmptyValueMessage="Time is required" 
                        InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                        TooltipMessage="Input a time" ValidationGroup="Demo1" />
                </td>
                <td align="center">
                    <asp:TextBox ID="txtApproxJourneyTimehh1" runat="server" Width="30px"></asp:TextBox>
                    <asp:TextBox ID="txtApproxJourneyTimemm1" runat="server" Width="30px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server" 
                        TargetControlID="txtApproxJourneyTimehh" WatermarkCssClass="watermarked" 
                        WatermarkText="HH">
                    </cc1:TextBoxWatermarkExtender>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
                <td align="center">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender13" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:DropDownList ID="DropDownList4" runat="server">
                    </asp:DropDownList>
                </td>
                <td align="center">
                    <asp:TextBox ID="txtTime4" runat="server" Width="100px"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" 
                        AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                        OnInvalidCssClass="MaskedEditError" TargetControlID="txtTime1" />
                    <cc1:MaskedEditValidator ID="MaskedEditValidator4" runat="server" 
                        ControlExtender="MaskedEditExtender1" ControlToValidate="txtTime1" 
                        Display="Dynamic" EmptyValueMessage="Time is required" 
                        InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                        TooltipMessage="Input a time" ValidationGroup="Demo1" />
                </td>
                <td align="center">
                    <asp:TextBox ID="txtApproxJourneyTimehh2" runat="server" Width="30px"></asp:TextBox>
                    <asp:TextBox ID="txtApproxJourneyTimemm2" runat="server" Width="30px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender7" runat="server" 
                        TargetControlID="txtApproxJourneyTimehh" WatermarkCssClass="watermarked" 
                        WatermarkText="HH">
                    </cc1:TextBoxWatermarkExtender>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender8" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
                <td align="center">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender14" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:DropDownList ID="DropDownList5" runat="server">
                    </asp:DropDownList>
                </td>
                <td align="center">
                    <asp:TextBox ID="txtTime5" runat="server" Width="100px"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" 
                        AcceptAMPM="True" CultureName="en-US" Mask="99:99:99" MaskType="Time" 
                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                        OnInvalidCssClass="MaskedEditError" TargetControlID="txtTime1" />
                    <cc1:MaskedEditValidator ID="MaskedEditValidator5" runat="server" 
                        ControlExtender="MaskedEditExtender1" ControlToValidate="txtTime1" 
                        Display="Dynamic" EmptyValueMessage="Time is required" 
                        InvalidValueMessage="Time is invalid" IsValidEmpty="False" 
                        TooltipMessage="Input a time" ValidationGroup="Demo1" />
                </td>
                <td align="center">
                    <asp:TextBox ID="txtApproxJourneyTimehh3" runat="server" Width="30px"></asp:TextBox>
                    <asp:TextBox ID="txtApproxJourneyTimemm3" runat="server" Width="30px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender9" runat="server" 
                        TargetControlID="txtApproxJourneyTimehh" WatermarkCssClass="watermarked" 
                        WatermarkText="HH">
                    </cc1:TextBoxWatermarkExtender>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender10" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
                <td align="center">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender15" runat="server" 
                        TargetControlID="txtApproxJourneyTimemm" WatermarkCssClass="watermarked" 
                        WatermarkText="MM">
                    </cc1:TextBoxWatermarkExtender>
                </td>
            </tr>
        </table>
    
    
        <br />
        <table>
              <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    
    </div>
    </form>
    
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmHoverSample.aspx.cs" Inherits="frmHoverSample" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title></head>
<body>   
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
    <asp:ObjectDataSource ID="odsCity" TypeName="clsHover" 
    OldValuesParameterFormatString="original{0}" 
    UpdateMethod="Update" runat="server"  SelectMethod="Select">
    
    <UpdateParameters>
         <asp:Parameter Name="originalid" Type="Int16" />
         <asp:Parameter Name="cityId" Type="String" />
         <asp:Parameter Name="cityName" Type="String" />
    </UpdateParameters>
    </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="odsCity" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
            OldValuesParameterFormatString="original{0}" onrowcreated="GridView1_RowCreated">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                    <asp:BoundField HeaderText="sno" DataField="id" ReadOnly="true" />
                    <asp:BoundField HeaderText="cityId" DataField="cityId" />
                    <asp:BoundField HeaderText="cityName"    DataField="cityName" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Panel ID="popupMenu" runat="server" style="display:none">
                                       <div style="border:1px outset white;padding:2px;">
                                           <div>
                                               <asp:LinkButton ID="lnkButtonEdit" runat="server" CommandName="Edit" Text="Edit" />
                                           </div>
                                           <div>
                                               <asp:LinkButton ID="lnkButtonDelete" runat="server" CommandName="Delete" Text="Delete" />
                                           </div>
                                       </div>
                                   </asp:Panel>
                                   <cc1:HoverMenuExtender ID="hoverMenu" runat="server"  
                                        PopupControlID="PopupMenu"
                                        PopupPosition="Right"
                                        HoverCssClass="popupHover"
                                        TargetControlID="dgDept"
                                        PopDelay="50" />
                        </ItemTemplate>
                        <EditItemTemplate>
                                   <asp:Panel ID="popupMenu" runat="server">
                                       <div style="border:1px outset white;padding:2px;">
                                           <div>
                                               <asp:LinkButton ID="lnkButtonUpdate" runat="server" CommandName="Update" Text="Update" />
                                           </div>
                                           <div>
                                               <asp:LinkButton ID="lnkButtonCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                                           </div>
                                       </div>
                                   </asp:Panel>
                                   <cc1:HoverMenuExtender ID="hoverMenu" runat="server"  
                                        PopupControlID="PopupMenu"
                                        PopupPosition="Right"
                                        HoverCssClass="popupHover"
                                        TargetControlID="PopupMenu"
                                        PopDelay="50" />
                               </EditItemTemplate>
                    </asp:TemplateField>      
                    </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>

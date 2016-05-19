<%@ Page Title="" Language="C#" MasterPageFile="~/Master/ModifiedBootstrapMaster.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ithelpdesk.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <style>
        td.pad {
            padding-left:10px;
        }
        td.field-name {
            width:220px;
        }

        div.header-group {
            background-color:#c00; 
            color:white;
            padding-left:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="content">
        <div class="header-group"><h3>Issue</h3></div>        
        <table>
            <tr>                
                <td class="pad field-name">
                    <b>Request For:</b>
                </td>
                <td>
                     <asp:TextBox ID="txtRequestFor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>                
                <td class="pad field-name">
                    <b>Phone:</b>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                </td>
            </tr>            
        </table>
        <table>
            <tr>
                <td class="pad field-name">
                    <b>Describe briefly your problem*:</b>                    
                </td>
                <td>
                    <asp:TextBox ID="txtShortDescription" runat="server" Width="488px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>            
            <tr>
                <td class="pad field-name">
                    <b>Description*:</b><br />                    
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="800px" Height="130px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td class="pad field-name">
                    <b>Upload a File (Optional):</b> <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>            
        </table>
        <div class="header-group">
            <h3>Submitter</h3>
        </div>
        <table>
            <tr>
                <td class="pad field-name"><b>Request By*:</b>
                </td>
                <td class="pad field-name">
                    <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployeeName" 
                        ErrorMessage="Employee Name Required!" Font-Italic="True" ForeColor="#CC3300" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="pad field-name">
                    <b>Email*:</b>
                </td>
                <td class="pad field-name">
                     <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>        
        <div style="text-align:center;">
            <asp:Button  ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>

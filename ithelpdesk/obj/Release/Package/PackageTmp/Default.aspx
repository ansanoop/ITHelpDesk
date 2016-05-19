<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ithelpdesk.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <table>
            <tr>
                <td><b>Employee Name*:</b>
                </td>
                <td style="width:400px;">
                    <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployeeName" ErrorMessage="Employee Name Required!" Font-Italic="True" ForeColor="#CC3300" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <b>Request For:</b>
                </td>
                <td>
                     <asp:TextBox ID="txtRequestFor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Email*:</b>
                </td>
                <td>
                     <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <b>Phone:</b>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                </td>
            </tr>            
        </table>
        <table>
            <tr>
                <td>
                    <b>Describe briefly your problem*:</b>                    
                </td>
                <td>
                    <asp:TextBox ID="txtShortDescription" runat="server" Width="488px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>            
            <tr>
                <td>
                    <b>Description*:</b><br />                    
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="800px" Height="130px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <b>Upload a File (Optional):</b> <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
        </table>
        <center><asp:Button  ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></center>
    </div>
</asp:Content>

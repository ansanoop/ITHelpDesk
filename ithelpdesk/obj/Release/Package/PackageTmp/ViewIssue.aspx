<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ViewIssue.aspx.cs" Inherits="ithelpdesk.ViewIssue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 37px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <h3 class="text-success" style="text-align: center;">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></h3>
        <h3>
            Issue Description
            <asp:Label ID="lblStatus" runat="server" Text="Issue Current Status"></asp:Label>&nbsp;<asp:Button ID="btnRecover" runat="server" OnClick="btnRecover_Click" Text="Recover" Visible="False" CausesValidation="False" />
        </h3>
        <table style="width:600px; padding:initial">
            <tr>
                <td class="auto-style1"><b>Requested By:</b></td>
                <td class="auto-style1"><asp:Label ID="lblRequestedBy" runat="server" Text="RaiderName"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><b>Email:</b></td>
                <td class="auto-style1"><asp:Label ID="lblEmail" runat="server" Text="abc@ttu.edu"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><b>Phone:</b></td>
                <td class="auto-style1"><asp:Label ID="lblPhone" runat="server" Text="(xxx)xxx-xxxx"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <b>Request For:</b>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblRequestFor" runat="server" Text="Raider Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"><b>Problem With:</b></td>
                <td class="auto-style1">
                    <asp:Label ID="lblBriefDescription" runat="server" Text="Brief Description"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style1">
                    <asp:Label ID="lblLongDescription" runat="server" Text="Detail"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"><b>Attach</b></td>
                <td class="auto-style1">
                    <asp:Label ID="lblNoAttach" runat="server" Text="No Attach"></asp:Label>
                    <asp:HyperLink ID="hplAttach" runat="server">Link to Attachment</asp:HyperLink></td>
            </tr>
        </table>
        <p></p>
        <asp:GridView ID="processGrid" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
            SelectMethod="processGrid_GetData"
            DataKeyNames="Id"
            CssClass="table table-striped table-bordered table-hover table-condensed" OnPreRender="processGrid_PreRender">            
            <Columns>
                <asp:BoundField DataField="Status" />
                <asp:BoundField DataField="ChangedBy" />
                <asp:BoundField DataField="changedAt" />
                <asp:BoundField DataField="Remark" />
            </Columns>
        </asp:GridView>
        <hr />
        <p></p>
        <h3>Action</h3>
        <asp:DropDownList ID="ddlAction" runat="server">
            <asp:ListItem Value="">Select one</asp:ListItem>
            <asp:ListItem Value="In Progress">In Progress</asp:ListItem>
            <asp:ListItem>Follow</asp:ListItem>
            <asp:ListItem Value="Completed">Completed</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="ActionValidator" runat="server" CssClass="alert-error" ControlToValidate="ddlAction" SetFocusOnError="True">Please select an action!</asp:RequiredFieldValidator>
        <h3>Remark</h3>
        <asp:TextBox ID="txtRemark" runat="server" Height="76px" TextMode="MultiLine" Width="458px"></asp:TextBox>
        <br />        

        <div class="btn-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="inline-button" OnClick="btnSubmit_Click"/>            
            <asp:Button ID="btnBack" runat="server" Text="Back to List" OnClick="btnBack_Click" CssClass="inline-button" CausesValidation="False"></asp:Button>
        </div>
    </div>
</asp:Content>

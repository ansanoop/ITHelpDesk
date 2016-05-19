<%@ Page Title="" Language="C#" MasterPageFile="~/Master/ModifiedBootstrapMaster.master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="ithelpdesk.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container pagination-centered">
        <asp:Label ID="lblMsg" runat="server" Text="Put the message here!" CssClass="text-success"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CssClass="btn-success" OnClick="btnGoBack_Click" />
    </div>
</asp:Content>

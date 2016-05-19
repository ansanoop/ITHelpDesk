<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="ithelpdesk.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container pagination-centered">
        <asp:Label ID="lblMsg" runat="server" Text="Put the message here!" CssClass="text-success"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CssClass="btn-success" OnClick="btnGoBack_Click" />
    </div>
</asp:Content>

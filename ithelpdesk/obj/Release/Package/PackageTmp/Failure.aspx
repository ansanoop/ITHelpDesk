<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Failure.aspx.cs" Inherits="ithelpdesk.Failure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container pagination-centered">
        <asp:Label ID="lblMsg" runat="server" Text="Something went wrong!" CssClass="text-error"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnGoBack" runat="server" Text="Go Back to the Homepage" CssClass="btn-danger" OnClick="btnGoBack_Click" />
    </div>
</asp:Content>

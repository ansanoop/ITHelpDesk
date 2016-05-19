<%@ Page Title="" Language="C#" MasterPageFile="~/Master/ModifiedBootstrapMaster.master" AutoEventWireup="true" CodeBehind="Failure.aspx.cs" Inherits="ithelpdesk.Failure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container pagination-centered">
        <asp:Label ID="lblMsg" runat="server" Text="Something went wrong!" CssClass="text-error"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnGoBack" runat="server" Text="Go Back to the Homepage" CssClass="btn-danger" OnClick="btnGoBack_Click" />
    </div>
</asp:Content>

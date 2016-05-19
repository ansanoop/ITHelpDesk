<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="Ajax4.aspx.cs" Inherits="ithelpdesk.Trying.Ajax4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdateProgress runat="server" id="PageUpdateProgress">
        <ProgressTemplate>
            Loading...
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel runat="server" id="Panel">
        <ContentTemplate>
            <asp:Label runat="server" ID="lblHelloWorld" Text="Click the button!" />
            <br /><br />
            <asp:Button runat="server" id="UpdateButton" onclick="UpdateButton_Click" text="Update" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

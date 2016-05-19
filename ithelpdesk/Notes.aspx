<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NotesMaster.master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="ithelpdesk.Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">   

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">               
    <h2><asp:Label ID="lblCategoryName" runat="server">Category Name</asp:Label></h2>
    <div id="toggle">
        <asp:ListView ID="notesList" runat="server" SelectMethod="notesList_GetData">
            <LayoutTemplate>
                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="question">
                    <div class="ui-accordion-header ui-state-default ui-accordion-icons ui-corner-all">
                        <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>
                        <div class="question-text"><%# Eval("Question") %></div>
                    </div>
                </div>
                <div class="answer" style="display:none">
                    <%# Eval("Answer") %>
                </div>
            </ItemTemplate>
            <EmptyDataTemplate>No question.</EmptyDataTemplate>
        </asp:ListView>
    </div>        
</asp:Content>

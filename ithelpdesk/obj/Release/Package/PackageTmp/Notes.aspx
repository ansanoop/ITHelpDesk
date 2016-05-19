<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="ithelpdesk.Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href='css/NotesStyle.css' rel='stylesheet' type='text/css' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
            <div id="sideBar">
                <div id="nav-main">
                    <h3>Categories</h3>
                    <ul>
                        <li><a href="#">Note 1 </a></li>
                        <li>Note 2</li>
                        <li>Note 3</li>
                        <li>Note 4</li>
                        <li>Note 5</li>
                        <li>Note 6</li>
                    </ul>
                </div>
            </div>
            <div id="dirbox">
                <%--<div id="globalNav">
					<ul class="megamenu">
    					<li onclick="ctab('1');" style="cursor:pointer">Home</li>
    					<li onclick="ctab('2');" style="cursor:pointer">My Checklist</li>
    					<li onclick="ctab('3');" style="cursor:pointer">health and safety</li>
    					<li onclick="ctab('4');" style="cursor:pointer">resources</li>
  					</ul>
                 </div>--%>
            </div>
        
    </div>
</asp:Content>

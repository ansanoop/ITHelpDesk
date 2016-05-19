<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="IssueList.aspx.cs" Inherits="ithelpdesk.IssueList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table th {
              padding: 8px;
              line-height: 20px;
              text-align: left;
              vertical-align: top;
              border-top: 1px solid #dddddd;
              background-color: #f2dede !important;
        }

        .text-success-with-background {
          color: white;
          background-color: crimson;
        }

        tr.strikedRow {
            color: lightgrey;
            text-decoration:line-through;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <div style="text-align:center;">
    <asp:Label CssClass="text-success-with-background" ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:CheckBox ID="ckbShowDeleted" runat="server" AutoPostBack="True" /><b>&nbsp; Show Deleted Issues</b></td>
                <td style="text-align:right">
                    <b>Status Filter </b><asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem Value="0">Not Started</asp:ListItem>
                        <asp:ListItem Value="1">In Progress</asp:ListItem>
                        <asp:ListItem Value="2">Completed</asp:ListItem>
                        <asp:ListItem Value="3">Follow</asp:ListItem>                        
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        
    </div>
    <asp:GridView ID="issuesGrid" runat="server" 
        CssClass="table table-striped table-bordered table-hover table-condensed"
        DataKeyNames="Id"
        AutoGenerateColumns="False" AllowSorting="True" SelectMethod="issuesGrid_GetData" AllowPaging="True" PageSize="20" DeleteMethod="issuesGrid_DeleteIssue" OnRowDataBound="issuesGrid_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
            <asp:BoundField HeaderText="Request For" DataField="requestFor" SortExpression="requestFor"/>
            <asp:HyperLinkField HeaderText="Problem With" DataTextField="issueShortDescription"
                DataNavigateUrlFields="Id" DataNavigateUrlFormatString="ViewIssue.aspx?ID={0}"/>
            <asp:BoundField HeaderText="Submitted By" DataField="raiderName" SortExpression="raiderName"/>
            <%--<asp:BoundField HeaderText="Submitted At" DataField="submittedTime" SortExpression="submittedTime"/>--%>
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"/>
            <asp:BoundField DataField="modifiedBy" HeaderText="Updated By" SortExpression="modifiedBy" />
            <%--<asp:BoundField DataField="modifiedAt" HeaderText="Updated At" SortExpression="modifiedAt" />             --%>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/cross.png" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>

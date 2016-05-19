<%@ Page Title="" Language="C#" MasterPageFile="~/Master/ModifiedBootstrapMaster.master" AutoEventWireup="true" CodeBehind="IssueList.aspx.cs" Inherits="ithelpdesk.IssueList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <style>
        .table th {
              padding: 8px;
              line-height: 20px;
              text-align: center;
              vertical-align: central;
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
        td img {
            display: block;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">    
    <div style="text-align:center;">
    <asp:Label CssClass="text-success-with-background" ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <table style="width:100%;">
            <tr>
                <td>
                    <div class="checkbox">
                        <label>
                        <asp:CheckBox ID="ckbShowDeleted" runat="server" AutoPostBack="True" />
                        Show Deleted Issues
                        </label>
                    </div>                    
                </td>
                <td style="text-align:center">                    
                    Show for 
                    <asp:DropDownList ID="ddlTimeFilter" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="14">Last 14 days</asp:ListItem>
                        <asp:ListItem Value="30">Last 30 days</asp:ListItem>
                        <asp:ListItem Value="90">Last 90 days</asp:ListItem>
                        <asp:ListItem Value="0">All</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="text-align:right">
                    Status Filter 
                    <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True">
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
            <%--<asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"/>--%>
            <asp:ImageField DataAlternateTextField="status" DataImageUrlField="Id" HeaderText="Status">
            </asp:ImageField>
            <asp:BoundField DataField="modifiedBy" HeaderText="Updated By" SortExpression="modifiedBy" />
            <%--<asp:BoundField DataField="modifiedAt" HeaderText="Updated At" SortExpression="modifiedAt" />             --%>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/cross.png" ShowDeleteButton="True" />            
        </Columns>
    </asp:GridView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="DialogTestMethod1.aspx.cs" Inherits="ithelpdesk.DialogTestMethod1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Do not try this one, won't work</p>
    <p>try CategoryTrying instead</p>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>    

        <!-- Button trigger modal -->
    <a href="#" role="button" class="btn btn-primary btn-lg" id="link" onclick="$('#myModal').modal()">Launch</a>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <!-- Modal -->
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                        </button>
                            <h4 class="modal-title" id="myModalLabel">Showing Dialog Using Method 1</h4>

                    </div>
                    <div class="modal-body">...</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button Text="Save" OnClick="Submit" runat="server"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

                    </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

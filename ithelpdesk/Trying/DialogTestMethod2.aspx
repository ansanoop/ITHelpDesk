<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="DialogTestMethod2.aspx.cs" Inherits="ithelpdesk.TestBootstrapDialog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">        
    <link href="../css/bootstrap-dialog.css" rel="stylesheet" />    
    <script src="../js/bootstrap-dialog.js"></script>
    <script>
        function showDialog() {
            var dialog = new BootstrapDialog({
                message: 'Hi Apple!',
                buttons: [{
                    id: 'btn-1',
                    label: 'Button 1'
                }]
            });
            dialog.realize();
            var btn1 = dialog.getButton('btn-1');
            btn1.click({ 'name': 'Apple' }, function (event) {
                alert('Hi, ' + event.data.name);
            });
            dialog.open();

            //BootstrapDialog.show({
            //    title: 'New Category',
            //    message: $('<textarea class="form-control" placeholder="Type a new category name ..."></textarea>'),
            //    buttons: [{
            //        label: 'OK',
            //        cssClass: 'btn-primary',
            //        hotkey: 13, // Enter.
            //        action: function () {
            //            alert('You pressed Enter.');
            //        }
            //    }]
            //});
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Do not try this one, won't work</p>
    <p>try CategoryTrying instead</p>

    <asp:ScriptManager ID="MainScriptManager" runat="server" ></asp:ScriptManager>
    <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
        <ContentTemplate>
            <asp:Label runat="server" ID="lblHelloWorld" Text="Click the button!" />
            <br /><br />
            <asp:Button runat="server" ID="btnHelloWorld" OnClick="btnHelloWorld_Click" Text="Update label!" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="pnlCategories" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gridview_categories" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Categories" SortExpression="Name" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=kingston;Initial Catalog=Athl_TicketRequestTest;Persist Security Info=True;User ID=ATHL_dbo;Password=A5MV986s;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [Categories]"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
        
    <div class="content">
        <a href="#" role="button" class="btn btn-primary btn-lg" id="link" 
        onclick="showDialog()">Launch</a>
    </div>
</asp:Content>

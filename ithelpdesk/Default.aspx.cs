using System;
using System.Data.Objects;
using System.Data.Objects.DataClasses;

using eRaider;
using System.Web;

namespace ithelpdesk
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //eRaiderInfo info = Functions.getLoginInfo();
            //if (info != null)
            //{
            //    txtEmployeeName.Text = info.eRaiderDisplayFirstName + " " + info.eRaiderDisplayLastName;
            //    txtEmail.Text = info.email;
            //}
            //else
            //    txtEmployeeName.Text = "";
            txtEmployeeName.Text = "Someone (Hard code)";
            txtEmail.Text = "someone@ttu.edu (Hard code)";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Issue issue = new Issue();
            issue.raiderName = txtEmployeeName.Text;
            issue.email = txtEmail.Text;
            issue.phone = txtPhoneNumber.Text;
            issue.issueShortDescription = txtShortDescription.Text;
            issue.issueLongDescription = txtDescription.Text;
            issue.submittedTime = DateTime.Now;
            issue.requestFor = txtRequestFor.Text;
            if (FileUpload1.HasFile)
            {
                try
                {
                    string fullpath = Server.MapPath("~/Upload/"+FileUpload1.FileName);
                    FileUpload1.SaveAs(fullpath);
                    issue.upload_path = "~/Upload/" + FileUpload1.FileName;
                }
                catch(Exception ex)
                {
                    Response.Write("file upload exception"+ex);
                }
            }
            //try
            //{
            ITHelpDeskEntities context = new ITHelpDeskEntities();
            context.Issues.Add(issue);
            context.SaveChanges();
            var userId = issue.Id;
            context.Dispose();

            //Functions.Send_Mail(txtEmail.Text, "athletics.helpdesk@ttu.edu", "New Request - " + txtShortDescription.Text, "You Have a new Request!!!<br/>click <a href='http://spark.ttu.edu/itHelpDesk/ViewIssue.aspx?ID=" + userId + "'>here</a> to go to View the request. ");

            // Redirect to success page
            Functions.showSuccess(Response, "Your question has been sent to the IT department.", "~/Default.aspx");
            //}
            //catch (Exception ex)
            //{
            //    Response.Redirect("~/Failure.aspx?err=" + ex.Message);
            //}
        }
    }
}
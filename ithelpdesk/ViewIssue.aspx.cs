using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using eRaider;

namespace ithelpdesk
{
    public partial class ViewIssue : System.Web.UI.Page
    {
        private Issue issue;
        ITHelpDeskEntities context = new ITHelpDeskEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
                Response.Redirect("~/Failure.aspx");
            
            int requestID = Int16.Parse(Request.QueryString["ID"]);
            issue = Functions.getIssueById(requestID, context);
            if (issue != null)
            {                
                if (issue.isDeleted == true)
                {
                    loadControlsForDeletedIssue();
                }
                else
                {
                    loadControlsForNormalIssue();
                }
                lblRequestedBy.Text = issue.raiderName;
                lblEmail.Text = issue.email;
                lblPhone.Text = StringUtils.formatPhoneNumber(issue.phone);
                lblRequestFor.Text = issue.requestFor;
                lblBriefDescription.Text = issue.issueShortDescription;
                lblLongDescription.Text = issue.issueLongDescription;
                hplAttach.NavigateUrl = issue.upload_path;
                hplAttach.Text = Path.GetFileName(issue.upload_path);
                hplAttach.Visible = issue.upload_path != null;
                lblNoAttach.Visible = issue.upload_path == null;
                lblRequestedOn.Text = issue.submittedTime.ToString();                
            }            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/IssueList.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int issueID = Int16.Parse(Request.QueryString["ID"]);
            eRaiderInfo loginInfo = Functions.getLoginInfo();

            Process process = new Process();
            process.IssueId = issueID;
            process.Status = ddlAction.SelectedValue;
            process.ChangedBy = Functions.getFirstLastFromRaiderInfo(loginInfo);
            process.Remark = txtRemark.Text;
            process.ChangedAt = DateTime.Now;
            
            issue.status = ddlAction.SelectedValue;
            issue.modifiedAt = DateTime.Now;
            issue.modifiedBy = Functions.getFirstLastFromRaiderInfo(loginInfo);

            try
            {                
                context.Processes.Add(process);
                context.SaveChanges();                

                processGrid.DataBind();
                lblMessage.Text = "Updated!";
                loadControlsForNormalIssue();
            }
            catch (Exception ex)
            {                
                Response.Redirect("~/Failure.aspx?err=" + ex.InnerException);
            }
        }

        public IQueryable processGrid_GetData()
        {
            int issueID = Int16.Parse(Request.QueryString["ID"]);            
            IQueryable rs = from d in context.Processes where d.IssueId == issueID orderby d.Id descending select d;

            // Set latest status for the issue
            //List<Process> list = rs.Cast<Process>().ToList();
            //Process latest = list.LastOrDefault();            
            //if (latest== null)
            //{
            //    lblStatus.Text = "- Not Started";
            //}
            //else
            //{
            //    lblStatus.Text = "- "+ latest.Status;
            //}
            return rs;
        }

        protected void processGrid_PreRender(object sender, EventArgs e)
        {
            if (processGrid.Rows.Count == 0)
                return;
            GridViewRow row = processGrid.Rows[0];
            row.Attributes.Add("class", "info");
        }

        protected void btnRecover_Click(object sender, EventArgs e)
        {            
            try
            {
                issue.isDeleted = false;
                context.SaveChanges();
                lblMessage.Text = "Issue " + issue.Id + " has been recovered!";
                loadControlsForNormalIssue();
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Failure.aspx?err=" + ex.Message);
            }
        }

        #region Helpers
        private void loadControlsForDeletedIssue()
        {
            lblStatus.Text = "- Deleted";
            btnRecover.Visible = true;
            ddlAction.Enabled = false;
            txtRemark.Enabled = false;
            btnSubmit.Enabled = false;            
        }

        private void loadControlsForNormalIssue()
        {
            if (string.IsNullOrEmpty(issue.status))
                lblStatus.Text = "";
            else
                lblStatus.Text = "- " + issue.status;
            btnRecover.Visible = false;
            ddlAction.Enabled = true;
            txtRemark.Enabled = true;
            btnSubmit.Enabled = true;
            imgStatus.ImageUrl = Functions.getImgURLForStatus(issue.status);
        }
        #endregion
    }
}
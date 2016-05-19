using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.Objects;

namespace ithelpdesk
{
    public partial class IssueList : System.Web.UI.Page
    {
        //private IQueryable dataSource;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Issue> issuesGrid_GetData(string sortByExpression, [Control("ddlStatus")] int? statusId,
                    [Control("ckbShowDeleted")] bool? showDeleted, [Control("ddlTimeFilter")] int? timeFilterRangeId)
        {            
            ITHelpDeskEntities context = new ITHelpDeskEntities();
            IQueryable<Issue> query;
            if (showDeleted == false)
                query = from i in context.Issues where (i.isDeleted == null || i.isDeleted == false) select i;
            else
                query = from i in context.Issues select i;

            // Time Filter
            if (timeFilterRangeId != 0)
            {
                query = query.Where(i => DateTime.Now <= EntityFunctions.AddDays(i.submittedTime, timeFilterRangeId));
            }
            
            //select new
            //{
            //    Id = i.Id,
            //    raiderName = i.raiderName,
            //    issueShortDescription = i.issueShortDescription,
            //    status = i.Processes.OrderByDescending(o => o.Id).FirstOrDefault().Status
            //};

                // Status filter
            if (statusId != null) {
                if (statusId == 0) // Not Started
                    query = query.Where(a => a.status == "" || a.status == null);
                else if (statusId == 1) // In progress
                    query = query.Where(a => a.status == "In Progress");
                else if (statusId == 2) // Completed
                    query = query.Where(a => a.status == "Completed");
                else if (statusId == 3) // Follow
                    query = query.Where(a => a.status == "Follow");                
            }

            // Process orderBy
            // Always put in inversed order by default
            query = query.OrderByDescending(x => x.Id);
            // Now filter by condition
            if (sortByExpression != null)
            {
                string[] sortExp = sortByExpression.Split(' ');
                string orderField = sortExp[0];
                string sortDirection = sortExp.Length == 2 ? sortExp[1] : null;

                switch (orderField)
                {
                    case "Id": // This special case needs to put in reversed order!!!
                        query = sortDirection == null ? query.OrderBy(x => x.Id) : query.OrderByDescending(x => x.Id);
                        break;

                    case "requestFor":
                        query = sortDirection == null ? query.OrderBy(x => x.requestFor) : query.OrderByDescending(x => x.requestFor);
                        break;

                    case "raiderName":
                        query = sortDirection == null ? query.OrderBy(x => x.raiderName) : query.OrderByDescending(x => x.raiderName);
                        break;

                    //case "submittedTime":
                    //    query = sortDirection == null ? query.OrderBy(x => x.submittedTime) : query.OrderByDescending(x => x.submittedTime);
                    //    break;

                    //case "status":
                    //    query = sortDirection == null ? query.OrderBy(x => x.status) : query.OrderByDescending(x => x.status);
                    //    break;

                    case "modifiedBy":
                        query = sortDirection == null ? query.OrderBy(x => x.modifiedBy) : query.OrderByDescending(x => x.modifiedBy);
                        break;

                    //case "modifiedAt":
                    //    query = sortDirection == null ? query.OrderBy(x => x.modifiedAt) : query.OrderByDescending(x => x.modifiedAt);
                    //    break;
                }
            }
            // Return final result set <IQueryable>
            return query;
        }
        
        public void issuesGrid_DeleteIssue(int Id)
        {
            ITHelpDeskEntities context = new ITHelpDeskEntities();
            try
            {                
                Issue issue = (from i in context.Issues where i.Id == Id select i).SingleOrDefault();
                if (issue != null)
                {
                    issue.isDeleted = true;
                    context.SaveChanges();
                    lblMessage.Text = "Issue " + Id.ToString() + " has been deleted!";
                }
            }
            catch (Exception ex)
            {                
                Response.Redirect("~/Failure.aspx?err=" + ex.Message);
            }
            finally
            {
                context.Dispose();
            }
        }

        protected void issuesGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Issue i = (Issue)e.Row.DataItem;
                if (i.isDeleted == true)
                {
                    e.Row.CssClass = "strikedRow";
                    e.Row.Cells[e.Row.Cells.Count - 1].Controls.Clear();
                }
                Image img = (Image)e.Row.Cells[4].Controls[0];
                img.ImageUrl = Functions.getImgURLForStatus(i.status);
            }
        }
    }
}
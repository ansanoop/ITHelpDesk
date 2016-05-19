using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ithelpdesk
{
    public partial class Notes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable notesList_GetData()
        {
            ITHelpDeskEntities context = new ITHelpDeskEntities();

            // Get Selected Category from Request, get the 1st one as default
            Category category = null;
            if (Request["catid"] == null)
                category = (from c in context.Categories select c).OrderBy(i => i.Id).FirstOrDefault();
            else
            {
                int catId = short.Parse(Request["catid"]);
                category = (from c in context.Categories where c.Id == catId select c).SingleOrDefault();
            }
            if (category == null)
                Response.Redirect("~/Failure.aspx?err=" + "Opps, something went wrong!");

            lblCategoryName.Text = category.Name;

            // Get Questions and Answers in that category
            IQueryable<Note> notesList = from n in context.Notes where n.CategoryId == category.Id select n;
            return notesList;
        }        
    }
}
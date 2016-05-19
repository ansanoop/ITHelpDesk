using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ithelpdesk.Trying
{
    public partial class CategoryTrying : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit(object sender, EventArgs e)
        {
            //Label1.Text = TextBox1.Text + " " + TextBox2.Text + " " + TextBox3.Text;
        }

        protected void NewCategory(object sender, EventArgs e)
        {
            //Label2.Text = txtNewCategory.Text;
            Category cat = new Category();
            cat.Name = txtNewCategory.Text;

            ITHelpDeskEntities context = new ITHelpDeskEntities();
            context.Categories.Add(cat);
            context.SaveChanges();
            context.Dispose();

            ListView1.DataBind();
            UpdatePanel2.Update();
        }
    }
}
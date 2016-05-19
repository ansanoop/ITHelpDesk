using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ithelpdesk.Trying
{
    public partial class Ajax5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit(object sender, EventArgs e)
        {
            Label1.Text = TextBox1.Text + " " + TextBox2.Text + " " + TextBox3.Text;
        }
    }
}
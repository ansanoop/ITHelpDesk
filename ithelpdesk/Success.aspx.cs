using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ithelpdesk
{
    public partial class Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = StringUtils.emptyOrString(HttpContext.Current.Session["msg"]);
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(StringUtils.emptyOrString(HttpContext.Current.Session["redirect_to"]));
        }
    }
}
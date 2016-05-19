using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ithelpdesk.Trying
{
    public partial class Ajax4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Update Progress";            
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {            
            lblHelloWorld.Text = "Hello W1111";
            //System.Threading.Thread.Sleep(5000);            
        }
    }
}
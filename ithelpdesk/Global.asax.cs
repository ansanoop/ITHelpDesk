using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ithelpdesk
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session.Add("eRaiderDBConnStr", "user id=ESI_ATHL_ITHELPDESK; password=A0EnUjAlUgUdIyO;	database=eraider;server=eraiderdb.net.ttu.edu");
            Session.Add("eRaiderDispatchURL", "http://spark.ttu.edu/ithelpdesk/Login.aspx");
            Session.Add("eRaiderFailureURL", "");
        }
    }
}
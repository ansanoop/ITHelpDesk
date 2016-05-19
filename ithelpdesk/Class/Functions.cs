using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eRaider;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace ithelpdesk
{
    public class Functions
    {
        public static eRaiderInfo getLoginInfo()
        {
            string raiderName = HttpContext.Current.User.Identity.Name;
            return SecurityHelper.GeteRaiderInfoByEraiderUsername(raiderName);
        }        

        public static Issue getIssueById(int id, ITHelpDeskEntities context)
        {            
            return context.Issues.First(a => a.Id == id);            
        }

        public static string getFirstLastFromRaiderInfo(eRaider.eRaiderInfo info)
        {
            return "Quan Nguyen";
            //if (info == null)
            //    return "";
            //return info.eRaiderDisplayFirstName + " " + info.eRaiderDisplayLastName;
        }

        public static void Send_Mail(string from, string to, string subject, string body)
        {
            var mail = new MailMessage();
            string To_email = to;
            mail.To.Add(To_email);
            mail.IsBodyHtml = true;
            mail.From = new MailAddress(from);
            mail.Subject = subject;
            mail.Body = body;
            //AlternateView plainView = AlternateView.CreateAlternateViewFromString(body);
            //mail.AlternateViews.Add(plainView);
            var smtp = new SmtpClient("basic.smtp.ttu.edu");
            smtp.Send(mail);
        }

        public static void showSuccess(HttpResponse response, string msg, string dest)
        {
            HttpContext.Current.Session["msg"] = msg;
            HttpContext.Current.Session["redirect_to"] = dest;
            response.Redirect("~/Success.aspx");
        }

        public static string getImgURLForStatus(string status)
        {
            if (string.IsNullOrEmpty(status) || status == "Not Started")            
                return "~/Images/new.png";                
            
            if (status == "In Progress")            
                return "~/Images/progress.png";                
            
            if (status == "Follow")            
                return "~/Images/followup.png";                
            
            if (status == "Completed")            
                return "~/Images/done.png";

            return "";            
        }
    }
}
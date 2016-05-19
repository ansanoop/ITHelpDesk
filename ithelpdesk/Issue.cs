//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ithelpdesk
{
    using System;
    using System.Collections.Generic;
    
    public partial class Issue
    {
        public Issue()
        {
            this.Processes = new HashSet<Process>();
        }
    
        public int Id { get; set; }
        public string raiderName { get; set; }
        public string issueShortDescription { get; set; }
        public string issueLongDescription { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string upload_path { get; set; }
        public Nullable<System.DateTime> submittedTime { get; set; }
        public string requestFor { get; set; }
        public Nullable<System.DateTime> modifiedAt { get; set; }
        public string modifiedBy { get; set; }
        public string status { get; set; }
        public Nullable<bool> isDeleted { get; set; }
    
        public virtual ICollection<Process> Processes { get; set; }
    }
}

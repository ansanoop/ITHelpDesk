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
    
    public partial class Process
    {
        public int Id { get; set; }
        public string Status { get; set; }
        public string ChangedBy { get; set; }
        public string Remark { get; set; }
        public Nullable<System.DateTime> ChangedAt { get; set; }
        public Nullable<int> IssueId { get; set; }
    
        public virtual Issue Issue { get; set; }
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BanSanGo1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product()
        {
            this.carts = new HashSet<cart>();
        }
    
        public int id { get; set; }
        public Nullable<int> category_id { get; set; }
        public string name { get; set; }
        public string details { get; set; }
        public Nullable<decimal> price { get; set; }
        public string image { get; set; }
        public Nullable<decimal> thickness { get; set; }
        public Nullable<decimal> width { get; set; }
        public Nullable<decimal> length { get; set; }
        public string warranty { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cart> carts { get; set; }
        public virtual category category { get; set; }
    }
}

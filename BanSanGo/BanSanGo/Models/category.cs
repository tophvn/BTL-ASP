using System.Collections.Generic;
using BanSanGo.Models; 

namespace BanSanGo.Models
{
    public partial class category
    {
        public int id { get; set; }
        public string name { get; set; }

        public virtual ICollection<product> products { get; set; }
    }
}

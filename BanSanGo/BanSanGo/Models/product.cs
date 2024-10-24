namespace BanSanGo.Models
{
    public class product
    {
        public int id { get; set; }
        public int category_id { get; set; }
        public string name { get; set; }
        public string details { get; set; }
        public int price { get; set; }
        public string image { get; set; }
        public decimal thickness { get; set; }
        public decimal width { get; set; }
        public decimal length { get; set; }
        public string warranty { get; set; }

        public virtual category category { get; set; }
    }
}

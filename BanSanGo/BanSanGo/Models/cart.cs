namespace BanSanGo.Models
{
    public class cart
    {
        public int id { get; set; }
        public int user_id { get; set; }
        public int pid { get; set; }
        public string name { get; set; }
        public int quantity { get; set; }
        public string image { get; set; }
        public int price { get; set; }
    }
}

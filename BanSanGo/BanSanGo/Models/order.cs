using System;

namespace BanSanGo.Models
{
    public class orders
    {
        public int id { get; set; }
        public int user_id { get; set; }
        public string name { get; set; }
        public string number { get; set; }
        public string email { get; set; }
        public string payment_method { get; set; }
        public string address { get; set; }
        public int total_product { get; set; }
        public int total_price { get; set; }
        public TimeSpan time_order { get; set; }
        public string payment_status { get; set; }
    }
}

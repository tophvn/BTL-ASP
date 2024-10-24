using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Mvc;
using BanSanGo.Models;

namespace BanSanGo.Controllers
{
    public class CartController : Controller
    {
        // Giỏ hàng người dùng (mô phỏng)
        private static List<cart> userCart = new List<cart>();

        // GET: Cart
        public ActionResult Index()
        {
            return View(userCart);
        }

        // POST: Cart/Add
        [HttpPost]
        public ActionResult Add(int productId, string productName, string productImage, int productPrice)
        {
            // Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
            var existingItem = userCart.Find(item => item.pid == productId);
            if (existingItem != null)
            {
                existingItem.quantity++;
            }
            else
            {
                userCart.Add(new cart
                {
                    id = userCart.Count + 1, // Tạo ID ngẫu nhiên cho sản phẩm
                    pid = productId,
                    name = productName,
                    image = productImage,
                    price = productPrice,
                    quantity = 1
                });
            }

            return RedirectToAction("Index");
        }

        // POST: Cart/Remove
        [HttpPost]
        public ActionResult Remove(int productId)
        {
            var itemToRemove = userCart.Find(item => item.pid == productId);
            if (itemToRemove != null)
            {
                userCart.Remove(itemToRemove);
            }

            return RedirectToAction("Index");
        }

        // POST: Cart/Clear
        [HttpPost]
        public ActionResult Clear()
        {
            userCart.Clear();
            return RedirectToAction("Index");
        }
    }
}

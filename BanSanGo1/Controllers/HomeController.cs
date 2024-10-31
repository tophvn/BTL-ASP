using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BanSanGo1.Models;  // Thêm namespace của Entity Model

namespace BanSanGo1.Controllers
{
    public class HomeController : Controller
    {
        private websangoEntities db = new websangoEntities();
        private static List<cart> userCart = new List<cart>();

        public ActionResult Index()
        {
            // Lấy danh sách sản phẩm từ Entity Framework
            List<product> products = db.products.ToList();
            List<category> categories = db.categories.ToList();

            ViewBag.Categories = categories;
            return View(products);
        }

        public ActionResult Details(int id)
        {
            // Lấy sản phẩm theo id từ Entity Framework
            product product = db.products.FirstOrDefault(p => p.id == id);

            if (product == null)
            {
                return HttpNotFound();
            }

            return View(product);
        }

        public ActionResult Cart()
        {
            return View(userCart);
        }

        [HttpPost]
        public ActionResult AddToCart(int productId, string name, string image, decimal price, int quantity)
        {
            var existingItem = userCart.Find(item => item.pid == productId);
            if (existingItem != null)
            {
                existingItem.quantity += quantity;
            }
            else
            {
                userCart.Add(new cart
                {
                    id = userCart.Count + 1,
                    pid = productId,
                    name = name,
                    image = image,
                    price = price,
                    quantity = quantity
                });
            }

            return RedirectToAction("Cart");
        }

        [HttpPost]
        public ActionResult Remove(int productId)
        {
            var itemToRemove = userCart.Find(item => item.pid == productId);
            if (itemToRemove != null)
            {
                userCart.Remove(itemToRemove);
            }

            return RedirectToAction("Cart");
        }

        [HttpPost]
        public ActionResult Clear()
        {
            userCart.Clear();
            return RedirectToAction("Cart");
        }

        public ActionResult About()
        {
            return View();
        }
    }
}

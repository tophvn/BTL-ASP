using System;
using System.Linq;
using System.Web.Mvc;
using BanSanGo1.Models;
using System.Security.Cryptography;
using System.Text;

namespace BanSanGo1.Controllers
{
    public class AccountController : Controller
    {
        private websangoEntities db = new websangoEntities(); // Sử dụng Entity Framework context

        // GET: Account/Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(user model)
        {
            if (ModelState.IsValid)
            {
                string hashedPassword = HashPassword(model.password);

                // Sử dụng LINQ để tìm người dùng với email và mật khẩu đã mã hóa
                var user = db.users.FirstOrDefault(u => u.email == model.email && u.password == hashedPassword);

                if (user != null)
                {
                    // Đăng nhập thành công, lưu thông tin người dùng vào session
                    Session["UserId"] = user.id;
                    Session["UserName"] = user.name;
                    Session["UserType"] = user.user_type;
                    return RedirectToAction("Index", "Home");
                }
            }

            ViewBag.ErrorMessage = "Email hoặc mật khẩu không đúng.";
            return View();
        }

        // GET: Account/Register
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(user model)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra email đã tồn tại chưa
                bool emailExists = db.users.Any(u => u.email == model.email);
                if (emailExists)
                {
                    ViewBag.ErrorMessage = "Email đã được sử dụng. Vui lòng chọn email khác.";
                    return View();
                }

                // Thêm người dùng mới vào database
                model.password = HashPassword(model.password); // Mã hóa mật khẩu
                model.user_type = "user"; // Gán giá trị mặc định cho loại người dùng

                db.users.Add(model);
                db.SaveChanges();

                return RedirectToAction("Login");
            }

            return View();
        }

        // GET: Account/Logout
        public ActionResult Logout()
        {
            Session.Clear(); // Xóa thông tin session
            return RedirectToAction("Index", "Home");
        }

        // Hàm mã hóa mật khẩu
        private string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                var bytes = Encoding.UTF8.GetBytes(password);
                var hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }
        }
    }
}

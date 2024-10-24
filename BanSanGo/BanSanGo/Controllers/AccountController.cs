using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Mvc;
using BanSanGo.Models;
using System.Security.Cryptography;
using System.Text;

namespace BanSanGo.Controllers
{
    public class AccountController : Controller
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        // GET: Account/Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(users model)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM [users] WHERE email = @Email AND password = @Password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", model.email);
                    command.Parameters.AddWithValue("@Password", HashPassword(model.password)); // Mã hóa mật khẩu
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Đăng nhập thành công, lưu thông tin người dùng vào session
                            Session["UserId"] = reader["id"];
                            Session["UserName"] = reader["name"];
                            Session["UserType"] = reader["user_type"];
                            return RedirectToAction("Index", "Home");
                        }
                    }
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
        public ActionResult Register(users model)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO [users] (name, email, password, user_type) VALUES (@Name, @Email, @Password, @UserType)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", model.name);
                    command.Parameters.AddWithValue("@Email", model.email);
                    command.Parameters.AddWithValue("@Password", HashPassword(model.password)); // Mã hóa mật khẩu
                    command.Parameters.AddWithValue("@UserType", "user"); // Giá trị mặc định

                    command.ExecuteNonQuery();
                }
            }
            return RedirectToAction("Login");
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
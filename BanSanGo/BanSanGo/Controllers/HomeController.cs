using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Mvc;
using BanSanGo.Models;
using System;

namespace BanSanGo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            List<product> products = new List<product>();
            List<category> categories = new List<category>();

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Lấy danh sách sản phẩm
                string queryProducts = "SELECT * FROM product";
                using (SqlCommand command = new SqlCommand(queryProducts, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            product product = new product
                            {
                                id = reader["id"] != DBNull.Value ? (int)reader["id"] : 0,
                                category_id = reader["category_id"] != DBNull.Value ? (int)reader["category_id"] : 0,
                                name = reader["name"] != DBNull.Value ? (string)reader["name"] : string.Empty,
                                details = reader["details"] != DBNull.Value ? (string)reader["details"] : string.Empty,
                                price = reader["price"] != DBNull.Value ? (int)reader["price"] : 0,
                                image = reader["image"] != DBNull.Value ? (string)reader["image"] : string.Empty,
                                thickness = reader["thickness"] != DBNull.Value ? (decimal)reader["thickness"] : 0,
                                width = reader["width"] != DBNull.Value ? (decimal)reader["width"] : 0,
                                length = reader["length"] != DBNull.Value ? (decimal)reader["length"] : 0,
                                warranty = reader["warranty"] != DBNull.Value ? (string)reader["warranty"] : string.Empty
                            };
                            products.Add(product);
                        }
                    }
                }

                // Lấy danh sách danh mục
                string queryCategories = "SELECT * FROM category";
                using (SqlCommand command = new SqlCommand(queryCategories, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            category category = new category
                            {
                                id = reader["id"] != DBNull.Value ? (int)reader["id"] : 0,
                                name = reader["name"] != DBNull.Value ? (string)reader["name"] : string.Empty
                            };
                            categories.Add(category);
                        }
                    }
                }
            }

            // Chuyển thông tin vào ViewBag để hiển thị trong View
            ViewBag.Categories = categories;
            return View(products);
        }

        // GET: Home/Details/5
        public ActionResult Details(int id)
        {
            product product = null;

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Lấy thông tin sản phẩm theo ID
                string queryProduct = "SELECT * FROM product WHERE id = @id";
                using (SqlCommand command = new SqlCommand(queryProduct, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            product = new product
                            {
                                id = reader["id"] != DBNull.Value ? (int)reader["id"] : 0,
                                category_id = reader["category_id"] != DBNull.Value ? (int)reader["category_id"] : 0,
                                name = reader["name"] != DBNull.Value ? (string)reader["name"] : string.Empty,
                                details = reader["details"] != DBNull.Value ? (string)reader["details"] : string.Empty,
                                price = reader["price"] != DBNull.Value ? (int)reader["price"] : 0,
                                image = reader["image"] != DBNull.Value ? (string)reader["image"] : string.Empty,
                                thickness = reader["thickness"] != DBNull.Value ? (decimal)reader["thickness"] : 0,
                                width = reader["width"] != DBNull.Value ? (decimal)reader["width"] : 0,
                                length = reader["length"] != DBNull.Value ? (decimal)reader["length"] : 0,
                                warranty = reader["warranty"] != DBNull.Value ? (string)reader["warranty"] : string.Empty
                            };
                        }
                    }
                }
            }

            if (product == null)
            {
                return HttpNotFound(); // Nếu không tìm thấy sản phẩm
            }

            return View(product); // Trả về view chi tiết sản phẩm
        }
    }
}

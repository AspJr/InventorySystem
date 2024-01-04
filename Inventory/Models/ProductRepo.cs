using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class ProductRepo
    {
        private static string myConn = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
		private const string SelectOneQuery = "Select ID,Name, Qty FROM Product WHERE ID=@ID";
		private const string SelectQuery = "Select ID,Name, Qty FROM Product";
		private const string SelectImageQuery = "Select ID,ProductID,FileName FROM ProductImage WHERE ProductID=@ProductID";
		private const string SelectLastRowQuery = "Select TOP 1 ID FROM [Product] ORDER BY id DESC";
		private const string InsertQuery = "Insert Into Product(Name, Qty, CreatedBy,CreatedDate) Values (@Name, @Qty,@CreatedBy,@CreatedDate)";
		private const string InsertImageQuery = "Insert Into ProductImage(Filename, ProductID, CreatedBy,CreatedDate) Values (@Filename, @ProductID,@CreatedBy,@CreatedDate)";
		private const string UpdateQuery = "Update Product Set Name=@Name, Qty=@Qty,ModifiedBy=@ModifiedBy,ModifiedDate=@ModifiedDate Where ID=@ID";
		private const string DeleteQuery = "Delete Product Where ID=@ID";
		private const string DeleteProductImageQuery = "Delete ProductImage Where ProductID=@ProductID";
		private const string DeleteImageQuery = "DELETE FROM ProductImage WHERE ProductID = @ProductID";
		private const string PathImage = "~/UploadImage/Product/";

		private ProductRepo() { }

		#region Singleton
		private static ProductRepo instance = null;
		public static ProductRepo Instance
		{
			get
			{
				if (instance == null)
				{
					instance = new ProductRepo();
				}
				return instance;
			}
		}
		#endregion
		public Product Get(int id)
		{
			Product product = new Product();
			SqlConnection con = new SqlConnection(myConn);
			con.Open();
			using (SqlCommand com = new SqlCommand(SelectOneQuery,con))
			{
				com.Parameters.AddWithValue("@ID", id);

				using (SqlDataReader reader = com.ExecuteReader())
				{
					while (reader.Read())
					{
                        product.ID = reader.GetInt32((reader.GetOrdinal("Id")));
                        product.Name = reader.GetString(reader.GetOrdinal("Name"));
                        product.Qty = reader.GetInt32(reader.GetOrdinal("Qty"));
                    }
					product.ProductImages = GetImageByProduct(id);
				}
			}
			return product;
		}
		public List<ProductImage> GetImageByProduct(int productID)
		{
			List<ProductImage> images = new List<ProductImage>();
			SqlConnection con = new SqlConnection(myConn);
			con.Open();
			using (SqlCommand command = new SqlCommand(SelectImageQuery, con))
			{
				command.Parameters.AddWithValue("@ProductID", productID);
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					images.Add(new ProductImage
					{
						ID = reader.GetInt32((reader.GetOrdinal("Id"))),
						FileName = string.Format("{0}{1}", PathImage, reader.GetString(reader.GetOrdinal("FileName")))
					});
				}
				reader.Close();
			}

			return images;
		}
		public List<Product> GetList()
        {
			List<Product> products = new List<Product>();
			SqlConnection con = new SqlConnection(myConn);
			SqlCommand command = new SqlCommand(SelectQuery, con);
			con.Open();
			SqlDataReader reader = command.ExecuteReader();
			while (reader.Read())
			{
				products.Add(new Product
				{
					ID = reader.GetInt32((reader.GetOrdinal("Id"))),
					Name = reader.GetString(reader.GetOrdinal("Name")),
					Qty = reader.GetInt32(reader.GetOrdinal("Qty"))
				});
			}
			reader.Close();
			con.Close();

			return products;
		}
		public bool Insert(Product product)
		{
			int rows;
			using (SqlConnection con = new SqlConnection(myConn))
			{
				con.Open();
				using (SqlCommand com = new SqlCommand(InsertQuery, con))
				{
					com.Parameters.AddWithValue("@Name", product.Name);
					com.Parameters.AddWithValue("@Qty", product.Qty);
					com.Parameters.AddWithValue("@CreatedBy", "App-Insert");
					com.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
					rows = com.ExecuteNonQuery();
				}
			}

			return (rows > 0) ? true : false;
		}

		public bool InsertImage(ProductImage productImage)
		{
			int rows;
			using (SqlConnection con = new SqlConnection(myConn))
			{
				con.Open();
				using (SqlCommand com = new SqlCommand(InsertImageQuery, con))
				{
					com.Parameters.AddWithValue("@FileName", productImage.FileName);
					com.Parameters.AddWithValue("@ProductID", productImage.ProductID);
					com.Parameters.AddWithValue("@CreatedBy", "App-Insert");
					com.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
					rows = com.ExecuteNonQuery();
				}
			}

			return (rows > 0) ? true : false;
		}

		public Product GetLastRow()
		{
			Product product = new Product();
			SqlConnection con = new SqlConnection(myConn);
			con.Open();
			using (SqlCommand com = new SqlCommand(SelectLastRowQuery, con))
			{
				using (SqlDataReader reader = com.ExecuteReader())
				{
					while (reader.Read())
					{
						product.ID = reader.GetInt32((reader.GetOrdinal("Id")));
					}
				}
			}
			return product;
		}

		public bool Update(Product product)
		{
			int rows;
			using (SqlConnection con = new SqlConnection(myConn))
			{
				con.Open();
				using (SqlCommand com = new SqlCommand(UpdateQuery, con))
				{
					com.Parameters.AddWithValue("@Name", product.Name);
					com.Parameters.AddWithValue("@Qty", product.Qty);
					com.Parameters.AddWithValue("@ModifiedBy", "App-Update");
					com.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
					com.Parameters.AddWithValue("@ID", product.ID);
					rows = com.ExecuteNonQuery();
				}
			}
			return (rows > 0) ? true : false;
		}
		public bool Delete(int id)
		{
			int rows;
			using (SqlConnection con = new SqlConnection(myConn))
			{
				con.Open();
				using (SqlCommand com = new SqlCommand(DeleteQuery, con))
				{
					com.Parameters.AddWithValue("@ID", id);
					rows = com.ExecuteNonQuery();
				}
			}
			return (rows > 0) ? true : false;
		}

		public bool DeleteProductImage(int ProductID)
		{
			int rows;
			using (SqlConnection con = new SqlConnection(myConn))
			{
				con.Open();
				using (SqlCommand com = new SqlCommand(DeleteProductImageQuery, con))
				{
					com.Parameters.AddWithValue("@ProductID", ProductID);
					rows = com.ExecuteNonQuery();
				}
			}
			return (rows > 0) ? true : false;
		}

		public bool DeleteImage(int ProductID)
		{
			int rows;
			using (SqlConnection con = new SqlConnection(myConn))
			{
				con.Open();
				using (SqlCommand com = new SqlCommand(DeleteImageQuery, con))
				{
					com.Parameters.AddWithValue("@ProductID", ProductID);
					rows = com.ExecuteNonQuery();
				}
			}
			return (rows > 0) ? true : false;
		}
	}
}
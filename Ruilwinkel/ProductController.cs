﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace Ruilwinkel
{
    public class ProductController : ApiController
    {
        [HttpGet]
        public IEnumerable<ArticleStatus> GetArticleStatus()
        {
            List<ArticleStatus> articleStatus = new List<ArticleStatus>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=productbeheerserver.database.windows.net;Initial Catalog=RuilwinkelDB;Persist Security Info=True;User ID=DevOps;Password=Zuyd2021";
            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT ARTICLE.ID, ARTICLE.STATUS FROM ARTICLE";
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                int articleID = int.Parse(dr.GetValue(0).ToString());
                bool status = (bool)dr.GetValue(1);
                articleStatus.Add(new ArticleStatus { ArticleID = articleID, status = status });
            }
            con.Close();

            return articleStatus;

        }


        [HttpPost]
        public void InsertNewProduct(Product product)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=productbeheerserver.database.windows.net;Initial Catalog=RuilwinkelDB;Persist Security Info=True;User ID=DevOps;Password=Zuyd2021";
            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into [PRODUCT] values(@CATEGORYID, @PRODUCTNAME, @DESCRIPTION)";
            cmd.Parameters.AddWithValue("@CATEGORYID", product.CategorieID);
            cmd.Parameters.AddWithValue("@PRODUCTNAME", product.ProductName);
            cmd.Parameters.AddWithValue("@DESCRIPTION", product.Description);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //[HttpPost]
        //public void InsertImage(Image Picture)
        //{
        //    Image img = Picture;
        //    byte[] bArr = Global.imgToByteArray(img);
        //    SqlConnection con = new SqlConnection();
        //    con.ConnectionString = @"Data Source=productbeheerserver.database.windows.net;Initial Catalog=RuilwinkelDB;Persist Security Info=True;User ID=DevOps;Password=Zuyd2021";
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "insert into [TESTIMAGE] values(@Image)";
        //    cmd.Parameters.AddWithValue("@Image", bArr);
        //    cmd.Connection = con;
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //}

        /*
        [HttpPost]
        [Route("api/FileUploading/UploadFile")]
        public async Task<string> UploadFile()
        {
            var ctx = HttpContext.Current;
            var root = ctx.Server.MapPath("~/App_Data");
            var provider = new MultipartFormDataStreamProvider(root);


            try
            {
                await Request.Content
                    .ReadAsMultipartAsync(provider);

                foreach (var file in provider.FileData)
                {
                    var name = file.Headers
                        .ContentDisposition
                        .FileName;

                    // remove double quotes from string.
                    name = name.Trim('"');

                    var localFileName = file.LocalFileName;
                    var filePath = Path.Combine(root, name);

                    File.Move(localFileName, filePath);
                }
            }
            catch (Exception e)
            {
                return $"Error: {e.Message}";
            }

            return "File uploaded!";
        }
        */

        /*public void UpdateArticle()*/

        /*public void GetProductsCategory()*/
    }
}
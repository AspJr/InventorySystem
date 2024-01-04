using Inventory.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inventory.Controllers
{
    public class InventoryController : Controller
    {
        private ProductRepo productRepo = ProductRepo.Instance;
        // GET: Inventory
        public ActionResult Index()
        {
            var product = productRepo.GetList();
            return View(product);
        }

        // GET: Inventory/Details/5
        public ActionResult Details(int id)
        {
            var product = productRepo.Get(id);
            return View(product);
        }

        // GET: Inventory/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Inventory/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            string path = Server.MapPath("~/UploadImage/Product/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            
            try
            {
                var product = new Product();
                product.Name = collection["Name"];
                product.Qty = Convert.ToInt32(collection["Qty"]);
                var res = productRepo.Insert(product);
                var last = productRepo.GetLastRow();
                HttpFileCollectionBase uploadedFiles = Request.Files;

                if (uploadedFiles != null)
                {
                    HttpPostedFileBase fileDoc;
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        fileDoc = Request.Files[i];
                        string fileName = Path.GetFileName(fileDoc.FileName);
                        fileDoc.SaveAs(path + fileName);

                        var productImage = new ProductImage();
                        productImage.FileName = fileName;
                        productImage.ProductID = last.ID;
                        var img = productRepo.InsertImage(productImage);
                        if (!img) {
                            return View();
                        }
                    }
                }

                if (last != null)
                {
                    return RedirectToAction("Index");
                }
                return View();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return View();
            }
        }

        // GET: Inventory/Edit/5
        public ActionResult Edit(int id)
        {
            var product = productRepo.Get(id);
            return View(product);
        }

        // POST: Inventory/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                var product = new Product();
                product.ID = id;
                product.Name = collection["Name"];
                product.Qty = Convert.ToInt32(collection["Qty"]);
                var res = productRepo.Update(product);
                HttpFileCollectionBase uploadedFiles = Request.Files;

                if (uploadedFiles != null)
                //if (uploadedFiles != null && uploadedFiles.Count > 1)
                {
                    var delete = productRepo.DeleteImage(id);
                    if (delete) 
                    {
                        HttpPostedFileBase fileDoc;
                        string path = Server.MapPath("~/UploadImage/Product/");
                        if (!Directory.Exists(path))
                        {
                            Directory.CreateDirectory(path);
                        }

                        for (int i = 0; i < Request.Files.Count; i++)
                        {
                            fileDoc = Request.Files[i];
                            string fileName = Path.GetFileName(fileDoc.FileName);
                            fileDoc.SaveAs(path + fileName);

                            var productImage = new ProductImage();
                            productImage.FileName = fileName;
                            productImage.ProductID = id;
                            var img = productRepo.InsertImage(productImage);
                            if (!img)
                            {
                                return View();
                            }
                        }
                    }
                }
                
                if (res)
                {
                    return RedirectToAction("Index");
                }
                return View();

            }
            catch
            {
                return View();
            }
        }

        // GET: Inventory/Delete/5
        public ActionResult Delete(int id)
        {
            var product = productRepo.Get(id);
            return View(product);
        }

        // POST: Inventory/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var res = productRepo.Delete(id);
                var del = productRepo.DeleteProductImage(id);
                if (res && del)
                {
                    return RedirectToAction("Index");
                }
                return View();

            }
            catch
            {
                return View();
            }
        }
    }
}

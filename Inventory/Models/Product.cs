using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class Product
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Qty { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<ProductImage> ProductImages { get; set; }
    }
}
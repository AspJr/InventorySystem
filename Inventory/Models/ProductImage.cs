using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class ProductImage
    {
        public int ID { get; set; }
        public int ProductID { get; set; }
        public string FileName { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
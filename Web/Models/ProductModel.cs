using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class ProductModel
    {
        public long ProductId { get; set; }
        public string Item_Number { get; set; }
        public string Item_Group { get; set; }
        public string Description { get; set; }
        public string Customer_Group { get; set; }
        public string Material_Type { get; set; }
        public string Colors { get; set; }
        public string Weight { get; set; }
        public string Dimension { get; set; }
        public string Grouping { get; set; }
        public string Comment { get; set; }
    }
}
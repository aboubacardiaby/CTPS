//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblFoodSale
    {
        public long FoodSaleId { get; set; }
        public string Bill_of_Landing { get; set; }
        public Nullable<long> Ship_Site { get; set; }
        public string Type { get; set; }
        public Nullable<System.DateTime> Ship_Date { get; set; }
        public string Time { get; set; }
        public string Location { get; set; }
        public string Point_of_Origin { get; set; }
        public string Item_Number { get; set; }
        public string Description { get; set; }
        public string Desc { get; set; }
        public Nullable<long> Qty { get; set; }
        public string Item_Type { get; set; }
        public string Ship_To { get; set; }
        public string Sort_Name { get; set; }
        public string Carrier { get; set; }
        public string Truc_Car { get; set; }
        public string Seals { get; set; }
        public string Biller { get; set; }
        public string Loader { get; set; }
        public string Remarks { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public string UpdatedBy { get; set; }
    
        public virtual tblProduct tblProduct { get; set; }
        public virtual tblCustomerReference tblCustomerReference { get; set; }
    }
}

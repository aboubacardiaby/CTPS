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
    
    public partial class tblBeverageSale
    {
        public long BeverageSaleId { get; set; }
        public string Bol_Number { get; set; }
        public string Item_Code { get; set; }
        public long MaterialId { get; set; }
        public string Ship_To { get; set; }
        public string Ship_To_Aplha_Name { get; set; }
        public string Sold_To { get; set; }
        public string Sold_To_Alpha_Name { get; set; }
        public string Ship_From { get; set; }
        public System.DateTime Ship_Date { get; set; }
        public string Ship_Time { get; set; }
        public System.DateTime Promised_Date { get; set; }
        public string Promised_Time { get; set; }
        public string Carrier { get; set; }
        public string Trailer_Number { get; set; }
        public string Seal_Number { get; set; }
        public string Customer_PO { get; set; }
        public string Customer_Release { get; set; }
        public string Customer_Reference { get; set; }
        public string Item_Number { get; set; }
        public string Quantity { get; set; }
        public string Eaches { get; set; }
        public string Customer_Item { get; set; }
        public string Item_Description { get; set; }
        public string Size { get; set; }
        public string Neck_Size { get; set; }
        public string CAN_END { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public string UpdatedBy { get; set; }
    
        public virtual tblMaterial_Handling tblMaterial_Handling { get; set; }
        public virtual tblProduct_Reference tblProduct_Reference { get; set; }
        public virtual tblCustomerReference tblCustomerReference { get; set; }
    }
}

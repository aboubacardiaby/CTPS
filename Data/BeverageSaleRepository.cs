using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class BeverageSaleRepository: IBeverageSaleRepository
    {
        private CoreDBEntities _coreDBEntities = new CoreDBEntities();
        public void AddBeverageSale(tblBeverageSale beverageSale)
        {
            try
            {
                
                string canEnd = beverageSale.CAN_END;
                if ( !string.IsNullOrEmpty(canEnd) && canEnd.ToLower()=="end")
                {
                    string canend = canEnd.ToLower();
                    beverageSale.MaterialId = _coreDBEntities.tblMaterial_Handling.
                        Where(v => v.Material_Desc.ToLower().Contains("end")).
                        Select(v => v.MaterialId).FirstOrDefault();
                    var itemdesc = _coreDBEntities.tblProduct_Reference.Where(v => v.Item_Desc.Contains("End")).FirstOrDefault();                   
                    beverageSale.Item_Code = itemdesc.Item_Code;

                }
                else
                {
                    beverageSale.MaterialId = 1;
                    var itemdesc = _coreDBEntities.tblProduct_Reference.Where(v => v.Item_Desc.Contains("Pallet  Plastic Can")).FirstOrDefault();
                    beverageSale.Item_Code = itemdesc.Item_Code;

                }


                _coreDBEntities.tblBeverageSales.Add(beverageSale);
                _coreDBEntities.SaveChanges();
            }
            catch (Exception exec)
            {

                
            }
        }

        public void DeleteBeverage(int beverageId)
        {
            string sqlQuery = @"DELETE FROM [dbo].[tblBeverageSale]
                                WHERE [BeverageSaleId] =" + beverageId;
            int noOfRowUpdated = _coreDBEntities.Database.ExecuteSqlCommand(sqlQuery);
                   
        }
        public List<tblMaterial_Handling> GetMaterial()
        {
            return _coreDBEntities.tblMaterial_Handling.ToList();
        }
        public List<tblBeverageSale> LOadData(string name, int startIndex, int count, string sorting)
        {
          return  _coreDBEntities.tblBeverageSales.ToList();
        }
    }
}

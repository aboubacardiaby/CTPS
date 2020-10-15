using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public  interface IBeverageSaleRepository
    {
        void AddBeverageSale(tblBeverageSale beverageSale);

        List<tblBeverageSale> LOadData(string name, int startIndex, int count, string sorting);
        List<tblMaterial_Handling> GetMaterial();
        void DeleteBeverage(int beverageId);
    }
}

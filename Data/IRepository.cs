using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
   
    public interface IRepository
    {
        List<tblCustomerReference> LoadCustomerReferencedata(int startIndex, int count, string sorting);
        int LoadCustomerReferencedataCount();
        tblCustomerReference AddCustomerReferenceCode(tblCustomerReference customerReference);
        List<tblCustomerReference> LoadFilteredCustomerbyName(string name, int startIndex, int count, string sorting);
        void UpdateCustomerCode(tblCustomerReference customerReference);
        List<tblCustomerReference> DeleteCustomerCode(long ReferenceId);
         
    }
}

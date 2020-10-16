using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Repository: IRepository
    {
        private CoreDBEntities _coreDBEntities = new CoreDBEntities();

        public tblCustomerReference AddCustomerReferenceCode(tblCustomerReference customerReference)
        {
            try
            {
                customerReference.CreatedBy = " Application";
                customerReference.CreateDate = DateTime.Now;
                _coreDBEntities.tblCustomerReferences.Add(customerReference);
                _coreDBEntities.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {


            }
            return customerReference;
        }
        public void UpdateCustomerCode(tblCustomerReference customerReference)
        {
            string sqlQuery = @"UPDATE [dbo].[tblCustomerReference]
                             SET [Name] ='" + customerReference.Name + @"',[CustomerCode] ='" + customerReference.CustomerCode +
                             @"' WHERE ReferenceId =" + customerReference.ReferenceId;
            int noOfRowUpdated = _coreDBEntities.Database.ExecuteSqlCommand(sqlQuery);
            
           
        }

        public List<tblCustomerReference> DeleteCustomerCode(long referenceId)
        {
            List<tblCustomerReference> list = new List<tblCustomerReference>();
            string sqlQuery = @"DELETE FROM [dbo].[tblCustomerReference]  " +
                             @" WHERE ReferenceId =" + referenceId;
            int noOfRowUpdated = _coreDBEntities.Database.ExecuteSqlCommand(sqlQuery);
            if (noOfRowUpdated > 0)
            {
                 list = _coreDBEntities.tblCustomerReferences.Where(b => b.ReferenceId == referenceId).ToList();
            }

            return list;
        }
        public List<tblCustomerReference> LoadCustomerReferencedata(int startIndex, int count, string sorting)
        {
            _coreDBEntities.Database.Connection.Open();
            IEnumerable<tblCustomerReference>query = _coreDBEntities.tblCustomerReferences.ToList();
            if (string.IsNullOrEmpty(sorting) || sorting.Equals("Name ASC"))
            {
                query = query.OrderBy(p => p.Name);
            }
            else if (sorting.Equals("Name DESC"))
            {
                query = query.OrderByDescending(p => p.Name);
            }
            else if (sorting.Equals("CustomerCode ASC"))
            {
                query = query.OrderBy(p => p.CustomerCode);
            }
            else if (sorting.Equals("CustomerCode DESC"))
            {
                query = query.OrderByDescending(p => p.CustomerCode);
            }
           
            else
            {
                query = query.OrderBy(p => p.Name); //Default!
            }

            return count > 0
                       ? query.Skip(startIndex).Take(count).ToList() //Paging
                       : query.ToList(); //No paging
             
        }
        public int LoadCustomerReferencedataCount()
        {
           return _coreDBEntities.tblCustomerReferences.Count();
        }

        public List<tblCustomerReference> LoadFilteredCustomerbyName(string name,int startIndex, int count, string sorting)
        {
            IEnumerable<tblCustomerReference> query = _coreDBEntities.tblCustomerReferences.Where(n=>n.Name.Contains(name));
            if (string.IsNullOrEmpty(sorting) || sorting.Equals("Name ASC"))
            {
                query = query.OrderBy(p => p.Name);
            }
            else if (sorting.Equals("Name DESC"))
            {
                query = query.OrderByDescending(p => p.Name);
            }
            else if (sorting.Equals("CustomerCode ASC"))
            {
                query = query.OrderBy(p => p.CustomerCode);
            }
            else if (sorting.Equals("CustomerCode DESC"))
            {
                query = query.OrderByDescending(p => p.CustomerCode);
            }

            else
            {
                query = query.OrderBy(p => p.Name); //Default!
            }

            return count > 0
                       ? query.Skip(startIndex).Take(count).ToList() //Paging
                       : query.ToList(); //No paging
        }
    }
}

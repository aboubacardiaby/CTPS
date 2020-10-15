using NUnit.Framework;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace UnitTests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test1()
        {
            List<Page> plist = new List<Page>();

            var dt = ConvertCSVtoDataTable(@"C:\hu\Product Table2.csv");
            //  var dt = ConvertCSVtoDataTable(@"C:\hu\Table.csv");
            //using (var context = new CtpsDataContext())
            //{

            //    var query = context.tblProduct;


            //    foreach (var item in query)
            //    {
            //        string first = item.Item_Group.Split(' ')[0];
            //        if (!Isduplicate(plist, first))
            //        {
            //            plist.Add(new Page() { item_code = first, item_Desc = item.Item_Group });
            //            File(@"C:\hu\test.txt", first, item.Item_Group);5
            //        }


            //    }
            foreach (DataRow item in dt.Rows)
            {
                //tblProduct product = new tblProduct()
                //{
                //    Item_Number = item[0].ToString(),
                //    Item_Group = item[1].ToString(),
                //    Description = item[2].ToString(),
                //    Customer_Group = item[3].ToString(),
                //    Material_Type = item[4].ToString(),

                //};
                File(@"C:\hu\test1.txt", item[1].ToString(), item[2].ToString());
                //    context.tblProduct.Add(product);                 

                //}

                //context.SaveChanges();
            }

                // Assert.Pass();
            }
        public void File(string path, string itemcode, string itemgroup)
        {

            if (!System.IO.File.Exists(path))
            {
                using (StreamWriter tw = System.IO.File.CreateText(path))
                {
                    tw.WriteLine("INSERT [dbo].[tblCustomerReference]([Name],[CustomerCode]) VALUES('" + itemcode + "','" + itemgroup + "')");
                    tw.Close();
                }
            }
            else if (System.IO.File.Exists(path))
            {
                using (StreamWriter tw = System.IO.File.AppendText(path))
                {
                    tw.WriteLine("INSERT [dbo].[tblCustomerReference]([Name],[CustomerCode]) VALUES('" + itemcode + "','" + itemgroup + "')");
                    tw.Close();
                }
            }
        }
        public  bool Isduplicate(List<Page> pages, string el)
        {
            if (pages is null)
            {
                throw new System.ArgumentNullException(nameof(pages));
            }

            var qu = pages.Find(v => v.item_code == el);
             if(qu != null)
            {
                return true;
            }
            return false;
        }
        public IEnumerable<T> DedupCollection<T>(IEnumerable<T> input)
        {
            var passedValues = new HashSet<T>();

            // Relatively simple dupe check alg used as example
            foreach (T item in input)
                if (passedValues.Add(item)) // True if item is new
                    yield return item;
        }
        public static DataTable ConvertCSVtoDataTable(string strFilePath)
        {
            DataTable dt = new DataTable();
            using (StreamReader sr = new StreamReader(strFilePath))
            {
                string[] headers = sr.ReadLine().Split(',');
                foreach (string header in headers)
                {
                    dt.Columns.Add(header);
                }
                while (!sr.EndOfStream)
                {
                    string[] rows = sr.ReadLine().Split(',');
                    DataRow dr = dt.NewRow();
                    for (int i = 0; i < headers.Length; i++)
                    {
                        dr[i] = rows[i];
                    }
                    dt.Rows.Add(dr);
                }

            }


            return dt;
        }
        
    }
}
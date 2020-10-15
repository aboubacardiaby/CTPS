using Data;
using LumenWorks.Framework.IO.Csv;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Controllers
{
    public class BeverageSaleController : Controller
    {
        private readonly IBeverageSaleRepository _repository;

        public BeverageSaleController(IBeverageSaleRepository repository)
        {
            this._repository = repository;
        }
        // GET: BeverageSale
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Upload(HttpPostedFileBase upload)
        {
            if (ModelState.IsValid)
            {

                if (upload != null && upload.ContentLength > 0)
                {

                    if (upload.FileName.EndsWith(".csv"))
                    {
                        Stream stream = upload.InputStream;
                        DataTable csvTable = new DataTable();
                        using (CsvReader csvReader =
                            new CsvReader(new StreamReader(stream), true))
                        {
                            csvTable.Load(csvReader);
                        }

                        AddDataDb(csvTable);
                        return View("Index");
                    }
                    else
                    {
                        ModelState.AddModelError("File", "This file format is not supported");
                        return View();
                    }
                }
                else
                {
                    ModelState.AddModelError("File", "Please Upload Your file");
                }
            }
            return View();
        }
        public ActionResult Filtering()
        {
            var Materials = _repository.GetMaterial().Select(mat => new SelectListItem { Text = mat.Material_Desc, Value = mat.MaterialId.ToString() }).ToList();
            Materials.Insert(0, new SelectListItem { Selected = true, Text = "All Materials", Value = "0" });

            ViewBag.Materials = Materials;
            return View();
        }

        public void AddDataDb(DataTable dt)
        {
            bool isHeader = true;
            foreach (DataRow row in dt.Rows)
            {

                if (!string.IsNullOrEmpty(row[2].ToString()) && !string.IsNullOrEmpty(row[2].ToString()))
                {
                    if (!isHeader)
                    {
                      
                        DateTime shipdate = Convert.ToDateTime(row[6].ToString());
                        DateTime PromisedDate = Convert.ToDateTime(row[8].ToString());
                        _repository.AddBeverageSale(new tblBeverageSale()
                        {
                           
                            Bol_Number = row[0].ToString(),
                            Ship_To = row[1].ToString(),
                            Ship_To_Aplha_Name = row[2].ToString(),
                            Sold_To = row[3].ToString(),
                            Sold_To_Alpha_Name = row[4].ToString(),
                            Ship_From = row[5].ToString(),
                            Ship_Date = shipdate,
                            Ship_Time = row[7].ToString(),
                            Promised_Date = PromisedDate,
                            Promised_Time = row[9].ToString(),
                            Carrier = row[10].ToString(),
                            Trailer_Number = row[11].ToString(),
                            Seal_Number = row[12].ToString(),
                            Customer_PO = row[13].ToString(),
                            Customer_Release = row[14].ToString(),
                            Customer_Reference = row[15].ToString(),
                            Item_Number = row[16].ToString(),
                            Quantity = row[17].ToString(),
                            Eaches = row[18].ToString(),
                            Customer_Item = row[19].ToString(),
                            Item_Description = row[20].ToString(),
                            Size = Convert.ToInt64(row[21].ToString()),
                            Neck_Size = row[22].ToString(),
                            CAN_END = row[23].ToString(),
                            CreatedBy = "Application",
                            CreateDate =DateTime.Now
                            

                        });
                    }
                    else
                    {
                        isHeader = false;
                    }
                }

            }
        }

        [HttpPost]
        public JsonResult GetMaterialOptions()
        {
            try
            {
                var materials = _repository.GetMaterial().Select(c => new { DisplayText = c.Material_Desc, Value = c.MaterialId });
                return Json(new { Result = "OK", Options = materials });
            }
            catch (Exception ex)
            {
                return Json(new { Result = "ERROR", Message = ex.Message });
            }
        }
        public JsonResult LoadBeveraleData(string Name, int jtStartIndex = 0, int jtPageSize = 0, string jtSorting = null)
        {

            try
            {
                List<tblBeverageSale> list = null;
                int count = 0;
                if (string.IsNullOrEmpty(Name))
                {

                    //  list = _repository.LOadData( jtStartIndex, jtPageSize, jtSorting);
                    //count = _repository.LoadCustomerReferencedataCount();
                    list = _repository.LOadData(Name, jtStartIndex, jtPageSize, jtSorting);
                    count = list.Count();

                }
                else
                {
                    list = _repository.LOadData(Name, jtStartIndex, jtPageSize, jtSorting);
                    count = list.Count();
                }

                return Json(new { Result = "OK", Records = list, TotalRecordCount = count },JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {

                return Json(new { Result = "ERROR", Message = ex.Message });
            }

        }
        public JsonResult DeleteBeverage(int BeverageSaleId)
        {
            try
            {
                 _repository.DeleteBeverage(BeverageSaleId);

                return Json(new { Result = "OK", Record = "" });
            }
            catch (Exception ex)
            {

                return Json(new { Result = "ERROR", Message = ex.Message });
            }
        }


    }
}
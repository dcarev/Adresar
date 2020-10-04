using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Adresar.Controllers
{
    public class ContactsController : Controller
    {
        // GET: Contacts
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="contactsSearchViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult Index(Models.ContactsSearchViewModel contactsSearchViewModel)
        {
            List<Models.ContactViewModel> cl = new List<Models.ContactViewModel>();
            Models.ContactViewModel contact;
            Models.ContactsListViewModel result = new Models.ContactsListViewModel();
            int totalRecords = 0;

            // Paging
            if (contactsSearchViewModel.length != 0)
            {
                contactsSearchViewModel.page = Convert.ToString((contactsSearchViewModel.start / contactsSearchViewModel.length) + 1);
            }
            else
                contactsSearchViewModel.page = "1";

            contactsSearchViewModel.pageSize = contactsSearchViewModel.length;

            // Sorting
            Int32 columnNumber = Convert.ToInt32(Request.Form.GetValues("order[0][column]")[0]);
            contactsSearchViewModel.sortColumn = Request.Form.GetValues("columns[" + columnNumber + "][data]")[0];
            contactsSearchViewModel.sortOrder = Request.Form.GetValues("order[0][dir]")[0];

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdresarConnectionString"].ToString()))
            {
                try
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("[dbo].[SP_ListaKontakata]", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Filter", ""));
                        cmd.CommandTimeout = 140;

                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                contact = new Models.ContactViewModel()
                                {
                                    ID = (Int64)rdr["ID"],
                                    Name = (String)rdr["Ime"],
                                    Surname = (String)rdr["Prezime"],
                                    Phone = (String)rdr["Telefon"],
                                    Email = (String)rdr["Email"],
                                    Created = ((DateTimeOffset)rdr["VrijemeKreiranja"]).ToString("G"),
                                    Updated = ((DateTimeOffset)rdr["ZadnjaIzmjena"]).ToString("G")
                                };

                                totalRecords = (int)rdr["TotalRecords"];
                                cl.Add(contact);
                            }
                        }
                    }

                    result.draw = Convert.ToInt32(contactsSearchViewModel.draw);
                    result.recordsTotal = totalRecords;
                    result.recordsFiltered = totalRecords;
                    result.data = cl;

                    return Json(result, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    //wtt.error = "Server is busy! Please try later.";
                }
                finally
                {
                    if (conn.State == System.Data.ConnectionState.Open)
                        conn.Close();
                }
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // GET: Contacts/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Contacts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contacts/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Contacts/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Contacts/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Contacts/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Contacts/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

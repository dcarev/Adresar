using Adresar.Properties;
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
        /// <summary>
        /// Get contacts
        /// </summary>
        /// <returns>Contact list page</returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Returns filtered list of contacts
        /// </summary>
        /// <param name="contactsSearchViewModel"></param>
        /// <returns>Filtered list of contacts</returns>
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
                contactsSearchViewModel.page = (contactsSearchViewModel.start / contactsSearchViewModel.length) + 1;
            }
            else
                contactsSearchViewModel.page = 1;

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
                        cmd.Parameters.Add(new SqlParameter("@Filter", contactsSearchViewModel.search));
                        cmd.Parameters.Add(new SqlParameter("@SortColumn", contactsSearchViewModel.sortColumn));
                        cmd.Parameters.Add(new SqlParameter("@SortOrder", contactsSearchViewModel.sortOrder));
                        cmd.Parameters.Add(new SqlParameter("@Page", contactsSearchViewModel.page));
                        cmd.Parameters.Add(new SqlParameter("@PageSize", contactsSearchViewModel.pageSize));
                        cmd.CommandTimeout = 140;

                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            Int64 id = 0;

                            while (rdr.Read())
                            {
                                id = (Int64)rdr["ID"];

                                contact = new Models.ContactViewModel()
                                {
                                    ID = id,
                                    Ime = (String)rdr["Ime"],
                                    Prezime = (String)rdr["Prezime"],
                                    Telefon = (String)rdr["Telefon"],
                                    Email = (rdr["Email"] != DBNull.Value) ? (String)rdr["Email"] : null,
                                    VrijemeKreiranja = ((DateTimeOffset)rdr["VrijemeKreiranja"]).ToString("G"),
                                    ZadnjaIzmjena = ((DateTimeOffset)rdr["ZadnjaIzmjena"]).ToString("G")
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

                    return Json(result);
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

            return Json(result);
        }

        // GET: Contacts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contacts/Create
        [HttpPost]
        public ActionResult Create([Bind(Include = "Ime, Prezime, Telefon, Email")] Models.ContactViewModel contact)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdresarConnectionString"].ToString()))
                    {
                        conn.Open();

                        using (SqlCommand cmd = new SqlCommand("[dbo].[SP_NoviKontakt]", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add(new SqlParameter("@Ime", contact.Ime));
                            cmd.Parameters.Add(new SqlParameter("@Prezime", contact.Prezime));
                            cmd.Parameters.Add(new SqlParameter("@Telefon", contact.Telefon));
                            cmd.Parameters.Add(new SqlParameter("@Email", contact.Email));
                            cmd.CommandTimeout = 140;

                            using (SqlDataReader rdr = cmd.ExecuteReader())
                            {
                                while (rdr.Read())
                                {
                                    contact = new Models.ContactViewModel()
                                    {
                                        ID = (Int64)rdr["ID"],
                                        Ime = (String)rdr["Ime"],
                                        Prezime = (String)rdr["Prezime"],
                                        Telefon = (String)rdr["Telefon"],
                                        Email = (rdr["Email"] != DBNull.Value) ? (String)rdr["Email"] : null,
                                        VrijemeKreiranja = ((DateTimeOffset)rdr["VrijemeKreiranja"]).ToString("G"),
                                        ZadnjaIzmjena = ((DateTimeOffset)rdr["ZadnjaIzmjena"]).ToString("G")
                                    };
                                }
                            }
                        }
                    }
                    TempData["Success"] = Resources.SuccessCreate;

                    return View("Edit", contact);
                }
            }
            catch
            {
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists see your system administrator.");
            }

            return View(contact);
        }

        // GET: Contacts/Edit/5
        public ActionResult Edit(int id)
        {
            Models.ContactViewModel contact = new Models.ContactViewModel();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdresarConnectionString"].ToString()))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("[dbo].[SP_Kontakt]", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@ID", id));

                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                contact = new Models.ContactViewModel()
                                {
                                    ID = (Int64)rdr["ID"],
                                    Ime = (String)rdr["Ime"],
                                    Prezime = (String)rdr["Prezime"],
                                    Telefon = (String)rdr["Telefon"],
                                    Email = (rdr["Email"] != DBNull.Value) ? (String)rdr["Email"] : null,
                                    VrijemeKreiranja = ((DateTimeOffset)rdr["VrijemeKreiranja"]).ToString("G"),
                                    ZadnjaIzmjena = ((DateTimeOffset)rdr["ZadnjaIzmjena"]).ToString("G")
                                };
                            }
                        }
                    }
                }

                return View(contact);
            }
            catch
            {
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists see your system administrator.");
            }

            return View(contact);
        }

        // POST: Contacts/Edit/5
        [HttpPost]
        public ActionResult Edit([Bind(Include = "ID, Ime, Prezime, Telefon, Email")] Models.ContactViewModel contact)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdresarConnectionString"].ToString()))
                    {
                        conn.Open();

                        using (SqlCommand cmd = new SqlCommand("[dbo].[SP_IzmijeniKontakt]", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add(new SqlParameter("@ID", contact.ID));
                            cmd.Parameters.Add(new SqlParameter("@Ime", contact.Ime));
                            cmd.Parameters.Add(new SqlParameter("@Prezime", contact.Prezime));
                            cmd.Parameters.Add(new SqlParameter("@Telefon", contact.Telefon));
                            cmd.Parameters.Add(new SqlParameter("@Email", contact.Email));
                            cmd.CommandTimeout = 140;

                            using (SqlDataReader rdr = cmd.ExecuteReader())
                            {
                                while (rdr.Read())
                                {
                                    contact = new Models.ContactViewModel()
                                    {
                                        ID = (Int64)rdr["ID"],
                                        Ime = (String)rdr["Ime"],
                                        Prezime = (String)rdr["Prezime"],
                                        Telefon = (String)rdr["Telefon"],
                                        Email = (rdr["Email"] != DBNull.Value) ? (String)rdr["Email"] : null,
                                        VrijemeKreiranja = ((DateTimeOffset)rdr["VrijemeKreiranja"]).ToString("G"),
                                        ZadnjaIzmjena = ((DateTimeOffset)rdr["ZadnjaIzmjena"]).ToString("G")
                                    };
                                }
                            }
                        }
                    }
                    TempData["Success"] = Resources.SuccessEdit;

                    return View("Edit", contact);
                }
            }
            catch
            {
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists see your system administrator.");
            }

            return View(contact);
        }

        // POST: Contacts/Delete/5
        [HttpPost]
        public ActionResult Delete(int id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdresarConnectionString"].ToString()))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("[dbo].[SP_ObrisiKontakt]", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@ID", id));
                        cmd.ExecuteScalar();
                    }
                }

                return Json(new {
                    success = true,
                    error = ""
                });
            }
            catch
            {
                return Json(new
                {
                    success = false,
                    error = Resources.DeleteError
                });
            }
        }
    }
}

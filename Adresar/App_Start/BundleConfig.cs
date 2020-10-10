﻿using System.Web;
using System.Web.Optimization;

namespace Adresar
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/DataTables/jquery.datatables.js",
                      "~/Scripts/DataTables/dataTables.bootstrap.js",
                      "~/Scripts/DataTables/dataTables.responsive.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      //"~/Content/DataTables/css/jquery.dataTables.css",
                      "~/Content/DataTables/css/dataTables.bootstrap.css",
                      "~/Content/fontawesome-all.css",
                      "~/Content/site.css"));

            #region Contacts

            bundles.Add(new ScriptBundle("~/bundles/ContactsListJs").Include(
                      "~/Scripts/Adresar/ContactsList.js"));

            bundles.Add(new ScriptBundle("~/bundles/ContactsEditJs").Include(
                              "~/Scripts/Adresar/ContactsEdit.js"));
            #endregion
        }
    }
}

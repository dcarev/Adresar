using System.Web;
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
                        "~/Scripts/jquery.validate*",
                        "~/Scripts/jquery.validate.messages.hr.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/DataTables/jquery.datatables.js",
                      "~/Scripts/DataTables/dataTables.bootstrap.js",
                      "~/Scripts/DataTables/dataTables.responsive.js",
                      "~/Scripts/DataTables/responsive.bootstrap.js",
                      "~/Scripts/toastr.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/DataTables/css/dataTables.bootstrap.css",
                      "~/Content/DataTables/css/responsive.bootstrap.css",
                      "~/Content/fontawesome-all.css",
                      "~/Content/toastr.css",
                      "~/Content/site.css"));

            #region Contacts

            bundles.Add(new ScriptBundle("~/bundles/ContactListJs").Include(
                      "~/Scripts/Adresar/ContactList.js"));

            bundles.Add(new ScriptBundle("~/bundles/ContactJs").Include(
                      "~/Scripts/Adresar/Contact.js"));
            #endregion
        }
    }
}

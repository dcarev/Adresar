using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Adresar.Models
{
    public class ContactsSearchViewModel
    {
        public string search { get; set; }
        public string sortOrder { get; set; }
        public string sortColumn { get; set; }

        #region DataTables

        public string draw { get; set; }
        public int start { get; set; }
        public int length { get; set; }
        public int page { get; set; }
        public int pageSize { get; set; }

        #endregion
    }
}
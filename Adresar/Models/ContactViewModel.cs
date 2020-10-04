using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Adresar.Models
{
    public class ContactViewModel
    {
        public Int64 ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Created { get; set; }
        public string Updated { get; set; }
    }
}
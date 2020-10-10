using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Adresar.Models
{
    public class ContactViewModel
    {
        public Int64 ID { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Telefon { get; set; }
        public string Email { get; set; }
        public string VrijemeKreiranja { get; set; }
        public string ZadnjaIzmjena { get; set; }
    }
}
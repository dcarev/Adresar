using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace Adresar.Models
{
    public class ContactViewModel: IValidatableObject
    {
        public Int64 ID { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Telefon { get; set; }
        public string Email { get; set; }
        public string VrijemeKreiranja { get; set; }
        public string ZadnjaIzmjena { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            Regex regex;

            //
            // Ime
            //
            if (Ime == null)
            {
                yield return new ValidationResult(
                    String.Format(Properties.Resources.ValidationFieldRequiredMinLength, "Ime"),
                    new[] { "Ime" });
            } else
            {
                if (Ime.Length < 2)
                {
                    yield return new ValidationResult(
                        String.Format(Properties.Resources.ValidationFieldRequiredMinLength, "Ime", 2),
                        new[] { "Ime" });
                }

                if (Ime.Length > 50)
                {
                    yield return new ValidationResult(
                        String.Format(Properties.Resources.ValidationFieldLength, "Ime", 50),
                        new[] { "Ime" });
                }
            }

            //
            // Prezime
            //
            if (Prezime == null)
            {
                yield return new ValidationResult(
                    String.Format(Properties.Resources.ValidationFieldRequiredMinLength, "Prezime"),
                    new[] { "Prezime" });
            }
            else
            {
                if (Prezime.Length < 2)
                {
                    yield return new ValidationResult(
                        String.Format(Properties.Resources.ValidationFieldRequiredMinLength, "Prezime", 2),
                        new[] { "Prezime" });
                }

                if (Prezime.Length > 50)
                {
                    yield return new ValidationResult(
                        String.Format(Properties.Resources.ValidationFieldLength, "Prezime", 50),
                        new[] { "Prezime" });
                }
            }

            //
            // Telefon
            //
            if (Telefon == null)
            {
                yield return new ValidationResult(
                    String.Format(Properties.Resources.ValidationFieldRequiredMinLength, "Telefon"),
                    new[] { "Telefon" });
            }
            else
            {
                if (Telefon.Length < 8)
                {
                    yield return new ValidationResult(
                        String.Format(Properties.Resources.ValidationFieldRequiredMinLength, "Telefon", 8),
                        new[] { "Telefon" });
                }

                if (Telefon.Length > 50)
                {
                    yield return new ValidationResult(
                        String.Format(Properties.Resources.ValidationFieldLength, "Telefon", 50),
                        new[] { "Telefon" });
                }

                regex = new Regex(@"^[\+]{0,2}[0-9\-\(\)\s]+$");
                if (!regex.IsMatch(Telefon))
                {
                    yield return new ValidationResult(
                        String.Format(Properties.Resources.ValidationFormat, "Telefon"),
                        new[] { "Telefon" });
                }
            }
        }
    }
}
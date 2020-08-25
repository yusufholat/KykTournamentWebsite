using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebKyk.Models
{
    public class TablolarDB
    {
        public List<Takimlar> Takims { get; set; }
        public List<Gruplar> Grups { get; set; }
        public List<Oyuncular> Oyunculars { get; set; }
        public List<Maclar> Maclars { get; set; }
        public List<Kullanici> Kullanicis { get; set; }
        public List<Enler> Enlers { get; set; }
        public List<OynanacakMaclar> OynanacakMaclars { get; set; }
    }
}
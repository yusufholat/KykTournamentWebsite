using WebKyk.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace WebKyk.Controllers
{
    [Authorize]
   
    public class AdminController : Controller
    {
        mfshalis_Entities ent = new mfshalis_Entities();
        TablolarDB obj = new TablolarDB();
    
        public ActionResult Index()
        {
           
            return View();
        }




        public ActionResult TakimEkle()
        {
            obj.Grups = ent.Gruplar.ToList();
            obj.Takims = ent.Takimlar.ToList();
            return View(obj);
        }

        [HttpPost]
        public ActionResult TakimEkle(Takimlar takim)
        {
            obj.Grups = ent.Gruplar.ToList();
            ent.Takimlar.Add(takim);
            ent.SaveChanges();
            return View(obj);
            
        }

        public ActionResult TakimlariDuzenle()
        {
            obj.Takims = ent.Takimlar.ToList();
            ent.SaveChanges();
            return View(obj);
        }

        //[HttpPost]
        public ActionResult TakimSil(int takimID)
        {
            ent.Takimlar.Remove(ent.Takimlar.First(d => d.takimID == takimID));
            ent.SaveChanges();
            return RedirectToAction("TakimlariDuzenle", "Admin");
        }




        public ActionResult OyuncuEkle()
        {
            obj.Takims = ent.Takimlar.ToList();
            return View(obj);
        }

        [HttpPost]
        public ActionResult OyuncuEkle(Oyuncular oyuncu)
        {
            try
            {
                obj.Takims = ent.Takimlar.ToList();
                obj.Oyunculars = ent.Oyuncular.ToList();
                ent.Oyuncular.Add(oyuncu);
                ent.SaveChanges();
                return View(obj);
            }
            catch (Exception)
            {
                return HttpNotFound();
            }
            
               

        }

        public ActionResult OyunculariDuzenle()
        {
            obj.Oyunculars = ent.Oyuncular.ToList();
            ent.SaveChanges();
            return View(obj);
        }

        public ActionResult OyuncuSil(int oyuncuID)
        {
            ent.Oyuncular.Remove(ent.Oyuncular.First(d => d.oyuncuID == oyuncuID));
            ent.SaveChanges();
            return RedirectToAction("OyunculariDuzenle", "Admin");
        }





        public ActionResult MacEkle()
        {
            obj.Grups = ent.Gruplar.ToList();
            obj.Maclars = ent.Maclar.ToList();
            obj.Takims = ent.Takimlar.ToList();
            return View(obj);
        }

        [HttpPost]
        public ActionResult MacEkle(Maclar m)
        { 
  
                var takim1 = ent.Takimlar.Where(e => e.takimID == m.birinciTakimID).FirstOrDefault();
                var takim2 = ent.Takimlar.Where(r => r.takimID == m.ikinciTakimID).FirstOrDefault();

                m.birinciTakimAdi = takim1.ad;
                m.ikinciTakimAdi = takim2.ad;
                m.ad = ent.Takimlar.Where(e => e.takimID == m.birinciTakimID).FirstOrDefault().ad + " " + m.birinciTakimSkor + " - "
                + m.ikinciTakimSkor + " " + ent.Takimlar.Where(r => r.takimID == m.ikinciTakimID).FirstOrDefault().ad;


                if (m.birinciTakimSkor == m.ikinciTakimSkor)
                {
                    takim1.beraberlik++;
                    takim2.beraberlik++;
                    
                    takim1.toplamPuan += 1;
                    takim2.toplamPuan += 1;

                    takim1.attigiGol += m.birinciTakimSkor;
                    takim2.attigiGol += m.ikinciTakimSkor;
                    takim1.yedigiGol += m.ikinciTakimSkor;
                    takim2.yedigiGol += m.birinciTakimSkor;
                }
                else if (m.birinciTakimSkor > m.ikinciTakimSkor)
                {
                    takim1.galibiyet++;
                    takim2.maglubiyet++;

                    takim1.toplamPuan += 3;

                    takim1.attigiGol += m.birinciTakimSkor;
                    takim2.attigiGol += m.ikinciTakimSkor;
                    takim1.yedigiGol += m.ikinciTakimSkor;
                    takim2.yedigiGol += m.birinciTakimSkor;
                }
                else if (m.ikinciTakimSkor > m.birinciTakimSkor)
                {
                    takim1.maglubiyet++;
                    takim2.galibiyet++;

                    takim2.toplamPuan += 3;

                    takim1.attigiGol += m.birinciTakimSkor;
                    takim2.attigiGol += m.ikinciTakimSkor;
                    takim1.yedigiGol += m.ikinciTakimSkor;
                    takim2.yedigiGol += m.birinciTakimSkor;
                }

                takim1.averaj = takim1.attigiGol - takim1.yedigiGol;
                takim2.averaj = takim2.attigiGol - takim2.yedigiGol;
                takim1.oynananMac = takim1.galibiyet + takim1.maglubiyet + takim1.beraberlik;
                takim2.oynananMac = takim2.galibiyet + takim2.maglubiyet + takim2.beraberlik;

                ent.Maclar.Add(m);
                ent.SaveChanges();

                obj.Grups = ent.Gruplar.ToList();
                obj.Maclars = ent.Maclar.ToList();
                obj.Takims = ent.Takimlar.ToList();
                return View(obj);
        }

        public ActionResult MaclariDuzenle()
        {
            obj.Maclars = ent.Maclar.OrderByDescending(m=>m.macID).ToList();
            ent.SaveChanges();
            return View(obj);
        }

        public ActionResult MacSil(int macID)
        {
            var mac = ent.Maclar.Find(macID);
            var takim1 = ent.Takimlar.Find(mac.birinciTakimID);
            var takim2 = ent.Takimlar.Find(mac.ikinciTakimID);
           
           
            if (mac.birinciTakimSkor == mac.ikinciTakimSkor)
            {
                takim1.beraberlik--;
                takim2.beraberlik--;

                takim1.toplamPuan -= 1;
                takim2.toplamPuan -= 1;

                takim1.attigiGol -= mac.birinciTakimSkor;
                takim2.attigiGol -= mac.ikinciTakimSkor;
                takim1.yedigiGol -= mac.ikinciTakimSkor;
                takim2.yedigiGol -= mac.birinciTakimSkor;
            }
            else if (mac.birinciTakimSkor > mac.ikinciTakimSkor)
            {
                takim1.galibiyet--;
                takim2.maglubiyet--;

                takim1.toplamPuan -= 3;

                takim1.attigiGol -= mac.birinciTakimSkor;
                takim2.attigiGol -= mac.ikinciTakimSkor;
                takim1.yedigiGol -= mac.ikinciTakimSkor;
                takim2.yedigiGol -= mac.birinciTakimSkor;
            }
            else if (mac.ikinciTakimSkor > mac.birinciTakimSkor)
            {
                takim1.maglubiyet--;
                takim2.galibiyet--;

                takim2.toplamPuan -= 3;

                takim1.attigiGol -= mac.birinciTakimSkor;
                takim2.attigiGol -= mac.ikinciTakimSkor;
                takim1.yedigiGol -= mac.ikinciTakimSkor;
                takim2.yedigiGol -= mac.birinciTakimSkor;
            }

            takim1.averaj = takim1.attigiGol - takim1.yedigiGol;
            takim2.averaj = takim2.attigiGol - takim2.yedigiGol;
            takim1.oynananMac = takim1.galibiyet + takim1.maglubiyet + takim1.beraberlik;
            takim2.oynananMac = takim2.galibiyet + takim2.maglubiyet + takim2.beraberlik;

            ent.Maclar.Remove(ent.Maclar.First(d => d.macID == mac.macID));
            ent.SaveChanges();
            return RedirectToAction("MaclariDuzenle", "Admin");

        }






        public ActionResult GolKralligi()
        {
            obj.Oyunculars = ent.Oyuncular.OrderByDescending(m=>m.golSayisi).ToList();
            return View(obj);
        }

        [HttpPost]
        public ActionResult GolKralligi(Oyuncular oyuncu)
        {
            try
            {
                var _oyuncu = ent.Oyuncular.Find(oyuncu.oyuncuID);
                _oyuncu.golSayisi = oyuncu.golSayisi;
                ent.SaveChanges();
                obj.Oyunculars = ent.Oyuncular.OrderByDescending(m => m.golSayisi).ToList();
                return View(obj);
            }
            catch (Exception)
            {
                return HttpNotFound();
            }
            
        }

        public ActionResult HaftaninEnleri()
        {
            obj.Enlers = ent.Enler.ToList();
            obj.Oyunculars = ent.Oyuncular.OrderByDescending(m => m.ad).ToList();
            return View(obj);
        }

        [HttpPost]
        public ActionResult HaftaninEnleri(Enler e)
        {
            try
            {
                var modelimiz = ent.Enler.Find(1);
                modelimiz.haftaninOyuncusu = e.haftaninOyuncusu;
                modelimiz.haftaninKalecisi = e.haftaninKalecisi;
                modelimiz.haftaninDefansi = e.haftaninDefansi;
                modelimiz.haftaninOrtasahasi = e.haftaninOrtasahasi;
                modelimiz.haftaninForveti = e.haftaninForveti;

                ent.SaveChanges();
                obj.Enlers = ent.Enler.ToList();
                obj.Oyunculars = ent.Oyuncular.OrderByDescending(m => m.ad).ToList();
                return View(obj);
            }
            catch (Exception)
            {
                return HttpNotFound();
            }
            
        }




        public ActionResult OynanacakMacEkle()
        {
            obj.Grups = ent.Gruplar.ToList();
            obj.Takims = ent.Takimlar.ToList();
            obj.OynanacakMaclars = ent.OynanacakMaclar.ToList();
            return View(obj);
        }

        [HttpPost]
        public ActionResult OynanacakMacEkle(OynanacakMaclar m)
        {
            obj.Grups = ent.Gruplar.ToList();
            obj.Takims = ent.Takimlar.ToList();
            obj.OynanacakMaclars = ent.OynanacakMaclar.OrderByDescending(x => x.oynanacakmacID).ToList();
            ent.OynanacakMaclar.Add(m);
            ent.SaveChanges();

            return View(obj);
        }

        public ActionResult OynanacakMaclariDuzenle()
        {
            obj.OynanacakMaclars = ent.OynanacakMaclar.ToList();
            ent.SaveChanges();
            return View(obj);
        }

        public ActionResult OynanacakMacSil(int oynanacakmacID)
        {
            ent.OynanacakMaclar.Remove(ent.OynanacakMaclar.First(d => d.oynanacakmacID == oynanacakmacID));
            ent.SaveChanges();

            return RedirectToAction("OynanacakMaclariDuzenle", "Admin");
        }
    }
}
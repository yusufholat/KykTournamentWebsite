using WebKyk.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        mfshalis_Entities ent = new mfshalis_Entities();
        TablolarDB obj = new TablolarDB();

        public ActionResult Index()
        {
            obj.Enlers = ent.Enler.ToList();
            obj.Oyunculars = ent.Oyuncular.OrderByDescending(m => m.golSayisi).Take(5).ToList();
            return View(obj);
        }

        public ActionResult Gruplar()
        {           
            obj.Grups = ent.Gruplar.ToList();
            obj.Takims = ent.Takimlar.OrderByDescending(m => m.toplamPuan).ThenByDescending(s => s.averaj).ToList();
            return View(obj);
        }

        public ActionResult Takimlar()
        {
            obj.Takims = ent.Takimlar.OrderByDescending(m => m.toplamPuan).ToList();
            return View(obj);
        }

        public ActionResult FiksturOynanacak()
        {
            obj.Grups = ent.Gruplar.ToList();
            obj.Takims = ent.Takimlar.ToList();
            obj.Maclars = ent.Maclar.OrderByDescending(m => m.tarih).ToList();
            return View(obj);
        }

        public ActionResult FiksturOynanan()
        {
            obj.Grups = ent.Gruplar.ToList();
            obj.Takims = ent.Takimlar.ToList();
            obj.Maclars = ent.Maclar.OrderByDescending(m => m.tarih).ToList();
            return View(obj);
        }

        public ActionResult Giris()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Giris(Kullanici model)
        {
            var kullanici = ent.Kullanici.FirstOrDefault(x => x.kullaniciAdi == model.kullaniciAdi && 
                                                          x.kullaniciSifre == model.kullaniciSifre);
            if(kullanici!=null)
            {
                FormsAuthentication.SetAuthCookie(kullanici.kullaniciAdi, false);
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                ViewBag.Hata = "Giriş Yapılamadı, lol!";
                return View();
            }
        }

        public ActionResult Cikis()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Giris");
        }


    }

}
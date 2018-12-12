using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LTW.Models;
using PagedList;

namespace LTW.Controllers
{
    public class BinStoreController : Controller
    {
        // GET: BinStore
        CSDLDataContext data = new CSDLDataContext();

        public ActionResult TrangChu(int? page)
        {
            //Tao bien quy dinh so san pham tren moi trang
            int pageSize = 9;
            //Tao bien so trang
            int pageNum = (page ?? 1);
            //Lấy top 5 Album bán chạy nhất
            var sachmoi = Laysachmoi(15);
            return View(sachmoi.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Hangsx()
        {
            var sp = from item in data.HANGSXes select item;
            return PartialView(sp);
        }
        private List<SANPHAM> Laysachmoi(int count)
        {
            //Sắp xếp sách theo ngày cập nhật, sau đó lấy top @count 
            return data.SANPHAMs.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        public ActionResult SPmoi(int id)
        {
            var spmoi = from s in data.SANPHAMs  select s;
            return View(spmoi);
        }
        public ActionResult ChiTiet(int id)
        {
            var sach = from s in data.SANPHAMs
                       where s.Masp == id
                       select s;
            return View(sach.Single());
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LTW.Models;
using System.IO;
using PagedList;
using PagedList.Mvc;
using System.Data.Entity;


namespace LTW.Controllers
{
    public class AdminController : Controller
    {
        CSDLDataContext db = new CSDLDataContext();
        // GET: Admin
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            // Gán các giá trị người dùng nhập liệu cho các biến 
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới (ad)        

                Tkadmin ad = db.Tkadmins.SingleOrDefault(n => n.maadmin == tendn && n.pass == matkhau);
                if (ad != null)
                {
                    ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        public ActionResult SanPham(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            //return View(db.SACHes.ToList());
            return View(db.SANPHAMs.ToList().OrderBy(n => n.Masp).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult ThemmoiSP()
        {
            //Dua du lieu vao dropdownList
            //Lay ds tu tabke chu de, sắp xep tang dan trheo ten chu de, chon lay gia tri Ma CD, hien thi thi Tenchude
            //ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            ViewBag.Mahangsx = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.Tenhangsx), "Mahangsx", "Tenhangsx");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemmoiSP(SANPHAM sach, HttpPostedFileBase fileUpload)
        {
            //Dua du lieu vao dropdownload
            // ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");

            //Kiem tra duong dan file
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh cho sản phẩm";
                return View();
            }
            //Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Luu ten fie, luu y bo sung thu vien using System.IO;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/sanpham"), fileName);
                    //Kiem tra hình anh ton tai chua?
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                    {
                        //Luu hinh anh vao duong dan
                        fileUpload.SaveAs(path);
                    }
                    ViewBag.Mahangsx = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.Tenhangsx), "Mahangsx", "Tenhangsx");
                    sach.Hinhanh = fileName;
                    //Luu vao CSDL
                    db.SANPHAMs.InsertOnSubmit(sach);
                    db.SubmitChanges();
                }
                return RedirectToAction("SanPham");
            }
        }

        //Hiển thị sản phẩm
        public ActionResult ChitietSP(int id)
        {
            //Lay ra doi tuong sach theo ma
            SANPHAM sach = db.SANPHAMs.SingleOrDefault(n => n.Masp == id);
            ViewBag.Masach = sach.Masp;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }

        //Xóa sản phẩm
        [HttpGet]
        public ActionResult XoaSP(int id)
        {
            //Lay ra doi tuong sach can xoa theo ma
            SANPHAM sach = db.SANPHAMs.SingleOrDefault(n => n.Masp == id);
            ViewBag.Masach = sach.Masp;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }

        [HttpPost, ActionName("XoaSP")]
        public ActionResult Xacnhanxoa(int id)
        {
            //Lay ra doi tuong sach can xoa theo ma
            SANPHAM sach = db.SANPHAMs.SingleOrDefault(n => n.Masp == id);
            ViewBag.Masach = sach.Masp;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SANPHAMs.DeleteOnSubmit(sach);
            db.SubmitChanges();
            return RedirectToAction("SanPham");
        }
        //Chinh sửa sản phẩm
        [HttpGet]
        public ActionResult SuaSP(int id)
        {
            //Lay ra doi tuong sach theo ma
            SANPHAM sach = db.SANPHAMs.SingleOrDefault(n => n.Masp == id);
            ViewBag.Masach = sach.Masp;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Dua du lieu vao dropdownList
            //Lay ds tu tabke chu de, sắp xep tang dan trheo ten chu de, chon lay gia tri Ma CD, hien thi thi Tenchude
            //  ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude", sach.MaCD);
            ViewBag.MaHangsx = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.Tenhangsx), "Mahangsx", "Tenhangsx", sach.Mahangsx);
            return View(sach);
        }
        [HttpPost, ActionName("SuaSP")]
        [ValidateInput(false)]
        public ActionResult Xacnhansua(int id, HttpPostedFileBase fileUpload)
        {
            SANPHAM sp = db.SANPHAMs.SingleOrDefault(n => n.Masp == id);
            ViewBag.Masach = sp.Masp;
            //Dua du lieu vao dropdownload
            // ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            ViewBag.MaHangsx = new SelectList(db.HANGSXes.ToList().OrderBy(n => n.Tenhangsx), "Mahangsx", "Tenhangsx");
            //Kiem tra duong dan file
            if (fileUpload == null)
            {
                Response.StatusCode = 404;
                return View();
            }
            //Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Luu ten fie, luu y bo sung thu vien using System.IO;
                    var filename = Path.GetFileName(fileUpload.FileName);
                    //Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/sanpham"), filename);
                    //Kiem tra hình anh ton tai chua?
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                    {
                        //Luu hinh anh vao duong dan
                        fileUpload.SaveAs(path);
                    }
                   
                    sp.Hinhanh = filename;
                    //Luu vao CSDL   
                    UpdateModel(sp);
                    db.SubmitChanges();

                }
                return RedirectToAction("SanPham", "Admin");
            }
        }
        public ActionResult HangSx(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            //return View(db.SACHes.ToList());
            return View(db.HANGSXes.ToList().OrderBy(n => n.Mahangsx).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Khachhang(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            //return View(db.SACHes.ToList());
            return View(db.KHACHHANGs.ToList().OrderBy(n => n.Makh).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult DonHang(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            //return View(db.SACHes.ToList());
            return View(db.DATHANGs.ToList().OrderBy(n => n.Madh).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult index(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            //return View(db.SACHes.ToList());
            return View(db.DATHANGs.ToList().OrderBy(n => n.Madh).ToPagedList(pageNumber, pageSize));
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LTW.Models;

namespace LTW.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
        // GET: GioHang
        //Tao doi tuong data chua dữ liệu từ model dbBansach đã tạo. 
        CSDLDataContext data = new CSDLDataContext();
        //Lay gio hang
        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                //Neu gio hang chua ton tai thi khoi tao listGiohang
                lstGiohang = new List<GioHang>();
                Session["GioHang"] = lstGiohang;
            }
            return lstGiohang;
        }
        //Them hang vao gio
        public ActionResult ThemGiohang(int iMasach, string strURL)
        {
            //Lay ra Session gio hang
            List<GioHang> lstGiohang = Laygiohang();
            //Kiem tra sách này tồn tại trong Session["Giohang"] chưa?
            GioHang sanpham = lstGiohang.Find(n => n.iMasach == iMasach);
            if (sanpham == null)
            {
                sanpham = new GioHang(iMasach);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoluong++;
                return Redirect(strURL);
            }
        }


        //Xay dung trang Gio hang
        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("TrangChu", "BinStore");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }
        //Tong so luong
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoluong);
            }
            return iTongSoLuong;
        }
        //Tinh tong tien
        private double TongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhtien);
            }
            return iTongTien;
        }
        //Tao Partial view de hien thi thong tin gio hang
        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }
        //Cap nhat Giỏ hàng
        public ActionResult CapnhatGiohang(int iMaSP, FormCollection f)
        {

            //Lay gio hang tu Session
            List<GioHang> lstGiohang = Laygiohang();
            //Kiem tra sach da co trong Session["Giohang"]
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.iMasach == iMaSP);
            //Neu ton tai thi cho sua Soluong
            if (sanpham != null)
            {
                sanpham.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        //Xoa Giohang
        public ActionResult XoaGiohang(int iMaSP)
        {
            //Lay gio hang tu Session
            List<GioHang> lstGiohang = Laygiohang();
            //Kiem tra sach da co trong Session["Giohang"]
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.iMasach == iMaSP);
            //Neu ton tai thi cho sua Soluong
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.iMasach == iMaSP);
                return RedirectToAction("GioHang");

            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("TrangChu", "BinStore");
            }
            return RedirectToAction("GioHang");
        }
        //Xoa tat ca thong tin trong Gio hang
        public ActionResult XoaTatcaGiohang()
        {
            //Lay gio hang tu Session
            List<GioHang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("TrangChu", "BinStore");
        }

        //Hien thi View DatHang de cap nhat cac thong tin cho Don hang
        [HttpGet]
        public ActionResult DatHang()
        {
            //Kiem tra dang nhap
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "Nguoidung");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("TrangChu", "BinStore");
            }

            //Lay gio hang tu Session
            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();

            return View(lstGiohang);
        }
        //Xay dung chuc nang Dathang
        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            //Them Don hang
            DATHANG ddh = new DATHANG();
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            List<GioHang> gh = Laygiohang();
            ddh.Makh = kh.Makh;
            ddh.Ngaydathang = DateTime.Now;
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["Ngaygiao"]);
            ddh.Ngaygiahang = (ngaygiao).ToString();
            ddh.Dagiaohang = false;
            ddh.Dathanhtoan = false;
            data.DATHANGs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            //Them chi tiet don hang            
            foreach (var item in gh)
            {
                CHITIETDATHANG ctdh = new CHITIETDATHANG();
                ctdh.Madh = ddh.Madh;
                ctdh.Masp = item.iMasach;
                ctdh.Soluong = item.iSoluong;
                ctdh.Gia = (decimal)item.dDongia;
                data.CHITIETDATHANGs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["GioHang"] = null;
            return RedirectToAction("Xacnhandonhang", "GioHang");
        }
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}
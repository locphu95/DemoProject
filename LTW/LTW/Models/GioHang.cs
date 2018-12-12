using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LTW.Models;
namespace LTW.Models
{
    public class GioHang
    {
        CSDLDataContext data = new CSDLDataContext();
        public int iMasach { set; get; }
        public string sTensach { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }

        }
        //Khoi tao gio hàng theo Masach duoc truyen vao voi Soluong mac dinh la 1
        public GioHang(int Masach)
        {
            iMasach = Masach;
            SANPHAM sach = data.SANPHAMs.Single(n => n.Masp == iMasach);
            sTensach = sach.Tensp;
            sAnhbia = sach.Hinhanh;
            dDongia = double.Parse(sach.Gia.ToString());
            iSoluong = 1;
        }
    }
}
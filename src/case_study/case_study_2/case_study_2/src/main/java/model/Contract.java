package model;

import java.util.HashMap;
import java.util.Map;

public class Contract {
    private int maHopDong;
    private String ngayLamHopDong;
    private String ngayKetThuc;
    private double tienDatCoc;
    private int maNhanVien;
    private int maKhachHang;
    private int maDichVu;

    public Contract(int maHopDong, String ngayLamHopDong, String ngayKetThuc, double tienDatCoc, int maNhanVien, int maKhachHang, int maDichVu) {
        this.maHopDong = maHopDong;
        this.ngayLamHopDong = ngayLamHopDong;
        this.ngayKetThuc = ngayKetThuc;
        this.tienDatCoc = tienDatCoc;
        this.maNhanVien = maNhanVien;
        this.maKhachHang = maKhachHang;
        this.maDichVu = maDichVu;
    }

    public Contract() {
    }

    public String getNgayLamHopDong() {
        return ngayLamHopDong;
    }

    public void setNgayLamHopDong(String ngayLamHopDong) {
        this.ngayLamHopDong = ngayLamHopDong;
    }

    public String getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(String ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    public double getTienDatCoc() {
        return tienDatCoc;
    }

    public void setTienDatCoc(double tienDatCoc) {
        this.tienDatCoc = tienDatCoc;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(int maNhanVien) {
        this.maNhanVien = maNhanVien;
    }

    public int getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(int maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public int getMaDichVu() {
        return maDichVu;
    }

    public void setMaDichVu(int maDichVu) {
        this.maDichVu = maDichVu;
    }

    public int getMaHopDong() {
        return maHopDong;
    }

    public void setMaHopDong(int maHopDong) {
        this.maHopDong = maHopDong;
    }

}


//
//    static final String VILLA_REGEX = "^SVVL-\\d{4}$";
//    static final String HOUSE_REGEX = "^SVHO-\\d{4}$";
//    static final String ROOM_REGEX = "^SVRO-\\d{4}$";
//    static final String TEN_REGEX = "^([A-Z]{1}[a-z]+$|^[A-Z]{1}[a-z]+ [a-z]+$|^[A-Z]{1}[a-z]+ [a-z]+ [a-z]+$|^[A-Z]{1}[a-z]+ [a-z]+ [a-z]+ [a-z]+$)";
//    static final String BIRTHDAY_REGEX = "(^(((0[1-9]|1[0-9]|2[0-8])[\\/](0[1-9]|1[012]))|((29|30|31)[\\/](0[13578]|1[02]))|((29|30)[\\/]" +
//            "(0[4,6,9]|11)))[\\/](19|[2-9][0-9])\\d\\d$)|(^29[\\/]02[\\/](19|[2-9][0-9])(00|04|08|12|16|20|24|" +
//            "28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)";
//    static final String PHONENUMBER_REGEX = "^0{1}\\d{9}$";
//    static final String EMAIL_REGEX = "\\w*@gmail.com";
////    static final String DIENTICH_REGEX = "^[3-9]{1}[0-9]+|[1-2]{1}[0-9]{2,}$";
////    static final String SOTANG_REGEX = "^[1-9]+$";
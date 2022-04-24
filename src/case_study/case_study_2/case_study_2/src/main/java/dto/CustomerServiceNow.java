package dto;

public class CustomerServiceNow {
    private int maHopDong;
    private String hoTen;
    private String tenDichVu;
    private String moTaTienNghiKhac;
    private double chiPhiThue;
    private String tenDichVuDiKem;
    private int soLuong;

    public int getMaHopDong() {
        return maHopDong;
    }

    public void setMaHopDong(int maHopDong) {
        this.maHopDong = maHopDong;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getTenDichVu() {
        return tenDichVu;
    }

    public void setTenDichVu(String tenDichVu) {
        this.tenDichVu = tenDichVu;
    }

    public String getMoTaTienNghiKhac() {
        return moTaTienNghiKhac;
    }

    public void setMoTaTienNghiKhac(String moTaTienNghiKhac) {
        this.moTaTienNghiKhac = moTaTienNghiKhac;
    }

    public double getChiPhiThue() {
        return chiPhiThue;
    }

    public void setChiPhiThue(double chiPhiThue) {
        this.chiPhiThue = chiPhiThue;
    }

    public String getTenDichVuDiKem() {
        return tenDichVuDiKem;
    }

    public void setTenDichVuDiKem(String tenDichVuDiKem) {
        this.tenDichVuDiKem = tenDichVuDiKem;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public CustomerServiceNow(int maHopDong, String hoTen, String tenDichVu, String moTaTienNghiKhac, double chiPhiThue, String tenDichVuDiKem, int soLuong) {
        this.maHopDong = maHopDong;
        this.hoTen = hoTen;
        this.tenDichVu = tenDichVu;
        this.moTaTienNghiKhac = moTaTienNghiKhac;
        this.chiPhiThue = chiPhiThue;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.soLuong = soLuong;
    }

    public CustomerServiceNow() {
    }
}

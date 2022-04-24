package model.customer;

public class CustomerType {
    private int maLoaiKhach;
    private String tenLoaiKhach;

    public int getMaLoaiKhach() {
        return maLoaiKhach;
    }

    public void setMaLoaiKhach(int maLoaiKhach) {
        this.maLoaiKhach = maLoaiKhach;
    }

    public String getTenLoaiKhach() {
        return tenLoaiKhach;
    }

    public void setTenLoaiKhach(String tenLoaiKhach) {
        this.tenLoaiKhach = tenLoaiKhach;
    }

    public CustomerType(int maLoaiKhach, String tenLoaiKhach) {
        this.maLoaiKhach = maLoaiKhach;
        this.tenLoaiKhach = tenLoaiKhach;
    }

    public CustomerType() {
    }
}

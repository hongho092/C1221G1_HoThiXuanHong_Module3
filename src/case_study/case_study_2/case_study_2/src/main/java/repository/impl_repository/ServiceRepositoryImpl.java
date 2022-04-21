package repository.impl_repository;

import model.Service;
import repository.BaseRepository;
import repository.interface_repository.ServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ServiceRepositoryImpl implements ServiceRepository {

    BaseRepository baseRepository = new BaseRepository();

    private static final String LIST_SERVICE = "select * from dich_vu;";
    private static final String LIST_TYPE_RENT = "select * from kieu_thue;";
    private static final String LIST_TYPE_SERVICE = "select * from loai_dich_vu;";
    private static final String CREATE_SERVICE = "insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang) value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    @Override
    public List<Service> getListService() {
        List<Service> services = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(LIST_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            Service service;
            while (resultSet.next()) {
                service = new Service();
                service.setMaDichVu(resultSet.getInt("ma_dich_vu"));
                service.setTenDichVu(resultSet.getString("ten_dich_vu"));
                service.setDienTich(resultSet.getInt("dien_tich"));
                service.setChiPhiThue(resultSet.getInt("chi_phi_thue"));
                service.setSoNguoiToiDa(resultSet.getInt("so_nguoi_toi_da"));
                service.setMaKieuThue(resultSet.getInt("ma_kieu_thue"));
                service.setMaLoaiDichVu(resultSet.getInt("ma_loai_dich_vu"));
                service.setTieuChuanPhong(resultSet.getString("tieu_chuan_phong"));
                service.setMoTaTienNghiKhac(resultSet.getString("mo_ta_tien_nghi_khac"));
                service.setDienTichHoBoi(resultSet.getInt("dien_tich_ho_boi"));
                service.setSoTang(resultSet.getInt("so_tang"));
                services.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    @Override
    public Map<Integer, String> getTypeService() {
        Map<Integer, String> kieuThue = new HashMap<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(LIST_TYPE_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mkt = resultSet.getInt("ma_loai_dich_vu");
                String tkt = resultSet.getString("ten_loai_dich_vu");
                kieuThue.put(mkt, tkt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return kieuThue;
    }

    @Override
    public Map<Integer, String> getTypeRent() {
        Map<Integer, String> loaiDV = new HashMap<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(LIST_TYPE_RENT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mldv = resultSet.getInt("ma_kieu_thue");
                String tldv = resultSet.getString("ten_kieu_thue");
                loaiDV.put(mldv, tldv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return loaiDV;
    }

    @Override
    public void createService(Service service) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(CREATE_SERVICE);
            preparedStatement.setString(1, service.getTenDichVu());
            preparedStatement.setInt(2, service.getDienTich());
            preparedStatement.setInt(3, (int) service.getChiPhiThue());
            preparedStatement.setInt(4, service.getSoNguoiToiDa());
            preparedStatement.setInt(5, service.getMaKieuThue());
            preparedStatement.setInt(6, service.getMaLoaiDichVu());
            preparedStatement.setString(7, service.getTieuChuanPhong());
            preparedStatement.setString(8, service.getMoTaTienNghiKhac());
            preparedStatement.setInt(9, (int) service.getDienTichHoBoi());
            preparedStatement.setInt(10, service.getSoTang());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

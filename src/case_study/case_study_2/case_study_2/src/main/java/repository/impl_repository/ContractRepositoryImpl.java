package repository.impl_repository;

import model.Contract;
import model.ContractDetail;
import repository.BaseRepository;

import javax.imageio.stream.ImageInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractRepositoryImpl implements repository.interface_repository.ServiceAllRepository {

    private BaseRepository baseRepository = new BaseRepository();

    private static final String GET_MHD = "select ma_hop_dong from hop_dong order by ma_hop_dong;";
    private static final String GET_DVDK = "select ma_dich_vu_di_kem, ten_dich_vu_di_kem from dich_vu_di_kem order by ma_dich_vu_di_kem;";
    private static final String CREATE_CD = "insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong) value (?, ?, ?);";
    private static final String LIST_CONTRACT_DETAIL = "select * from hop_dong_chi_tiet;";
    private static final String LIST_CONTRACT = "select * from hop_dong;";
    private static final String LIST_CUSTOMER_CONTRACT = "select ma_khach_hang, ho_ten from khach_hang order by ma_khach_hang;";
    private static final String LIST_EMPLOYEE_CONTRACT = "select ma_nhan_vien, ho_ten from nhan_vien order by ma_nhan_vien;";
    private static final String LIST_SERVICE = "select ma_dich_vu, ten_dich_vu from dich_vu order by ma_dich_vu;";

    @Override
    public List<Integer> getMaHopDongHD() {
        List<Integer> maHopDongHD = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(GET_MHD);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maHD = resultSet.getInt("ma_hop_dong");
                maHopDongHD.add(maHD);
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
        return maHopDongHD;
    }

    @Override
    public Map<Integer, String> getMaHopDongHDCT() {
        Map<Integer, String> maHopDongHDCT = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(GET_DVDK);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                int maDVDK = resultSet.getInt("ma_dich_vu_di_kem");
                String tenDVDK = resultSet.getString("ten_dich_vu_di_kem");
                maHopDongHDCT.put(maDVDK, tenDVDK);
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
        return maHopDongHDCT;
    }

    @Override
    public void createCD(ContractDetail contractDetail) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(CREATE_CD);
            preparedStatement.setInt(1, contractDetail.getMaHopDong());
            preparedStatement.setInt(2, contractDetail.getMaDichVuDiKem());
            preparedStatement.setInt(3, contractDetail.getSoLuong());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<ContractDetail> getListContractDetail() {
        List<ContractDetail> contractDetails = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        ContractDetail contractDetail;
        try {
            preparedStatement = connection.prepareStatement(LIST_CONTRACT_DETAIL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                contractDetail = new ContractDetail();
                contractDetail.setMaHopDongChiTiet(resultSet.getInt("ma_hop_dong_chi_tiet"));
                contractDetail.setMaHopDong(resultSet.getInt("ma_hop_dong"));
                contractDetail.setMaDichVuDiKem(resultSet.getInt("ma_dich_vu_di_kem"));
                contractDetail.setSoLuong(resultSet.getInt("so_luong"));
                contractDetails.add(contractDetail);
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
        return contractDetails;
    }

    @Override
    public List<Contract> getListContract() {
        List<Contract> contracts = new ArrayList<>();

        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        Contract contract;
        try {
            preparedStatement = connection.prepareStatement(LIST_CONTRACT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                contract = new Contract();
                contract.setMaHopDong(resultSet.getInt("ma_hop_dong"));
                contract.setNgayLamHopDong(resultSet.getString("ngay_lam_hop_dong"));
                contract.setNgayKetThuc(resultSet.getString("ngay_ket_thuc"));
                contract.setTienDatCoc(resultSet.getInt("tien_dat_coc"));
                contract.setMaNhanVien(resultSet.getInt("ma_nhan_vien"));
                contract.setMaKhachHang(resultSet.getInt("ma_khach_hang"));
                contract.setMaDichVu(resultSet.getInt("ma_dich_vu"));
                contracts.add(contract);
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

        return contracts;
    }

    @Override
    public Map<Integer, String> getNhanVienHD() {
        Map<Integer, String> nhanVienHD = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(LIST_EMPLOYEE_CONTRACT);
//            private static final String LIST_EMPLOYEE_CONTRACT = "select ma_nhan_vien, ho_ten from khach_hang order by ma_nhan_vien;";
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mnv = resultSet.getInt("ma_nhan_vien");
                String tnv = resultSet.getString("ho_ten");
                nhanVienHD.put(mnv, tnv);
            }
            System.out.println(nhanVienHD);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return nhanVienHD;
    }

    @Override
    public Map<Integer, String> getKhachHangHD() {
        Map<Integer, String> khachHangHD = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(LIST_CUSTOMER_CONTRACT);
//            private static final String LIST_CUSTOMER_CONTRACT = "select ma_khach_hang, ho_ten from nhan_vien order by ma_nhan_vien;";
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mkh = resultSet.getInt("ma_khach_hang");
                String tkh = resultSet.getString("ho_ten");
                khachHangHD.put(mkh, tkh);
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
        return khachHangHD;
    }

    @Override
    public Map<Integer, String> getDichVu() {
        Map<Integer, String> dichVu = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(LIST_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mdv = resultSet.getInt("ma_dich_vu");
                String tdv = resultSet.getString("ten_dich_vu");
                dichVu.put(mdv, tdv);
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
        return dichVu;
    }
}

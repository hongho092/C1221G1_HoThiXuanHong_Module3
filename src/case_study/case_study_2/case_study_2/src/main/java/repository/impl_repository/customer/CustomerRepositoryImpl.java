package repository.impl_repository.customer;

import dto.CustomerServiceNow;
import model.customer.Customer;
import repository.BaseRepository;
import repository.interface_repository.customer.CustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerRepositoryImpl implements CustomerRepository {

    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_CUSTOMER = "select * from khach_hang";
    private static final String CREATE_CUSTOMER = "insert into khach_hang(ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi) value (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String FIND_CUSTOMER = "select * from khach_hang where ma_khach_hang = ?;";
    private static final String EDIT_CUSTOMER = "update khach_hang set ma_loai_khach=?, ho_ten=?, ngay_sinh=?, gioi_tinh=?, so_cmnd=?, so_dien_thoai=?, email=?, dia_chi=? where ma_khach_hang=?;";
    private static final String DELETE_CUSTOMER = "call deleteCustomer(?);";
    private static final String SEARCH_CUSTOMER = "select * from khach_hang where ho_ten like ?;";


    @Override
    public List<Customer> getList() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setMaKhachHang(resultSet.getInt("ma_khach_hang"));
                customer.setMaLoaiKhach(resultSet.getInt("ma_loai_khach"));
                customer.setHoTen(resultSet.getString("ho_ten"));
                customer.setNgaySinh(resultSet.getString("ngay_sinh"));
                customer.setGioiTinh(resultSet.getInt("gioi_tinh"));
                customer.setSoCMND(resultSet.getString("so_cmnd"));
                customer.setSoDienThoai(resultSet.getString("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setDiaChi(resultSet.getString("dia_chi"));
                customers.add(customer);
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
        return customers;
    }

    @Override
    public void createCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(CREATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getMaLoaiKhach());
            preparedStatement.setString(2, customer.getHoTen());
            preparedStatement.setString(3, customer.getNgaySinh());
            preparedStatement.setInt(4, customer.getGioiTinh());
            preparedStatement.setString(5, customer.getSoCMND());
            preparedStatement.setString(6, customer.getSoDienThoai());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getDiaChi());
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
    public Customer findCustomerById(int id) {
        Connection connection = baseRepository.getConnection();
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(FIND_CUSTOMER);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setMaKhachHang(resultSet.getInt("ma_khach_hang"));
                customer.setMaLoaiKhach(resultSet.getInt("ma_loai_khach"));
                customer.setHoTen(resultSet.getString("ho_ten"));
                customer.setNgaySinh(resultSet.getString("ngay_sinh"));
                customer.setGioiTinh(resultSet.getInt("gioi_tinh"));
                customer.setSoCMND(resultSet.getString("so_cmnd"));
                customer.setSoDienThoai(resultSet.getString("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setDiaChi(resultSet.getString("dia_chi"));
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
        return customer;
    }

    @Override
    public void editCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setInt(1, customer.getMaLoaiKhach());
            preparedStatement.setString(2, customer.getHoTen());
            preparedStatement.setString(3, customer.getNgaySinh());
            preparedStatement.setInt(4, customer.getGioiTinh());
            preparedStatement.setString(5, customer.getSoCMND());
            preparedStatement.setString(6, customer.getSoDienThoai());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getDiaChi());
            preparedStatement.setInt(9, customer.getMaKhachHang());
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
    public void deleteCustomer(int id) {
        Connection connection = baseRepository.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                callableStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Customer> getCustomerByName(String name) {
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_CUSTOMER);
            preparedStatement.setString(1, "%"+name+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setMaKhachHang(resultSet.getInt("ma_khach_hang"));
                customer.setMaLoaiKhach(resultSet.getInt("ma_loai_khach"));
                customer.setHoTen(resultSet.getString("ho_ten"));
                customer.setNgaySinh(resultSet.getString("ngay_sinh"));
                customer.setGioiTinh(resultSet.getInt("gioi_tinh"));
                customer.setSoCMND(resultSet.getString("so_cmnd"));
                customer.setSoDienThoai(resultSet.getString("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setDiaChi(resultSet.getString("dia_chi"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public List<CustomerServiceNow> getListCSN() {
        List<CustomerServiceNow> customerServiceNows = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        String query = "select hop_dong.ma_hop_dong, khach_hang.ho_ten, dich_vu.ten_dich_vu, dich_vu.mo_ta_tien_nghi_khac, dich_vu.chi_phi_thue, \n" +
                       "dich_vu_di_kem.ten_dich_vu_di_kem, hop_dong_chi_tiet.so_luong\n" +
                       "from khach_hang\n" +
                       "inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang\n" +
                       "inner join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu\n" +
                       "left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong\n" +
                       "left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem\n" +
                       "where now() between hop_dong.ngay_lam_hop_dong and hop_dong.ngay_ket_thuc; \n";
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            CustomerServiceNow customerServiceNow;
            while (resultSet.next()) {
                customerServiceNow = new CustomerServiceNow();
                customerServiceNow.setMaHopDong(resultSet.getInt("ma_hop_dong"));
                customerServiceNow.setHoTen(resultSet.getString("ho_ten"));
                customerServiceNow.setTenDichVu(resultSet.getString("ten_dich_vu"));
                customerServiceNow.setMoTaTienNghiKhac(resultSet.getString("mo_ta_tien_nghi_khac"));
                customerServiceNow.setChiPhiThue(resultSet.getInt("chi_phi_thue"));
                customerServiceNow.setTenDichVuDiKem(resultSet.getString("ten_dich_vu_di_kem"));
                customerServiceNow.setSoLuong(resultSet.getInt("so_luong"));
                customerServiceNows.add(customerServiceNow);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerServiceNows;
    }
}

package repository.impl_repository;

import model.Customer;
import repository.BaseRepository;
import repository.interface_repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {

    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_CUSTOMER = "select * from khach_hang";
    private static final String CREATE_CUSTOMER = "insert into khach_hang(ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi) value (?, ?, ?, ?, ?, ?, ?, ?);";


    @Override
    public List<Customer> getList() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER);
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
        return null;
    }

    @Override
    public void createCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getMaLoaiKhach());
            preparedStatement.setString(2, customer.getHoTen());
            preparedStatement.setString(3, customer.getNgaySinh());
            preparedStatement.setInt(4, customer.getGioiTinh());
            preparedStatement.setString(5, customer.getSoCMND());
            preparedStatement.setString(6, customer.getSoDienThoai());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getDiaChi());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

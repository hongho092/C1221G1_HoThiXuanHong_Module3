package repository.impl_repository;

import model.Customer;
import model.Employee;
import repository.BaseRepository;
import repository.interface_repository.EmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Employee> getList() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        String query = "select * from nhan_vien";
        Employee employee;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setMaNhanVien(resultSet.getInt("ma_nhan_vien"));
                employee.setHoTen(resultSet.getString("ho_ten"));
                employee.setNgaySinh(resultSet.getString("ngay_sinh"));
                employee.setSoCMND(resultSet.getString("so_cmnd"));
                employee.setLuong(resultSet.getInt("luong"));
                employee.setSoDienThoai(resultSet.getString("so_dien_thoai"));
                employee.setEmail(resultSet.getString("email"));
                employee.setDiaChi(resultSet.getString("dia_chi"));
                employee.setMaViTri(resultSet.getInt("ma_vi_tri"));
                employee.setMaTrinhDo(resultSet.getInt("ma_trinh_do"));
                employee.setMaBoPhan(resultSet.getInt("ma_bo_phan"));
                employees.add(employee);
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public Map<Integer, String> getVT() {
        Map<Integer, String> viTri = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        String query = "select * from vi_tri";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mvt = resultSet.getInt("ma_vi_tri");
                String tvt = resultSet.getString("ten_vi_tri");
                viTri.put(mvt, tvt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return viTri;
    }

    @Override
    public Map<Integer, String> getTD() {
        Map<Integer, String> trinhDo = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        String query = "select * from trinh_do";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mtd = resultSet.getInt("ma_trinh_do");
                String ttd = resultSet.getString("ten_trinh_do");
                trinhDo.put(mtd, ttd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trinhDo;
    }

    @Override
    public Map<Integer, String> getBP() {
        Map<Integer, String> boPhan = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        String query = "select * from bo_phan";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mbp = resultSet.getInt("ma_bo_phan");
                String tbp = resultSet.getString("ten_bo_phan");
                boPhan.put(mbp, tbp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boPhan;
    }

    @Override
    public void createEmployee(Employee employee) {
        PreparedStatement preparedStatement = null;
        String query = "insert into nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(query);
            preparedStatement.setString(1, employee.getHoTen());
            preparedStatement.setString(2, employee.getNgaySinh());
            preparedStatement.setString(3, employee.getSoCMND());
            preparedStatement.setInt(4, (int) employee.getLuong());
            preparedStatement.setString(5, employee.getSoDienThoai());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getDiaChi());
            preparedStatement.setInt(8, employee.getMaViTri());
            preparedStatement.setInt(9, employee.getMaTrinhDo());
            preparedStatement.setInt(10, employee.getMaBoPhan());
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
    public Employee findEmployeeById(int id) {
        Connection connection = baseRepository.getConnection();
        Employee employee = null;
        PreparedStatement preparedStatement = null;
        String query = "select * from nhan_vien where ma_nhan_vien = ?;";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setMaNhanVien(resultSet.getInt("ma_nhan_vien"));
                employee.setHoTen(resultSet.getString("ho_ten"));
                employee.setNgaySinh(resultSet.getString("ngay_sinh"));
                employee.setSoCMND(resultSet.getString("so_cmnd"));
                employee.setLuong(resultSet.getInt("luong"));
                employee.setSoDienThoai(resultSet.getString("so_dien_thoai"));
                employee.setEmail(resultSet.getString("email"));
                employee.setDiaChi(resultSet.getString("dia_chi"));
                employee.setMaViTri(resultSet.getInt("ma_vi_tri"));
                employee.setMaTrinhDo(resultSet.getInt("ma_trinh_do"));
                employee.setMaBoPhan(resultSet.getInt("ma_bo_phan"));
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
        return employee;
    }

    @Override
    public void editEmployee(Employee employee) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        String query = "update nhan_vien set ho_ten=?, ngay_sinh=?, so_cmnd=?, luong=?, so_dien_thoai=?, email=?, dia_chi=?, ma_vi_tri=?, ma_trinh_do=?, ma_bo_phan=?  where ma_nhan_vien=?;";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, employee.getHoTen());
            preparedStatement.setString(2, employee.getNgaySinh());
            preparedStatement.setString(3, employee.getSoCMND());
            preparedStatement.setInt(4, (int) employee.getLuong());
            preparedStatement.setString(5, employee.getSoDienThoai());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getDiaChi());
            preparedStatement.setInt(8, employee.getMaViTri());
            preparedStatement.setInt(9, employee.getMaTrinhDo());
            preparedStatement.setInt(10, employee.getMaBoPhan());
            preparedStatement.setInt(11, employee.getMaNhanVien());
            preparedStatement.executeUpdate();
            System.out.println(employee);
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
    public void deleteEmployee(int id) {
        Connection connection = baseRepository.getConnection();
        CallableStatement callableStatement = null;
        String query = "call deleteEmployee(?);";
        try {
            callableStatement = connection.prepareCall(query);
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
}

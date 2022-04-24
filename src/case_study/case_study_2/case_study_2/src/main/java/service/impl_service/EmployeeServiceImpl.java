package service.impl_service;

import model.Employee;
import repository.impl_repository.EmployeeRepositoryImpl;
import repository.interface_repository.EmployeeRepository;
import service.interface_service.EmployeeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {

    private EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();


    @Override
    public List<Employee> getList() {
        List<Employee> employees = employeeRepository.getList();
        return employees;
    }

    @Override
    public Map<Integer, String> getVT() {
        Map<Integer, String> viTri = employeeRepository.getVT();
        return viTri;
    }

    @Override
    public Map<Integer, String> getTD() {
        Map<Integer, String> trinhDo = employeeRepository.getTD();
        return trinhDo;
    }

    @Override
    public Map<Integer, String> getBP() {
        Map<Integer, String> boPhan = employeeRepository.getBP();
        return boPhan;
    }

    @Override
    public Map<String, String> createEmployee(Employee employee) {
        Map<String, String> map = new HashMap<>();
        String soCMND = "^[0-9]{9}$";
        String soDienThoai = "^(090|091|(84)+90|(84)+91)[0-9]{7}$";
        String email = "^[\\w-\\.]+@([\\w-]+\\.)+com$";
        String luong = "^[1-9]{1}[0-9]*$";
        if (employee.getHoTen().equals("")) {
            map.put("hoTen", "Tên không được để trống");
        }
        if (employee.getNgaySinh().equals("")) {
            map.put("ngaySinh", "Ngày sinh không được để trống");
        }
        if (employee.getSoCMND().equals("")) {
            map.put("soCMND", "Số CMND không được để trống");
        } else if (!employee.getSoCMND().matches(soCMND)) {
            map.put("soCMND", "Số CMND không hợp lệ");
        }
        if (employee.getLuong().equals("")) {
            map.put("luong", "Lương không được để trống");
        } else if (!employee.getLuong().matches(luong)) {
            map.put("luong", "Lương phải lớn hơn 0");
        }
        if (employee.getSoDienThoai().equals("")) {
            map.put("soDienThoai", "Số điện thoại không được để trống");
        } else if (!employee.getSoDienThoai().matches(soDienThoai)) {
            map.put("soDienThoai", "Số điện thoại không hợp lệ");
        }
        if (employee.getEmail().equals("")) {
            map.put("email", "Email không được để trống");
        } else if (!employee.getEmail().matches(email)) {
            map.put("email", "Email không họp lệ");
        }
        if (employee.getDiaChi().equals("")) {
            map.put("diaChi", "Địa chỉ không được để trống");
        }
        if (employee.getMaViTri() == 0) {
            map.put("maViTri", "Hãy chọn vị trí");
        }
        if (employee.getMaBoPhan() == 0) {
            map.put("maBoPhan", "Hãy chọn bộ phận");
        }
        if (employee.getMaTrinhDo() == 0) {
            map.put("maTrinhDo", "Hãy chọn trình độ");
        }
        if (map.isEmpty()) {
            employeeRepository.createEmployee(employee);
        }
        return map;
    }

    @Override
    public Employee findEmployeeById(int id) {
        Employee employee = employeeRepository.findEmployeeById(id);
        return employee;
    }

    @Override
    public void editEmployee(Employee employee) {
        employeeRepository.editEmployee(employee);
    }

    @Override
    public void deleteEmployee(int id) {
        employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> getEmployeeList(String name, String address, int mavt) {
        List<Employee> employees = employeeRepository.getEmployeeList(name, address, mavt);
        return employees;
    }
}

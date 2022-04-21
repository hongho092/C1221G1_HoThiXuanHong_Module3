package service.impl_service;

import model.Employee;
import repository.impl_repository.EmployeeRepositoryImpl;
import repository.interface_repository.EmployeeRepository;
import service.interface_service.EmployeeService;

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
    public void createEmployee(Employee employee) {
        employeeRepository.createEmployee(employee);
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
}

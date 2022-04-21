package service.interface_service;

import model.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    List<Employee> getList();

    Map<Integer, String> getVT();

    Map<Integer, String> getTD();

    Map<Integer, String> getBP();

    void createEmployee(Employee employee);

    Employee findEmployeeById(int id);

    void editEmployee(Employee employee);

    void deleteEmployee(int id);
}

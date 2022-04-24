package repository.interface_repository;

import model.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeRepository {
    List<Employee> getList();

    Map<Integer, String> getVT();

    Map<Integer, String> getTD();

    Map<Integer, String> getBP();

    void createEmployee(Employee employee);

    Employee findEmployeeById(int id);

    void editEmployee(Employee employee);

    void deleteEmployee(int id);

    List<Employee> getEmployeeList(String name, String address, int mavt);
}

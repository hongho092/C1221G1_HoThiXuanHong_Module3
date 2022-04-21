package service.interface_service;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    void createCustomer(Customer customer);

    List<Customer> getList();

    Customer findCustomerById(int id);

    void editCustomer(Customer customer);

    void deleteCustomer(int id);

    Map<Integer, String> getLoaiKhach();

    List<Customer> getCustomerByName(String name);
}

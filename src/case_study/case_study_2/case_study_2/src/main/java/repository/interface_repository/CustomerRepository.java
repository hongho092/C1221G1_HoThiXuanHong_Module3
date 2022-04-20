package repository.interface_repository;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerRepository {
    List<Customer> getList();
    void createCustomer(Customer customer);

    Customer findCustomerById(int id);

    void editCustomer(Customer customer);

    void deleteCustomer(int id);

    Map<Integer, String> getMaLoaiKhach();
}

package service.interface_service.customer;

import dto.CustomerServiceNow;
import model.customer.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    Map<String, String> createCustomer(Customer customer);

    List<Customer> getList();

    Customer findCustomerById(int id);

    void editCustomer(Customer customer);

    void deleteCustomer(int id);

//    Map<Integer, String> getLoaiKhach();

    List<Customer> getCustomerByName(String name);

    List<CustomerServiceNow> getListCSN();
}

package repository.interface_repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository{
    List<Customer> getList();
    void createCustomer(Customer customer);
}

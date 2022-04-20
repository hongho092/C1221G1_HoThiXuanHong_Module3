package service.impl_service;

import model.Customer;
import repository.impl_repository.CustomerRepositoryImpl;
import repository.interface_repository.CustomerRepository;

import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements service.interface_service.CustomerService {

    private CustomerRepository iCustomerRepository = new CustomerRepositoryImpl();

    @Override
    public void createCustomer(Customer customer) {
        iCustomerRepository.createCustomer(customer);
    }

    public List<Customer> getList() {
        List<Customer> customers = iCustomerRepository.getList();
        return customers;
    }

    @Override
    public Customer findCustomerById(int id) {
        Customer customer = iCustomerRepository.findCustomerById(id);
        return customer;
    }

    @Override
    public void editCustomer(Customer customer) {
        iCustomerRepository.editCustomer(customer);
    }

    @Override
    public void deleteCustomer(int id) {
        iCustomerRepository.deleteCustomer(id);
    }

    @Override
    public Map<Integer, String> getLoaiKhach() {
        Map<Integer, String> maLoaiKhach = iCustomerRepository.getMaLoaiKhach();
        return maLoaiKhach;
    }
}

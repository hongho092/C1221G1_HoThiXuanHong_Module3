package service.impl_service;

import model.Customer;
import repository.impl_repository.CustomerRepository;
import repository.interface_repository.ICustomerRepository;
import service.interface_service.ICustomerService;

public class CustomerService implements ICustomerService {

    private ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public void createCustomer(Customer customer) {
        iCustomerRepository.createCustomer(customer);
    }
}

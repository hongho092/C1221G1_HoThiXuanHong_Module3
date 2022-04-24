package service.impl_service.customer;

import repository.impl_repository.customer.CustomerTypeRepositoryImpl;
import repository.interface_repository.customer.CustomerTypeRepositiry;
import service.interface_service.customer.CustomerTypeService;

import java.util.Map;

public class CustomerTypeServiceImpl implements CustomerTypeService {

    private CustomerTypeRepositiry customerTypeRepositiry = new CustomerTypeRepositoryImpl();

    @Override
    public Map<Integer, String> getCustomerType() {
        Map<Integer, String> listCustomerType = customerTypeRepositiry.getCustomerType();
        return listCustomerType;
    }
}

package service.impl_service.customer;

import dto.CustomerServiceNow;
import model.customer.Customer;
import repository.impl_repository.customer.CustomerRepositoryImpl;
import repository.interface_repository.customer.CustomerRepository;
import service.interface_service.customer.CustomerService;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class CustomerServiceImpl implements CustomerService {

    private CustomerRepository iCustomerRepository = new CustomerRepositoryImpl();

    @Override
    public Map<String, String> createCustomer(Customer customer) {
        Map<String, String> map = new HashMap<>();
        String soCMND = "^[0-9]{9}$";
        String soDienThoai = "^(090|091|(84)+90|(84)+91)[0-9]{7}$";
        String email = "^[\\w-\\.]+@([\\w-]+\\.)+com$";
        String birthday = "(^(((0[1-9]|1[0-9]|2[0-8])[\\/](0[1-9]|1[012]))|((29|30|31)[\\/](0[13578]|1[02]))|((29|30)[\\/](0[4,6,9]|11)))[\\/](19|[2-9][0-9])\\d\\d$)|(^29[\\/]02[\\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)";
        if (customer.getHoTen().equals("")){
            map.put("hoTen", "Không được để trống");
        }
        if (customer.getNgaySinh().equals("")){
            map.put("ngaySinh", "Không được để trống");
        } else if (Pattern.matches(birthday, customer.getNgaySinh())) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            LocalDate age = LocalDate.parse(customer.getNgaySinh(), formatter);
            LocalDate now = LocalDate.now();
            int current = Period.between(age, now).getYears();
            if (current > 100 || current < 18) {
                map.put("ngaySinh", "Tuổi phải lớn hơn 18 hoặc nhỏ hơn 100");
            }
        }
        if (customer.getSoCMND().equals("")){
            map.put("soCMND", "Không được để trống");
        } else if (!customer.getSoCMND().matches(soCMND)) {
            map.put("soCMND", "Sai định dạng");
        }
        if (customer.getSoDienThoai().equals("")){
            map.put("soDienThoai", "Không được để trống");
        } else if (!customer.getSoDienThoai().matches(soDienThoai)) {
            map.put("soDienThoai", "Sai định dạng");
        }
        if (customer.getEmail().equals("")){
            map.put("email", "Không được để trống");
        } else if (!customer.getEmail().matches(email)){
            map.put("email", "Sai định dạng");
        }
        if (customer.getDiaChi().equals("")){
            map.put("diaChi", "Không được để trống");
        }
        if (customer.getGioiTinh() == 2){
            map.put("gioiTinh", "Không được để trống");
        }
        if (customer.getMaLoaiKhach() != 1 || customer.getMaLoaiKhach() != 0){
            map.put("maLoaiKhach", "Không được để trống");
        }
        if (map.isEmpty()) {
            iCustomerRepository.createCustomer(customer);
        }
        return map;
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

//    @Override
//    public Map<Integer, String> getLoaiKhach() {
//        Map<Integer, String> maLoaiKhach = iCustomerRepository.getMaLoaiKhach();
//        return maLoaiKhach;
//    }

    @Override
    public List<Customer> getCustomerByName(String name) {
        List<Customer> customers = iCustomerRepository.getCustomerByName(name);
        return customers;
    }

    @Override
    public List<CustomerServiceNow> getListCSN() {
        List<CustomerServiceNow> customerServiceNows = iCustomerRepository.getListCSN();
        return customerServiceNows;
    }
}

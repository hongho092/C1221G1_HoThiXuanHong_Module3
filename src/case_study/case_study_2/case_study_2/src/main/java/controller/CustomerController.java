package controller;

import model.customer.Customer;
import service.impl_service.customer.CustomerServiceImpl;
import service.impl_service.customer.CustomerTypeServiceImpl;
import service.interface_service.customer.CustomerService;
import service.interface_service.customer.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {

    private CustomerService iCustomerService = new CustomerServiceImpl();
    private CustomerTypeService customerTypeService = new CustomerTypeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                goToCreate(request, response);
                break;
            }
            case "edit": {
                findCustomerById(request, response);
                break;
            }
            case "delete": {
                deleteCustomer(request, response);
                break;
            }
            case "search": {
                searchCustomer(request, response);
                break;
            }
            default: {
                goToList(request, response);
            }
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Customer> customers = iCustomerService.getCustomerByName(name);
        request.setAttribute("customers", customers);
        Map<Integer, String> maloaikhach = customerTypeService.getCustomerType();
        request.setAttribute("lkh", maloaikhach);
        try {
            request.getRequestDispatcher("view/customer/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void goToList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = iCustomerService.getList();
        request.setAttribute("customers", customers);
        Map<Integer, String> maloaikhach = customerTypeService.getCustomerType();
        request.setAttribute("lkh", maloaikhach);
        try {
            request.getRequestDispatcher("view/customer/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void goToCreate(HttpServletRequest request, HttpServletResponse response) {
        Map<Integer, String> maloaikhach = customerTypeService.getCustomerType();
        request.setAttribute("lkh", maloaikhach);
        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findCustomerById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = iCustomerService.findCustomerById(id);
        request.setAttribute("customer", customer);
        Map<Integer, String> maloaikhach = customerTypeService.getCustomerType();
        request.setAttribute("lkh", maloaikhach);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iCustomerService.deleteCustomer(id);
        request.setAttribute("show", "Xóa khách hàng thành công");
        goToList(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createCustomer(request, response);
                break;
            }
            case "edit": {
                infoEditCustomer(request, response);
                break;
            }
        }
    }

    private void infoEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        Customer customer = new Customer();
        customer.setMaKhachHang(Integer.parseInt(request.getParameter("maKhachHang")));
        customer.setMaLoaiKhach(Integer.parseInt(request.getParameter("maLoaiKhach")));
        customer.setHoTen(request.getParameter("hoTen"));
        customer.setNgaySinh(request.getParameter("ngaySinh"));
        customer.setGioiTinh(Integer.parseInt(request.getParameter("gioiTinh")));
        customer.setSoCMND(request.getParameter("soCMND"));
        customer.setSoDienThoai(request.getParameter("soDienThoai"));
        customer.setEmail(request.getParameter("email"));
        customer.setDiaChi(request.getParameter("diaChi"));
        iCustomerService.editCustomer(customer);
        request.setAttribute("show", "Sửa thông tin khách hàng thành công");
        goToList(request, response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        Customer customer = new Customer();
        customer.setMaLoaiKhach(Integer.parseInt(request.getParameter("maLoaiKhach")));
        customer.setHoTen(request.getParameter("hoTen"));
        customer.setNgaySinh(request.getParameter("ngaySinh"));
        customer.setGioiTinh(Integer.parseInt(request.getParameter("gioiTinh")));
        customer.setSoCMND(request.getParameter("soCMND"));
        customer.setSoDienThoai(request.getParameter("soDienThoai"));
        customer.setEmail(request.getParameter("email"));
        customer.setDiaChi(request.getParameter("diaChi"));
        Map<String, String> map = iCustomerService.createCustomer(customer);
        if (map.isEmpty()) {
            request.setAttribute("show", "Tạo mới khách hàng thành công");
            goToList(request, response);
        } else {
            request.setAttribute("error", map);
            goToCreate(request, response);
        }
//        Map<String, String> map = employeeService.createEmployee(employee);
//        iCustomerService.createCustomer(customer);
//        request.setAttribute("show", "Tạo mới khách hàng thành công");
//        goToList(request, response);
    }
}

package controller;

import model.Customer;
import service.impl_service.CustomerServiceImpl;
import service.interface_service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {

    private CustomerService iCustomerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                try {
                    Map<Integer, String> maloaikhach = iCustomerService.getLoaiKhach();
                    request.setAttribute("lkh", maloaikhach);
                    request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
            case "edit": {
                int id = Integer.parseInt(request.getParameter("id"));
                Customer customer = iCustomerService.findCustomerById(id);
                request.setAttribute("customer", customer);
                Map<Integer, String> maloaikhach = iCustomerService.getLoaiKhach();
                request.setAttribute("lkh", maloaikhach);
                try {
                    request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
            case "delete": {
                deleteCustomer(request, response);
                break;
            }
            case "search": {
                String name = request.getParameter("name");
//                List<Student> studentList = iStudentService.search(name);
//                request.setAttribute("students", studentList);
//                request.getRequestDispatcher("list.jsp").forward(request, response);
                break;
            }
            default: {
                List<Customer> customers = iCustomerService.getList();
                request.setAttribute("customers", customers);
                try {
                    request.getRequestDispatcher("view/customer/show.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
//                List<StudentListDTO> studentList = iStudentService.getListStudent();
//                request.setAttribute("students", studentList);
//                request.getRequestDispatcher("list.jsp").forward(request, response);
            }
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iCustomerService.deleteCustomer(id);
        request.setAttribute("show", "Delete Success");
        List<Customer> customers = iCustomerService.getList();
        request.setAttribute("customers", customers);
        try {
            request.getRequestDispatcher("view/customer/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        request.setAttribute("show", "Edit Success");
        List<Customer> customers = iCustomerService.getList();
        request.setAttribute("customers", customers);
        try {
            request.getRequestDispatcher("view/customer/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

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
        iCustomerService.createCustomer(customer);
        request.setAttribute("show", "Create Success");
        List<Customer> customers = iCustomerService.getList();
        request.setAttribute("customers", customers);
        try {
            request.getRequestDispatcher("view/customer/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

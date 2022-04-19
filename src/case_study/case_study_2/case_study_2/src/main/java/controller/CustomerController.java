package controller;

import model.Customer;
import service.impl_service.CustomerService;
import service.interface_service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {

    private ICustomerService iCustomerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                try {
                    request.getRequestDispatcher("customer/create.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
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
//                List<StudentListDTO> studentList = iStudentService.getListStudent();
//                request.setAttribute("students", studentList);
//                request.getRequestDispatcher("list.jsp").forward(request, response);
            }
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
                System.out.println("vao em oi");
                createCustomer(request, response);
            }

        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("vao chua em");
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
        try {
            request.getRequestDispatcher("customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

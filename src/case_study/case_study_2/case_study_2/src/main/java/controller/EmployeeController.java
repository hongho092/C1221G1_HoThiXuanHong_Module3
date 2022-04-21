package controller;

import model.Customer;
import model.Employee;
import service.impl_service.EmployeeServiceImpl;
import service.interface_service.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeController", value = "/employee")
public class EmployeeController extends HttpServlet {

    private EmployeeService employeeService = new EmployeeServiceImpl();

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
                findEmployeeById(request, response);
                break;
            }
            case "delete": {
                deleteEmployee(request, response);
                break;
            }
            case "search": {
                System.out.println("search");
//                String name = request.getParameter("name");
//                List<Customer> customers = iCustomerService.getCustomerByName(name);
//                request.setAttribute("customers", customers);
//                try {
//                    request.getRequestDispatcher("view/customer/show.jsp").forward(request, response);
//                } catch (ServletException e) {
//                    e.printStackTrace();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//                break;
            }
            default: {
                goToList1(request, response);
            }
        }
    }

    private void goToCreate(HttpServletRequest request, HttpServletResponse response) {
        Map<Integer, String> viTri = employeeService.getVT();
        Map<Integer, String> trinhDo = employeeService.getTD();
        Map<Integer, String> boPhan = employeeService.getBP();
        request.setAttribute("vt", viTri);
        request.setAttribute("td", trinhDo);
        request.setAttribute("bp", boPhan);
        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findEmployeeById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findEmployeeById(id);
        System.out.println(employee.getHoTen());
        request.setAttribute("employee", employee);
        Map<Integer, String> viTri = employeeService.getVT();
        Map<Integer, String> trinhDo = employeeService.getTD();
        Map<Integer, String> boPhan = employeeService.getBP();
        request.setAttribute("vt", viTri);
        request.setAttribute("td", trinhDo);
        request.setAttribute("bp", boPhan);
        try {
            request.getRequestDispatcher("view/employee/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void goToList1(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employees = employeeService.getList();
        request.setAttribute("employees", employees);
        Map<Integer, String> viTri = employeeService.getVT();
        Map<Integer, String> trinhDo = employeeService.getTD();
        Map<Integer, String> boPhan = employeeService.getBP();
        request.setAttribute("vt", viTri);
        request.setAttribute("td", trinhDo);
        request.setAttribute("bp", boPhan);
        try {
            request.getRequestDispatcher("view/employee/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        request.setAttribute("show", "Xóa nhân viên thành công");
        goToList1(request, response);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createEmployee(request, response);
                break;
            }
            case "edit": {
                infoEditEmployee(request, response);
                break;
            }
        }
    }

    private void infoEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setMaNhanVien(Integer.parseInt(request.getParameter("maNhanVien")));
        employee.setHoTen(request.getParameter("hoTen"));
        employee.setNgaySinh(request.getParameter("ngaySinh"));
        employee.setSoCMND(request.getParameter("soCMND"));
        employee.setLuong(Double.parseDouble(request.getParameter("luong")));
        employee.setSoDienThoai(request.getParameter("soDienThoai"));
        employee.setEmail(request.getParameter("email"));
        employee.setDiaChi(request.getParameter("diaChi"));
        employee.setMaViTri(Integer.parseInt(request.getParameter("maViTri")));
        employee.setMaTrinhDo(Integer.parseInt(request.getParameter("maTrinhDo")));
        employee.setMaBoPhan(Integer.parseInt(request.getParameter("maBoPhan")));
        employeeService.editEmployee(employee);
        System.out.println(employee.getHoTen());
        request.setAttribute("show", "Sửa thông tin nhân viên thành công");
        goToList1(request, response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setHoTen(request.getParameter("hoTen"));
        employee.setNgaySinh(request.getParameter("ngaySinh"));
        employee.setSoCMND(request.getParameter("soCMND"));
        employee.setLuong(Integer.parseInt(request.getParameter("luong")));
        employee.setSoDienThoai(request.getParameter("soDienThoai"));
        employee.setEmail(request.getParameter("email"));
        employee.setDiaChi(request.getParameter("diaChi"));
        employee.setMaViTri(Integer.parseInt(request.getParameter("maViTri")));
        employee.setMaTrinhDo(Integer.parseInt(request.getParameter("maTrinhDo")));
        employee.setMaBoPhan(Integer.parseInt(request.getParameter("maBoPhan")));
        employeeService.createEmployee(employee);
        request.setAttribute("show", "Tạo mới nhân viên thành công");
        goToList1(request, response);
    }
}

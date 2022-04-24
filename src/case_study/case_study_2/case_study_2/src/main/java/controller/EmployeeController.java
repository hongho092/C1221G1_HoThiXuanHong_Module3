package controller;

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
                searchEmployee(request, response);
                break;
            }
            default: {
                goToList1(request, response);
            }
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        int maViTri = Integer.parseInt(request.getParameter("maViTri"));
        if (name == "") {
            name = null;
        }
        if (address == "") {
            address = null;
        }
        List<Employee> employees = employeeService.getEmployeeList(name, address, maViTri);
        request.setAttribute("employees", employees);
        Map<Integer, String> viTri = employeeService.getVT();
        Map<Integer, String> trinhDo = employeeService.getTD();
        Map<Integer, String> boPhan = employeeService.getBP();
        request.setAttribute("vt", viTri);
        request.setAttribute("td", trinhDo);
        request.setAttribute("bp", boPhan);
        request.setAttribute("show", "Kết quả tìm kiếm được");
        try {
            request.getRequestDispatcher("view/employee/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
        employee.setLuong(request.getParameter("luong"));
        employee.setSoDienThoai(request.getParameter("soDienThoai"));
        employee.setEmail(request.getParameter("email"));
        employee.setDiaChi(request.getParameter("diaChi"));
        employee.setMaViTri(Integer.parseInt(request.getParameter("maViTri")));
        employee.setMaTrinhDo(Integer.parseInt(request.getParameter("maTrinhDo")));
        employee.setMaBoPhan(Integer.parseInt(request.getParameter("maBoPhan")));
        employeeService.editEmployee(employee);
        request.setAttribute("show", "Sửa thông tin nhân viên thành công");
        goToList1(request, response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setHoTen(request.getParameter("hoTen"));
        employee.setNgaySinh(request.getParameter("ngaySinh"));
        employee.setSoCMND(request.getParameter("soCMND"));
        employee.setLuong(request.getParameter("luong"));
        employee.setSoDienThoai(request.getParameter("soDienThoai"));
        employee.setEmail(request.getParameter("email"));
        employee.setDiaChi(request.getParameter("diaChi"));
        employee.setMaViTri(Integer.parseInt(request.getParameter("maViTri")));
        employee.setMaTrinhDo(Integer.parseInt(request.getParameter("maTrinhDo")));
        employee.setMaBoPhan(Integer.parseInt(request.getParameter("maBoPhan")));
        Map<String, String> map = employeeService.createEmployee(employee);
        if (map.isEmpty()) {
            request.setAttribute("show", "Tạo mới nhân viên thành công");
            goToList1(request, response);
        } else {
            request.setAttribute("error", map);
            request.setAttribute("hoTen", employee.getHoTen());
            request.setAttribute("ngaySinh", employee.getNgaySinh());
            request.setAttribute("luong", employee.getLuong());
            request.setAttribute("soCMND", employee.getSoCMND());
            request.setAttribute("soDienThoai", employee.getSoDienThoai());
            request.setAttribute("email", employee.getEmail());
            request.setAttribute("diaChi", employee.getDiaChi());
            try {
                request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

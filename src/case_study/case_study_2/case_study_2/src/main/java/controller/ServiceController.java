package controller;

import model.Employee;
import model.Service;
import service.impl_service.ServiceServiceImpl;
import service.interface_service.ServiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceController", value = "/service")
public class ServiceController extends HttpServlet {

    private ServiceService serviceService = new ServiceServiceImpl();

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
                getInfoToService(request, response);
                break;
            }
            default: {
                goToList(request, response);
            }
        }
    }

    private void goToList(HttpServletRequest request, HttpServletResponse response) {
        Map<Integer, String> kieuThue = serviceService.getTypeRent();
        Map<Integer, String> loaiDv = serviceService.getTypeService();
        request.setAttribute("kt", kieuThue);
        request.setAttribute("ldv", loaiDv);
        List<Service> services = serviceService.getListService();
        request.setAttribute("services", services);
        try {
            request.getRequestDispatcher("view/service/show.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getInfoToService(HttpServletRequest request, HttpServletResponse response) {
        Map<Integer, String> kieuThue = serviceService.getTypeRent();
        Map<Integer, String> loaiDv = serviceService.getTypeService();
        request.setAttribute("kt", kieuThue);
        request.setAttribute("ldv", loaiDv);
        try {
            request.getRequestDispatcher("view/service/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createService(request, response);
                break;
            }
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        Service service = new Service();
        service.setTenDichVu(request.getParameter("tenDichVu"));
        service.setDienTich(Integer.parseInt(request.getParameter("dienTich")));
        service.setChiPhiThue(Double.parseDouble(request.getParameter("chiPhiThue")));
        service.setSoNguoiToiDa(Integer.parseInt(request.getParameter("soNguoiToiDa")));
        service.setMaKieuThue(Integer.parseInt(request.getParameter("maKieuThue")));
        service.setMaLoaiDichVu(Integer.parseInt(request.getParameter("maLoaiDichVu")));
        service.setTieuChuanPhong(request.getParameter("tieuChuanPhong"));
        service.setMoTaTienNghiKhac(request.getParameter("moTaTienNghiKhac"));
        service.setDienTichHoBoi(Double.parseDouble(request.getParameter("dienTichHoBoi")));
        service.setSoTang(Integer.parseInt(request.getParameter("soTang")));
        Map<String, String> map = serviceService.createService(service);
        if (map.isEmpty()) {
            request.setAttribute("show", "Tạo dịch vụ thành công");
            goToList(request, response);
        } else {
            request.setAttribute("error", map);
            getInfoToService(request, response);
        }
    }
}

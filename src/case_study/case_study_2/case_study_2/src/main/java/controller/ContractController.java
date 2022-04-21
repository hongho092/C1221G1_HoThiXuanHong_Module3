package controller;

import model.Contract;
import model.ContractDetail;
import service.impl_service.ContractServiceImpl;
import service.interface_service.ContractService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceAllController", value = "/serviceAllController")
public class ContractController extends HttpServlet {

    private ContractService iServiceAllService = new ContractServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createContractDetail": {
                getInfoCD(request, response);
                break;
            }
            case "showContractDetail": {
                List<ContractDetail> contractDetails = iServiceAllService.getListContractDetail();
                request.setAttribute("cds", contractDetails);
                request.getRequestDispatcher("view/contract/show_contract_detail.jsp").forward(request, response);
                break;
            }
            case "showContract": {
                List<Contract> contracts = iServiceAllService.getListContract();
                request.setAttribute("ct", contracts);
                request.getRequestDispatcher("view/contract/show_contract.jsp").forward(request, response);
                break;
            }
            case "createContract": {
                getInfoCT(request, response);
                break;
            } default: {
                request.getRequestDispatcher("404.jsp").forward(request, response);
            }
        }

    }

    private void getInfoCT(HttpServletRequest request, HttpServletResponse response) {
        Map<Integer, String> nhanVienHD = iServiceAllService.getNhanVienHD();
        Map<Integer, String> khachHangHD = iServiceAllService.getKhachHangHD();
        Map<Integer, String> dichVu = iServiceAllService.getDichVu();
        request.setAttribute("nvhd", nhanVienHD);
        request.setAttribute("khhd", khachHangHD);
        request.setAttribute("dv", dichVu);
        try {
            request.getRequestDispatcher("view/contract/create_contract.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getInfoCD(HttpServletRequest request, HttpServletResponse response) {
        List<Integer> maHopDongHD = iServiceAllService.getMaHopDongHD();
        Map<Integer, String> maHopDongHDCT = iServiceAllService.getMaHopDongHDCT();
        request.setAttribute("mhd", maHopDongHD);
        request.setAttribute("hdct", maHopDongHDCT);
        try {
            request.getRequestDispatcher("view/contract/create_contract_detail.jsp").forward(request, response);
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
            case "createContractDetail": {
                createCD(request, response);
                break;
            }
            case "createContract": {
                createCT(request, response);
                break;
            }
        }
    }

    private void createCT(HttpServletRequest request, HttpServletResponse response) {
        Contract contract = new Contract();
        contract.setNgayLamHopDong(request.getParameter("ngayLamHopDong"));
        contract.setNgayKetThuc(request.getParameter("ngayKetThuc"));
        contract.setTienDatCoc(Double.parseDouble(request.getParameter("tienDatCoc")));
        contract.setMaNhanVien(Integer.parseInt(request.getParameter("maNhanVien")));
        contract.setMaKhachHang(Integer.parseInt(request.getParameter("maKhachHang")));
        contract.setMaDichVu(Integer.parseInt(request.getParameter("maDichVu")));
        iServiceAllService.createCT(contract);
        request.setAttribute("show", "Tạo hợp đồng thành công");
        List<Contract> contracts = iServiceAllService.getListContract();
        request.setAttribute("ct", contracts);
        try {
            request.getRequestDispatcher("view/contract/show_contract.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCD(HttpServletRequest request, HttpServletResponse response) {
        ContractDetail contractDetail = new ContractDetail();
        contractDetail.setMaHopDong(Integer.parseInt(request.getParameter("maHopDong")));
        contractDetail.setMaDichVuDiKem(Integer.parseInt(request.getParameter("maDichVuDiKem")));
        contractDetail.setSoLuong(Integer.parseInt(request.getParameter("soLuong")));
        iServiceAllService.createCD(contractDetail);
        request.setAttribute("show", "Tạo hợp đồng chi tiết thành công");
        List<ContractDetail> contractDetails = iServiceAllService.getListContractDetail();
        request.setAttribute("cds", contractDetails);
        try {
            request.getRequestDispatcher("view/contract/show_contract_detail.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

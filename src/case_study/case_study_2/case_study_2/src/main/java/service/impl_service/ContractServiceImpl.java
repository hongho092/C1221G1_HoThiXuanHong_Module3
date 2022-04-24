package service.impl_service;

import model.Contract;
import model.ContractDetail;
import repository.impl_repository.ContractRepositoryImpl;
import repository.interface_repository.ContractRepository;
import service.interface_service.ContractService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractServiceImpl implements ContractService {

    private ContractRepository iServiceAllRepository = new ContractRepositoryImpl();

    @Override
    public List<Integer> getMaHopDongHD() {
        List<Integer> maHopDongHD = iServiceAllRepository.getMaHopDongHD();
        return maHopDongHD;
    }

    @Override
    public Map<Integer, String> getMaHopDongHDCT() {
        Map<Integer, String> maHopDongHDCT = iServiceAllRepository.getMaHopDongHDCT();
        return maHopDongHDCT;
    }

    @Override
    public Map<String, String> createCD(ContractDetail contractDetail) {
        Map<String, String> map = new HashMap<>();
        if (contractDetail.getMaHopDong() == 0) {
            map.put("maHopDong", "Không được để trống");
        }
        if (contractDetail.getMaDichVuDiKem() == 0) {
            map.put("maDichVuDiKem", "Không được để trống");
        }
        if (contractDetail.getSoLuong() == 0) {
            map.put("soLuong", "Không được để trống");
        } else if (contractDetail.getSoLuong() < 0) {
            map.put("soLuong", "Số lượng không được bé hơn 0");
        }
        if (map.isEmpty()) {
            iServiceAllRepository.createCD(contractDetail);
        }
        return map;
    }

    @Override
    public List<ContractDetail> getListContractDetail() {
        List <ContractDetail> contractDetails = iServiceAllRepository.getListContractDetail();
        return contractDetails;
    }

    @Override
    public List<Contract> getListContract() {
        List<Contract> contracts = iServiceAllRepository.getListContract();
        return contracts;
    }

    @Override
    public Map<Integer, String> getNhanVienHD() {
        Map<Integer, String> nhanVienHD = iServiceAllRepository.getNhanVienHD();
        return nhanVienHD;
    }

    @Override
    public Map<Integer, String> getKhachHangHD() {
        Map<Integer, String> khachHangHD = iServiceAllRepository.getKhachHangHD();
        return khachHangHD;
    }

    @Override
    public Map<Integer, String> getDichVu() {
        Map<Integer, String> dichVu = iServiceAllRepository.getDichVu();
        return dichVu;
    }

    @Override
    public Map<String, String> createCT(Contract contract) {
        Map<String, String> map = new HashMap<>();
        if (contract.getNgayLamHopDong().equals("")) {
            map.put("ngayLamHopDong", "Không được để trống");
        }
        if (contract.getNgayKetThuc().equals("")) {
            map.put("ngayKetThuc", "Không được để trống");
        }
        if (contract.getTienDatCoc() == 0) {
            map.put("tienDatCoc", "Không được để trống");
        } else if (contract.getTienDatCoc() < 0) {
            map.put("tienDatCoc", "Không được bé hơn 0");
        }
        if (contract.getMaNhanVien() == 0) {
            map.put("maNhanVien", "Không được để trống");
        }
        if (contract.getMaKhachHang() == 0) {
            map.put("maKhachHang", "Không được để trống");
        }
        if (contract.getMaDichVu() == 0) {
            map.put("maDichVu", "Không được để trống");
        }
        if (map.isEmpty()) {
            iServiceAllRepository.createCT(contract);
        }
        return map;
    }
}

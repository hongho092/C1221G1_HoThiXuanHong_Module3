package service.impl_service;

import model.Contract;
import model.ContractDetail;
import repository.impl_repository.ContractRepositoryImpl;
import repository.interface_repository.ServiceAllRepository;
import service.interface_service.ContractService;

import java.util.List;
import java.util.Map;

public class ContractServiceImpl implements ContractService {

    private ServiceAllRepository iServiceAllRepository = new ContractRepositoryImpl();

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
    public void createCD(ContractDetail contractDetail) {
        iServiceAllRepository.createCD(contractDetail);
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
}

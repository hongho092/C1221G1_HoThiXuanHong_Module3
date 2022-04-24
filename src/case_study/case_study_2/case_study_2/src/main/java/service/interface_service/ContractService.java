package service.interface_service;

import model.Contract;
import model.ContractDetail;

import java.util.List;
import java.util.Map;

public interface ContractService {
    List<Integer> getMaHopDongHD();

    Map<Integer, String> getMaHopDongHDCT();

    Map<String, String> createCD(ContractDetail contractDetail);

    List<ContractDetail> getListContractDetail();

    List<Contract> getListContract();

    Map<Integer, String> getNhanVienHD();

    Map<Integer, String> getKhachHangHD();

    Map<Integer, String> getDichVu();

    Map<String, String> createCT(Contract contract);
}

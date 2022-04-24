package service.impl_service;

import model.Service;
import repository.impl_repository.ServiceRepositoryImpl;
import repository.interface_repository.ServiceRepository;
import service.interface_service.ServiceService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceServiceImpl implements ServiceService {

    private ServiceRepository serviceRepository = new ServiceRepositoryImpl();

    @Override
    public List<Service> getListService() {
        List<Service> services = serviceRepository.getListService();
        return services;
    }

    @Override
    public Map<Integer, String> getTypeService() {
        Map<Integer, String> kieuThue = serviceRepository.getTypeService();
        return kieuThue;
    }

    @Override
    public Map<Integer, String> getTypeRent() {
        Map<Integer, String> loaiDv = serviceRepository.getTypeRent();
        return loaiDv;
    }

    @Override
    public Map<String, String> createService(Service service) {
        Map<String, String> map = new HashMap<>();
        if (service.getTenDichVu().equals("")) {
            map.put("tenDichVu", "Không được để trống");
        }
        if (service.getMoTaTienNghiKhac().equals("")) {
            map.put("moTaTienNghiKhac", "Không được để trống");
        }
        if (service.getTieuChuanPhong().equals("")) {
            map.put("tieuChuanPhong", "Không được để trống");
        }
        if (service.getMaKieuThue() == 0) {
            map.put("maKieuThue", "Không được để trống");
        }
        if (service.getMaLoaiDichVu() == 0) {
            map.put("maLoaiDichVu", "Không được để trống");
        }
        if (service.getDienTich() == 0) {
            map.put("dienTich", "Không được để trống");
        } else if (service.getDienTich() < 0) {
            map.put("dienTich", "Phải lớn hơn không");
        }
        if (service.getChiPhiThue() == 0) {
            map.put("chiPhiThue", "Không được để trống");
        } else if (service.getChiPhiThue() < 0) {
            map.put("chiPhiThue", "Phải lớn hơn không");
        }
        if (service.getSoNguoiToiDa() == 0) {
            map.put("soNguoiToiDa", "Không được để trống");
        } else if (service.getSoNguoiToiDa() < 0) {
            map.put("soNguoiToiDa", "Phải lớn hơn không");
        }
        if (service.getDienTichHoBoi() == 0) {
            map.put("dienTichHoBoi", "Không được để trống");
        } else if (service.getSoNguoiToiDa() < 0) {
            map.put("dienTichHoBoi", "Phải lớn hơn không");
        }
        if (service.getSoTang() == 0) {
            map.put("soTang", "Không được để trống");
        } else if (service.getSoNguoiToiDa() < 0) {
            map.put("soTang", "Phải lớn hơn không");
        }

        if (map.isEmpty()) {
            serviceRepository.createService(service);

        }
        return map;
    }
}

package service.impl_service;

import model.Service;
import repository.impl_repository.ServiceRepositoryImpl;
import repository.interface_repository.ServiceRepository;
import service.interface_service.ServiceService;

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
    public void createService(Service service) {
        serviceRepository.createService(service);
    }
}

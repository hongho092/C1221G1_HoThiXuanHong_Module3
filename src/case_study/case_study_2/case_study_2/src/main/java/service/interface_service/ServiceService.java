package service.interface_service;

import model.Service;

import java.util.List;
import java.util.Map;

public interface ServiceService {
    List<Service> getListService();

    Map<Integer, String> getTypeService();

    Map<Integer, String> getTypeRent();

    Map<String, String> createService(Service service);
}

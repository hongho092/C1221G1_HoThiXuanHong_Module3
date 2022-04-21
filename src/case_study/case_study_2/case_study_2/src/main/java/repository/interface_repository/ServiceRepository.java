package repository.interface_repository;

import model.Service;

import java.util.List;
import java.util.Map;

public interface ServiceRepository {
    List<Service> getListService();

    Map<Integer, String> getTypeService();

    Map<Integer, String> getTypeRent();

    void createService(Service service);
}

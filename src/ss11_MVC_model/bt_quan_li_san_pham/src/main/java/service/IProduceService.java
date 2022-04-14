package service;

import model.Product;

import java.util.List;

public interface IProduceService {
    List<Product> getList();
    void save(Product product);

    void update(List<Product> products);
}

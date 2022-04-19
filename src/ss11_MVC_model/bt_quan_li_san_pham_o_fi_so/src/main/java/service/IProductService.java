package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getList();

    Product getById(int id);
//
    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(int id);
}

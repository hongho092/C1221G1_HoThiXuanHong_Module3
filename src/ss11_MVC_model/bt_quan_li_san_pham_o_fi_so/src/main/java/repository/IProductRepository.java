package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getList();

    Product getById(int id);

    void addProduct(Product product);

    void deleteProduct(int id);
}

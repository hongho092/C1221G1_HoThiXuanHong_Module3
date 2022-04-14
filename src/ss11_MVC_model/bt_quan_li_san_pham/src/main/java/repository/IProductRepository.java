package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getList();
    void save(Product product);

    void update(List<Product> products);
}

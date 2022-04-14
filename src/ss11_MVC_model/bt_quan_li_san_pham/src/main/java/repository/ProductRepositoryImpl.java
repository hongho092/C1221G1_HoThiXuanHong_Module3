package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository{
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(256, "Fan", "red"));
        products.add(new Product(875, "Sofa", "yellow"));
        products.add(new Product(376, "Table", "blue"));
        products.add(new Product(947, "Phone", "black"));
        products.add(new Product(475, "House", "orange"));
    }


    @Override
    public List<Product> getList() {
//        List<Product> products = new ArrayList<>();
        return products;
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public void update(List<Product> products) {

    }
}

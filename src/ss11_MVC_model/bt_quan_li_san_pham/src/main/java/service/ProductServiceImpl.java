package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements IProduceService{
    private IProductRepository iProductRepository = new ProductRepositoryImpl();


    @Override
    public List<Product> getList() {
        List<Product> products = iProductRepository.getList();
        return products;
    }

    @Override
    public void save(Product product) {
        iProductRepository.save(product);
    }
}

package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements IProductService{

    private IProductRepository iProductRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> getList() {
        return iProductRepository.getList();
    }

    @Override
    public Product getById(int id) {
        return iProductRepository.getById(id);
    }

    @Override
    public void addProduct(Product product) {
        iProductRepository.addProduct(product);
    }

    @Override
    public void editProduct(Product product) {
        List<Product> productList = getList();
        for (int i=0; i<productList.size(); i++) {
            if (productList.get(i).getId() == product.getId()) {
                productList.get(i).setName(product.getName());
                productList.get(i).setDetail(product.getDetail());
                productList.get(i).setQuantity(product.getQuantity());
                productList.get(i).setMade(product.getMade());
            }
        }
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepository.deleteProduct(id);
    }

}

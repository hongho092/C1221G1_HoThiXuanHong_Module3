package repository;

import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements IProductRepository{
//    private static List<Product> productList = new ArrayList<>();
    private static Map<Integer, Product> productList = new HashMap<>();
//    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_PRODUCT = "select * from product";
    static {
        productList.put(1, new Product(1, "Fan", "red", 453, "China"));
        productList.put(2, new Product(2, "Mouse", "orange", 563, "VietNam"));
        productList.put(3, new Product(3, "House", "blue", 286, "Japan"));
        productList.put(4, new Product(4, "Light", "green", 678, "Malay"));
        productList.put(5, new Product(5, "Motor", "black", 981, "Lao"));
        productList.put(6, new Product(6, "Car", "yellow", 435, "ThaiLan"));
    }

    public List<Product> getList() {
        return new ArrayList<>(productList.values());
//        List<Product> productList = new ArrayList<>();
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_PRODUCT);
//            ResultSet resultSet =preparedStatement.executeQuery();
//            Product product;
//            while (resultSet.next()) {
//                product = new Product();
//                product.setId(resultSet.getInt("id"));
//                product.setName(resultSet.getString("name"));
//                product.setDetail(resultSet.getString("detail"));
//                product.setQuantity(resultSet.getInt("quantity"));
//                product.setMade(resultSet.getString("made"));
//                productList.add(product);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        finally {
//            try {
//                preparedStatement.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//        return productList;
    }

    @Override
    public Product getById(int id) {
        return productList.get(id);
    }

    @Override
    public void addProduct(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void deleteProduct(int id) {
        productList.remove(id);
    }
}

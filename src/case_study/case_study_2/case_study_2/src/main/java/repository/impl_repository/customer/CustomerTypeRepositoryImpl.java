package repository.impl_repository.customer;

import repository.BaseRepository;
import repository.interface_repository.customer.CustomerTypeRepositiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class CustomerTypeRepositoryImpl implements CustomerTypeRepositiry {
    BaseRepository baseRepository = new BaseRepository();

    public Map<Integer, String> getCustomerType() {
        Map<Integer, String> listCustomerType = new HashMap<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        String query = "select * from loai_khach_hang;";
        try {
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int mlk = resultSet.getInt("ma_loai_khach");
                String tlk = resultSet.getString("ten_loai_khach");
                listCustomerType.put(mlk, tlk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listCustomerType;
    }
}

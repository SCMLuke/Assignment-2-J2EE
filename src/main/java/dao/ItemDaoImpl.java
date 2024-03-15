package dao;

import jdbc.JDBC;
import model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDaoImpl implements ItemDao {
    private static final String INSERT_TODOS_SQL = "INSERT INTO items" +
            "(item_number, item_name, item_description, item_rating, item_stock) VALUES " + "(?,?,?,?,?);";
    private static final String SELECT_TODO_BY_ID = "select item_number, item_name, item_description, item_rating, item_stock from items where item_number = ?";
    private static final String SELECT_ALL_TODOS = "select * from items";
    private static final String DELETE_TODO_BY_ID = "delete from items where item_number = ?;";
    private static final String UPDATE_TODO = "UPDATE items SET item_name = ?, item_description = ?, item_rating = ?, item_stock = ? WHERE item_number=?";

    public ItemDaoImpl(){}

    @Override
    public void insertItem(Item item) throws SQLException {
        System.out.println(INSERT_TODOS_SQL);
        try (Connection connection = JDBC.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TODOS_SQL)) {
            preparedStatement.setInt(1, item.getItemNumber());
            preparedStatement.setString(2, item.getItemName());
            preparedStatement.setString(3, item.getItemDescription());
            preparedStatement.setDouble(4, item.getItemRating());
            preparedStatement.setInt(5, item.getItemStock());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            JDBC.printSQLException(exception);
        }
    }

    @Override
    public Item selectItem(int itemNumber) {
        Item item = null;
        try (Connection connection = JDBC.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TODO_BY_ID);) {

            preparedStatement.setInt(1, itemNumber);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int number = rs.getInt("item_number");
                String name = rs.getString("item_name");
                String description = rs.getString("item_description");
                double rating = rs.getDouble("item_rating");
                int stock = rs.getInt("item_stock");
                item = new Item(number,name,description,rating,stock);
            }

        } catch (SQLException exception) {
            JDBC.printSQLException(exception);
        }
        return item;
    }

    @Override
    public List<Item> selectAllItems() {
        List<Item> item = new ArrayList<>();
        try (Connection connection = JDBC.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TODOS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int number = rs.getInt("item_number");
                String name = rs.getString("item_name");
                String description = rs.getString("item_description");
                double rating = rs.getDouble("item_rating");
                int stock = rs.getInt("item_stock");
                item.add(new Item(number,name,description,rating,stock));
            }
        } catch (SQLException exception) {
            JDBC.printSQLException(exception);
        }
        return item;
    }

    @Override
    public boolean deleteItem(int number) throws SQLException {
        boolean delete;
        try (Connection connection = JDBC.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TODO_BY_ID);) {
            preparedStatement.setInt(1, number);
            delete = preparedStatement.executeUpdate() > 0;
        }
        return delete;
    }

    @Override
    public boolean updateItem(Item item) throws SQLException {
        boolean update = false;
        try (Connection connection = JDBC.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TODO)) {
            preparedStatement.setString(1, item.getItemName());
            preparedStatement.setString(2, item.getItemDescription());
            preparedStatement.setDouble(3, item.getItemRating());
            preparedStatement.setInt(4, item.getItemStock());
            preparedStatement.setInt(5, item.getItemNumber());

            System.out.println("Executing SQL update query: " + preparedStatement);

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                update = true;
                System.out.println("Item updated successfully.");
            } else {
                System.out.println("Failed to update item. No rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating item: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
        return update;
    }
}

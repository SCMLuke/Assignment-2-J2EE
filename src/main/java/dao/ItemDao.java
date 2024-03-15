package dao;

import model.Item;

import java.sql.SQLException;
import java.util.List;

public interface ItemDao {
    void insertItem(Item item) throws SQLException;
    Item selectItem(int id);
    List<Item>selectAllItems();
    boolean deleteItem(int id) throws SQLException;
    boolean updateItem(Item item) throws SQLException;
}

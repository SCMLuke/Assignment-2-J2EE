package test;

import dao.ItemDao;
import dao.ItemDaoImpl;
import model.Item;

import java.sql.SQLException;

public class DatabaseTest {
    public static void main(String[] args) {
        int itemNumber = 1;
        String itemName = "Updated Item Name";
        String itemDescription = "Updated Item Description";
        double itemRating = 4.5;
        int itemStock = 20;

        ItemDao itemDao = new ItemDaoImpl();

        try {
            Item existingItem = itemDao.selectItem(itemNumber);

            if (existingItem != null) {
                existingItem.setItemName(itemName);
                existingItem.setItemDescription(itemDescription);
                existingItem.setItemRating(itemRating);
                existingItem.setItemStock(itemStock);

                boolean updateSuccessful = itemDao.updateItem(existingItem);

                if (updateSuccessful) {
                    System.out.println("Item updated successfully.");
                } else {
                    System.out.println("Failed to update item.");
                }
            } else {
                System.out.println("Item not found.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating item: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

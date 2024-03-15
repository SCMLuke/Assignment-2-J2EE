package model;

public class Item {

    private int itemNumber;
    private String itemName;
    private String itemDescription;
    private double itemRating;
    private int itemStock;

    public Item(int itemNumber, String itemName, String itemDescription, double itemRating, int itemStock) {
        this.itemNumber = itemNumber;
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.itemRating = itemRating;
        this.itemStock = itemStock;
    }



    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }

    public double getItemRating() {
        return itemRating;
    }

    public void setItemRating(double itemRating) {
        this.itemRating = itemRating;
    }

    public int getItemStock() {
        return itemStock;
    }

    public void setItemStock(int itemStock) {
        this.itemStock = itemStock;
    }
}

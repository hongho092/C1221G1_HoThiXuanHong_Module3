package model;

public class Product {
    private int id;
    private String name;
    private String detail;
    private int quantity;
    private String made;

    public Product(int id, String name, String detail, int quantity, String made) {
        this.id = id;
        this.name = name;
        this.detail = detail;
        this.quantity = quantity;
        this.made = made;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMade() {
        return made;
    }

    public void setMade(String made) {
        this.made = made;
    }
}

package vn.edu.nlu.fit.model;

public class Product {
    private String id_product, id_items, id_supplier, product_name, img;
    private double price,discout;
    private int total, active;

    public Product() {
    }

    public Product(String id_product, String id_items, String id_supplier, String product_name, double price, String img, int total, int active,double discout) {
        this.id_product = id_product;
        this.id_items = id_items;
        this.id_supplier = id_supplier;
        this.product_name = product_name;
        this.img = img;
        this.price = price;
        this.total = total;
        this.active = active;
        this.discout=discout;
    }

    public String getId_product() {
        return id_product;
    }

    public void setId_product(String id_product) {
        this.id_product = id_product;
    }

    public String getId_items() {
        return id_items;
    }

    public void setId_items(String id_items) {
        this.id_items = id_items;
    }

    public String getId_supplier() {
        return id_supplier;
    }

    public void setId_supplier(String id_supplier) {
        this.id_supplier = id_supplier;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public double getDiscout() {
        return discout;
    }

    public void setDiscout(double discout) {
        this.discout = discout;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}

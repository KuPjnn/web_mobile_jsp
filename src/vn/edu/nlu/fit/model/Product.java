package vn.edu.nlu.fit.model;

public class Product {
    String id_product, id_items, id_supplier, product_name, img;
    double price, total;

    public Product() {
    }

    public Product(String id_product, String id_items, String id_supplier, String product_name, double price, String img, double total) {
        this.id_product = id_product;
        this.id_items = id_items;
        this.id_supplier = id_supplier;
        this.product_name = product_name;
        this.img = img;
        this.price = price;
        this.total = total;
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

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Product :" +
                "id_product='" + id_product + '\'' +
                ", id_items='" + id_items + '\'' +
                ", id_supplier='" + id_supplier + '\'' +
                ", product_name='" + product_name + '\'' +
                ", img='" + img + '\'' +
                ", price=" + price +
                ", total=" + total;
    }
}

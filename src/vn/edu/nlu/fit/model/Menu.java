package vn.edu.nlu.fit.model;

public class Menu {
    private String id_items, supplier_name;

    public Menu() {
    }

    public Menu(String id_items, String supplier_name) {
        this.id_items = id_items;
        this.supplier_name = supplier_name;
    }

    public String getId_items() {
        return id_items;
    }

    public void setId_items(String id_items) {
        this.id_items = id_items;
    }

    public String getSupplier_name() {
        return supplier_name;
    }

    public void setSupplier_name(String supplier_name) {
        this.supplier_name = supplier_name;
    }

}

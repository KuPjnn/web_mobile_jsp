package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;

import java.sql.*;
import java.util.ArrayList;

public class MenuDAO {
    String id_items, supplier_name;

    public MenuDAO() {
    }

    public MenuDAO(String id_items, String supplier_name) {
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

    public ArrayList<MenuDAO> getSupplier() throws SQLException, ClassNotFoundException {

        String query = "SELECT DISTINCT items.ID_ITEMS,supplier.NAME_SUPPLIER FROM items,supplier,product \n" +
                "WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER;";

        PreparedStatement ps = DBConect.getPreparedStatement(query);
        ResultSet menu = ps.executeQuery();

        ArrayList<MenuDAO> listMenu = new ArrayList<>();

        while (menu.next()) {
            String id = menu.getString(1);
            String name = menu.getString(2);
            listMenu.add(new MenuDAO(id, name));
        }
        return listMenu;
    }
}

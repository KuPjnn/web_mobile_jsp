package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Menu;

import java.sql.*;
import java.util.ArrayList;

public class MenuDAO {

    public ArrayList<Menu> getSupplier() throws SQLException, ClassNotFoundException {

        String query = "SELECT DISTINCT items.ID_ITEMS,supplier.NAME_SUPPLIER FROM items,supplier,product \n" +
                "WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER AND items.ACTIVE=1 AND supplier.ACTIVE=1";

        PreparedStatement ps = DBConect.getPreparedStatement(query);
        ResultSet menu = ps.executeQuery();

        ArrayList<Menu> listMenu = new ArrayList<>();

        while (menu.next()) {
            String id = menu.getString(1);
            String name = menu.getString(2);
            listMenu.add(new Menu(id, name));
        }
        return listMenu;
    }
}

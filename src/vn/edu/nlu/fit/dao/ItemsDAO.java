package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Item;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemsDAO {

    public List<Item> listItems() throws SQLException, ClassNotFoundException {
        List<Item> list = new ArrayList<>();

        String query = "SELECT * FROM `items`";

        PreparedStatement st = DBConect.getPreparedStatement(query);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String id = rs.getString(1);
            String name = rs.getString(2);
            int active = rs.getInt(3);
            list.add(new Item(id, name, active));
        }
        return list;
    }

    public Item getItems(String id) throws SQLException, ClassNotFoundException {
        Item item = new Item();

        String query = "SELECT * FROM `items` WHERE items.ID_ITEMS = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(query);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        rs.last();
        int row = rs.getRow();
        if (row == 1) {
            item.setId(rs.getString(1));
            item.setName(rs.getString(2));
            item.setActive(rs.getInt(3));
        }
        return item;
    }

    public boolean hideItems(String id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String hide = "UPDATE `webmobile`.`items` SET `ACTIVE` = 0 WHERE `ID_ITEMS` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hide);
        ps.setString(1, id);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean activeItems(String id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String hide = "UPDATE `webmobile`.`items` SET `ACTIVE` = 1 WHERE `ID_ITEMS` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hide);
        ps.setString(1, id);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean delItems(String id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String del = "DELETE FROM `webmobile`.`items` WHERE `ID_ITEMS` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(del);
        ps.setString(1, id);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean addItems(String id, String name) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String add = "INSERT INTO `webmobile`.`items`(`ID_ITEMS`, `ITEMS_NAME`, `ACTIVE`) VALUES (?, ?, 1)";
        PreparedStatement ps = DBConect.getPreparedStatement(add);
        ps.setString(1, id.toUpperCase());
        ps.setString(2, name);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean editItems(String id_items, String name_items) throws SQLException, ClassNotFoundException {
        boolean result = false;

        String edit = "UPDATE `webmobile`.`items` SET `ITEMS_NAME` = ? WHERE `ID_ITEMS` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(edit);
        ps.setString(1, name_items);
        ps.setString(2, id_items);
        if (ps.executeUpdate() == 1)
            result = true;
        return result;
    }
}

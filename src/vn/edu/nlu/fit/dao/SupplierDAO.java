package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Supplier;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO {
    public List<Supplier> listSupplier() throws SQLException, ClassNotFoundException {
        List<Supplier> list = new ArrayList<>();

        String query = "SELECT * FROM `supplier`";

        PreparedStatement st = DBConect.getPreparedStatement(query);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String id = rs.getString(1);
            String name = rs.getString(2);
            int active = rs.getInt(3);
            list.add(new Supplier(id, name, active));
        }
        return list;
    }

    public Supplier getSupplier(String id) throws SQLException, ClassNotFoundException {
        Supplier supplier = new Supplier();
        String query = "SELECT * FROM `supplier` WHERE SUPPLIER.ID_SUPPLIER = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(query);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        rs.last();
        int row = rs.getRow();
        if (row == 1) {
            supplier.setId(rs.getString(1));
            supplier.setName(rs.getString(2));
            supplier.setActive(rs.getInt(3));
        }
        return supplier;
    }


    public boolean hideSupplier(String id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String hide = "UPDATE `webmobile`.`supplier` SET `ACTIVE` = 0 WHERE `ID_SUPPLIER` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hide);
        ps.setString(1, id);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean activeSupplier(String id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String hide = "UPDATE `webmobile`.`supplier` SET `ACTIVE` = 1 WHERE `ID_SUPPLIER` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hide);
        ps.setString(1, id);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean delSupplier(String id_supplier) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String del_supplier = "DELETE FROM `webmobile`.`supplier` WHERE `ID_SUPPLIER` = ?";
        String select_product = "SELECT ID_PRODUCT FROM product WHERE ID_SUPPLIER = ?";
        String del_product = "DELETE FROM `webmobile`.`product` WHERE `ID_PRODUCT` IN(" + select_product + ")";
        String del_configure = "DELETE FROM `webmobile`.`configuration` WHERE `ID_PRODUCT` IN(" + select_product + ")";
        PreparedStatement ps = DBConect.getPreparedStatement(select_product);
        ps.setString(1, id_supplier);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            /*Xóa cấu hình sản phẩm thuộc thuộc thương hiệu cần xóa*/
            ps = DBConect.getPreparedStatement(del_configure);
            ps.setString(1, id_supplier);
            ps.executeUpdate();
            /*Xóa Các sản phẩm thuộc thương hiệu cần xóa*/
            ps = DBConect.getPreparedStatement(del_product);
            ps.setString(1, id_supplier);
            ps.executeUpdate();
        }
        /*Xóa thương hiệu*/
        ps = DBConect.getPreparedStatement(del_supplier);
        ps.setString(1, id_supplier);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }


    public boolean addSupplier(String id, String name) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String add = "INSERT INTO `webmobile`.`supplier`(`ID_SUPPLIER`, `NAME_SUPPLIER`, `ACTIVE`) VALUES (?, ?, 1)";
        PreparedStatement ps = DBConect.getPreparedStatement(add);
        ps.setString(1, id.toUpperCase());
        ps.setString(2, name);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }
}
package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {
    public Product getProduct(String ID_PRODUCT) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM `product` WHERE ID_PRODUCT=?";
        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        preparedStatement.setString(1, ID_PRODUCT);
        ResultSet rs = preparedStatement.executeQuery();

        rs.last();
        int row = rs.getRow();

        Product pro = new Product();
        if (rs != null && row == 1) {
            rs.first();
            pro.setId_product(rs.getString(1));
            pro.setId_items(rs.getString(2));
            pro.setId_supplier(rs.getString(3));
            pro.setProduct_name(rs.getString(4));
            pro.setPrice(rs.getDouble(5));
            pro.setImg(rs.getString(6));
            pro.setTotal(rs.getInt(7));
        }
        return pro;
    }

    public ArrayList<Product> listProduct() throws SQLException, ClassNotFoundException {

        ArrayList<Product> list = new ArrayList<>();

        String product = "SELECT * FROM product ";

        PreparedStatement ps = DBConect.getPreparedStatement(product);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String id_product = rs.getString(1);
            String id_item = rs.getString(2);
            String id_supplier = rs.getString(3);
            String product_name = rs.getString(4);
            double price = rs.getDouble(5);
            String img = rs.getString(6);
            int total = rs.getInt(7);
            int active = rs.getInt(8);
            list.add(new Product(id_product, id_item, id_supplier, product_name, price, img, total, active));
        }
        return list;
    }

    public boolean hideProduct(String id_product) throws SQLException, ClassNotFoundException {
        boolean hide = false;
        String hi = "UPDATE `webmobile`.`product` SET `ACTIVE` = 0 WHERE `ID_PRODUCT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hi);
        ps.setString(1, id_product);
        int i = ps.executeUpdate();
        if (i == 1)
            hide = true;
        return hide;
    }

    public boolean activeProduct(String id_product) throws SQLException, ClassNotFoundException {
        boolean active = false;
        String hi = "UPDATE `webmobile`.`product` SET `ACTIVE` = 1 WHERE `ID_PRODUCT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hi);
        ps.setString(1, id_product);
        int i = ps.executeUpdate();
        if (i == 1)
            active = true;
        return active;
    }
}

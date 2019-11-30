package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Product;
import vn.edu.nlu.fit.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAOImpl implements ProductDAO {
    @Override
    public Product getProduct(String ID_PRODUCT) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM `product` WHERE ID_PRODUCT=?;";
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
}

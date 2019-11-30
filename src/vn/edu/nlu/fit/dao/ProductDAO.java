package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Product;

import java.sql.SQLException;

public interface ProductDAO {
    public Product getProduct(String ID_PRODUCT) throws SQLException, ClassNotFoundException;

}

package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Product;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductDAO {
    public Product getProduct(String id_product) throws SQLException, ClassNotFoundException;

    public ArrayList<Product> listProduct() throws SQLException, ClassNotFoundException;

    public boolean hideProduct(String id_product) throws SQLException, ClassNotFoundException;

    public boolean activeProduct(String id_product) throws SQLException, ClassNotFoundException;
}

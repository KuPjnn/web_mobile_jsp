package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Bill;

import java.sql.SQLException;
import java.util.List;

public interface IBillDAO {

    public List<Bill> listBill() throws SQLException, ClassNotFoundException;

    public Bill getBill(String id_bill) throws SQLException, ClassNotFoundException;
}

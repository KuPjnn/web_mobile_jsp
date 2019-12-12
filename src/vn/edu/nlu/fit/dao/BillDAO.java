package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Bill;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BillDAO {
    public List<Bill> listBill() throws SQLException, ClassNotFoundException {
        List<Bill> list = new ArrayList<>();
        String bill = "SELECT * FROM `webmobile`.`bill`";
        PreparedStatement ps = DBConect.getPreparedStatement(bill);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt(1);
            String user_name = rs.getString(2);
            Date date = rs.getDate(3);
            String phone = rs.getString(4);
            String address = rs.getString(5);
            double total = rs.getDouble(6);
            String status = rs.getString(7);
            list.add(new Bill(id, user_name, date, phone, address, total, status));
        }
        return list;
    }

    public Bill getBill(String id_bill) throws SQLException, ClassNotFoundException {

        Bill bill = new Bill();

        String getBill = "SELECT * FROM `webmobile`.`bill` WHERE ID_BILL=?";
        PreparedStatement ps = DBConect.getPreparedStatement(getBill);
        ps.setString(1, id_bill);
        ResultSet rs = ps.executeQuery();
        rs.last();
        if (rs.getRow() == 1) {
            rs.first();
            bill.setId(rs.getInt(1));
            bill.setUserName(rs.getString(2));
            bill.setDate(rs.getDate(3));
            bill.setPhone(rs.getString(4));
            bill.setAddress(rs.getString(5));
            bill.setTotal(rs.getDouble(6));
            bill.setStatus(rs.getString(7));
        }
        return bill;
    }
}

package vn.edu.nlu.fit.dao;

import org.apache.jasper.tagplugins.jstl.core.If;
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

    public ResultSet getBill(String id_bill) throws SQLException, ClassNotFoundException {

        String sql = "SELECT bill.ID_BILL,`user`.USER_NAME,`user`.FULLNAME,bill.PHONE,bill.ADDRESS,bill.DATE,product.PRODUCT_NAME,product.PRICE,bill.`STATUS`,bill.TOTAL\n" +
                " FROM bill,detail_order,product,`user` WHERE bill.ID_BILL=detail_order.ID_BILL AND detail_order.ID_PRODUCT=product.ID_PRODUCT\n" +
                " AND bill.USER_NAME = `user`.USER_NAME AND bill.ID_BILL = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(sql);
        ps.setString(1, id_bill);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public boolean activeBill(int id_bill) throws SQLException, ClassNotFoundException {
        boolean active = false;
        String sql = "UPDATE `webmobile`.`bill` SET `STATUS` = ? WHERE `ID_BILL` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(sql);
        ps.setString(1, "Đã thanh toán");
        ps.setInt(2, id_bill);
        int row = ps.executeUpdate();
        if (row == 1)
            active = true;
        return active;
    }
}

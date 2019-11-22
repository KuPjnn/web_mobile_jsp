package vn.edu.nlu.fit.db;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

public class DBConect {
    private static Connection con;

    private static String URL = "jdbc:mysql://localhost:3306/webmobile?useUnicode=true&characterEncoding=utf-8";
    private static String USER = "root";
    private static String PASS = "";


    public static Statement connectMySQL() throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            return con.createStatement();
        } else {
            return con.createStatement();
        }
    }

    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        }
        return con.prepareStatement(sql);
    }

    //kiểm tra kết nối và câu query của database
    /*public static void main(String[] args) throws Exception {
        Statement s = DBConect.connectMySQL();
        System.out.println("Kết nối database thành công.");
        String query = "SELECT DISTINCT items.ID_ITEMS,supplier.NAME_SUPPLIER FROM items,supplier,product \n" +
                "WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER;";
        ResultSet rs = s.executeQuery(query);
        rs.last();
        System.out.println("Số hàng : " + rs.getRow());
        rs.beforeFirst();
        while (rs.next()) {
            System.out.print(rs.getString(1) + "\t");
            System.out.print(rs.getString(2) + "\n");
        }
    }*/
}

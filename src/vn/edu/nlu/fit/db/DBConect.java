package vn.edu.nlu.fit.db;

import java.sql.*;

public class DBConect {
	private static Connection con;

	private static String URL = "jdbc:mysql://localhost:3306/webmobile?useUnicode=true&characterEncoding=utf-8";
	private static String USER = "root";
	private static String PASS = "";

/*    public static Statement connectMySQL() throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            return con.createStatement();
        } else {
            return con.createStatement();
        }
    }*/

	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, USER, PASS);
		}
		return con.prepareStatement(sql);
	}

}

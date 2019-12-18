package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public boolean addUser(User obj) throws SQLException, ClassNotFoundException {
        User user = obj;
        boolean add = false;
        String query = "INSERT INTO `user` (USER_NAME, PASSWORD, FULLNAME, EMAIL, PHONE, PRIVILEGES) VALUES " +
                " (?,?,?,?,?,?); ";
        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        preparedStatement.setString(1, user.getUser_name());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setString(3, user.getFull_name());
        preparedStatement.setString(4, user.getEmail());
        preparedStatement.setString(5, user.getPhone());
        preparedStatement.setString(6, user.getPrivileges());
        int row = preparedStatement.executeUpdate();
        if (row == 1)
            add = true;
        return add;
    }

    public boolean checkLogin(String user, String pass) throws SQLException, ClassNotFoundException {
        boolean check = false;

        String query = "SELECT * FROM `user` WHERE USER_NAME= ? AND `PASSWORD`= ?;";

        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        preparedStatement.setString(1, user);
        preparedStatement.setString(2, pass);
        ResultSet resultSet = preparedStatement.executeQuery();

        resultSet.last();
        int row = resultSet.getRow();
        if (resultSet != null && row == 1)
            check = true;
        return check;
    }

    public User getUser(String userName) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM `user` WHERE USER_NAME = ?;";
        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        preparedStatement.setString(1, userName);
        ResultSet rs = preparedStatement.executeQuery();

        rs.last();
        int row = rs.getRow();

        User u = new User();
        if (rs != null && row == 1) {
            rs.first();
            u.setUser_name(rs.getString(1));
            u.setPassword(rs.getString(2));
            u.setFull_name(rs.getString(3));
            u.setEmail(rs.getString(4));
            u.setPhone(rs.getString(5));
            u.setPrivileges(rs.getString(6));
            return u;
        }
        return u;
    }

    public List<User> listUser() throws SQLException, ClassNotFoundException {

        List<User> list = new ArrayList<>();

        String query = "select * from `user`";
        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            String userName = rs.getString("USER_NAME");
            String password = rs.getString("PASSWORD");
            String fullName = rs.getString("FULLNAME");
            String email = rs.getString("EMAIL");
            String phone = rs.getString("PHONE");
            String privileges = rs.getString("PRIVILEGES");
            list.add(new User(userName, password, fullName, email, phone, privileges));
        }
        return list;
    }

    public boolean editUser(String username, String pass, String fullname, String email, String phone, String privileges) throws SQLException, ClassNotFoundException {
        boolean edit = false;

        String sql = "UPDATE `webmobile`.`user` SET `USER_NAME` = ?, `PASSWORD` = ?, `FULLNAME` = ?, `EMAIL` = ?, `PHONE` = ?, `PRIVILEGES` = ? WHERE `USER_NAME` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(sql);
        ps.setString(1, username);
        ps.setString(2, pass);
        ps.setString(3, fullname);
        ps.setString(4, email);
        ps.setString(5, phone);
        ps.setString(6, privileges);
        ps.setString(7, username);
        int row = ps.executeUpdate();
        if (row == 1)
            edit = true;
        return edit;
    }

    public boolean delUser(String username) throws SQLException, ClassNotFoundException {
        boolean del = false;
        /*Xóa user*/
        String del_user = "DELETE FROM `webmobile`.`user` WHERE `USER_NAME` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(del_user);
        ps.setString(1, username);
        int row = ps.executeUpdate();
        if (row == 1)
            del = true;
        return del;
    }
}

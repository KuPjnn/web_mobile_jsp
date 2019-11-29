package vn.edu.nlu.fit.dao;


import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {
    @Override
    public boolean addUser(User obj) {
        User user = obj;

        try {
            String query = "INSERT INTO `user` (USER_NAME, PASSWORD, FULLNAME, EMAIL, PHONE, PRIVILEGES) VALUES " +
                    " (?,?,?,?,?,?); ";
            PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
            preparedStatement.setString(1, user.getUser_name());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFull_name());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.setString(6, user.getPrivileges());
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkLogin(String user, String pass) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM `user` WHERE USER_NAME= ? AND `PASSWORD`= ?;";

        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        preparedStatement.setString(1, user);
        preparedStatement.setString(2, pass);
        ResultSet resultSet = preparedStatement.executeQuery();

        resultSet.last();
        int row = resultSet.getRow();
        if (resultSet != null && row == 1) {
            return true;
        }
        return false;
    }

    @Override
    public User getUser(String userName) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM `user` WHERE USER_NAME=?;";
        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        preparedStatement.setString(1, userName);
        ResultSet rs = preparedStatement.executeQuery();

        rs.last();
        int row = rs.getRow();

        User u = new User();
        if (rs != null && row == 1) {
            rs.first();
            u.setUser_name(rs.getString(1));
            u.setPassword("");
            u.setFull_name(rs.getString(3));
            u.setEmail(rs.getString(4));
            u.setPhone(rs.getString(5));
            u.setPrivileges(rs.getString(6));
            return u;
        }
        return u;
    }

    @Override
    public List<User> list() throws SQLException, ClassNotFoundException {

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
}

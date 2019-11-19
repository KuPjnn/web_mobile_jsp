package vn.edu.nlu.fit.dao;


import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAOImpl implements UserDAO {
    @Override
    public boolean addUser(Object obj) {
        User user = (User) obj;

        try {
            Statement statement = DBConect.connectMySQL();

            String query = "INSERT INTO `user` VALUES ('" + user.getId_user() + "','" + user.getUser_name() + "','" + user.getPassword()
                    + "','" + user.getFull_name() + "','" + user.getEmail() + "','" + user.getPhone() + "','" + user.getPrivileges() + "');";

            System.out.println(query);
            statement.executeUpdate(query);
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

//    get thông tin khách hàng

    @Override
    public boolean checkLogin(String user, String pass) throws SQLException, ClassNotFoundException {

        Statement statement = DBConect.connectMySQL();

        String query = "SELECT * FROM `user` WHERE USER_NAME='" + user + "' AND `PASSWORD`='" + pass + "';";

        ResultSet resultSet = statement.executeQuery(query);

        resultSet.last();

        int row = resultSet.getRow();
        if (resultSet != null && row == 1) {
            resultSet.first();
            User u = new User();
            u.setId_user(resultSet.getString(1));
            u.setUser_name(resultSet.getString(2));
            u.setPassword("");
            u.setFull_name(resultSet.getString(4));
            u.setEmail(resultSet.getString(5));
            u.setPhone(resultSet.getString(6));
            u.setPrivileges(resultSet.getString(7));

            return true;
        }
        return false;
    }

    /*public static void main(String[] args) {
        User user = new User();
        user.setId_user("17130006");
        user.setUser_name("hoanghuy");
        user.setPassword("123456");
        user.setFull_name("Hoang Huy");
        user.setEmail("hoanghuy@gmail.com");
        user.setPhone("0123456789");
        user.setPrivileges("KH");

        System.out.println(user.toString());

        System.out.println(new UserDAO().addUser(user));
    }*/
}

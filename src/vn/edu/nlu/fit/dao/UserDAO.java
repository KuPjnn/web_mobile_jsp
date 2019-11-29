package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO {
    public boolean addUser(User user);

    public boolean checkLogin(String user, String pass) throws SQLException, ClassNotFoundException;

    public User getUser(String userName) throws SQLException, ClassNotFoundException;

    public List<User> list() throws SQLException, ClassNotFoundException;
}

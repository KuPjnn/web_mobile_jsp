package vn.edu.nlu.fit.dao;

import java.sql.SQLException;

public interface UserDAO {
    public boolean addUser(Object obj);

    public boolean checkLogin(String user, String pass) throws SQLException, ClassNotFoundException;
}

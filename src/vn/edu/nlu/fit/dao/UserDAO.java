package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.UserModel;
import vn.edu.nlu.fit.util.Encyption;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	public boolean insertUser(UserModel userModel) throws SQLException, ClassNotFoundException {
		String query = "INSERT INTO `webmobile`.`user` (USER_NAME, PASSWORD, FULLNAME, EMAIL, PHONE, PRIVILEGES, PUBLIC_KEY) VALUES (?,?,?,?,?,?,?);";
		PreparedStatement ps = DBConect.getPreparedStatement(query);
		ps.setString(1, userModel.getUser_name());
		ps.setString(2, Encyption.MyEncypt(userModel.getPassword()));
		ps.setString(3, userModel.getFull_name());
		ps.setString(4, userModel.getEmail());
		ps.setString(5, userModel.getPhone());
		ps.setString(6, userModel.getPrivileges());
		ps.setString(7, userModel.getKey());
		int row = ps.executeUpdate();

		return row == 1;
	}

	public boolean checkLogin(String user, String pass) throws SQLException, ClassNotFoundException {

		String query = "SELECT * FROM `user` WHERE USER_NAME= ? AND `PASSWORD`= ?;";

		PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
		preparedStatement.setString(1, user);
		preparedStatement.setString(2, Encyption.MyEncypt(pass));
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.last();
		int row = resultSet.getRow();

		return row == 1;
	}

	public boolean checkMail(String user, String mail) throws SQLException, ClassNotFoundException {

		String query = "SELECT * FROM `user` WHERE USER_NAME= ? AND `EMAIL`= ?;";

		PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
		preparedStatement.setString(1, user);
		preparedStatement.setString(2, mail);
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.last();
		int row = resultSet.getRow();

		return row == 1;
	}

	public UserModel getUser(String userName) throws SQLException, ClassNotFoundException {

		String query = "SELECT * FROM `user` WHERE USER_NAME = ?;";
		PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
		preparedStatement.setString(1, userName);
		ResultSet rs = preparedStatement.executeQuery();

		rs.last();
		int row = rs.getRow();

		UserModel userModel = new UserModel();
		if (row == 1) {
			rs.first();
			userModel.setUser_name(rs.getString(1));
			userModel.setPassword(rs.getString(2));
			userModel.setFull_name(rs.getString(3));
			userModel.setEmail(rs.getString(4));
			userModel.setPhone(rs.getString(5));
			userModel.setPrivileges(rs.getString(6));
			userModel.setCode(rs.getString(7));
			userModel.setKey(rs.getString(8));
			userModel.setKey_code(rs.getString(9));
			return userModel;
		}
		return userModel;
	}

	public List<UserModel> listUser() throws SQLException, ClassNotFoundException {

		List<UserModel> list = new ArrayList<>();

		String query = "select * from `user`";
		PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			String userName = rs.getString("USER_NAME");
			String password = "";
			String fullName = rs.getString("FULLNAME");
			String email = rs.getString("EMAIL");
			String phone = rs.getString("PHONE");
			String privileges = rs.getString("PRIVILEGES");
			String key = rs.getString("PUBLIC_KEY");
			list.add(new UserModel(userName, password, fullName, email, phone, privileges, key));
		}
		return list;
	}

	public boolean deleteUser(String username) throws SQLException, ClassNotFoundException {
		String del_user = "DELETE FROM `webmobile`.`user` WHERE `USER_NAME` = ?";

		PreparedStatement ps = DBConect.getPreparedStatement(del_user);
		ps.setString(1, username);
		int row = ps.executeUpdate();

		return row == 1;
	}

	public boolean editUser(String username, String pass, String fullname, String email, String phone, String privileges) throws SQLException, ClassNotFoundException {
		String sql = "UPDATE `webmobile`.`user` SET `USER_NAME` = ?, `FULLNAME` = ?, `EMAIL` = ?, `PHONE` = ?, `PRIVILEGES` = ? WHERE `USER_NAME` = ?";
		if (!pass.equals("")) {
			sql = "UPDATE `webmobile`.`user` SET `USER_NAME` = ?, `PASSWORD` = ?, `FULLNAME` = ?, `EMAIL` = ?, `PHONE` = ?, `PRIVILEGES` = ? WHERE `USER_NAME` = ?";
		}
		PreparedStatement ps = DBConect.getPreparedStatement(sql);
		if (!pass.equals("")) {
			ps.setString(1, username);
			ps.setString(2, Encyption.MyEncypt(pass));
			ps.setString(3, fullname);
			ps.setString(4, email);
			ps.setString(5, phone);
			ps.setString(6, privileges);
			ps.setString(7, username);
		} else {
			ps.setString(1, username);
			ps.setString(2, fullname);
			ps.setString(3, email);
			ps.setString(4, phone);
			ps.setString(5, privileges);
			ps.setString(6, username);
		}

		int row = ps.executeUpdate();
		return row == 1;
	}

	public boolean updateUser(String username, String fullname, String email, String phone) throws SQLException, ClassNotFoundException {
		boolean edit = false;

		String sql = "UPDATE `webmobile`.`user` SET `FULLNAME` = ?, `EMAIL` = ?, `PHONE` = ? WHERE `USER_NAME` = ?";

		PreparedStatement ps = DBConect.getPreparedStatement(sql);

		ps.setString(1, fullname);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.setString(4, username);

		int row = ps.executeUpdate();
		if (row == 1)
			edit = true;
		return edit;
	}

	public boolean changePass(String username, String pass) throws SQLException, ClassNotFoundException {
		String sql = "UPDATE `webmobile`.`user` SET `PASSWORD` = ? WHERE `USER_NAME` = ?";

		PreparedStatement ps = DBConect.getPreparedStatement(sql);
		ps.setString(1, Encyption.MyEncypt(pass));
		ps.setString(2, username);
		int row = ps.executeUpdate();

		return row == 1;
	}

	public String getPublicKey(String userName) {
		try {
			String query = "SELECT `user`.PUBLIC_KEY FROM `user` WHERE USER_NAME = ?;";
			PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
			preparedStatement.setString(1, userName);
			ResultSet rs = preparedStatement.executeQuery();
			rs.last();
			return rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

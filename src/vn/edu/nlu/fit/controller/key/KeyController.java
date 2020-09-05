package vn.edu.nlu.fit.controller.key;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.UserModel;
import vn.edu.nlu.fit.util.Encyption;
import vn.edu.nlu.fit.util.SendCodeForgotMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/changePublicKey")
public class KeyController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");

		try {
			UserModel userModel = (UserModel) request.getSession().getAttribute("user");
			String code = SendCodeForgotMail.randomAlphaNumeric();
			System.out.println(code);
			SendCodeForgotMail.send(userModel.getEmail(), code);
			String sql = "update user set KEY_CODE=? where USER_NAME=?;";
			PreparedStatement preparedStatement = DBConect.getPreparedStatement(sql);
			preparedStatement.setString(1, Encyption.MyEncypt(code));
			preparedStatement.setString(2, userModel.getUser_name());
			preparedStatement.executeUpdate();
			response.getWriter().write("Đã gửi mã xác nhận!");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("KeyController exception");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");

		String key_code = request.getParameter("key_code");
		String public_key = request.getParameter("public_key");

		UserModel userModel = (UserModel) request.getSession().getAttribute("user");
		try {
			userModel = new UserDAO().getUser(userModel.getUser_name());
			if (!key_code.equals("") && !public_key.equals("")) {
				if (userModel.getKey_code().equals(Encyption.MyEncypt(key_code))) {
					String sql = "update user set KEY_CODE = ?, PUBLIC_KEY = ? where USER_NAME=?;";
					PreparedStatement preparedStatement = DBConect.getPreparedStatement(sql);
					preparedStatement.setString(1, null);
					preparedStatement.setString(2, public_key);
					preparedStatement.setString(3, userModel.getUser_name());
					preparedStatement.executeUpdate();
					response.getWriter().write("true");
				} else {
					response.getWriter().write("Mã xác nhận không đúng.");
				}
			} else {
				response.getWriter().write("Key_code && public_key isEmpty");
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			response.getWriter().write("KeyController exception!");
		}
	}
}

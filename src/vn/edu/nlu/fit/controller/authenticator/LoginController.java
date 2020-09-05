package vn.edu.nlu.fit.controller.authenticator;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginController extends javax.servlet.http.HttpServlet {
	protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");

		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		try {
			UserModel userModel = new UserDAO().getUser(user);
			boolean validate = new UserDAO().checkLogin(user, pass);
			if (userModel != null && validate && userModel.getPrivileges().equals("kh")) {
				session.setAttribute("user", userModel);
				response.getWriter().write("true");
			} else if (userModel != null && validate && userModel.getPrivileges().equals("ad")) {
				session.setAttribute("user", userModel);
				response.getWriter().write("true_ad");
			} else {
				response.getWriter().write("false");
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}

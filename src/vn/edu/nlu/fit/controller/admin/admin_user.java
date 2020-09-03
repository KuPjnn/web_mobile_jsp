package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.UserModel;
import vn.edu.nlu.fit.util.CheckMail;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/user")
public class admin_user extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");

		String userName = request.getParameter("user_register");
		String password = request.getParameter("pass_register");
		String fullName = request.getParameter("name_register");
		String email = request.getParameter("mail_register");
		String phone = request.getParameter("phone_register");
		String publicKey = request.getParameter("public_key");

		UserModel user = new UserModel(userName, password, fullName, email, phone, "kh", publicKey);
		try {
			UserModel getUser = new UserDAO().getUser(userName);
			if (CheckMail.isMailAddressValid(email)) {
				if (getUser.getUser_name() == null && new UserDAO().insertUser(user)) {
					response.getWriter().write("true");
				} else {
					response.getWriter().write("Tên đăng nhập tồn tại");
				}
			} else {
				response.getWriter().write("Email không tồn tại");
			}
		} catch (
				SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			if (request.getParameter("action") == null) {
				List<UserModel> list_user = new UserDAO().listUser();
				request.setAttribute("list_user", list_user);
				request.getRequestDispatcher("admin_user.jsp").forward(request, response);
			} else if (request.getParameter("action").equals("edit")) {
				String user_name = request.getParameter("user_name");
				String pass = request.getParameter("pass");
				String full_name = request.getParameter("full_name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String privileges = request.getParameter("privileges");

				boolean edit = new UserDAO().editUser(user_name, pass, full_name, email, phone, privileges);
				if (edit)
					response.sendRedirect(Util.fullPath("admin/user"));
			} else if (request.getParameter("action").equals("del")) {
				String user_name = request.getParameter("id");
				boolean del = new UserDAO().deleteUser(user_name);
				if (del)
					response.sendRedirect(Util.fullPath("admin/user"));
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}

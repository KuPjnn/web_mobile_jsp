package vn.edu.nlu.fit.controller.user;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.UserModel;
import vn.edu.nlu.fit.util.CheckMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/change_info")
public class ChangeInfoController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String user_name = request.getParameter("user_name");
		String full_name = request.getParameter("full_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		try {
			if (CheckMail.isMailAddressValid(email)) {
				boolean change = new UserDAO().updateUser(user_name, full_name, email, phone);
				if (change) {
					response.getWriter().write("Cập nhật thành công!");
					UserModel user = new UserDAO().getUser(user_name);
					session.setAttribute("user", user);
				} else {
					response.getWriter().write("Lỗi cập nhật!");
				}
			} else {
				response.getWriter().write("Email không tồn tại");
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}

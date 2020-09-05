package vn.edu.nlu.fit.controller.pay;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Cart;
import vn.edu.nlu.fit.model.ListCart;
import vn.edu.nlu.fit.model.UserModel;
import vn.edu.nlu.fit.signatures.Signatures;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.PublicKey;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/pay")
public class pay extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String optionPay = request.getParameter("pay");
		String signatures = request.getParameter("signatures");
		String data_sign = request.getParameter("data_sign");

		HttpSession session = request.getSession();

		if (optionPay.equals("prepayment")) {
			request.setAttribute("info", address + "~" + phone);
			request.setAttribute("signatures", signatures);
			request.setAttribute("data_sign", data_sign);
			request.getRequestDispatcher("pay_online.jsp").forward(request, response);
		}

		if (optionPay.equals("pay_later")) {

			UserModel user = (UserModel) session.getAttribute("user");
			ListCart listCart = (ListCart) session.getAttribute("list_cart");

			StringBuilder data = new StringBuilder();
			for (Cart item : listCart.list_cart) {
				data.append(item.getPro().getId_product()).append(item.getTotal());
			}
			data.append(address).append("~").append(phone).append(user.getUser_name());

			PublicKey publicKey = Signatures.getPublicKey(new UserDAO().getPublicKey(user.getUser_name()));
			if (Signatures.verify(data_sign, signatures, publicKey) && data_sign.equalsIgnoreCase(data.toString())) {
				String update = "INSERT INTO `webmobile`.`bill`(`USER_NAME`, `DATE`, `PHONE`, `ADDRESS`,`TOTAL`, `STATUS`) VALUES (?, NOW(), ?, ?, ?, ?)";
				try {
					PreparedStatement preparedStatement = DBConect.getPreparedStatement(update);
					preparedStatement.setString(1, user.getUser_name());
					preparedStatement.setString(2, phone);
					preparedStatement.setString(3, address);
					preparedStatement.setDouble(4, listCart.totalPrice());
					preparedStatement.setString(5, "Chưa thanh toán");
					preparedStatement.executeUpdate();

					response.sendRedirect(Util.fullPath("detail_order"));
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("message", "Xác thực chữ ký không thành công!");
				request.getRequestDispatcher("show_cart").forward(request, response);
			}
		}
	}
}

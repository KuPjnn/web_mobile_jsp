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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/pay_online")
public class pay_online extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		ListCart listCart = (ListCart) session.getAttribute("list_cart");
		UserModel user = (UserModel) session.getAttribute("user");

		/*Xử lý parameter */
		String name_atm = request.getParameter("name_atm");
		int number_atm = Integer.parseInt(request.getParameter("number_atm"));
		String[] info = request.getParameter("info").split("~");

		String signatures = request.getParameter("signatures");
		String data_sign = request.getParameter("data_sign");

		/*Get data từ session và request parameter*/
		StringBuilder data = new StringBuilder();
		for (Cart item : listCart.list_cart) {
			data.append(item.getPro().getId_product()).append(item.getTotal());
		}
		data.append(info[0]).append("~").append(info[1]).append(user.getUser_name());

		PublicKey publicKey = Signatures.getPublicKey(new UserDAO().getPublicKey(user.getUser_name()));
		if (Signatures.verify(data_sign, signatures, publicKey) && data_sign.equalsIgnoreCase(data.toString())) {
			String query = "SELECT * FROM `webmobile`.`atm` WHERE `ACCUONT_NUMBER` = ? AND `ACCUONT_NAME`= ? ";
			try {
				PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
				preparedStatement.setInt(1, number_atm);
				preparedStatement.setString(2, name_atm);
				ResultSet rs = preparedStatement.executeQuery();
				rs.last();
				int index = rs.getRow();
				if (index == 1) {
					rs.first();
					if (rs.getDouble(3) >= listCart.totalPrice()) {

						String insert = "INSERT INTO `webmobile`.`bill`(`USER_NAME`, `DATE`, `PHONE`, `ADDRESS`,`TOTAL`, `STATUS`) VALUES (?, NOW(), ?, ?, ?, ?)";
						preparedStatement = DBConect.getPreparedStatement(insert);
						preparedStatement.setString(1, user.getUser_name());
						preparedStatement.setString(2, info[1]);
						preparedStatement.setString(3, info[0]);
						preparedStatement.setDouble(4, listCart.totalPrice());
						preparedStatement.setString(5, "Đã thanh toán");
						preparedStatement.executeUpdate();

						String update_atm = "UPDATE `webmobile`.`atm` SET `BALANCE` = ? WHERE `ACCUONT_NUMBER` = ?";
						preparedStatement = DBConect.getPreparedStatement(update_atm);
						preparedStatement.setDouble(1, rs.getDouble(3));
						preparedStatement.setInt(2, number_atm);
						preparedStatement.executeUpdate();

						response.sendRedirect(Util.fullPath("detail_order"));
					} else {
						request.setAttribute("info", info[0] + "~" + info[1]);
						request.setAttribute("signatures", signatures);
						request.setAttribute("data_sign", data_sign);
						request.setAttribute("atm_error", "Tài khoản của bạn không đủ tiền.");
						request.getRequestDispatcher("pay_online.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("info", info[0] + "~" + info[1]);
					request.setAttribute("signatures", signatures);
					request.setAttribute("data_sign", data_sign);
					request.setAttribute("atm_error", "Sai thông tin tài khoản.");
					request.getRequestDispatcher("pay_online.jsp").forward(request, response);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("info", info[0] + "~" + info[1]);
			request.setAttribute("signatures", signatures);
			request.setAttribute("data_sign", data_sign);
			request.setAttribute("atm_error", "Xác thực chữ ký không thành công!");
			request.getRequestDispatcher("pay_online.jsp").forward(request, response);
		}
	}
}

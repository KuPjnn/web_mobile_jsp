package vn.edu.nlu.fit.controller.pay;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.ListCart;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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

        HttpSession session = request.getSession();

        if (optionPay.equals("prepayment")) {
            String info = address + "~" + phone;
            request.setAttribute("info", info);
            request.getRequestDispatcher("pay_online.jsp").forward(request, response);
        }

        if (optionPay.equals("pay_later")) {

            User user = (User) session.getAttribute("user");
            ListCart listCart = (ListCart) session.getAttribute("list_cart");

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
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/pay_online")
public class pay_online extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        ListCart listCart = (ListCart) session.getAttribute("list_cart");


        String name_atm = request.getParameter("name_atm");
        int number_atm = Integer.parseInt(request.getParameter("number_atm"));

        String[] info = ((String) request.getParameter("info")).split("~");

        String query = "SELECT * FROM `webmobile`.`atm` WHERE `ACCUONT_NUMBER` = ? AND `ACCUONT_NAME`= ? ";
        try {
            PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
            preparedStatement.setInt(1, number_atm);
            preparedStatement.setString(2, name_atm);
            ResultSet rs = preparedStatement.executeQuery();
            rs.last();
            int index = rs.getRow();
            if (rs != null && index == 1) {
                rs.first();
                if (rs.getDouble(3) >= listCart.totalPrice()) {
                    User user = (User) session.getAttribute("user");
                    listCart = (ListCart) session.getAttribute("list_cart");

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
                    preparedStatement.setDouble(1, rs.getDouble(3) - listCart.totalPrice());
                    preparedStatement.setInt(2, number_atm);
                    preparedStatement.executeUpdate();

                    response.sendRedirect(Util.fullPath("detail_order"));
                } else {
                    request.setAttribute("atm_error", "Tài khoản của bạn không đủ tiền.");
                    request.getRequestDispatcher("pay_online.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("atm_error", "Sai thông tin tài khoản.");
                request.getRequestDispatcher("pay_online.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

package vn.edu.nlu.fit.controller.pay;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Cart;
import vn.edu.nlu.fit.model.ListCart;

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

@WebServlet("/detail_order")
public class detail_order extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String select = "SELECT * FROM `webmobile`.`bill` WHERE ID_BILL = (SELECT MAX(id_bill) FROM bill)";

        try {
            PreparedStatement preparedStatement = DBConect.getPreparedStatement(select);

            ResultSet rs = preparedStatement.executeQuery();

            request.setAttribute("rs", rs);

            int id_bill = 0;
            while (rs.next()) {
                id_bill = rs.getInt(1);
            }

            ListCart listCart = (ListCart) session.getAttribute("list_cart");
            for (Cart cart : listCart.list_cart) {
                    String insert = "INSERT INTO `webmobile`.`detail_order`(`ID_PRODUCT`, `ID_BILL`) VALUES (?, ?)";
                    preparedStatement = DBConect.getPreparedStatement(insert);
                    preparedStatement.setString(1, cart.getPro().getId_product());
                    preparedStatement.setInt(2, id_bill);
                    preparedStatement.executeUpdate();
            }

            request.getRequestDispatcher("detail_order.jsp").forward(request, response);
            request.getSession().removeAttribute("list_cart");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

package vn.edu.nlu.fit.controller.cart;

import vn.edu.nlu.fit.model.Cart;
import vn.edu.nlu.fit.model.ListCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/minus_quality")
public class minus_quality extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String minus = request.getParameter("id_product");

        String link = request.getParameter("link");
        HttpSession session = request.getSession();
        ListCart listCart = (ListCart) session.getAttribute("list_cart");
        for (Cart item : listCart.list_cart) {
            if (item.getPro().getId_product().equals(minus) && item.getTotal() > 1) {
                item.setTotal(item.getTotal() - 1);
            }
        }
        response.sendRedirect(link);
    }
}

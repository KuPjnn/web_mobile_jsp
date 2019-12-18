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

@WebServlet("/add_quantity")
public class add_quantity extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String add = request.getParameter("id_product");

        HttpSession session = request.getSession();
        ListCart listCart = (ListCart) session.getAttribute("list_cart");
        for (Cart item : listCart.list_cart) {
            if (item.getPro().getId_product().equals(add) && item.getTotal() < item.getPro().getTotal()) {
                item.setTotal(item.getTotal() + 1);
            }
        }
    }
}

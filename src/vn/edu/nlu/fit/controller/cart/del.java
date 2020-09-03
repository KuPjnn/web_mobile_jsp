package vn.edu.nlu.fit.controller.cart;

import vn.edu.nlu.fit.model.ListCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/del")
public class del extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String id_product = request.getParameter("id_del");
        ListCart listCart = (ListCart) session.getAttribute("list_cart");
        listCart.list_cart.removeIf(item -> item.getPro().getId_product().equals(id_product));
        request.setAttribute("list_cart", listCart);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

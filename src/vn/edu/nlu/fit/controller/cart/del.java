package vn.edu.nlu.fit.controller.cart;

import vn.edu.nlu.fit.model.Cart;
import vn.edu.nlu.fit.model.ListCart;
import vn.edu.nlu.fit.util.Util;

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
        String link = request.getParameter("link_cart");

        ListCart listCart = (ListCart) session.getAttribute("list_cart");
        String id_product = request.getParameter("id_del");
        listCart.list_cart.removeIf(item -> item.getPro().getId_product().equals(id_product));

        request.setAttribute("list_cart", listCart);
        response.sendRedirect(Util.fullPath(link));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

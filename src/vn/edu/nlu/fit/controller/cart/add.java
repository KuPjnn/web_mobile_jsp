package vn.edu.nlu.fit.controller.cart;

import vn.edu.nlu.fit.dao.ProductDAOImpl;
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
import java.sql.SQLException;

@WebServlet("/add")
public class add extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            String linkSendRequest = request.getParameter("link_detail");
            System.out.println(linkSendRequest);

            String id_product = request.getParameter("id");
            Cart item = new Cart(new ProductDAOImpl().getProduct(id_product), 1);

            ListCart listCArt = (ListCart) session.getAttribute("list_cart");

            if (listCArt == null)
                listCArt = new ListCart();
            if (!listCArt.list_cart.isEmpty()) {
                for (Cart product : listCArt.list_cart) {
                    if (product.getPro().getId_product().equals(id_product)) {
                        product.setTotal(product.getTotal() + 1);
                    } else {
                        listCArt.list_cart.add(item);
                        break;
                    }
                }
            } else {
                if (item != null) {
                    listCArt.list_cart.add(item);
                }
            }
            session.setAttribute("list_cart", listCArt);
            response.sendRedirect(Util.fullPath(linkSendRequest));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
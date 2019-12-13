package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.ProductDAO;
import vn.edu.nlu.fit.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/product")
public class admin_product extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String action = request.getParameter("action");
            String id_product = request.getParameter("id_product");
            if (action == null) {
                List<Product> list = new ProductDAO().listProduct();
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin_product.jsp").forward(request, response);
            } else if (action != null && id_product != null && action.equals("hide")) {
                boolean hide = new ProductDAO().hideProduct(id_product);
                if (hide == true)
                    response.sendRedirect("product");
            } else if (action != null && id_product != null && action.equals("active")) {
                boolean active = new ProductDAO().activeProduct(id_product);
                if (active == true)
                    response.sendRedirect("product");

            } else if (action != null && id_product != null && action.equals("del")) {
                boolean del = new ProductDAO().delProduct(id_product);
                if (del == true)
                    response.sendRedirect("product");
            } else if (action != null && id_product != null && action.equals("add")) {
                String id_pro = request.getParameter("");
                String id_items = request.getParameter("");
                String id_supplier = request.getParameter("");
                String name = request.getParameter("");
                double price = Double.parseDouble(request.getParameter(""));
                String img = request.getParameter("");
                int total = Integer.parseInt(request.getParameter(""));
                int active = Integer.parseInt(request.getParameter(""));
                boolean add = new ProductDAO().addProduct(id_pro, id_items, id_supplier, name, price, img, total, active);
                if (add == true)
                    response.sendRedirect("product");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

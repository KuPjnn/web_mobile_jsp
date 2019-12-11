package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.IProductDAO;
import vn.edu.nlu.fit.dao.ProductDAOImpl;
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
                IProductDAO productDAO = new ProductDAOImpl();
                List<Product> list = productDAO.listProduct();
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin_product.jsp").forward(request, response);
            } else if (action != null && id_product != null && action.equals("hide")) {
                boolean hide = new ProductDAOImpl().hideProduct(id_product);
                if (hide == true)
                    response.sendRedirect("product");
            } else if (action != null && id_product != null && action.equals("active")) {
                boolean active = new ProductDAOImpl().activeProduct(id_product);
                if (active == true) {
                    response.sendRedirect("product");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.ItemsDAO;
import vn.edu.nlu.fit.dao.ProductDAO;
import vn.edu.nlu.fit.dao.SupplierDAO;
import vn.edu.nlu.fit.model.Item;
import vn.edu.nlu.fit.model.Product;
import vn.edu.nlu.fit.model.Supplier;

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
            System.out.println(action + " " + id_product);

            if (action == null) {
                List<Product> list = new ProductDAO().listProduct();
                List<Item> itemList = new ItemsDAO().listItems();
                List<Supplier> supplierList = new SupplierDAO().listSupplier();

                request.setAttribute("list", list);
                request.setAttribute("itemList", itemList);
                request.setAttribute("supplierList", supplierList);
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

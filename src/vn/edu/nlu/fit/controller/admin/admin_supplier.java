package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.SupplierDAO;
import vn.edu.nlu.fit.model.Supplier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/supplier")
public class admin_supplier extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String id_items = request.getParameter("id_supplier");
            if (action == null) {
                List<Supplier> list = new SupplierDAO().listSupplier();
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin_supplier.jsp").forward(request, response);

            } else if (action != null && id_items != null && action.equals("add")) {
                String id = request.getParameter("id_supplier");
                String name = request.getParameter("name_supplier");
                boolean add = new SupplierDAO().addSupplier(id, name);
                if (add == true)
                    response.sendRedirect("supplier");

            } else if (action != null && id_items != null && action.equals("hide")) {
                boolean hide = new SupplierDAO().hideSupplier(id_items);
                if (hide == true)
                    response.sendRedirect("supplier");

            } else if (action != null && id_items != null && action.equals("active")) {
                boolean active = new SupplierDAO().activeSupplier(id_items);
                if (active == true)
                    response.sendRedirect("supplier");

            } else if (action != null && id_items != null && action.equals("del")) {
                boolean del = new SupplierDAO().delSupplier(id_items);
                if (del == true)
                    response.sendRedirect("supplier");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

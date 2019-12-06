package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.db.DBConect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/list_product")
public class list_product extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String supplier = request.getParameter("supplier");

        String search = request.getParameter("search");
        String[] arr = null;
        if (supplier != null)
            arr = supplier.split("_");
        try {
            String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT\n" +
                    " FROM product,items,supplier\n" +
                    " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER";
            if (supplier != null) {
                product += " AND supplier.NAME_SUPPLIER= ? AND items.ID_ITEMS= ?";
            }

            if (search != null) {
                product += " AND product.PRODUCT_NAME LIKE ?";
            }
            PreparedStatement preparedStatement = DBConect.getPreparedStatement(product);
            if (supplier != null) {
                preparedStatement.setString(1, arr[1]);
                preparedStatement.setString(2, arr[0]);
            }
            if (search != null)
                preparedStatement.setString(1, "%" + search + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            request.setAttribute("resultSet", resultSet);

            request.getRequestDispatcher("list_product.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

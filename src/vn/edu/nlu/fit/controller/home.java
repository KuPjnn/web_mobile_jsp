package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.db.DBConect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/home")
public class home extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Statement statement = DBConect.connectMySQL();

            String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT\n" +
                    " FROM product,items,supplier\n" +
                    " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER\n" +
                    " ORDER BY RAND ( );";

            ResultSet resultSet = statement.executeQuery(product);

            request.setAttribute("resultSet", resultSet);

            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

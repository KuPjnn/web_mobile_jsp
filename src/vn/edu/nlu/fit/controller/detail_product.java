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

@WebServlet("/detail_product")
public class detail_product extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String detail = request.getParameter("detail");
        try {

            Statement statement = DBConect.connectMySQL();
            String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT\n" +
                    " FROM product,items,supplier\n" +
                    " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER " +
                    "AND product.ID_PRODUCT=" + "\'" + detail + "\'";
            ResultSet resultSet = statement.executeQuery(product);
            request.setAttribute("resultSet", resultSet);

            /*Cau hinh*/
            Statement st = DBConect.connectMySQL();
            String conf = "SELECT * FROM configuration WHERE configuration.ID_PRODUCT=" + "\'" + detail + "\'";
            ResultSet configuration = st.executeQuery(conf);
            request.setAttribute("configuration", configuration);


            request.getRequestDispatcher("detail_product.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

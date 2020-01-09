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
        /*String supplier = request.getParameter("supplier");

        String search = request.getParameter("search");
        String[] arr = null;
        if (supplier != null)
            arr = supplier.split("_");
        try {
            String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT\n" +
                    " FROM product,items,supplier\n" +
                    " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER AND product.ACTIVE=1 ";
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
        }*/
        int page = 0;
        String checkPage = "";
        if (request.getParameter("page") == null) page = 1;
        else {
            page = Integer.parseInt(request.getParameter("page"));
        }
        String supplier = request.getParameter("supplier");
        String sort = request.getParameter("sort");
        String search = request.getParameter("search");
        if (search == "")
            search = "<>";

        String[] arr = null;
        String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT, product.DISCOUNT, product.STAR_MEDIUM\n" +
                " FROM product,items,supplier\n" +
                " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER AND product.ACTIVE=1 " +
                " AND items.ACTIVE=1 AND supplier.ACTIVE=1 ";

        String count = "SELECT COUNT(product.ID_PRODUCT)\n" +
                " FROM product,items,supplier\n" +
                " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER AND product.ACTIVE=1 " +
                " AND items.ACTIVE=1 AND supplier.ACTIVE=1 ";
        try {
            if (supplier != null) {
                arr = supplier.split("_");
                product += " AND supplier.NAME_SUPPLIER= ? AND items.ID_ITEMS= ? LIMIT " + (page - 1) * 15 + ",15";
                PreparedStatement preparedStatement = DBConect.getPreparedStatement(product);
                preparedStatement.setString(1, arr[1]);
                preparedStatement.setString(2, arr[0]);
                ResultSet resultSet = preparedStatement.executeQuery();
                request.setAttribute("resultSet", resultSet);

                count += " AND supplier.NAME_SUPPLIER= ? AND items.ID_ITEMS= ?";
                PreparedStatement pre = DBConect.getPreparedStatement(count);

                pre.setString(1, arr[1]);
                pre.setString(2, arr[0]);

                ResultSet cc = pre.executeQuery();
                cc.beforeFirst();
                cc.next();
                int total = cc.getInt(1);
                checkPage = "false" + "_" + total;
                request.setAttribute("total", checkPage);
            } else if (search != null) {
                product += " AND product.PRODUCT_NAME LIKE ? LIMIT " + (page - 1) * 15 + ",15";
                PreparedStatement preparedStatement = DBConect.getPreparedStatement(product);
                preparedStatement.setString(1, "%" + search + "%");
                ResultSet resultSet = preparedStatement.executeQuery();
                request.setAttribute("resultSet", resultSet);

                count += " AND product.PRODUCT_NAME LIKE ?";
                PreparedStatement pre = DBConect.getPreparedStatement(count);
                pre.setString(1, "%" + search + "%");
                ResultSet cc = pre.executeQuery();
                cc.beforeFirst();
                cc.next();
                int total = cc.getInt(1);
                checkPage = search + "_" + total;
                request.setAttribute("total", checkPage);
            } else if (sort.equals("<5000000")) {
                product += " AND product.PRICE < ? LIMIT " + (page - 1) * 15 + ",15";
                PreparedStatement preparedStatement = DBConect.getPreparedStatement(product);
                preparedStatement.setInt(1, 5000000);
                ResultSet resultSet = preparedStatement.executeQuery();
                request.setAttribute("resultSet", resultSet);

                count += " AND product.PRICE < ?";
                PreparedStatement pre = DBConect.getPreparedStatement(count);
                pre.setInt(1, 5000000);
                ResultSet cc = pre.executeQuery();
                cc.beforeFirst();
                cc.next();
                int total = cc.getInt(1);
                checkPage = "false" + "_" + total;
                request.setAttribute("total", checkPage);

            } else if (!sort.equals("<5000000") && sort.equals("<10000000")) {
                product += " AND product.PRICE BETWEEN ? AND ? LIMIT " + (page - 1) * 15 + ",15";
                PreparedStatement preparedStatement = DBConect.getPreparedStatement(product);
                preparedStatement.setInt(1, 5000000);
                preparedStatement.setInt(2, 10000000);
                ResultSet resultSet = preparedStatement.executeQuery();
                request.setAttribute("resultSet", resultSet);

                count += " AND product.PRICE BETWEEN ? AND ?";
                PreparedStatement pre = DBConect.getPreparedStatement(count);
                pre.setInt(1, 5000000);
                pre.setInt(2, 10000000);

                ResultSet cc = pre.executeQuery();
                cc.beforeFirst();
                cc.next();
                int total = cc.getInt(1);
                checkPage = "false" + "_" + total;
                request.setAttribute("total", checkPage);
            } else if (sort.equals(">10000000")) {
                product += " AND product.PRICE > ? LIMIT " + (page - 1) * 15 + ",15";
                PreparedStatement preparedStatement = DBConect.getPreparedStatement(product);
                preparedStatement.setInt(1, 10000000);
                ResultSet resultSet = preparedStatement.executeQuery();
                request.setAttribute("resultSet", resultSet);

                count += " AND product.PRICE > ?";
                PreparedStatement pre = DBConect.getPreparedStatement(count);
                pre.setInt(1, 10000000);
                ResultSet cc = pre.executeQuery();
                cc.beforeFirst();
                cc.next();
                int total = cc.getInt(1);
                checkPage = "sort" + "_" + total;
                request.setAttribute("total", checkPage);
            } else {
                product += " LIMIT " + (page - 1) * 15 + ",15";
                PreparedStatement preparedStatement = DBConect.getPreparedStatement(product);
                ResultSet resultSet = preparedStatement.executeQuery();
                request.setAttribute("resultSet", resultSet);

                PreparedStatement pre = DBConect.getPreparedStatement(count);
                ResultSet cc = pre.executeQuery();
                cc.beforeFirst();
                cc.next();
                int total = cc.getInt(1);
                checkPage = "true" + "_" + total;
                request.setAttribute("total", checkPage);
            }

            request.getRequestDispatcher("list_product.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

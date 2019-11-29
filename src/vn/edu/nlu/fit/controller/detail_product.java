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

            /*thong tin san pham*/
            Statement stProduct = DBConect.connectMySQL();
            String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT\n" +
                    " FROM product,items,supplier\n" +
                    " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER " +
                    "AND product.ID_PRODUCT=" + "\'" + detail + "\'";
            ResultSet detailProduct = stProduct.executeQuery(product);
            request.setAttribute("detailProduct", detailProduct);

            /*Cau hinh san pham*/
            Statement stConf = DBConect.connectMySQL();
            String conf = "SELECT * FROM configuration WHERE configuration.ID_PRODUCT=" + "\'" + detail + "\'";
            ResultSet configuration = stConf.executeQuery(conf);
            request.setAttribute("configuration", configuration);

            /*Binh luan san pham*/
            Statement stCom = DBConect.connectMySQL();
            String com = "SELECT DISTINCT `comment`.ID_COMMENT,`user`.FULLNAME,`comment`.ID_PRODUCT,`comment`.CONTENT,`comment`.DATE_COMMENT\n" +
                    "FROM `comment`,`user` WHERE `comment`.USER_NAME=`user`.USER_NAME AND `comment`.ID_PRODUCT=" + "\'" + detail + "\'";
            ResultSet comment = stCom.executeQuery(com);
            request.setAttribute("comment", comment);

            /*San pham tuong tu*/
            Statement stSame = DBConect.connectMySQL();
            String same = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT\n" +
                    "FROM product,items,supplier\n" +
                    "WHERE \n" +
                    "product.ID_ITEMS=items.ID_ITEMS \n" +
                    "AND \n" +
                    "product.ID_SUPPLIER=supplier.ID_SUPPLIER\n" +
                    "AND\n" +
                    "product.ID_SUPPLIER =(SELECT product.ID_SUPPLIER FROM product WHERE product.ID_PRODUCT =" + "\'" + detail + "\') \n" +
                    "AND \n" +
                    "product.ID_ITEMS = (SELECT product.ID_ITEMS FROM product WHERE product.ID_PRODUCT =" + "\'" + detail + "\') \n" +
                    " ORDER BY RAND ( );";
            ResultSet like = stSame.executeQuery(same);
            request.setAttribute("like", like);

            request.getRequestDispatcher("detail_product.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

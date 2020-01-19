package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/detail_product")
public class detail_product extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String detail = request.getParameter("detail");
        try {

            /*thong tin san pham*/
            String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT,product.DISCOUNT,product.STAR_MEDIUM\n" +
                    " FROM product,items,supplier\n" +
                    " WHERE product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER " +
                    "AND product.ID_PRODUCT= ?;";
            PreparedStatement stProduct = DBConect.getPreparedStatement(product);
            stProduct.setString(1, detail);
            ResultSet detailProduct = stProduct.executeQuery();
            request.setAttribute("detailProduct", detailProduct);

            /*Cau hinh san pham*/
            String conf = "SELECT * FROM configuration WHERE configuration.ID_PRODUCT= ?;";
            PreparedStatement stConf = DBConect.getPreparedStatement(conf);
            stConf.setString(1, detail);
            ResultSet configuration = stConf.executeQuery();
            request.setAttribute("configuration", configuration);

            /*Binh luan san pham*/
            String com = "SELECT DISTINCT `comment`.USER_NAME,`user`.FULLNAME,`comment`.ID_PRODUCT,`comment`.CONTENT,`comment`.DATE_COMMENT, `comment`.ID_COMMENT, `comment`.EVALUATE\n" +
                    " FROM `comment`,`user` WHERE `comment`.USER_NAME=`user`.USER_NAME AND `comment`.ID_PRODUCT= ? AND `comment`.ACTIVE=1 ";
            PreparedStatement stCom = DBConect.getPreparedStatement(com);
            stCom.setString(1, detail);
            ResultSet comment = stCom.executeQuery();
            request.setAttribute("comment", comment);

            /*kiem tra danh gia*/
            HttpSession s = request.getSession();
            User us = (User) s.getAttribute("user");
            if (us != null) {
                String sql = "SELECT ID_PRODUCT, USER_NAME, EVALUATE FROM `comment` where ID_PRODUCT=? and USER_NAME=? and EVALUATE!=0";
                stCom = DBConect.getPreparedStatement(sql);
                stCom.setString(1, detail);
                stCom.setString(2, us.getUser_name());
                comment = stCom.executeQuery();
                comment.last();

                request.setAttribute("check", comment.getRow());
            } else
                request.setAttribute("check", 0);
            /*San pham tuong tu*/
            String same = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT, product.DISCOUNT, product.STAR_MEDIUM\n" +
                    "FROM product,items,supplier\n" +
                    "WHERE \n" +
                    "product.ID_ITEMS=items.ID_ITEMS \n" +
                    "AND \n" +
                    "product.ID_SUPPLIER=supplier.ID_SUPPLIER\n" +
                    "AND\n" +
                    "product.ID_SUPPLIER =(SELECT product.ID_SUPPLIER FROM product WHERE product.ID_PRODUCT = ?) " +
                    "AND \n" +
                    "product.ID_ITEMS = (SELECT product.ID_ITEMS FROM product WHERE product.ID_PRODUCT = ?) "
                    + " ORDER BY RAND ( );";
            PreparedStatement stSame = DBConect.getPreparedStatement(same);
            stSame.setString(1, detail);
            stSame.setString(2, detail);

            ResultSet like = stSame.executeQuery();
            request.setAttribute("like", like);

            request.getRequestDispatcher("detail_product.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

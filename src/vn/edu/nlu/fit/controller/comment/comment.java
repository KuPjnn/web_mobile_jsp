package vn.edu.nlu.fit.controller.comment;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.Util;

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

@WebServlet("/comment")
public class comment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("comment");
        String idProduct = request.getParameter("id");
        int evaluate = 0;


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (content != null && user != null) {
            String insertComment = "INSERT INTO `webmobile`.`comment`(`USER_NAME`, `ID_PRODUCT`, `CONTENT`, `DATE_COMMENT`,`EVALUATE`) VALUES (?, ?, ?, NOW(),?)";
            String sql = "SELECT ID_PRODUCT, USER_NAME, EVALUATE FROM `comment` where ID_PRODUCT=? and USER_NAME=? and EVALUATE!=0";

            try {
                PreparedStatement ps = DBConect.getPreparedStatement(sql);
                ps.setString(1, idProduct);
                ps.setString(2, user.getUser_name());

                ResultSet rs = ps.executeQuery();
                rs.last();
                if (rs.getRow() == 0) {
                    evaluate = Integer.parseInt(request.getParameter("star_num"));
                }

                ps = DBConect.getPreparedStatement(insertComment);
                ps.setString(1, user.getUser_name());
                ps.setString(2, idProduct);
                ps.setString(3, content);
                ps.setInt(4, evaluate);
                ps.executeUpdate();

                String sql1 = "SELECT AVG(`EVALUATE`)\n" +
                        "FROM `comment`\n" +
                        "WHERE `ID_PRODUCT`= ? and EVALUATE!=0;";
                PreparedStatement ps1 = DBConect.getPreparedStatement(sql1);
                ps1.setString(1, idProduct);
                rs = ps1.executeQuery();
                rs.next();
                String sql2 = "update product set STAR_MEDIUM= ? where `ID_PRODUCT`= ? ;";
                PreparedStatement ps2 = DBConect.getPreparedStatement(sql2);
                System.out.println(rs.getInt(1));
                ps2.setInt(1, rs.getInt(1));
                ps2.setString(2, idProduct);
                ps2.executeUpdate();
                response.sendRedirect(Util.fullPath("home"));
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

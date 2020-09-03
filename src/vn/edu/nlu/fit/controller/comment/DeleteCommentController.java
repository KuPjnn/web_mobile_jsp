package vn.edu.nlu.fit.controller.comment;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/del_comment")
public class DeleteCommentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain");

        String id_comment = request.getParameter("id_comment");
        String delComment = "DELETE FROM `webmobile`.`comment` WHERE `ID_COMMENT` = ?";
        String id_product = request.getParameter("id");
        try {
            PreparedStatement ps = DBConect.getPreparedStatement(delComment);
            ps.setInt(1, Integer.parseInt(id_comment));
            ps.executeUpdate();
            response.getWriter().write("Xoa");

            String sql1 = "SELECT AVG(`EVALUATE`)\n" +
                    "FROM `comment`\n" +
                    "WHERE `ID_PRODUCT`= ? and EVALUATE!=0;";
            PreparedStatement ps1 = DBConect.getPreparedStatement(sql1);
            ps1.setString(1, id_product);
            ResultSet rs = ps1.executeQuery();
            rs.next();
            if (rs.getRow() == 1) {
                String sql2 = "update product set STAR_MEDIUM= ? where `ID_PRODUCT`= ? ;";
                PreparedStatement ps2 = DBConect.getPreparedStatement(sql2);
                System.out.println(rs.getInt(1));
                ps2.setInt(1, rs.getInt(1));
                ps2.setString(2, id_product);
                ps2.executeUpdate();
                response.sendRedirect(Util.fullPath("home"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

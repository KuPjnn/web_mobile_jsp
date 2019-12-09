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
import java.sql.SQLException;

@WebServlet("/del_comment")
public class del_comment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String link = request.getParameter("link");
        String id_comment = request.getParameter("id_comment");
        String delComment = "DELETE FROM `webmobile`.`comment` WHERE `ID_COMMENT` = ?";
        try {
            PreparedStatement ps = DBConect.getPreparedStatement(delComment);
            ps.setInt(1, Integer.parseInt(id_comment));
            ps.executeUpdate();
            response.sendRedirect(Util.fullPath(link));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

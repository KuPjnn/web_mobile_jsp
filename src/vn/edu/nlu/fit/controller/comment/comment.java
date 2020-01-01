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
import java.sql.SQLException;

@WebServlet("/comment")
public class comment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("comment");
        String idProduct = request.getParameter("id");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (content != null && user != null) {
            String insertComment = "INSERT INTO `webmobile`.`comment`(`USER_NAME`, `ID_PRODUCT`, `CONTENT`, `DATE_COMMENT`) VALUES (?, ?, ?, NOW())";
            try {
                PreparedStatement ps = DBConect.getPreparedStatement(insertComment);
                ps.setString(1, user.getUser_name());
                ps.setString(2, idProduct);
                ps.setString(3, content);
                ps.executeUpdate();
                response.sendRedirect(Util.fullPath("home"));
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

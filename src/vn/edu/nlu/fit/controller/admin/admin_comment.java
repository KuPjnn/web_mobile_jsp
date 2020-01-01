package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.CommentDAO;
import vn.edu.nlu.fit.model.Comment;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/comment")
public class admin_comment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {

            String action = request.getParameter("action");
            String id_comment = request.getParameter("id_comment");

            if (action == null && id_comment == null) {
                List<Comment> commentList = new CommentDAO().getList();
                request.setAttribute("commentList", commentList);
                request.getRequestDispatcher("admin_comment.jsp").include(request, response);
            } else if (action.equals("hide")) {
                boolean hide = new CommentDAO().hide(Integer.parseInt(id_comment));
                if (hide == true)
                    response.sendRedirect(Util.fullPath("admin/comment"));
            } else if (action.equals("active")) {
                boolean active = new CommentDAO().active(Integer.parseInt(id_comment));
                if (active == true)
                    response.sendRedirect(Util.fullPath("admin/comment"));
            } else if (action.equals("del")) {
                boolean del = new CommentDAO().remove(Integer.parseInt(id_comment));
                if (del == true)
                    response.sendRedirect(Util.fullPath("admin/comment"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

package vn.edu.nlu.fit.controller.user;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/change_info")
public class change_info extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String user_name = request.getParameter("user_name");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        try {
            boolean change = new UserDAO().updateUser(user_name, full_name, email, phone);
            if (change == true) {
                response.getWriter().write("Cập nhật thành công!");
                User user = new UserDAO().getUser(user_name);
                session.setAttribute("user", user);
            } else {
                response.getWriter().write("Lỗi cập nhật!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

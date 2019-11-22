package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.dao.UserDAOImpl;
import vn.edu.nlu.fit.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class login extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        User u = new User(user, pass);

        try {
            if (new UserDAOImpl().checkLogin(user, pass)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                response.sendRedirect("home");
            } else {
                request.setAttribute("err", "Sai tên hoặc mật khẩu !");
                request.getRequestDispatcher("home").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}

package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.dao.UserDAOImpl;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class login extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        String link = request.getParameter("link");

        System.out.println(link);
        try {
            User u = new UserDAOImpl().getUser(user);
            boolean validate = new UserDAOImpl().checkLogin(user, pass);
            if (u != null && validate) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);

                response.sendRedirect(Util.fullPath(link));
            } else {
                response.sendRedirect(Util.fullPath(link));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) {
    }
}

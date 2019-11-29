package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.dao.UserDAOImpl;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/register")
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String userName = request.getParameter("user_register");
        String password = request.getParameter("pass_register");
        String rePassword = request.getParameter("rePass_register");
        String fullName = request.getParameter("name_register");
        String email = request.getParameter("mail_register");
        String phone = request.getParameter("phone_register");
        String role = "kh";

        String link = request.getParameter("linkRegister");
        User user = new User(userName, password, fullName, email, phone, role);
        try {
            User getUser = new UserDAOImpl().getUser(userName);

            if (getUser == null && password.equalsIgnoreCase(rePassword) && new UserDAOImpl().addUser(user)) {
                response.sendRedirect(Util.fullPath(link));
            } else {
                System.out.println("Loi dang ki");
                response.sendRedirect(Util.fullPath(link));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

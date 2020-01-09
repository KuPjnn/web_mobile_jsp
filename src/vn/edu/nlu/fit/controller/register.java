package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.CheckMail;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain");

        String userName = request.getParameter("user_register");
        String password = request.getParameter("pass_register");
        String rePassword = request.getParameter("rePass_register");
        String fullName = request.getParameter("name_register");
        String email = request.getParameter("mail_register");
        String phone = request.getParameter("phone_register");
        String role = "kh";

        User user = new User(userName, password, fullName, email, phone, role);
        try {
            User getUser = new UserDAO().getUser(userName);
            if (CheckMail.isMailAddressValid(email)) {
                if (getUser.getUser_name() == null && password.equalsIgnoreCase(rePassword) && new UserDAO().addUser(user)) {
                    response.getWriter().write("true");
                } else {
                    response.getWriter().write("Sai thông tin đăng kí");
                }
            } else {
                response.getWriter().write("Email không tồn tại");
            }
        } catch (
                SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

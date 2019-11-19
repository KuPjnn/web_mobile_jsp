package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.dao.UserDAOImpl;
import vn.edu.nlu.fit.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String userName = request.getParameter("user_register");
        String password = request.getParameter("pass_register");
        String rePassword = request.getParameter("rePass_register");
        String fullName = request.getParameter("name_register");
        String email = request.getParameter("mail_register");
        String phone = request.getParameter("phone_register");
        String role = "KH";

        String userID = phone;

        User user = new User(userID, userName, password, fullName, email, phone, role);

        if (password.equalsIgnoreCase(rePassword) && new UserDAOImpl().addUser(user)) {
            response.sendRedirect("index.jsp");
        } else {
            System.out.println("Lỗi đăng kí !");
        }
    }
}

package vn.edu.nlu.fit.controller.forget;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.util.Encyption;
import vn.edu.nlu.fit.util.SendCodeForgotMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet("/sendCode")
public class SendCodeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain");

        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        UserDAO us = new UserDAO();
        try {
            if (us.checkMail(userName, email)) {
                String code = SendCodeForgotMail.randomAlphaNumeric();
                SendCodeForgotMail.send(email, code);
                String sql = "update user set CODE=? where USER_NAME=?;";
                PreparedStatement preparedStatement = DBConect.getPreparedStatement(sql);
                preparedStatement.setString(1, Encyption.MyEncypt(code));
                preparedStatement.setString(2, userName);
                preparedStatement.executeUpdate();
                response.getWriter().write("Đã gửi mã xác nhận!");
            } else {
                response.getWriter().write("Email hoặc tên đăng nhập không đúng");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

package vn.edu.nlu.fit.controller.forget;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.Encyption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/confirmCode")
public class confirmCode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain");

        String userName = request.getParameter("username");
        String pass = request.getParameter("password");
        String rePass = request.getParameter("rePassword");
        String code = request.getParameter("code");
        try {
            User us = new UserDAO().getUser(userName);
            System.out.println(us.getCode());
            System.out.println(Encyption.MyEncypt(code));
            if (pass.equals(rePass) && code != "") {
                if (us.getCode().equals(Encyption.MyEncypt(code))) {
                    String sql = "update user set CODE=?, PASSWORD = ? where USER_NAME=?;";
                    PreparedStatement preparedStatement = DBConect.getPreparedStatement(sql);
                    preparedStatement.setString(1, null);
                    preparedStatement.setString(2, Encyption.MyEncypt(pass));
                    preparedStatement.setString(3, userName);
                    preparedStatement.executeUpdate();
                    response.getWriter().write("true");
                } else {
                    response.getWriter().write("Mã xác nhận không đúng.");
                }
            } else {
                response.getWriter().write("Mã xác mật khẩu không trùng nhau.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class login extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain");

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            User u = new UserDAO().getUser(user);
            boolean validate = new UserDAO().checkLogin(user, pass);
            if (u != null && validate) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                response.getWriter().write("true");
//                response.sendRedirect(Util.fullPath(link));
            } else {
                response.getWriter().write("false");
            }
/*            else {
                String url = "";
                if (link.matches(".*\\?{1}.*")) {
                    url = link + "&login=false";
                } else {
                    url = link + "?login=false";
                }
                response.setContentType("text/plain");
                response.getWriter().write("Dang nhap thanh cong!");
                response.sendRedirect(Util.fullPath(url));
            }*/
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

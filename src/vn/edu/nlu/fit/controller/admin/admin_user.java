package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.UserDAO;
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

@WebServlet("/admin/user")
public class admin_user extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            if (request.getParameter("action") == null) {
                List<User> list_user = new UserDAO().listUser();
                request.setAttribute("list_user", list_user);
                request.getRequestDispatcher("admin_user.jsp").forward(request, response);
            } else if (request.getParameter("action").equals("edit")) {
                String user_name = request.getParameter("user_name");
                String pass = request.getParameter("pass");
                String full_name = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String privileges = request.getParameter("privileges");

                boolean edit = new UserDAO().editUser(user_name, pass, full_name, email, phone, privileges);
                if (edit == true)
                    response.sendRedirect(Util.fullPath("admin/user"));
            } else if (request.getParameter("action").equals("del")) {
                String user_name = request.getParameter("id");
                boolean del = new UserDAO().delUser(user_name);
                if (del == true)
                    response.sendRedirect(Util.fullPath("admin/user"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

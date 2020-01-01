package vn.edu.nlu.fit.controller.user;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.util.Encyption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/change_pass")
public class change_pass extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String user_name = request.getParameter("user_name");
        String pass = request.getParameter("pass");
        String new_pass = request.getParameter("new_pass");
        String re_pass = request.getParameter("re_pass");

        try {
            User user = new UserDAO().getUser(user_name);
            if (new_pass.equals(re_pass) && user.getPassword().equals(Encyption.MyEncypt(pass))) {
                boolean update = new UserDAO().changePass(user_name, new_pass);
                if (update == true) {
                    response.getWriter().write("true");
                    session.setAttribute("user", user);
                } else {
                    response.getWriter().write("false");
                }
            } else {
                response.getWriter().write("false");
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

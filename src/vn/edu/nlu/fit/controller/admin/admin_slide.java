package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.SlideDAO;
import vn.edu.nlu.fit.model.Slide;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/slide")
public class admin_slide extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String id_slide = request.getParameter("id_slide");
            if (action == null) {
                List<Slide> list_slide = new SlideDAO().getSlide();
                request.setAttribute("list_slide", list_slide);
                request.getRequestDispatcher("admin_slide.jsp").forward(request, response);

            } else if (action != null && id_slide != null && action.equals("hide")) {
                boolean hide = new SlideDAO().hideSlide(id_slide);
                if (hide == true)
                    response.sendRedirect("slide");

            } else if (action != null && id_slide != null && action.equals("active")) {
                boolean active = new SlideDAO().active(id_slide);
                if (active == true)
                    response.sendRedirect("slide");

            } else if (action != null && id_slide != null && action.equals("del")) {
                boolean del = new SlideDAO().delSlide(id_slide);
                if (del == true)
                    response.sendRedirect("slide");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

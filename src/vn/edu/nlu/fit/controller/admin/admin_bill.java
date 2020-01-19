package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.BillDAO;
import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Bill;
import vn.edu.nlu.fit.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/bill")
public class admin_bill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain");

        String id_bill = request.getParameter("id_bill");
        try {
            ResultSet bill = new BillDAO().getBill(id_bill);
            String result = "";
            while (bill.next()) {
                result += bill.getString(7) + " | " + bill.getString(8) + "~";
            }
            response.getWriter().write(result);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        try {
            if (request.getParameter("action") == null) {
                List<Bill> list = new BillDAO().listBill();
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin_bill.jsp").forward(request, response);

            } else if (request.getParameter("action").equals("active")) {
                int id_bill = Integer.parseInt(request.getParameter("id"));
                boolean active = new BillDAO().activeBill(id_bill);
                if (active == true)
                    response.sendRedirect(Util.fullPath("admin/bill"));
            } else {
                response.sendRedirect(Util.fullPath("admin/bill"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

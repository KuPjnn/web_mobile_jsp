package vn.edu.nlu.fit.controller.common;

import vn.edu.nlu.fit.dao.ItemsDAO;
import vn.edu.nlu.fit.dao.MenuDAO;
import vn.edu.nlu.fit.model.Item;
import vn.edu.nlu.fit.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/menu")
public class MenuController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Menu> listSupplier = new MenuDAO().getSupplier();
			List<Item> listItems = new ItemsDAO().listItems();
			request.setAttribute("listSupplier", listSupplier);
			request.setAttribute("listItems", listItems);
			request.getRequestDispatcher("menu.jsp").include(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}

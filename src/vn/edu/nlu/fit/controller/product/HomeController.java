package vn.edu.nlu.fit.controller.product;

import vn.edu.nlu.fit.db.DBConect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String product = "SELECT product.PRODUCT_NAME,product.PRICE,product.IMG,supplier.NAME_SUPPLIER, items.ID_ITEMS, product.ID_PRODUCT, product.DISCOUNT, product.STAR_MEDIUM\n" +
					" FROM product,items,supplier\n" +
					" WHERE product.ACTIVE=1 AND product.ID_ITEMS=items.ID_ITEMS AND product.ID_SUPPLIER=supplier.ID_SUPPLIER " +
					" AND product.ACTIVE=1 AND items.ACTIVE=1 AND supplier.ACTIVE=1 ORDER BY RAND ();";
			PreparedStatement statement = DBConect.getPreparedStatement(product);
			ResultSet resultSet = statement.executeQuery();
			request.setAttribute("resultSet", resultSet);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

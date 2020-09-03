package vn.edu.nlu.fit.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Util {
	static final String HOST = "https://localhost:8443/";

	public static String fullPath(String path) {
		return HOST + path;
	}

	public static String convertPrice(double price) {
		BigDecimal decimal = new BigDecimal(price);

		DecimalFormat format = new DecimalFormat("####,###,###");

		return (format.format(decimal) + "đ").replace(",", ".");
	}

	public static String splitImg(String listLink) {
		String[] link = listLink.split("~");
		return link[0];
	}

}

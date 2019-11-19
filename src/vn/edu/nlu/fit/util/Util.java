package vn.edu.nlu.fit.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Util {
    static final String HOST = "http://localhost:8080/web_mobile/";

    public static String fullPath(String path) {
        return HOST + path;
    }

    public static String convertPrice(double price) {
        BigDecimal decimal = new BigDecimal(price);

        DecimalFormat format = new DecimalFormat("####,###,###");

        String pri = String.valueOf(format.format(decimal)) + "đ";

        return pri;
    }
}

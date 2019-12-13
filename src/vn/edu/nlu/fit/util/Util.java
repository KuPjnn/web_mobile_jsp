package vn.edu.nlu.fit.util;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Util {
    static final String HOST = "http://localhost:8080/web_mobile/";

    public static String fullPath(String path) {
        return HOST + path;
    }

    public static String urlRedirect(HttpServletRequest request) {
        String u = (String) request.getAttribute("javax.servlet.forward.request_uri");
        String url = "";
        if (u != null)
            url = u.replace("/web_mobile/", "");

        String parameterAddressBar = request.getQueryString();
        String parameter = "";
        if (parameterAddressBar != null) {
            String str = parameterAddressBar.replace("login=false", "");
            if (str != "")
                parameter = str.replace("&", "");
        }
        if (parameter != "")
            url += "?" + parameter;
        return url;
    }

    public static String convertPrice(double price) {
        BigDecimal decimal = new BigDecimal(price);

        DecimalFormat format = new DecimalFormat("####,###,###");

        String pri = String.valueOf(format.format(decimal)) + "đ";

        return pri;
    }

    public static String splitImg(String listLink) {
        String[] link = listLink.split("~");
        return link[0];
    }
}

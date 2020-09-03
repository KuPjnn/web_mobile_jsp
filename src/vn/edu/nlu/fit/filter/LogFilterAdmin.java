package vn.edu.nlu.fit.filter;

import vn.edu.nlu.fit.model.UserModel;
import vn.edu.nlu.fit.util.Util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogFilterAdmin implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;

        HttpSession session = req.getSession();

        UserModel user = (UserModel) session.getAttribute("user");

        if (user != null && user.getPrivileges().equals("ad")) {
            // Cho phép request được đi tiếp. (Vượt qua Filter này).
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            HttpServletResponse resp = (HttpServletResponse) servletResponse;
            resp.sendRedirect(Util.fullPath("home"));
        }
    }

    @Override
    public void destroy() {
    }
}

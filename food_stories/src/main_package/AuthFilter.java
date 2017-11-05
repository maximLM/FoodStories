package main_package;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
//        resp.setContentType("text/html");
        HttpServletRequest r = (HttpServletRequest) req;
        if (r.getSession().getAttribute("current_user") != null || r.getRequestURI().equals("/login")) {
            chain.doFilter(req, resp);
        }
        else {
            ((HttpServletResponse)resp).sendRedirect("/login");
        }
//        chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }
}

package main_package;

//import freemarker.template.TemplateException;


import dao.UserDao;
import entities.User;
import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("IN POST");
        Map<String, String[]> map = req.getParameterMap();
        User user = null;
        if (map.containsKey("name")) {
            if (UserDao.existsWithLogin(map.get("login")[0])) {
                resp.sendRedirect("/login");
                return;
            }
            user = UserDao.createUser(map.get("login")[0],
                    map.get("password")[0],
                    map.get("name")[0],
                    map.get("email")[0],
                    Calendar.getInstance(),
                    "Moscow",
                    Calendar.getInstance());

        } else {
            user = UserDao.getUserByLoginAndPass(
                    map.get("login")[0],
                    map.get("password")[0]
            );
        }
        if (user == null) {
            resp.sendRedirect("/login");
            return;
        }
        req.getSession().setAttribute("current_user", user);
        resp.sendRedirect("/index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.getWriter().println("KEK IS NOT");
        System.out.println("Вгете кекк");
        try {
            Render.render(resp, new HashMap<>(), "/login.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}

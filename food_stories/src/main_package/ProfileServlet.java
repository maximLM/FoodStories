package main_package;

import dao.UserDao;
import entities.User;
import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Calendar;
import java.util.HashMap;

import static main_package.Helper.CURRENT_USER_KEY;

@WebServlet("/profile")
@MultipartConfig
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute(CURRENT_USER_KEY);
        String name = req.getParameter("name");
        String login = req.getParameter("login");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String city = req.getParameter("city");
        if (login == null ||
                name == null ||
                email == null ||
                password == null ||
                city == null ) {
            System.out.println("city = " + city);
            System.out.println("password = " + password);
            System.out.println("login = " + login);
            System.out.println("email = " + email);
            System.out.println("name = " + name);
            resp.sendRedirect("/index.jsp");
            return;
        }
        if (!login.equals(user.getLogin()) && UserDao.existsWithLogin(login)) {
            resp.sendRedirect("/profile");
            return;
        }
        Part part = req.getPart("photo");
        String photo = user.getId() + "DIVIDER_" +
                System.currentTimeMillis() + ".jpg";
        Helper.loadPhoto(photo, part.getInputStream());

        user = new User(
                user.getId(),
                login,
                password,
                name,
                email,
                user.getBirthday(),
                city,
                user.getRegister(),
                user.isAdmin(),
                photo
        );
        UserDao.updateUser(user);
        req.getSession().setAttribute(CURRENT_USER_KEY, user);
        resp.sendRedirect("/profile");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HashMap<String, Object> map = new HashMap<>();
            User user = (User) req.getSession().getAttribute(CURRENT_USER_KEY);
            System.out.println("USER IS === " + user);
            map.put("user", user);
            Render.render(resp, map, "/profile.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}

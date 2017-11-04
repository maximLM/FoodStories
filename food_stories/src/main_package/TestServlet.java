package main_package;

import dao.UserDao;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("/text.html");
        PrintWriter out = resp.getWriter();
        out.println("HEEEEYYYYYY</br");
        UserDao userDao = new UserDao();
        User user = userDao.createUser("Maxim", "pass", "Yagafarov",
                "lesssmeaning@gmainl.com", Calendar.getInstance(), "Petyr", Calendar.getInstance());
        out.println(user + "</br");
    }
}

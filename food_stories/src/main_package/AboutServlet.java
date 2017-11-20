package main_package;

import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/about")
public class AboutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HashMap<String, Object> map = new HashMap<>();
        map.put("user", req.getSession().getAttribute(Helper.CURRENT_USER_KEY));
        try {
            Render.render(resp, map, "/about.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}

package main_package;

import dao.PostDao;
import entities.Post;
import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/search")
public class SearchPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, Object> map = new HashMap<>();
        map.put("user", req.getSession().getAttribute(Helper.CURRENT_USER_KEY));
        try {
            Render.render(resp, map, "search.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}

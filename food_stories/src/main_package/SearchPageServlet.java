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
        ArrayList<String> tags = new ArrayList<>();
        tags.add("spahish");
        tags.add("british");
        String pattern = "ate";
        List<Post> res =
                PostDao.search(pattern, tags);
        for (Post p : res) {
            System.out.println("post = " + p);
        }
        try {
            Render.render(resp, new HashMap<>(), "search.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}

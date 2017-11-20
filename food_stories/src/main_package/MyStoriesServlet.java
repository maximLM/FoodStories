package main_package;

import dao.PostDao;
import dao.UserDao;
import entities.Post;
import entities.User;
import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/my_stories")
public class MyStoriesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, Object> map = new HashMap<>();
        User user = UserDao.getUserById(Integer.parseInt(req.getParameter("id")));
        map.put("user", user);
        List<Post> posts = PostDao.getUserPost(user);
        map.put("posts", posts);
        try {
            Render.render(resp, map, "user.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}

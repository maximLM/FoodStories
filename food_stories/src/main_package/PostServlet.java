package main_package;

import entities.Comment;
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
import java.util.Map;

import static main_package.Helper.CURRENT_USER_KEY;

@WebServlet("/post")
public class PostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> map = req.getParameterMap();
        if (!map.containsKey("id")) {
            resp.sendRedirect("/profile");
            return;
        }
        int id = Integer.parseInt(map.get("id")[0]);
        Post post = Helper.getFullPost(id);
        System.out.println("post comments = " + post.getComments());
        for (Comment comment : post.getComments()) {
            System.out.println("comment.getAuthor() = " + comment.getAuthor());
        }
        HashMap<String, Object> front = new HashMap<>();
        front.put("post", post);
        front.put("user", ((User)req.getSession().getAttribute(CURRENT_USER_KEY)));
        System.out.println("POST = " + post);
        try {
            Render.render(resp, front, "/post.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}

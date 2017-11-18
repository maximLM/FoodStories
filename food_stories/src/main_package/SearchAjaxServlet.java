package main_package;

import dao.CommentDao;
import dao.PostDao;
import entities.Comment;
import entities.Post;
import entities.User;
import freemarker.template.TemplateException;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import static main_package.Helper.CURRENT_USER_KEY;

@WebServlet("/search_ajax")
public class SearchAjaxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pattern = req.getParameter("pattern");
        String tags = req.getParameter("tags");
        System.out.println("pattern = " + pattern);
        String res = "";
        if (tags == null || tags.equals("")) {
            System.out.println("TAGS IS EMPTY");
//            Post post = PostDao.search(pattern).get(0);
            Post post = new Post(
                    1,
                    "text",
                    Calendar.getInstance(),
                    2
            );
            HashMap<String, Object> map = new HashMap<>();
            map.put("post", post);
            try {
                res = Render.render(map, "post_body.ftl");
            } catch (TemplateException e) {
                e.printStackTrace();
            }

        } else {

        }
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("posts", res);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/json");
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().close();
    }
}

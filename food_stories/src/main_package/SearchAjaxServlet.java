package main_package;

import dao.CommentDao;
import dao.PostDao;
import entities.Comment;
import entities.Post;
import entities.Tag;
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
import java.util.*;

import static main_package.Helper.CURRENT_USER_KEY;

@WebServlet("/search_ajax")
public class SearchAjaxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pattern = req.getParameter("pattern");
        String tags = req.getParameter("tags");
        //System.out.println("pattern = " + pattern);
        String res = "";
        List<String> tagList = new ArrayList<>();

        if (tags == null || tags.equals("")) {
            System.out.println("TAGS IS EMPTY");

        } else {
            Helper.parseTags(tags, tagList);
        }
        System.out.println("TAGS : ");
        for (String s : tagList) {
            System.out.println(s);
        }
        HashMap<String, Object> map = new HashMap<>();
        List<Post> posts = PostDao.search(pattern, tagList);
        for (Post post : posts) {
            System.out.println("post = " + post);
        }
        map.put("posts", posts);
        try {
            res = Render.render(map, "post_body.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("posts", res);
        } catch (JSONException e) {
            e.printStackTrace();
        }
//        System.out.println("res = " + res);
//        System.out.println("jsonObject = " + jsonObject);
        resp.setContentType("text/json");
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().close();
    }

    }

package main_package;

import dao.CommentDao;
import dao.PostDao;
import entities.Comment;
import entities.User;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;

import static main_package.Helper.CURRENT_USER_KEY;

@WebServlet("/add/comment")
public class AddCommentServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("text");

        int id = Integer.parseInt(req.getParameter("post_id"));
        System.out.println("TEXTT = " + text);
        System.out.println("ID = " + id);
//        if (true) return;
        Comment comment = new Comment(-1,
                ((User) req.getSession().getAttribute(CURRENT_USER_KEY)),
                PostDao.getPostById(id),
                text,
                Calendar.getInstance()
        );
        comment = CommentDao.createComment(comment);
        JSONObject jsonObject = new JSONObject();

        try {
            assert comment != null;
            jsonObject.put("login", comment.getAuthor().getLogin());
            jsonObject.put("text", comment.getText());
            jsonObject.put("photo", comment.getAuthor().getPhoto());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/json");
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().close();
    }
}

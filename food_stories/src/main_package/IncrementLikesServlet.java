package main_package;

import dao.PostDao;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/incrementlikes")
public class IncrementLikesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("AM IN INCREMENT LIKES");
        int id = Integer.parseInt(req.getParameter("id"));
        int likes = Integer.parseInt(req.getParameter("likes"));
        PostDao.incrementLikes(id, likes);
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("kek", "is kek");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/json");
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().close();
    }
}

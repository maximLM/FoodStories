package main_package;

import dao.PostDao;
import dao.TagDao;
import dao.UserDao;
import entities.Post;
import entities.Tag;
import entities.User;
import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.*;


@WebServlet("/create_post")
@MultipartConfig
public class CreatePostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("I AM IN POST OF CREATE");
        List<String> tagList = new ArrayList<>();
        String tags = req.getParameter("tags");
        if (tags != null && !tags.equals(""))
            Helper.parseTags(tags, tagList);
        Post post = new Post(-1,
                req.getParameter("text"),
                Calendar.getInstance(),
                0);
        User author = (User) req.getSession().getAttribute(Helper.CURRENT_USER_KEY);
        post = PostDao.createPost(post);
        for (String s : tagList) {
            Tag tag = TagDao.getTagByName(s);
            if (tag == null) {
                tag = TagDao.createTag(s);
            }
            PostDao.addTag(post, tag);
        }
        post.setAuthor(author);
        UserDao.addPost(post.getAuthor(), post);

        Part part = req.getPart("photo");
        String photo = author.getId() + "DIVIDER_" +
                System.currentTimeMillis() + ".jpg";
        Helper.loadPhoto(photo, part.getInputStream());
        PostDao.addPhoto(post, photo);
//        FileItemFactory factory = new DiskFileItemFactory();
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        String FieldName = "";
//        try {
//            List items = upload.parseRequest(request);
//            Iterator iterator = items.iterator();
//            while (iterator.hasNext()) {
//                item = (FileItem) iterator.next();
//
//                if (fieldname.equals("description")) {
//                    description = item.getString();
//                }
//            }
//            if (!item.isFormField()) {
//                filename = item.getName();
//                path = new File(path1 + File.separator);
//                if (!path.exists()) {
//                    boolean status = path.mkdirs();
//                }
//                            /* START OF CODE FRO PRIVILEDGE*/
//
//                File uploadedFile = new File(path + Filename);  // for copy file
//                item.write(uploadedFile);
//            }
//        } else {
//            f1 = item.getName();
//        }



        resp.sendRedirect("/post?id=" + post.getId());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute(Helper.CURRENT_USER_KEY);
        Post dummy = new Post(1,"2", Calendar.getInstance(), 3);
        dummy.setAuthor(user);
        HashMap<String, Object> map = new HashMap<>();
        map.put("user", user);
        map.put("post", dummy);
        try {
            Render.render(resp, map, "create_post.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }

    }
}

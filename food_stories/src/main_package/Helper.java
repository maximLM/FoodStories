package main_package;

import dao.CommentDao;
import dao.PostDao;
import dao.TagDao;
import dao.UserDao;
import entities.Post;

import java.util.Calendar;
import java.util.Date;

public class Helper {

    public static final String ROOT_OF_PROJECT = "W:/WEBM_PROJECTS/FoodStoriesProject/food_stories";
    public static final String CURRENT_USER_KEY = "current_user";

    public static Calendar toCalendar(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal;
    }

    public static Post getFullPost(int id) {
        Post post = PostDao.getPostById(id);
        if (post == null) return null;
        post.setComments(CommentDao.getCommentsByPost(post));
        post.setTags(TagDao.getPostTags(post));
        post.setAuthor(UserDao.getAuthor(post));
        return post;
    }
}

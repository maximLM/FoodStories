package entities;

import java.util.Calendar;

public class Comment {
    private int id;
    private User author;
    private Post post;
    private String text;
    private Calendar date;

    public Comment(int id, User author, Post post, String text, Calendar date) {
        this.id = id;
        this.author = author;
        this.post = post;
        this.text = text;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}

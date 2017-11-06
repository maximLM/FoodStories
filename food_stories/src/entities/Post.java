package entities;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Post {
    private int id;
    private String text;
    private Calendar date;
    private User author;
    private int likes;
    private List<Photo> photos;
    private List<Tag> tags;
    private List<Comment> comments;

    public Post(int id, String text, Calendar date, int likes) {
        this.id = id;
        this.text = text;
        this.date = date;
        this.likes = likes;
        tags = new ArrayList<>();
        comments = new ArrayList<>();
        photos = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "id = " + id + "\ntext = " + text + "\nlikes = " + likes + "\n";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void addComment(Comment comment) {

    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}

package dao;

import entities.Comment;
import entities.Post;
import entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static main_package.Helper.toDate;
import static main_package.Helper.toCalendar;

public class CommentDao {

    public static List<Comment> getCommentsByUser(User user) {
        Connection conn = DBConnection.getConnection();

        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT \"comment\".id, \"comment\"._text, \"comment\"._date FROM\n" +
                            "  (\"user\" JOIN \"user_comment\" ON \"user\".id = \"user_comment\".user_id) AS\n" +
                            "  usercom JOIN \"comment\" ON usercom.comment_id = \"comment\".id\n" +
                            "  WHERE usercom.user_id = ?"
            );
            ps.setInt(1, user.getId());
            ResultSet rs = ps.executeQuery();
            ArrayList<Comment> ret = new ArrayList<>();
            while (rs.next()) {
                ret.add(
                        new Comment(
                                rs.getInt(1),
                                user,
                                getPostByCommentId(rs.getInt(1)),
                                rs.getString(2),
                                toCalendar(rs.getDate(3))
                        )
                );
            }
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Post getPostByCommentId(int commId) {
        Connection conn = DBConnection.getConnection();

        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(
                    "SELECT \"user\".id FROM\n" +
                            "    \"user\" JOIN \"user_comment\" ON \"user\".id = \"user_comment\".user_id\n" +
                            "  WHERE \"user_comment\".comment_id = ?"
            );
            ps.setInt(1, commId);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;
            return PostDao.getPostById(rs.getInt(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Comment> getCommentsByPost(Post post) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT \"comment\".id, \"comment\"._text, \"comment\"._date FROM\n" +
                            "  (\"post\" JOIN \"post_comment\" ON \"post\".id = \"post_comment\".post_id) AS\n" +
                            "  postcom JOIN \"comment\" ON postcom.comment_id = \"comment\".id\n" +
                            "  WHERE postcom.id = ?"
            );
            ps.setInt(1, post.getId());
            ResultSet resultSet = ps.executeQuery();
            ArrayList<Comment> ret = new ArrayList<>();

            while (resultSet.next()) {
                ret.add(
                        new Comment(
                                resultSet.getInt(1),
                                getUserByCommentId(resultSet.getInt(1)),
                                post,
                                resultSet.getString(2),
                                toCalendar(resultSet.getDate(3))
                        )
                );
            }
            Collections.reverse(ret);
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Comment createComment(Comment comment) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO \"comment\" (_text, _date) VALUES\n" +
                            "  (?, ?)"
            );
            java.sql.Date date = toDate(comment.getDate());
            ps.setString(1, comment.getText());
            ps.setDate(2, date);
            ps.executeUpdate();
            ps = conn.prepareStatement("SELECT max(id) FROM \"comment\" WHERE _date = ?");
            ps.setDate(1, date);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;
            comment.setId(rs.getInt(1));

            ps = conn.prepareStatement(
                    "INSERT INTO \"user_comment\" (user_id, comment_id) VALUES\n" +
                            "  (?, ?)"
            );
            ps.setInt(1, comment.getAuthor().getId());
            ps.setInt(2, comment.getId());
            ps.executeUpdate();

            ps = conn.prepareStatement(
                    "INSERT INTO \"post_comment\" (post_id, comment_id) VALUES\n" +
                            " (?, ?) "
            );
            ps.setInt(1, comment.getPost().getId());
            ps.setInt(2, comment.getId());
            ps.executeUpdate();
            return comment;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private static User getUserByCommentId(int commId) {

        Connection conn = DBConnection.getConnection();

        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(
                    "SELECT \"user\".id FROM\n" +
                            "    \"user\" JOIN \"user_comment\" ON \"user\".id = \"user_comment\".user_id\n" +
                            "  WHERE \"user_comment\".comment_id = ?"
            );
            ps.setInt(1, commId);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;
            return UserDao.getUserById(rs.getInt(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

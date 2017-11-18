package dao;

import com.sun.org.apache.regexp.internal.RE;
import entities.Comment;
import entities.Post;
import entities.Tag;
import entities.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static main_package.Helper.toCalendar;

public class PostDao {

    public static List<Post> getPostsByTag(Tag tag) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT \"post\".id, \"post\"._text, \"post\"._date, \"post\".likes FROM\n" +
                            "  (\"tag\" JOIN \"post_tags\" ON \"tag\".id = \"post_tags\".tag_id) AS\n" +
                            "  tagpost JOIN  \"post\" ON tagpost.post_id = \"post\".id\n" +
                            "  WHERE tagpost.tag_id = ?"
            );
            ps.setInt(1, tag.getId());
            ResultSet rs = ps.executeQuery();
            ArrayList<Post> ret = new ArrayList<>();
            while (rs.next()) {
                ret.add(
                        new Post(
                                rs.getInt(1),
                                rs.getString(2),
                                toCalendar(rs.getDate(3)),
                                rs.getInt(4)
                        )
                );
            }
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Post> getUserPost(User user) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement prepareStatement = conn.prepareStatement(
                    "SELECT \"post\".id, \"post\"._text, \"post\"._date, \"post\".likes FROM\n" +
                            "  (\"user\" JOIN \"user_posts\" ON \"user\".id = \"user_posts\".user_id)\n" +
                            "    AS kek  JOIN \"post\" ON kek.post_id = \"post\".id\n" +
                            "    WHERE kek.id = ? ORDER BY kek.id ASC;"
            );
            prepareStatement.setInt(1, user.getId());
            ResultSet resultSet = prepareStatement.executeQuery();
            ArrayList<Post> posts = new ArrayList<>();
            while (resultSet.next()) {
                posts.add(new Post(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        toCalendar(resultSet.getDate(3)),
                        resultSet.getInt(4)
                ));
            }
            return posts;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Post getPostById(int id) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT * FROM \"post\" WHERE id = ?"
            );
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;
            return new Post(
                    rs.getInt(1),
                    rs.getString(2),
                    toCalendar(rs.getDate(3)),
                    rs.getInt(4)
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Post> search(String pattern) {
        Connection conn = DBConnection.getConnection();
        try {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(
                    "SELECT *\n" +
                            "  FROM \"post\"  AS P1\n" +
                            "WHERE P1._text LIKE '%" + pattern + "%';"
            );
            ArrayList<Post> ret = new ArrayList<>();
            while (rs.next()) {
                ret.add(new Post(
                        rs.getInt(1),
                        rs.getString(2),
                        toCalendar(rs.getDate(3)),
                        rs.getInt(4)
                ));
            }
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Post> search(String pattern, List<String> tags) {
        StringBuilder sb = new StringBuilder(
                "SELECT *\n" +
                        "FROM \"post\"  AS P1\n" +
                        "WHERE (\n" +
                        "        SELECT COUNT(*) FROM\n" +
                        "  (SELECT P2.id\n" +
                        "   FROM \"tag\" AS P2\n");
        if (!tags.isEmpty()) {
            sb.append("WHERE P2.tag = '" + tags.get(0) + "' ");
            for (int i = 1; i < tags.size(); ++i) {
                String cur = tags.get(i);
                sb.append("OR P2.tag = '" + cur + "' ");
            }
        }
        sb.append("\n" +
//
                        "   EXCEPT\n" +
                        "   SELECT P3.tag_id\n" +
                        "   FROM \"post_tags\" AS P3\n" +
                        "   WHERE P3.post_id = P1.id) AS KEK)\n" +
                        "  = 0\n" +
                        "  AND\n" +
                        "  P1._text LIKE '%" + pattern + "%'");
        String query = sb.toString();
        System.out.println("query = " + query);
        Connection conn = DBConnection.getConnection();
        Statement statement = null;
        try {
            statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(query);
            ArrayList<Post> ret = new ArrayList<>();

            while (rs.next()) {
                ret.add(new Post(
                        rs.getInt(1),
                        rs.getString(2),
                        toCalendar(rs.getDate(3)),
                        rs.getInt(4)
                ));
            }
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void incrementLikes(int id, int likes) {
        ++likes;
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(
                    "UPDATE \"post\" SET likes = ?" +
                            "WHERE id = ?"
            );
            ps.setInt(1, likes);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

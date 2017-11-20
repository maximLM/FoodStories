package dao;

import com.sun.org.apache.regexp.internal.RE;
import entities.Comment;
import entities.Post;
import entities.Tag;
import entities.User;
import main_package.Helper;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import static main_package.Helper.toCalendar;

public class PostDao {

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
                posts.get(posts.size() - 1).setPhotos(
                        PostDao.getPhotoByPost(
                                posts.get(posts.size() - 1)
                        )
                );
            }
            Collections.reverse(posts);
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


    public static List<Post> search(String pattern, List<String> tags) {

        String query = "SELECT P6.post_id, P6._text, P6._date, P6.likes, P6.user_id, P6.login, P6.photo FROM\n" +
                "(\n" +
                "  (\n" +
                "    (\n" +
                "      SELECT *\n" +
                "          FROM \"post\"  AS P1\n" +
                "          WHERE \n" +
                "          P1._text LIKE '%" + pattern + "%'\n";

        if (!tags.isEmpty()) {
            query += "AND\n" +
                    "          (\n" +
                    "            SELECT COUNT(*) FROM\n" +
                    "              (\n" +
                    "                SELECT P2.id\n" +
                    "                FROM \"tag\" AS P2\n" +
                    "                WHERE P2.tag = '" + tags.get(0) + "' ";
            for (int i = 1; i < tags.size(); ++i) {
                query += "OR P2.tag = '" + tags.get(i) + "' ";
            }
            query += "\n" +
                    "                EXCEPT\n" +
                    "                SELECT P3.tag_id\n" +
                    "                FROM \"post_tags\" AS P3\n" +
                    "                WHERE P3.post_id = P1.id\n" +
                    "              ) AS KEK\n" +
                    "          ) = 0";
        }

        query += ") AS P4\n" +
                "\n" +
                "    JOIN \"user_posts\" ON P4.id = \"user_posts\".post_id\n" +
                "  ) AS P5\n" +
                "  JOIN  \"user\" ON P5.user_id = \"user\".id\n" +
                ") AS P6";

        /*
SELECT P6.post_id, P6._text, P6._date, P6.likes, P6.user_id, P6.login, P6.photo FROM
(
  (
    (
      SELECT *
          FROM "post"  AS P1
          WHERE
          P1._text LIKE '%ate%'
          AND
          (
            SELECT COUNT(*) FROM
              (
                SELECT P2.id
                FROM "tag" AS P2
                WHERE P2.tag = 'spahish' OR P2.tag = 'british'
                EXCEPT
                SELECT P3.tag_id
                FROM "post_tags" AS P3
                WHERE P3.post_id = P1.id
              ) AS KEK
          ) = 0

    ) AS P4

    JOIN "user_posts" ON P4.id = "user_posts".post_id
  ) AS P5
  JOIN  "user" ON P5.user_id = "user".id
) AS P6


SELECT P6.post_id, P6._text, P6._date, P6.likes, P6.user_id, P6.login, P6.photo FROM
(
  (
    (
      SELECT *
          FROM "post"  AS P1
          WHERE
          P1._text LIKE '%ate%'
    ) AS P4

    JOIN "user_posts" ON P4.id = "user_posts".post_id
  ) AS P5
  JOIN  "user" ON P5.user_id = "user".id
) AS P6
         */

        System.out.println("query = " + query);
        Statement statement;
        Connection conn = DBConnection.getConnection();
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
                ret.get(ret.size() - 1).setAuthor(
                        new User(
                                rs.getInt(5),
                                rs.getString(6),
                                rs.getString(7)
                        )
                );
                ret.get(ret.size() - 1).setPhotos(getPhotoByPost(
                        ret.get(ret.size() - 1)
                ));
            }
            Collections.reverse(ret);
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

    public static Post createPost(Post post) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO \"post\"(_text, _date, likes)\n" +
                            "    VALUES\n" +
                            "      (?, ?, ?)"
            );
            java.sql.Date date = Helper.toDate(post.getDate());
            ps.setString(1, post.getText());
            ps.setDate(2, date);
            ps.setInt(3, post.getLikes());
            ps.executeUpdate();
            ps = conn.prepareStatement(
                    "SELECT * FROM \"post\"\n" +
                            "WHERE \"post\".id = (" +
                            "SELECT max(id) FROM \"post\"" +
                            ")"
            );

            ResultSet rs = ps.executeQuery();

            if (rs.next()) post = new Post(
                    rs.getInt(1),
                    rs.getString(2),
                    toCalendar(rs.getDate(3)),
                    rs.getInt(4)
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

    public static void addTag(Post post, Tag tag) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO \"post_tags\" (post_id, tag_id)\n" +
                            "VALUES(?, ?)"
            );
            ps.setInt(1, post.getId());
            ps.setInt(2, tag.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<String> getPhotoByPost(Post post) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT \"post_photo\".photo FROM \"post_photo\"\n" +
                            "WHERE \"post_photo\".post_id = ?"
            );
            ps.setInt(1, post.getId());
            ResultSet rs = ps.executeQuery();
            ArrayList<String> ret = new ArrayList<>();
            while (rs.next()) {
                ret.add(rs.getString(1));
            }
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    public static void addPhoto(Post post, String photo) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO \"post_photo\" (post_id, photo) VALUES\n" +
                            "(?, ?)"
            );
            ps.setInt(1, post.getId());
            ps.setString(2,photo);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

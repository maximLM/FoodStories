package dao;

import entities.Post;
import entities.Tag;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TagDao {


    public static List<Tag> getAllTags() {
        Connection conn = DBConnection.getConnection();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(
                    "SELECT * FROM \"tag\""
            );
            ArrayList<Tag> ret = new ArrayList<>();
            while (rs.next()) {
                ret.add(
                        new Tag(
                                rs.getInt(1),
                                rs.getString(2)
                        )
                );
            }
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Tag> getPostTags(Post post) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT \"tag\".id, \"tag\".tag FROM\n" +
                            "  (\"post\" JOIN \"post_tags\" ON \"post\".id = \"post_tags\".post_id) AS\n" +
                            "  kek JOIN \"tag\" ON kek.tag_id = \"tag\".id WHERE kek.post_id = ?"
            );
            ps.setInt(1, post.getId());
            ResultSet rs = ps.executeQuery();
            ArrayList<Tag> ret = new ArrayList<>();
            while (rs.next()) {
                ret.add(
                        new Tag(
                                rs.getInt(1),
                                rs.getString(2)
                        )
                );
            }
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Tag getTagByName(String tag) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT * FROM \"tag\"\n " +
                            "WHERE \"tag\".tag = ?"
            );
            ps.setString(1,tag);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
                return new Tag(rs.getInt(1),
                        rs.getString(2));
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Tag createTag(String s) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO \"tag\"(tag) \n" +
                            "VALUES(?)"
            );
            ps.setString(1,s);
            ps.executeUpdate();
            return getTagByName(s);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Tag> getPopularTags() {
        ArrayList<Tag> ret = new ArrayList<>();
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT t.id, t.tag FROM \"tag\" AS t\n" +
                            "ORDER BY (SELECT COUNT(*) FROM \"post_tags\" WHERE \"post_tags\".tag_id = t.id) DESC"
            );
            ResultSet rs = ps.executeQuery();
            while (rs.next() && ret.size() < 8)
                ret.add(new Tag(rs.getInt(1), rs.getString(2)));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret;
    }
}

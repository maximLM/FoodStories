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

    private static List<Tag> getPostTags(Post post) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT (\"tag\".id, \"tag\".tag) FROM\n" +
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
}

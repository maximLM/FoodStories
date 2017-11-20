package dao;

import com.sun.org.apache.regexp.internal.RE;
import entities.Post;
import entities.User;
import main_package.Helper;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;

import static main_package.Helper.toCalendar;

public class UserDao {

    public static boolean existsWithLogin(String login) {
        Connection conn = DBConnection.getConnection();

        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM \"user\" WHERE login = ?");
            ps.setString(1, login);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static User getUserByLoginAndPass(String login, String pass) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM \"user\" " +
                    "WHERE login = ? AND password = ?");
            ps.setString(1, login);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;
            int ind = 0;
            User user = new User(rs.getInt(++ind),
                    rs.getString(++ind),
                    rs.getString(++ind),
                    rs.getString(++ind),
                    rs.getString(++ind),
                    toCalendar(rs.getDate(++ind)),
                    rs.getString(++ind),
                    toCalendar(rs.getDate(++ind)),
                    false,
                    rs.getString(++ind)
            );
            ind = 0;
            if (getAdminId() == user.getId()) user.setAdmin(true);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    public static User createUser(String login,
                                  String password,
                                  String name,
                                  String email,
                                  Calendar birthday,
                                  String city,
                                  Calendar registred) {
        Connection conn = DBConnection.getConnection();
        try {
            java.sql.Date dateB = Helper.toDate(birthday);
            java.sql.Date dateR = Helper.toDate(registred);
            PreparedStatement ps = conn.prepareStatement("INSERT INTO \"user\" (login, password, name, email, birthday, city, registred, photo) " +
                    "VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, login);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setDate(5, dateB);
            ps.setString(6, city);
            ps.setDate(7, dateR);
            ps.setString(8, "kek.jpg");
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return getUserByLoginAndPass(login, password);
    }


    private static int getAdminId() {
        int id = -1;
        Connection conn = DBConnection.getConnection();
        try {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT id FROM \"status\" WHERE status");
            if (rs.next())
                id = rs.getInt(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public static User getUserById(int id) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM \"user\" " +
                    "WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;
            int ind = 0;
            User user = new User(rs.getInt(++ind),
                    rs.getString(++ind),
                    rs.getString(++ind),
                    rs.getString(++ind),
                    rs.getString(++ind),
                    toCalendar(rs.getDate(++ind)),
                    rs.getString(++ind),
                    toCalendar(rs.getDate(++ind)),
                    false,
                    rs.getString(++ind)
            );
            ind = 0;
            if (getAdminId() == user.getId()) user.setAdmin(true);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void updateUser(User user) {

        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "UPDATE \"user\" SET\n" +
                            "  login = ?,\n" +
                            "  password = ?,\n" +
                            "  name = ?,\n" +
                            "  email = ?,\n" +
                            "  birthday = ?,\n" +
                            "  city = ?,\n" +
                            "  registred = ?\n," +
                            "  photo = ?\n" +
                            "  WHERE id = ?"
            );
            int ind = 0;
            System.out.println("USER IN DAO = " + user);
            ps.setString(++ind, user.getLogin());
            ps.setString(++ind, user.getPassword());
            ps.setString(++ind, user.getName());
            ps.setString(++ind, user.getEmail());
            ps.setDate(++ind, Helper.toDate(user.getBirthday()));
            ps.setString(++ind, user.getCity());
            ps.setDate(++ind, Helper.toDate(user.getRegister()));
            ps.setString(++ind, user.getPhoto());
            ps.setInt(++ind, user.getId());
            ind = 0;
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static User getAuthor(Post post) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT user_id FROM\n" +
                            "  \"user_posts\" WHERE post_id = ?"
            );
            ps.setInt(1, post.getId());
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return null;
            return getUserById(rs.getInt(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void addPost(User author, Post post) {
        Connection conn = DBConnection.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO \"user_posts\" (user_id, post_id) \n" +
                            "VALUES(?, ?)"
            );
            ps.setInt(1, author.getId());
            ps.setInt(2, post.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

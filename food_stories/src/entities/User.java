package entities;

import java.util.Calendar;

public class User {
    private int id;
    private String login;
    private String name;
    private String email;
    private Calendar birthday;
    private Calendar register;
    private String city;
    private String password;
    private boolean admin;

    public User(int id,
                String login,
                String password,
                String name,
                String email,
                Calendar birthday,
                String city,
                Calendar register,
                boolean admin) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.name = name;
        this.email = email;
        this.birthday = birthday;
        this.register = register;
        this.city = city;
        this.admin = admin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Calendar getBirthday() {
        return birthday;
    }

    public void setBirthday(Calendar birthday) {
        this.birthday = birthday;
    }

    public Calendar getRegister() {
        return register;
    }

    public void setRegister(Calendar register) {
        this.register = register;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "User\nlogin = " + login + "\nname = " + name + "\nbirthday = " + birthday;
    }

    public String getPassword() {
        return password;
    }
}

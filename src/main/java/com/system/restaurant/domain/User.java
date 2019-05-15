package com.system.restaurant.domain;

public class User {

    private int user_id;
    private String name;
    private String login;
    private String password;
    private String email;
    private String user_type;


    public User(int user_id, String name, String login, String password, String email, String user_type) {
        this.user_id = user_id;
        this.name = name;
        this.login = login;
        this.password = password;
        this.email = email;
        this.user_type = user_type;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }
}

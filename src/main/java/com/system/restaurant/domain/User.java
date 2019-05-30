package com.system.restaurant.domain;

import lombok.Data;

import java.util.List;

@Data
public class User {

    private int user_id;
    private String name;
    private String login;
    private List<Phone> phone;
    private String password;
    private String email;
    private String user_type;

    public User() {}

    public User(String name, String login, String password) {
        this.name = name;
        this.login = login;
        this.password = password;
    }
    private class Phone {
        private String Phone1;
        private String Phone2;
    }
}

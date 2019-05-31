package com.system.restaurant.repository;

import com.system.restaurant.domain.User;

import java.util.ArrayList;

public interface UserRepository {
    ArrayList<User> userList();

    User findById(int id);

    int post(User userdata);

    int put(User userdata);

    int delete(int user_id);
}

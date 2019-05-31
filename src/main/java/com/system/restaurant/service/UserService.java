package com.system.restaurant.service;

import com.system.restaurant.domain.User;
import com.system.restaurant.repository.UserRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class UserService {

    @Resource
    UserRepository userRepository;

    public ArrayList<User> userList() {
        return userRepository.userList();
    }

    public User findById(int id) {
        return userRepository.findById(id);
    }

    public int post(User userdata) {
        return userRepository.post(userdata);
    }

    public int put(User userdata) {
        return userRepository.put(userdata);
    }

    public int delete(int user_id) {
        return userRepository.delete(user_id);
    }
}

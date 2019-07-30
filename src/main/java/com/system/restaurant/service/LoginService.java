package com.system.restaurant.service;

import com.system.restaurant.controller.LoginDto;
import com.system.restaurant.domain.User;
import com.system.restaurant.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private UserRepository userRepository;

    public User isUser(LoginDto loginDto) {
        return userRepository.findByUserLogin(loginDto.getUser_login());
    }

    public User isUserPassword(LoginDto loginDto) {
        return userRepository.findByUserPassword(loginDto);
    }
}

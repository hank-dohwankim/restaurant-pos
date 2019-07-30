package com.system.restaurant.controller;

import com.system.restaurant.domain.User;
import com.system.restaurant.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;

@Controller
public class UserController {

    @Resource
            UserService userService;

    /**
     * USER LIST jsp
     * @param model
     * @return
     */
    @RequestMapping(value = "/user.do", method = RequestMethod.GET)
    public String userList(ModelMap model) {
        ArrayList<User> userList = userService.userList(); //== (user.getUserName(),,,,);
        model.addAttribute("userList", userList);

        return "userList";
    }

    /**
     * USER LIST api
     * @return
     */
    @RequestMapping(value = "/users")
    public ResponseEntity<ArrayList<User>> userList2() {
        ArrayList<User> userList = userService.userList();
        return new ResponseEntity<ArrayList<User>>(userList, HttpStatus.ACCEPTED);
    }

    // USER SEARCH BY ID
    @RequestMapping(value = "/users/{user_id}")
    public ResponseEntity<User> userDetail(@PathVariable("user_id") int user_id) {
        User user = userService.findById(user_id);
        return new ResponseEntity<>(user, HttpStatus.ACCEPTED);
    }


    // ADD USER
    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public ResponseEntity<User> userPost(@ModelAttribute User userData) {
        int affected = userService.post(userData);
        return new ResponseEntity<>(new User(), HttpStatus.ACCEPTED);
    }


    // MODIFY USER
    @RequestMapping(value = "/users/{user_id}", method = RequestMethod.PUT)
    public ResponseEntity<User> userPut(@RequestBody User userData) {
        int affected = userService.put(userData);
        return new ResponseEntity<>(new User(), HttpStatus.ACCEPTED);
    }

    // DELETE USER
    @RequestMapping(value = "/users/{user_id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> userDelete(@PathVariable("user_id") int user_id) {
        int affected = userService.delete(user_id);
        return new ResponseEntity<>(new User(), HttpStatus.ACCEPTED);
    }
}

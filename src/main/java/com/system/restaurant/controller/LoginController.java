package com.system.restaurant.controller;

import com.system.restaurant.domain.User;
import com.system.restaurant.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("/doLogin")
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public ResponseEntity<HashMap> doLogin(@RequestBody LoginDto loginDto, HttpServletRequest request) {

        HashMap returnMap = new HashMap();
        User user = loginService.isUser(loginDto);
        if(user != null) {
            // PASSWORD CHECK
            User userPassword = loginService.isUserPassword(loginDto);
            if(userPassword != null) {
                // LOGIN CHECK
                HttpSession session = request.getSession(true);
                session.setAttribute("user", userPassword);

                returnMap.put("message", "LOGIN");
            } else {
                // PASSWORD ERROR HANDLING
                returnMap.put("message", "PASS_NOT_MATCH");
            }
        } else {
            //  ID ERROR HANDLING
            returnMap.put("message", "ID_NOT_MATCH");
        }

        return new ResponseEntity<>(returnMap, HttpStatus.ACCEPTED);
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if( user != null ) {
            session.invalidate();
        }
        return "login";
    }

    // ACCESS DENY PAGE
    @RequestMapping("/access_deny.do")
    public String access_deny() {
        return "access_deny";
    }

}

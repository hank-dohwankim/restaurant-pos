package com.system.restaurant.controller;

import com.system.restaurant.domain.Menu;
import com.system.restaurant.domain.Terminal;
import com.system.restaurant.domain.User;
import com.system.restaurant.service.MenuService;
import com.system.restaurant.service.TerminalService;
import com.system.restaurant.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.ArrayList;

@Controller
public class TerminalController {

    @Resource
    TerminalService terminalService;

    @Resource
    MenuService menuService;

    @Resource
    UserService userService;
    /**
     * TERMINAL jsp
     * @param model
     * @return
     */
    @RequestMapping(value = "/terminal.do", method = RequestMethod.GET)
    public String terminalList(ModelMap model) {
        ArrayList<Terminal> terminalList = terminalService.terminalList();
        model.addAttribute("terminalList", terminalList);
        ArrayList<Menu> menuList = menuService.menuList();
        model.addAttribute("menuList", menuList);
        ArrayList<User> userList = userService.userList();
        model.addAttribute("userList", userList);


        return "terminalList";
    }

    /**
     * TERMINAL api
     * @return
     */
    @RequestMapping(value = "/terminals")
    public ResponseEntity<ArrayList<Terminal>> terminalList2() {
        ArrayList<Terminal> terminalList = terminalService.terminalList();
        return new ResponseEntity<ArrayList<Terminal>>(terminalList, HttpStatus.ACCEPTED);
    }

    /**
     * ADD order IN TERMINAL PAGE
     */
    @RequestMapping(value = "/terminals", method = RequestMethod.POST)
    public ResponseEntity<Terminal> terminalPost (@RequestBody OrderRequestVO orderRequestVO)  {

        try {
            terminalService.post(orderRequestVO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(new Terminal(), HttpStatus.ACCEPTED);
    }
}


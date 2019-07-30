package com.system.restaurant.controller;

import com.system.restaurant.domain.Menu;
import com.system.restaurant.service.MenuService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


import javax.annotation.Resource;
import java.util.ArrayList;

@Controller
public class MenuController {

    @Resource
    // DI WITH OBJECT NAME. CREATE Bean, ADJUST SINGLETON
    // CALL getMenuService() WITHOUT CREATE OBJECT
    MenuService menuService;

    /**
     * MENU LIST jsp
     * @param model
     * @return
     */

    @RequestMapping(value = "/menu.do", method = RequestMethod.GET)
    // ACCESS 'menuList' METHOD WHEN USER REQUEST
    public String menuList(ModelMap model) {
        ArrayList<Menu> menuList = menuService.menuList(); //== (menu.getMenuName(),,,,);
        model.addAttribute("menuList", menuList);
        /*addAttribute ADD method.
          INJECT menuList OBJECT TO MenuService class
         */
        return "menuList";
    }

    /**
     * MENU LIST api
     * @return
     */
    @RequestMapping(value = "/menus")
    public ResponseEntity<ArrayList<Menu>> menuList2() {
        ArrayList<Menu> menuList = menuService.menuList();
        return new ResponseEntity<ArrayList<Menu>>(menuList, HttpStatus.ACCEPTED);
    }

    // CHECK 1 ITEM IN LIST
    @RequestMapping(value = "/menus/{menu_id}")
    public ResponseEntity<Menu> menuDetail(@PathVariable("menu_id") int menu_id) {
        Menu menu = menuService.findById(menu_id);
        return new ResponseEntity<>(menu, HttpStatus.ACCEPTED);
    }

    // MENU REGISTER
    // formdata submit => @ModelAttribute Menu menuData
    // json => @RequestBody Menu menuData DATA FLOW
    @RequestMapping(value = "/menus", method = RequestMethod.POST)
    public ResponseEntity<Menu> menuPost(@ModelAttribute Menu menuData) {
        int affected = menuService.post(menuData);
        return new ResponseEntity<>(new Menu(), HttpStatus.ACCEPTED);
    }

    // MODIFY
    @RequestMapping(value = "/menus/{menu_id}", method = RequestMethod.PUT)
    public ResponseEntity<Menu> menuPut(@RequestBody Menu menuData) {
        int affected = menuService.put(menuData);
        return new ResponseEntity<>(new Menu(), HttpStatus.ACCEPTED);
    }

    // DELETE
    @RequestMapping(value = "/menus/{menu_id}", method = RequestMethod.DELETE)
    public ResponseEntity<Menu> menuDelete(@PathVariable("menu_id") int menu_id) {
        int affected = menuService.delete(menu_id);
        return new ResponseEntity<>(new Menu(), HttpStatus.ACCEPTED);
    }
}


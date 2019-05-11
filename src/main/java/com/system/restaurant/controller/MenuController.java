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
//    private MenuRepository repository;
    MenuService menuService;

    /**
     * 메뉴 목록 jsp
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/menu.do", method = RequestMethod.GET)
    public String menulist(ModelMap modelMap) {
        ArrayList<Menu> menulist = menuService.menulist();
        modelMap.put("menulist", menulist);
        return "menulist";
    }

    /**
     * 메뉴 목록 api
     * @return
     */
    @RequestMapping(value = "/menus")
    public ResponseEntity<ArrayList<Menu>> menulist2() {
        ArrayList<Menu> menulist = menuService.menulist();
        return new ResponseEntity<ArrayList<Menu>>(menulist, HttpStatus.ACCEPTED);
    }

    // 메뉴 1건 조회
    //menus?id=1
    //menus/1
    @RequestMapping(value = "/menus/{menu_id}")
    public ResponseEntity<Menu> menuDetail(@PathVariable("menu_id") int menu_id) {
        Menu menu = menuService.findOne(menu_id);
        return new ResponseEntity<>(menu, HttpStatus.ACCEPTED);
    }


    //  등록
    // formdata submit => @ModelAttribute Menu menudata
    // json => @RequestBody Menu menudata
    @RequestMapping(value = "/menus", method = RequestMethod.POST)
    public ResponseEntity<Menu> menuPost(@ModelAttribute Menu menudata) {
        Menu menu = menuService.post(menudata);
        return new ResponseEntity<>(menu, HttpStatus.ACCEPTED);
    }


    // 수정
    @RequestMapping(value = "/menus/{menu_id}", method = RequestMethod.PUT)
    public ResponseEntity<Menu> menuPut(@ModelAttribute Menu menudata) {
        Menu menu = menuService.put(menudata);
        return new ResponseEntity<>(menu, HttpStatus.ACCEPTED);
    }

    // 삭제
    @RequestMapping(value = "/menus/{menu_id}", method = RequestMethod.DELETE)
    public ResponseEntity<Menu> menuDelete(@PathVariable("menu_id") int menu_id) {
        int affected = menuService.delete(menu_id);
        return new ResponseEntity<>(null, HttpStatus.ACCEPTED);
    }
}

package com.system.restaurant.service;

import com.system.restaurant.domain.Menu;
import com.system.restaurant.repository.MenuRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class MenuService {

    @Resource
    MenuRepository menuRepository;

    public ArrayList<Menu> menuList() {
        return menuRepository.menuList();
    }

    public Menu findById(int id) {
        return menuRepository.findById(id);
    }

    public int post(Menu menuData) {
        return menuRepository.post(menuData);
    }

    public int put(Menu menuData) {
        return menuRepository.put(menuData);
    }

    public int delete(int menu_id) {
        return menuRepository.delete(menu_id);
    }
}

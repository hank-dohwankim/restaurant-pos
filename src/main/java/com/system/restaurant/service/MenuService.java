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

    public ArrayList<Menu> menulist() {
      return menuRepository.menulist();
    }

    public Menu findOne(int id) {
        return menuRepository.findOne(id);
    }

    public Menu post(Menu menudata) {
        return menuRepository.post(menudata);
    }

    public Menu put(Menu menudata) {
        return menuRepository.put(menudata);
    }

    public int delete(int menu_id) {
        return menuRepository.delete(menu_id);
    }
}

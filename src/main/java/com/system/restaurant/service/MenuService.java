package com.system.restaurant.service;

import com.system.restaurant.domain.Menu;
import com.system.restaurant.repository.MenuRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service // 해당 class 가 service 라는 것을 알려주기 위해 annotation @Service
public class MenuService {

    @Resource
    MenuRepository menuRepository;

    public ArrayList<Menu> menuList() {
        // Service 에서 해당 서비스에 맞는 Data 를 불러오기 위해 DAO 생성
        return menuRepository.menuList();
        // Repository 에 DAO 에서 불러온 List 값을 return.
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

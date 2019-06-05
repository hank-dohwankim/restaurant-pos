package com.system.restaurant.repository;

import com.system.restaurant.domain.Menu;

import java.util.ArrayList;

public interface MenuRepository {
    ArrayList<Menu> menuList();
    // Service 에서 사용하기 위한 Domain 의 List 를 생성했다.

    Menu findById(int id);

    int post(Menu menuData);

    int put(Menu menuData);

    int delete(int menu_id);
}

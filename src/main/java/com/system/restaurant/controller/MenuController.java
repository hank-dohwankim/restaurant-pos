package com.system.restaurant.controller;

import com.system.restaurant.domain.Menu;
import com.system.restaurant.service.MenuService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import java.util.ArrayList;

//아래의 Class 를 controller 로 모듈화 시키는 Tag
@Controller
public class MenuController {

    @Resource
    // 객체 생성 없이 getMenuService()를 호출할 수 있다.
    //@Autowired
    MenuService menuService;

    /**
     * 메뉴 목록 jsp
     * @param model
     * @return
     */
    @RequestMapping(value = "/menu.do", method = RequestMethod.GET)
    // '/menu' 라는 요청이 들어왔을 때 'menuList' method 를 실행한다
    //public String menuList(Model, model, HttpServletRequest request){
    public String menuList(ModelMap model) {
        /*Menu 클래스의 'ModelMap model' -> menuList() method 실행 후
         View 에서 활용되는 데이터 담고 있는 object*/

        /*menuList 라는 command object 를 생성, 이 object 에 getter 를 이용해서 service 에 전달하는 작업
        view, controller 등에서 파일에서 menuList.menu_name 등으로 객체의 data 를 가져와서 사용할 수 있다.
        Spring container 안에서 위와 같은 기능이 동작하도록 지원한다.
        */

        /* 개발자는 Model object 에 데이터를 담아서 DispatcherServlet 에 전달한다.
            DispatcherServlet 에 전달된 Model 데이터는 View 에서 가공되어 client 에게
            응답처리된다.
         */

        /*Menu 클래스 속성을 갖는 menuList object를 생성한 뒤
         getter로 받은 Menu class의 variable들을 menuList를 통해 menuService로 전달한다.
        */


        /*@ModelAttribute 를 사용하면 command object 의 이름을 변경할 수 있고, 이렇게 변경된 이름은
        view 에서 command object 를참조할 때 사용된다.
        public String menuRemove(@ModelAttribueAttribute('menu') Member member)
        */
        ArrayList<Menu> menuList = menuService.menuList(); //== (menu.getMenuName(),,,,);
        model.addAttribute("menuList", menuList);
        /*addAttribute 속성을 추가해주는 method.
          MenuService class 의 menuList 객체의 속성을 주입한다.
         */

        return "menuList";
        /* mvc-config.xml 의 코드에서 '.jsp' 와 return 값 "menuList" 가 합쳐져 응답해주는
        view 페이지 주소를 나타낸다. 'menuList.jsp'
        <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/view/"/>
        <property name="suffix" value=".jsp"/>
        </bean>
         */
    }

    /**
     * 메뉴 목록 api
     * @return
     */
    @RequestMapping(value = "/menus")
    public ResponseEntity<ArrayList<Menu>> menuList2() {
        ArrayList<Menu> menuList = menuService.menuList();
        return new ResponseEntity<ArrayList<Menu>>(menuList, HttpStatus.ACCEPTED);
    }

    // 메뉴 1건 조회 시
    //menus?id=1
    //menus/1
    @RequestMapping(value = "/menus/{menu_id}")
    public ResponseEntity<Menu> menuDetail(@PathVariable("menu_id") int menu_id) {
        Menu menu = menuService.findById(menu_id);
        return new ResponseEntity<>(menu, HttpStatus.ACCEPTED);
    }


    // 메뉴 등록
    // formdata submit => @ModelAttribute Menu menuData
    // json => @RequestBody Menu menuData 테이터의 흐름
    @RequestMapping(value = "/menus", method = RequestMethod.POST)
    public ResponseEntity<Menu> menuPost(@ModelAttribute Menu menuData) {
        int affected = menuService.post(menuData);
        return new ResponseEntity<>(new Menu(), HttpStatus.ACCEPTED);
    }


    // 수정
    @RequestMapping(value = "/menus/{menu_id}", method = RequestMethod.PUT)
    public ResponseEntity<Menu> menuPut(@RequestBody Menu menuData) {
        int affected = menuService.put(menuData);
        return new ResponseEntity<>(new Menu(), HttpStatus.ACCEPTED);
    }

    // 삭제
    @RequestMapping(value = "/menus/{menu_id}", method = RequestMethod.DELETE)
    public ResponseEntity<Menu> menuDelete(@PathVariable("menu_id") int menu_id) {
        int affected = menuService.delete(menu_id);
        return new ResponseEntity<>(new Menu(), HttpStatus.ACCEPTED);
    }
}

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

//아래의 Class 를 controller 로 모듈화 시키는 Tag
@Controller
public class UserController {

    @Resource
            UserService userService;

    /**
     * 메뉴 목록 jsp
     * @param model
     * @return
     */
    @RequestMapping(value = "/user.do", method = RequestMethod.GET)
    // '/user' 라는 요청이 들어왔을 때 'userList' method 를 실행한다
    //public String userList(Model, model, HttpServletRequest request){
    public String userList(ModelMap model) {
        /*User 클래스의 'ModelMap model' -> userList() method 실행 후
         View 에서 활용되는 데이터 담고 있는 object*/

        /*userList 라는 command object 를 생성, 이 object 에 getter 를 이용해서 service 에 전달하는 작업
        view, controller 등에서 파일에서 userList.user_name 등으로 객체의 data 를 가져와서 사용할 수 있다.
        Spring container 안에서 위와 같은 기능이 동작하도록 지원한다.
        */

        /* 개발자는 Model object 에 데이터를 담아서 DispatcherServlet 에 전달한다.
            DispatcherServlet 에 전달된 Model 데이터는 View 에서 가공되어 client 에게
            응답처리된다.
         */

        /*User 클래스 속성을 갖는 userList object를 생성한 뒤
         getter로 받은 User class의 variable들을 userList를 통해 userService로 전달한다.
        */


        /*@ModelAttribute 를 사용하면 command object 의 이름을 변경할 수 있고, 이렇게 변경된 이름은
        view 에서 command object 를참조할 때 사용된다.
        public String userRemove(@ModelAttribueAttribute('user') Member member)
        */
        ArrayList<User> userList = userService.userList(); //== (user.getUserName(),,,,);
        model.addAttribute("userList", userList);
        /*addAttribute 속성을 추가해주는 method.
          UserService class 의 userList 객체의 속성을 주입한다.
         */

        return "userList";
        /* mvc-config.xml 의 코드에서 '.jsp' 와 return 값 "userList" 가 합쳐져 응답해주는
        view 페이지 주소를 나타낸다. 'userList.jsp'
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
    @RequestMapping(value = "/users")
    public ResponseEntity<ArrayList<User>> userList2() {
        ArrayList<User> userList = userService.userList();
        return new ResponseEntity<ArrayList<User>>(userList, HttpStatus.ACCEPTED);
    }

    // 메뉴 1건 조회 시
    //users?id=1
    //users/1
    @RequestMapping(value = "/users/{user_id}")
    public ResponseEntity<User> userDetail(@PathVariable("user_id") int user_id) {
        User user = userService.findById(user_id);
        return new ResponseEntity<>(user, HttpStatus.ACCEPTED);
    }


    // 메뉴 등록
    // formdata submit => @ModelAttribute User userData
    // json => @RequestBody User userData 테이터의 흐름
    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public ResponseEntity<User> userPost(@ModelAttribute User userData) {
        int affected = userService.post(userData);
        return new ResponseEntity<>(new User(), HttpStatus.ACCEPTED);
    }


    // 수정
    @RequestMapping(value = "/users/{user_id}", method = RequestMethod.PUT)
    public ResponseEntity<User> userPut(@RequestBody User userData) {
        int affected = userService.put(userData);
        return new ResponseEntity<>(new User(), HttpStatus.ACCEPTED);
    }

    // 삭제
    @RequestMapping(value = "/users/{user_id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> userDelete(@PathVariable("user_id") int user_id) {
        int affected = userService.delete(user_id);
        return new ResponseEntity<>(new User(), HttpStatus.ACCEPTED);
    }
}

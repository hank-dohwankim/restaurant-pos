package com.system.restaurant.controller;

import com.system.restaurant.domain.Menu;
import com.system.restaurant.domain.Order;
import com.system.restaurant.service.OrderService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class OrderController {

    @Resource
    OrderService orderService;



    /**
     * ORDER LIST jsp
     * @param model
     * @return
     */
    @RequestMapping(value = "/order.do", method = RequestMethod.GET)
        public String orderList(ModelMap model) {
            ArrayList<Order> orderList = orderService.orderList();
            ArrayList<Order> tmpList = new ArrayList<>();
            for (Order o : orderList) {
                if (!o.getCooking_status().equals("Served")) {
                    tmpList.add(o);
                }
            }
            model.addAttribute("orderList", tmpList);

        return "orderList";
    }

    @RequestMapping(value = "/ledge.do", method = RequestMethod.GET)
    public String ledgeList(ModelMap model) {
        ArrayList<Order> ledgeList = orderService.orderList();
        model.addAttribute("orderList", ledgeList);

        return "ledgeList";
    }

    /**
     * ORDER LIST api
     * @return
     */
    @RequestMapping(value = "/orders")
    public ResponseEntity<ArrayList<Order>> orderList2() {
        ArrayList<Order> Orderlist = orderService.orderList();
        return new ResponseEntity<ArrayList<Order>>(Orderlist, HttpStatus.ACCEPTED);
    }

    // CHECK ORDER BY ID
    @RequestMapping(value = "/orders/{order_id}")
    public ResponseEntity<Order> OrderDetail(@PathVariable("order_id") int order_id) {
        Order Order = orderService.findById(order_id);
        return new ResponseEntity<>(Order, HttpStatus.ACCEPTED);
    }

    // ADD ORDER
    @RequestMapping(value = "/orders", method = RequestMethod.POST)
    public ResponseEntity<Order> OrderPost(@RequestBody OrderRequestVO orderRequestVO) {
        return new ResponseEntity<>(new Order(), HttpStatus.ACCEPTED);
    }


    // MODIFY ORDER
    @RequestMapping(value = "/orders/{order_id}", method = RequestMethod.GET)
    public ResponseEntity<Order> OrderPut(@PathVariable("order_id")int order_id,
    		@RequestParam(value="cooking_status")String cooking_status) {
    	Map<String, Object> m = new HashMap<>();
    	m.put("order_detail_id", order_id);
    	m.put("cooking_status", cooking_status);
        int affected = orderService.put(m);
        return new ResponseEntity<>(new Order(), HttpStatus.ACCEPTED);
    }

    // DELETE
    @RequestMapping(value = "/orders/{order_id}", method = RequestMethod.DELETE)
    public ResponseEntity<Order> OrderDelete(@PathVariable("order_id") int order_id) {
        int affected = orderService.delete(order_id);
        return new ResponseEntity<>(new Order(), HttpStatus.ACCEPTED);
    }
}

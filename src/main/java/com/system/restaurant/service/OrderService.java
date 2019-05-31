package com.system.restaurant.service;

import com.system.restaurant.domain.Order;
import com.system.restaurant.repository.OrderRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.ArrayList;

@Service
public class OrderService {

    @Resource
    OrderRepository orderRepository;

    public ArrayList<Order> orderList() {
        return orderRepository.orderList();
    }

    public Order findById(int id) {
        return orderRepository.findById(id);
    }

    public int post(Order orderData) throws SQLException {
        return orderRepository.post(orderData);
    }

    public int put(Order orderData) {
        return orderRepository.put(orderData);
    }

    public int delete(int order_id) {
        return orderRepository.delete(order_id);
    }
}

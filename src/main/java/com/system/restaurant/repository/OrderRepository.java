package com.system.restaurant.repository;

import com.system.restaurant.domain.Order;

import java.util.ArrayList;

public interface OrderRepository {
    ArrayList<Order> orderlist();

    Order findById(int id);

    int post(Order orderdata);

    int put(Order orderdata);

    int delete(int order_id);
}

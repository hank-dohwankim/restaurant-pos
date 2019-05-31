package com.system.restaurant.repository;

import com.system.restaurant.domain.Order;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;

@Repository
public interface OrderRepository {
    ArrayList<Order> orderList();

    Order findById(int id);

    int post(Order orderData) throws SQLException;

    int put(Order orderData);

    int delete(int order_id);
}

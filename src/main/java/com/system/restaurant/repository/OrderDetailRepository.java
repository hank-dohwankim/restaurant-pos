package com.system.restaurant.repository;

import com.system.restaurant.domain.OrderDetail;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;

@Repository
public interface OrderDetailRepository {
    ArrayList<OrderDetail> orderDetailList();

    OrderDetail findById(int id);

    int post(OrderDetail orderDetailData) throws SQLException;

    int put(OrderDetail orderDetailData);

    int delete(int order_detail_id);
}

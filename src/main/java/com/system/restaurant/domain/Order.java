package com.system.restaurant.domain;

import java.util.List;

final class Order {

    private final OrderDetail orderDetail;
    private int order_id;
    private int table_no;
    //    private String waiter;
    private List<User> user;
    private String message;
    private String cooking_status;

    public Order(OrderDetail orderDetail, int order_id, int table_no, String message, String cooking_status, List<User> user) {
        this.orderDetail = orderDetail;
        this.order_id = order_id;
        this.table_no = table_no;
//        this.waiter = waiter;
        this.user = user;
        this.message = message;
        this.cooking_status = cooking_status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getTable_no() {
        return table_no;
    }

    public void setTable_no(int table_no) {
        this.table_no = table_no;
    }

    public List<User> getUser() {
        return user;
    }

    public void setUser(List<User> user) {
        this.user = user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getcooking_status() {
        return cooking_status;
    }

    public void setcooking_status(String cooking_status) {
        this.cooking_status = cooking_status;
    }



    public static class OrderDetail {

        private int order_detail_id;
        private int order_id;
        private List<Menu> menu;
//        private int menu_id;
//        private int menu_price;

        public OrderDetail(int order_detail_id, int order_id, List<Menu> menu) {
            this.order_detail_id = order_detail_id;
            this.order_id = order_id;
            this.menu = menu;
        }

        public int getOrder_detail_id() {
            return order_detail_id;
        }

        public void setOrder_detail_id(int order_detail_id) {
            this.order_detail_id = order_detail_id;
        }

        public int getOrder_id() {
            return order_id;
        }

        public void setOrder_id(int order_id) {
            this.order_id = order_id;
        }

        public List<Menu> getMenu() {
            return menu;
        }

        public void setMenu(List<Menu> menu) {
            this.menu = menu;
        }
    }
}

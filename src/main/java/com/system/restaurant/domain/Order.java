package com.system.restaurant.domain;


import lombok.Data;

@Data
public class Order {

    private int order_id;
    private int order_detail_id;
    private String menu_name;
    private String user_name;
    private String user_id;
    private float menu_price;
    private float total_cost;
    private String cooking_status;
    private String message;

    public Order() {}

    public Order(int order_id, int order_detail_id, String menu_name, String user_name, String user_id, float menu_price, float total_cost, String cooking_status, String message) {
        this.order_id = order_id;
        this.order_detail_id = order_detail_id;
        this.menu_name = menu_name;
        this.user_name = user_name;
        this.user_id = user_id;
        this.menu_price = menu_price;
        this.total_cost = total_cost;
        this.cooking_status = cooking_status;
        this.message = message;
    }
    public Order(int order_detail_id, String cooking_status) {
        this.order_detail_id = order_detail_id;
    }
    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int order_detail_id) {
        this.order_detail_id = order_detail_id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public float getMenu_price() {
        return menu_price;
    }

    public void setMenu_price(float menu_price) {
        this.menu_price = menu_price;
    }

    public float getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(float total_cost) {
        this.total_cost = total_cost;
    }

    public String getCooking_status() {
        return cooking_status;
    }

    public void setCooking_status(String cooking_status) {
        this.cooking_status = cooking_status;
    }
}


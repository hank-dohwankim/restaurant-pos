package com.system.restaurant.domain;



public class Order {

    private int order_id;
    private String user_name;
    private String menu_name;
    private String message;
    private String cooking_status;

    public Order() {}

    public Order(int order_id, String user_name, String menu_name, String message, String cooking_status) {
        this.order_id = order_id;
        this.user_name = user_name;
        this.menu_name = menu_name;
        this.message = message;
        this.cooking_status = cooking_status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCooking_status() {
        return cooking_status;
    }

    public void setCooking_status(String cooking_status) {
        this.cooking_status = cooking_status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", user_name='" + user_name + '\'' +
                ", menu_name='" + menu_name + '\'' +
                ", message='" + message + '\'' +
                ", cooking_status='" + cooking_status + '\'' +
                '}';
    }
}


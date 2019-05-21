package com.system.restaurant.domain;



public class Order {

    private int order_id;
    private String waiter;
    private String message;
    private String cooking_status;

    public Order() {}

    public Order(int order_id, String waiter, String message, String cooking_status) {
        this.order_id = order_id;
        this.waiter = waiter;
        this.message = message;
        this.cooking_status = cooking_status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getWaiter() {
        return waiter;
    }

    public void setWaiter(String waiter) {
        this.waiter = waiter;
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

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", waiter='" + waiter + '\'' +
                ", message='" + message + '\'' +
                ", cooking_status='" + cooking_status + '\'' +
                '}';
    }
}

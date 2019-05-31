package com.system.restaurant.domain;

import lombok.Data;

@Data
public class Terminal {

    private int order_id;
    private int order_detail_id;
    private String user_name;
    private String menu_name;
    private String message;
    private String cooking_status;

    public Terminal() {}

    public Terminal(int order_id, int order_detail_id, String user_name, String menu_name, String message, String cooking_status) {
        this.order_id = order_id;
        this.order_detail_id = order_detail_id;
        this.user_name = user_name;
        this.menu_name = menu_name;
        this.message = message;
        this.cooking_status = cooking_status;
    }
}


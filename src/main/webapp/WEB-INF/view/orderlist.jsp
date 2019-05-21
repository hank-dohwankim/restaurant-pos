<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Order Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        function getOrderNo() { //2019-05-12-123923
            var d = new Date();
            var s =
                leadingZeros(d.getFullYear(), 4) + '-' +
                leadingZeros(d.getMonth() + 1, 2) + '-' +
                leadingZeros(d.getDate(), 2) + '-' +
/**
                leadingZeros(d.getHours(), 2) + ':' +
                leadingZeros(d.getMinutes(), 2) + ':' +
                leadingZeros(d.getSeconds(), 2) + '-' +
**/
                getRandomInt(10000,99999);
            return s;
        }
        function getRandomInt(min, max) {
            min = Math.ceil(min);
            max = Math.floor(max);
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }
        function leadingZeros(n, digits) {
            var zero = '';
            n = n.toString();
            if (n.length < digits) {
                for (i = 0; i < digits - n.length; i++)
                    zero += '0';
            }
            return zero + n;
        }
        var order_no = getOrderNo();
        function remove_order(id){
            $("#"+id).remove();
        }
        function add_order(){
            var waiter = $("#waiter").val();
            var menu_name = $("#menu_name option:selected").val();
            var message = $("#message").val();
            var id = getRandomInt(1111,9999);
            var html = '            <tr id="'+id+'">\n' +
                '                <td>\n' +
                '                    <input type="hidden" name="order_no" value="'+order_no+'" />\n' +
                '                    <input type="text" name="waiter" value="'+waiter+'" class="waiter" />\n' +
                '                </td>\n' +
                '                <td>\n' +
                '                    <input type="text" name="menu_name" value="'+menu_name+'" class="menu_name"/>\n' +
                '                </td>\n' +
                '                <td><input type="text" name="message" value="'+message+'" class="message"></td>\n' +
                '                <td>\n' +
                '                    <button type="button" onClick="remove_order(\''+id+'\');">Remove Order</button>\n' +
                '                </td>\n' +
                '            </tr>\n';
            $("#order_tbody").append(html);
            $("#order_table").show();
            $(".button_order").show();
        }

        // 주문
        $('.button_order').on('click',function(){
            $.ajax({
                type: "POST",
                url: "./orders",
                data: "",
                dataType: "json", contentType: 'application/json',
                success: function (response) {
                debugger
                }
            });
        });
    </script>
    <style>
        .waiter { width: 80px;}
        .menu_name { width: 100px;}
        .message { width: 150px;}
        .cooking_status { width: 90px;}
        #order_table {display: none;}
        .button_order {display: none;}
    </style>
</head>
<body>

<div class="container">
    <div>
        <span> <a href="order.html">1. Order</a></span>
        <span> <a href="kitchen.html">2. Kitchen</a></span>
        <span> <a href="check_out.html">3. Check Out</a></span>
    </div>

    <button class="test_order">test order </button>
    <script>
    $('.test_order').on('click', function() {

var order_obj =
 {
     "order_id": 1,
     "waiter": "mike",
     "message": "test message",
     "cooking_status": "ready",
     "order_detail": [
        {
       "order_detail_id": 1,
       "order_id": 1,
       "menu_id": 1,
       "menu_price": 100},
       {
       "order_detail_id": 1,
       "order_id": 1,
       "menu_id": 1,
       "menu_price": 100
       }
     ]
 };

   $.ajax({
       type: "POST",
       url: "/orders",
       data: JSON.stringify(order_obj),
       dataType: "json", contentType: 'application/json',
       success: function (response) {
           debugger
       }
   });


    });
    </script>
    <h2>Kitchen System Page</h2>
    <table class="table">
        <thead>
        <tr>
<!--            <th>Table No.</th>-->
<!--            <th>Order No.</th>-->
            <th>Waiter</th>
            <th>Order</th>
            <th>Message</th>
<!--            <th>Receipt</th>-->
            <th>Cooking status</th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <c:forEach items = "${orderlist}" var = "data">
<!--            <td>$[id]</td>-->
            <td>${data.order_id}</td>
            <td>${data.waiter}</td>
            <td>${data.message}</td>
<!--            <td>${food_frice}</td>-->
            <td>
                <select id="cooking_status">
                <option value="Not_started">Not Started</option>
                <option value="Started">Started</option>
                <option value="Completed">Completed</option>
                <option value="Served">Served</option>
                <option value="Cancel">Cancel</option>
                </select>
            </td>
            </c:forEach>
        </tr>
        </tbody>
    </table>
</div>

<div class="container">
    <form action="#" method="post">

        <table class="table">
            <thead>
            <tr>
<!--                <th>Table No.</th>-->
                <th>Waiter</th>
                <th>Order</th>
                <th>Message</th>
                <th>Manage</th>
            </tr>
            </thead>
            <tbody>
            <tr>
<!--                <td>-->
<!--                        <option value="1">1</option>-->
<!--                        <option value="2">2</option>-->
<!--                        <option value="3">3</option>-->
<!--                        <option value="4">4</option>-->
<!--                    </select>-->
<!--                </td>-->
                <td>
                    <select id="waiter">
                        <option value="Mike">Mike</option>
                        <option value="Sarah">Sarah</option>
                    </select>
                </td>
                <td>
                    <select id="menu_name">
                        <option value="Steak">Steak</option>
                        <option value="Salad">Salad</option>
                        <option value="Pasta">Pasta</option>
                        <option value="Dessert">Dessert</option>
                    </select>
                </td>
                <td><input type="text" id="message" value="message"></td>
                <td>
                    <button type="button" onClick="add_order();">Add Order</button>
                </td>
            </tr>
            </tbody>
        </table>

        <table class="table" id="order_table">
            <thead>
            <tr>
<!--                <th>Table No.</th>-->
                <th>Waiter</th>
                <th>Order</th>
                <th>Message</th>
                <th>Manage</th>
            </tr>
            </thead>
            <tbody id="order_tbody">
            </tbody>
        </table>
        <button class="button_order">Order</button>
    </form>
</div>
</body>
</html>
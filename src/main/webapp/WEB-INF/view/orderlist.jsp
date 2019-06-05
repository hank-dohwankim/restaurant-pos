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

           <style>
               .waiter { width: 100px;}
               .menu_name { width: 100px;}
               .message { width: 150px;}
               .cooking_status { width: 90px;}
               #order_table {display: none;}
               .button_order {display: none;}
           </style>
       </head>
       <body>
       <div class="modify">
         <h2>Modification</h2>
         <table>
             <tr>
                 <td>
                   <input type="text" placeholder="order_id" name="order_id" value="" /></td>
             </tr>
             <tr>
                 <td><input type="text" placeholder="cooking_status" name="cooking_status" value="" /></td>
             </tr>
             <tr>
                 <td>
                       <button class="btn-menu-save2">Change and save</button>
                       <button class="btn-menu-delete">Delete</button>
                 </td>
             </tr>
         </table>
         </div>
            <script>
                //         // 1건 조회
                //   $(document).on('click','#cooking_status', function() {
                //     console.log($(this).val());

                //     $.ajax({
                //       url: "./orders/" + $(this).data('id') ,
                //       data: "data",  // url?id=1
                //       dataType: "json",  // return type
                //       success: function (response) {
                //         $('.modify [name="order_id"]').val(response.order_id);
                //         $('.modify [name="cooking_status"]').val(response.cooking_status);
                //       }
                //     });
                //   });
           

                            // 수정
                // $('.btn-menu-save2').on('click', function() {

                //     var obj = {
                //         "menu_id": $('.modify [name="menu_id"]').val(),
                //         "menu_name": $('.modify [name="menu_name"]').val(),
                //         "menu_price": $('.modify [name="menu_price"]').val(),
                //         "cooking_time": $('.modify [name="cooking_time"]').val()
                //     };

                //     $.ajax({
                //     type: "PUT",
                //     url: "./menus/" + $('.modify [name="menu_id"]').val(),
                //     data: JSON.stringify(obj),
                //     contentType: 'application/json',
                //     dataType: "json", // return type
                //     success: function (response) {
                //         debugger
                //         alert('Modified');
                //         getmenuList();
                //     }
                //     });
                // });
            </script>

       <div class="container">
           <div>
               <span> <a href="terminal.do">1. Terminal</a></span>
               <span> <a href="order.do">2. Kitchen</a></span>
               <span> <a href="ledge.do">3. Check Out</a></span>
           </div>

           <h2>Kitchen Page</h2>

           <table class="table" id="mytable">
               <thead>
               <tr>
                   <th>Order No.</th>
                   <th>Waiter</th>
                   <th>Order</th>
                   <th>Message</th>
                   <th>Cooking status</th>
                   <th>Action</th>
               </tr>
               </thead>
               <tbody>
                   <c:forEach items = "${orderList}" var = "data">
                       <tr id="mycell">
                           <td><b>${data.order_id}</b> - ${data.order_detail_id}</td>
                           <td>${data.user_name}</td>
                           <td>${data.menu_name}</td>
                           <td>${data.message}</td>
                           <td id="cooking_status">${data.cooking_status}</td>
                           <td>
                                <button id="btn-order-fire" class="">Fire</button>
                                <button class="">Serve</button>
                           </td>
                       </tr>
                   </c:forEach>
               </tbody>
           </table>
       </div>
       </body>
       </html>
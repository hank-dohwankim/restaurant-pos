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
               $(function(){
                   $('#forRowspan').each(function() {
                       var table = this;
                       $.each([1,5] /* 합칠 칸 번호 */, function(c, v) {
                           var tds = $('>tbody>tr>td:nth-child(' + v + ')', table).toArray();
                           var i = 0, j = 0;
                           for(j = 1; j < tds.length; j ++) {
                               if(tds[i].innerHTML != tds[j].innerHTML) {
                                   $(tds[i]).attr('rowspan', j - i);
                                   i = j;
                                   continue;
                               }
                               $(tds[j]).hide();
                           }
                           j --;
                           if(tds[i].innerHTML == tds[j].innerHTML) {
                               $(tds[i]).attr('rowspan', j - i + 1);
                           }
                       });
                   });
               });
           </script>
           <style>
               .waiter { width: 100px;}
               .order_no {width: 100px;}
               .table {vertical-align:middle; text-align:center; margin:auto;}
                table {text-align: center; border: 1px solid #dddddd}
                thead {background-color: #fafafa; text-align: center;}
           </style>
       </head>
       <body>
               <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="/terminal.do">Restaurant Web Order System</a>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/terminal.do">Terminal</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/order.do">Kitchen</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/ledge.do">Ledge</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="nav-link" href="/user.do">User</a></li>
                        <li><a class="nav-link" href="/menu.do">Menu</a></li>
                    </ul>
            </nav>
        <br>
           <h1>Ledge Page</h1>
           <hr>
           <table class="table" style="text-align: center; border: 1px solid #dddddd" id="forRowspan" >
               <thead>
               <tr>
                   <th>Order No.</th>
                   <th>Waiter</th>
                   <th>Order</th>
                   <th>Menu Price</th>
                   <th>Receipt Total</th>
               </tr>
               </thead>
               <tbody>
                   <c:forEach items = "${orderList}" var = "data">
                       <tr id="mycell">
                           <td class="order_no"><b>${data.order_id}</b></td>
                           <td>${data.user_name}</td>
                           <td>${data.menu_name}</td>
                           <td>${data.menu_price}</td>
                           <td>${data.total_cost}</td>
                       </tr>
                   </c:forEach>
               </tbody>
           </table>
       </div>
       </body>
       </html>>
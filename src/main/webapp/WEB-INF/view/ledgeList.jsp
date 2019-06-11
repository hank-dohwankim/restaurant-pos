<%@ page language="java" isELIgnored="false" contentType="text/html;charset=utf-8"
                pageEncoding="utf-8" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <html lang="en">
       <head>
           <title>Restaurant Web Order System</title>
           <meta charset="utf-8">
           <meta name="viewport" content="width=device-width, initial-scale=1">
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

               <style>
                    #order_detail_no {width: 200px;}
                    #menu_name {width: 200px;}
                    #order_detail_no {width: 200px;}
                    table {text-align: center; border: 1px solid #dddddd}
                    thead {background-color: #fafafa; text-align: center;}
               </style>
       </head>
       <body>
        <br>
     <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/terminal.do">Terminal</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/order.do">Kitchen</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="/ledge.do">Ledge<span class="sr-only">(current)</span></a>
                            </li>
                            <c:if test="${sessionScope.user.user_type == 'admin'}">
                            <li><a class="nav-link" href="/user.do">User</a></li>
                            <li><a class="nav-link" href="/menu.do">Menu</a></li>
                            </c:if>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">

                            <c:if test="${not empty sessionScope.user.user_login}">
                                <li class="active"><a class="nav-link" href="#"><c:out value="${sessionScope.user.user_login}"/></a></li>
                                <li><a class="nav-link" href="/logout">Sign out</a></li>
                            </c:if>
                        </ul>
            </nav>
        <br>

           <h2>Ledge Page</h2>
           <hr/>

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
</html>